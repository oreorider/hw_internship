`timescale 1ns/1ps


module mask_maker 
(
	input  wire clk,
	input  wire rstn,
	input  [31:0] conv_out_pix, //input IFM values
	input 		 conv_out_pix_vld, //vld signal for input IFM
	//input  wire start,
	input  wire ap_start,
	//input  wire start_outputting,
	input  wire [4:0] q_current_conv_layer,
	output wire [1:0] mask_layer,
	output [31:0] omask_out_pix,
	output omask_out_pix_vld,
	output maskgen_finished,
	output last_pix,
	output reg o_start
);

reg all_done;
reg [4:0] q_latched_layer;

always@(posedge clk, negedge rstn)begin
	if(~rstn) q_latched_layer <= 0;
	else if(ap_start) q_latched_layer <= q_current_conv_layer;
end

//-------------------------------------------------
// Parameters
//-------------------------------------------------
//parameter   CLK_PERIOD       = 10.0;		// 100 MHz
parameter   FMAP_WIDTH       = 128;
parameter   FMAP_HEIGHT      = 128;
localparam  FMAP_FRAME_SIZE  =  FMAP_WIDTH * FMAP_HEIGHT;
parameter   FILTER_SIZE_X    = 1;
parameter   FILTER_SIZE_Y    = 1;
localparam  FILTER_SIZE_2D   = FILTER_SIZE_X * FILTER_SIZE_Y;
parameter   INP_CHANNEL_NUM  = 32;
parameter   OUT_CHANNEL_NUM  = 4; //for first layer of mask generation

parameter   Ti = 4; // number multipliers in each kernel
parameter	Tw = 4; //width of input
parameter   To = 4;// number of kernels
parameter   WI = 8; //width of quantized numbers

localparam N  = 3*Ti; 
localparam NW = $clog2(N+1);
parameter   ACT_BITS   = 8;
parameter   PARAM_BITS = 16;



//total 		128 * 128 * 32 numbers, each number is 8 bit
//organized as 	16 * 32768 numbers, 16 * 32768 * 8 bit total = 
//				[16 * 8bit-1:0] ifm_data [0:(128 * 128 * 32) / 16 * 8bit - 1]
//				128b * 32768
//reg [127: 0] ifm_data 	[0:((FMAP_FRAME_SIZE*INP_CHANNEL_NUM               )/16)-1]; 
//reg [127: 0] omask		[0:((FMAP_FRAME_SIZE*INP_CHANNEL_NUM               )/16)-1];
//reg [127: 0] wgt_data 	[0:((INP_CHANNEL_NUM*OUT_CHANNEL_NUM*FILTER_SIZE_2D)/16)-1];
//reg [127: 0] ofm_data 	[0:((FMAP_FRAME_SIZE*INP_CHANNEL_NUM               )/16)-1];
reg [ 15: 0] biases  	[0:OUT_CHANNEL_NUM-1];
reg [ 15: 0] scales   	[0:OUT_CHANNEL_NUM-1];
reg MASKLAYER3START;

//mask weights for layers 3 to 6
//1*1*32* 4 layer
reg [255: 0] mask_l1_w	[0:3]; 		//32 * 8bit by 4 	|| [255:0]*[3:0]
reg [ 15: 0] mask_l1_b 	[0:3]; 		//32*8bit bias		|| 
reg	[ 15: 0] mask_l1_s	[0:3];
//output from layer 1 of mask generation
//reg [7:0] 	mask_l1_o 	[0 : FMAP_FRAME_SIZE * 4-1]; //each 8 bit pixel as its own row, similar to class
//reg [1023:0] mask_l1_o	[0: 511];		//(128*8b by 128) * 4

//3*3*4*4
reg [127:0] mask_l2_w	[0:8]; 	//16 * WI = 128 bit by 9, see "3x3 weight format.txt"
reg	[15:0 ]	mask_l2_b	[0:3]; //4*8bit bias
reg [15:0 ] mask_l2_s	[0:3];
//output from layer 2 of mask generation
//reg [7:0] 	mask_l2_o	[0: FMAP_FRAME_SIZE * 4 - 1];

//1*1*4*32
reg [31:0] mask_l3_w	[0:31];	//4*8bit by 32
reg	[15:0] mask_l3_b	[0:31]; //32*8bit bias
reg [15:0] mask_l3_s	[0:31]; //32*8bit bias
//output from layer 3 of mask generation, omask
//don't store, because won't synthesize
//reg [7:0]  mask_l3_o	[0 : FMAP_FRAME_SIZE * 32 - 1]; 
//omask
//reg [0 : FMAP_FRAME_SIZE * 32 - 1] omask; //binary mask of size FMAP_FRAME_SIZE * 32
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//

//-------------------------------------------------
// Internal signals
//-------------------------------------------------
//reg 		clk;
//reg 		bmp_rstn;
//reg all_done;
//wire bmp_rstn = rstn;
//reg 		rstn;
//reg 		start; 
reg  [11:0] q_width;
reg  [11:0] q_height;
reg  [ 5:0] q_2d_filter_size;		// fx * fy	--> Support both 1D and 2D conv
reg  [ 2:0] q_in_channels;
reg  [ 2:0] q_out_channels;
reg  [11:0] q_pix_idx_max;
reg  [ 5:0] q_stride;
//reg  [ 4:0]	q_latched_layer;

wire ctrl_data_run;
wire ctrl_sync_run;
wire ctrl_load_batch;
wire ctrl_skip_run;

//wire 		ctrl_data_sync_rune		ctrl_sync_run;
wire [11:0] col;
wire [11:0] row;
wire [ 2:0] ni_idx;
wire [ 2:0] no_idx;
wire [ 3:0] pix_idx;
wire        end_of_line;

wire [3:0] batch_ch_idx; 		//output from FSM, tells which "batch" of channels is currently being calculated
wire [2:0] batch_col_idx; 		//output from FSM, tells which "batch" of columns is currently being calculated
wire [9:0] local_col_idx;
wire [9:0] local_row_idx;		//output from FSM, tells which row in the channel 0~1023
wire	   end_frame;			//output from FSM

wire [2:0] conv_layer;			//output from FSM, tells current layer in CNN
//wire [1:0] mask_layer; 			//output from FSM, tells current mask generation alyer

// Convolutional kernel's signals
reg  [To*128-1:0]		 win;	  // mask weight, 4 * 128bit, use only first 32 bit in each 128 block
reg  [127:0]			 din;	  // Input block data, 1*4*4
reg  					 vld_i;	  // Input valid signal
reg  					 vld_i_st; // Input valid signal (Start beat)
reg  					 vld_i_ed; // Input valid signal (end beat)	
wire [16*ACT_BITS-1:0]   acc_o;	  // Output block data
wire [15:0] 			 vld_o;	  // Output valid signal
reg  [To*PARAM_BITS-1:0] scale;	  // Scales (Batch normalization), 	[64-1:0]
reg  [To*PARAM_BITS-1:0] bias;	  // Biases							[4*16-1:0]


wire [23:0] data_count;
reg  [23:0] pixel_count;
reg         layer_done;
reg  [ 4:0] bias_shift;
reg  [ 3:0] act_shift ;

wire  is_first_col, is_last_col;
wire  is_first_row, is_last_row;
reg dummy_code;

integer i; 
reg			is_3x3_conv;


wire is_finished_state;
wire read_IFM_finished;
//-------------------------------------------------------------------------------
// Mask generation FSM
//-------------------------------------------------------------------------------
mask_gen_fsm u_mask_gen_fsm(
./*input 		 */clk					(clk				),
./*input 		 */rstn					(rstn				),
./*input		 */force_idle			(1'b0				),
//./*input 		 */i_start				(o_start			),
./*input 		 */i_start				(read_IFM_finished			),
./*input  [11:0] */q_width				(q_width			),
./*input  [ 5:0] */q_2d_filter_size		(q_2d_filter_size	),//not actually used
./*input  [ 3:0] */i_current_conv_layer	(4'b0				),
./*input 		 */i_mask_loaded		(1'b0				),	
./*output 		 */o_ctrl_data_run		(ctrl_data_run		),
./*output		 */o_ctrl_sync_run		(ctrl_sync_run		),
./*output		 */o_ctrl_load_batch	(ctrl_load_batch	),
./*output		 */o_ctrl_skip_run		(ctrl_skip_run		),
./*output [ 3:0] */o_batch_ch_idx		(batch_ch_idx		),
./*output [ 9:0] */o_local_col_idx		(local_col_idx		),
./*output [ 9:0] */o_local_row_idx		(local_row_idx		),
./*output [ 1:0] */o_mask_layer			(mask_layer			),
./*output [ 3:0] */o_pix_idx			(pix_idx			),
./*output 		 */o_end_frame			(end_frame			)
);

//-------------------------------------------------------------------------------
// Computing kernels
//change to conv_kern_wrapper_mask module
//-------------------------------------------------------------------------------
generate
	conv_kern_wrapper_mask #(.To(To))
	u_conv_kern_wrapper_mask(
		./*input 			 */clk			(clk	    ),
		./*input 			 */rstn			(rstn		),
		./*input 			 */is_last_layer(MASKLAYER3START		),
		./*input [To*16-1:0] */scale		(scale		),//change to mask layer scale
		./*input [To*16-1:0] */bias			(bias		),//change to mask layer bias
		./*input [ 3:0] 	 */act_shift	(act_shift	),
		./*input [ 4:0] 	 */bias_shift	(bias_shift	),
		./*input 			 */vld_i		(vld_i		),
		./*input 			 */vld_i_st		(vld_i_st	), 
		./*input 			 */vld_i_ed		(vld_i_ed	), 
		./*input [To*128-1:0]*/win			(win		),
		./*input [   127:0]  */din			(din		), 
		./*output[16*8-1:0]  */acc_o		(acc_o      ),
		./*output[16-1:0]    */vld_o		(vld_o      ),
		./*input			 */is_3x3_conv	(is_3x3_conv)//doesn't actually do anything, but needs to be here
	);	
endgenerate

//-------------------------------------------------------------------------------
// Block Memory instantiation
//-------------------------------------------------------------------------------
localparam ST_BLK_MEM_IDLE = 0;
localparam ST_BLK_MEM_INIT = 1;
localparam ST_BLK_MEM_FIN  = 2;
localparam ST_BLK_MEM_DELAY = 3;
//block mem instantiation FSM
reg [2:0] blk_mem_cstate;
reg [2:0] blk_mem_nstate;

wire blk_mem_init_finish;
reg [9:0] startup_delay;

always@(posedge clk, negedge rstn)begin
	if(~rstn)begin
		blk_mem_cstate <= 0;
		//blk_mem_nstate <= 0;
	end
	else begin
		blk_mem_cstate <= blk_mem_nstate;
	end
end

always@(*)begin
	blk_mem_nstate = 0;
	case(blk_mem_cstate)
		ST_BLK_MEM_IDLE: begin
			if(ap_start) 
				blk_mem_nstate = ST_BLK_MEM_DELAY;
			else 
				blk_mem_nstate = ST_BLK_MEM_IDLE;
		end
		ST_BLK_MEM_DELAY: begin
			if(startup_delay == 10'd100)
				blk_mem_nstate = ST_BLK_MEM_INIT;
			else
				blk_mem_nstate = ST_BLK_MEM_DELAY;
		end
		ST_BLK_MEM_INIT: begin
			if(blk_mem_init_finish)
				blk_mem_nstate = ST_BLK_MEM_FIN;
			else 
				blk_mem_nstate = ST_BLK_MEM_INIT;
		end
		ST_BLK_MEM_FIN: begin
			blk_mem_nstate = ST_BLK_MEM_FIN;
		end
		default : begin
			blk_mem_nstate = ST_BLK_MEM_IDLE;
		end
	endcase
end

reg ap_start_d;

always@(posedge clk, negedge rstn)begin
	if(~rstn) ap_start_d <= 0;
	else ap_start_d <= ap_start;
end

always@(posedge clk, negedge rstn)begin
	if(~rstn) begin
		startup_delay <= 0;
	end
	else begin
		if(blk_mem_cstate == ST_BLK_MEM_DELAY)begin
			startup_delay <= startup_delay + 1;
		end
		else 
			startup_delay <= 0;
	end
end

reg [10:0]  read_bias_data_count;		//from 0 to 40
reg [10:0]  read_scale_data_count;		//from 0 to 40
reg [10:0]  read_weight_0_data_count; 	//from 0 to 4
reg [10:0]  read_weight_1_data_count; 	//from 0 to 9
reg [10:0]  read_weight_2_data_count; 	//from 0 to 32

reg [10:0]  read_bias_data_count_d;		
reg [10:0]  read_scale_data_count_d;		
reg [10:0]  read_weight_0_data_count_d; 	
reg [10:0]  read_weight_1_data_count_d; 	
reg [10:0]  read_weight_2_data_count_d; 	

reg [7:0] 	bias_blk_mem_addr;
//reg [7:0] 	bias_blk_mem_addr_d;
reg 		bias_blk_mem_ena;
wire [15:0] bias_blk_mem_data;
bias_blk_mem u_bias_blk_mem(
	./*input  */clka	(clk					),
	./*input  */addra	(bias_blk_mem_addr		),
	./*input  */ena		(bias_blk_mem_ena		),
	./*output */douta	(bias_blk_mem_data		)
);

reg [7:0] 	scale_blk_mem_addr;
//reg [7:0] 	scale_blk_mem_addr_d;
reg 		scale_blk_mem_ena;
wire [15:0] scale_blk_mem_data;
scale_blk_mem u_scale_blk_mem(
	./*input  */clka	(clk					),
	./*input  */addra	(scale_blk_mem_addr		),
	./*input  */ena		(scale_blk_mem_ena		),
	./*output */douta	(scale_blk_mem_data		)
);

reg [4:0] 		weight_0_blk_mem_addr;
//reg [4:0] 		weight_0_blk_mem_addr_d;
reg 			weight_0_blk_mem_ena;
wire [255:0]	weight_0_blk_mem_data;
weight_0_blk_mem u_weight_0_blk_mem(
	./*input  */clka	(clk					),
	./*input  */addra	(weight_0_blk_mem_addr	),
	./*input  */ena		(weight_0_blk_mem_ena	),
	./*output */douta	(weight_0_blk_mem_data	)
);

reg [5:0] 	weight_1_blk_mem_addr;
//reg [5:0] 	weight_1_blk_mem_addr_d;
reg 		weight_1_blk_mem_ena;
wire [127:0] weight_1_blk_mem_data;
weight_1_blk_mem u_weight_1_blk_mem(
	./*input  */clka	(clk					),
	./*input  */addra	(weight_1_blk_mem_addr	),
	./*input  */ena		(weight_1_blk_mem_ena	),
	./*output */douta	(weight_1_blk_mem_data	)
);

reg [7:0] 	weight_2_blk_mem_addr;
//reg [7:0] 	weight_2_blk_mem_addr_d;
reg 		weight_2_blk_mem_ena;
wire [31:0] weight_2_blk_mem_data;
weight_2_blk_mem u_weight_2_blk_mem(
	./*input  */clka	(clk					),
	./*input  */addra	(weight_2_blk_mem_addr	),
	./*input  */ena		(weight_2_blk_mem_ena	),
	./*output */douta	(weight_2_blk_mem_data	)
);

reg [14:0] ifm_data_addr;
reg [127:0] ifm_data_wr_data;
wire [127:0] ifm_data_rd_data;
reg ifm_data_ena;
reg ifm_data_wr_ena;

ifm_data_128x32768 u_ifm_data(
	.clka(clk),
	.addra(ifm_data_addr),
	.dina(ifm_data_wr_data),
	.douta(ifm_data_rd_data),
	.ena(ifm_data_ena),
	.wea(ifm_data_wr_ena)
);

reg [11:0] l1_o_data_addr;
reg [127:0] l1_o_data_wr_data;
wire [127:0] l1_o_data_rd_data;
reg l1_o_data_ena;
reg l1_o_data_wr_ena;

l1_o_data_128x4096 u_l1_o_data(
	.clka(clk),
	.addra(l1_o_data_addr),
	.dina(l1_o_data_wr_data),
	.douta(l1_o_data_rd_data),
	.ena(l1_o_data_ena),
	.wea(l1_o_data_wr_ena)
);


reg [11:0] l2_o_data_addr;
reg [127:0] l2_o_data_wr_data;
wire [127:0] l2_o_data_rd_data;
reg l2_o_data_ena;
reg l2_o_data_wr_ena;

l2_o_data_128x4096 u_l2_o_data(
	.clka(clk),
	.addra(l2_o_data_addr),
	.dina(l2_o_data_wr_data),
	.douta(l2_o_data_rd_data),
	.ena(l2_o_data_ena),
	.wea(l2_o_data_wr_ena)
);

//-------------------------------------------------
// Load bias, scales, weights
//-------------------------------------------------
//always@(posedge clk, negedge rstn)begin //setting read address for ROM
//	if(!rstn)begin
//		read_bias_data_count 		<= 0;
//		read_scale_data_count 		<= 0;
//		read_weight_0_data_count 	<= 0;
//		read_weight_1_data_count 	<= 0;
//		read_weight_2_data_count 	<= 0;
//		read_bias_data_count_d 		<= 0;
//		read_scale_data_count_d 	<= 0;
//		read_weight_0_data_count_d 	<= 0;
//		read_weight_1_data_count_d 	<= 0;
//		read_weight_2_data_count_d 	<= 0;
//	end
//	else begin
//		if(blk_mem_cstate == ST_BLK_MEM_INIT)begin
//			bias_blk_mem_ena 		<= (read_bias_data_count_d 		>= 'd40) ? 0 : 1;
//			scale_blk_mem_ena 		<= (read_scale_data_count_d		>= 'd40) ? 0 : 1;
//			weight_0_blk_mem_ena	<= (read_weight_0_data_count_d 	>= 'd4 ) ? 0 : 1;
//			weight_1_blk_mem_ena	<= (read_weight_1_data_count_d 	>= 'd9 ) ? 0 : 1;
//			weight_2_blk_mem_ena	<= (read_weight_2_data_count_d 	>= 'd32) ? 0 : 1;
//		end
//	end
//end

//assign blk_mem_init_finish = (blk_mem_cstate == ST_BLK_MEM_INIT) && 
//(!bias_blk_mem_ena && !scale_blk_mem_ena && !weight_0_blk_mem_ena && !weight_1_blk_mem_ena && !weight_2_blk_mem_ena);

assign blk_mem_init_finish = 	(read_bias_data_count_d 		>= 'd40) &&
								(read_scale_data_count_d		>= 'd40) &&
								(read_weight_0_data_count_d 	>= 'd4 ) &&
								(read_weight_1_data_count_d 	>= 'd9 ) &&
								(read_weight_2_data_count_d 	>= 'd32);

always@(posedge clk, negedge rstn)begin
	if(~rstn)begin
		bias_blk_mem_addr 		<= 0;
		bias_blk_mem_ena		<= 0;
		scale_blk_mem_addr		<= 0;
		scale_blk_mem_ena 		<= 0;
		weight_0_blk_mem_addr	<= 0;
		weight_0_blk_mem_ena	<= 0;
		weight_1_blk_mem_addr	<= 0;
		weight_1_blk_mem_ena	<= 0;
		weight_2_blk_mem_addr	<= 0;
		weight_2_blk_mem_ena	<= 0;

		read_bias_data_count 		<= 0;
		read_scale_data_count 		<= 0;
		read_weight_0_data_count 	<= 0;
		read_weight_1_data_count 	<= 0;
		read_weight_2_data_count 	<= 0;
		read_bias_data_count_d 		<= 0;
		read_scale_data_count_d 	<= 0;
		read_weight_0_data_count_d 	<= 0;
		read_weight_1_data_count_d 	<= 0;
		read_weight_2_data_count_d 	<= 0;

	end
	else if(ap_start_d)begin
		bias_blk_mem_addr 		<= 40 * (q_latched_layer - 3); //has 40 total biases per conv layer, conv layer starts from 3
		bias_blk_mem_ena		<= 0;

		scale_blk_mem_addr		<= 40 * (q_latched_layer - 3);
		scale_blk_mem_ena 		<= 0;

		weight_0_blk_mem_addr	<= 4 * (q_latched_layer - 3);
		weight_0_blk_mem_ena	<= 0;

		weight_1_blk_mem_addr	<= 9 * (q_latched_layer - 3);
		weight_1_blk_mem_ena	<= 0;

		weight_2_blk_mem_addr	<= 32 * (q_latched_layer - 3);
		weight_2_blk_mem_ena	<= 0;
	end
	else begin//increment read addresses, and data counts
		if(blk_mem_cstate == ST_BLK_MEM_INIT)begin
			bias_blk_mem_ena 		<= (read_bias_data_count_d 		>= 'd40) ? 0 : 1;
			scale_blk_mem_ena 		<= (read_scale_data_count_d		>= 'd40) ? 0 : 1;
			weight_0_blk_mem_ena	<= (read_weight_0_data_count_d 	>= 'd4 ) ? 0 : 1;
			weight_1_blk_mem_ena	<= (read_weight_1_data_count_d 	>= 'd9 ) ? 0 : 1;
			weight_2_blk_mem_ena	<= (read_weight_2_data_count_d 	>= 'd32) ? 0 : 1;
		end
		if(bias_blk_mem_ena) begin
 			//bias_blk_mem_addr_d 	<= bias_blk_mem_addr;
			bias_blk_mem_addr 		<= bias_blk_mem_addr + 1;
			read_bias_data_count_d	<= read_bias_data_count;
			read_bias_data_count	<= read_bias_data_count + 1;
		end
		if(scale_blk_mem_ena)begin
			//scale_blk_mem_addr_d 	<= scale_blk_mem_addr;
			scale_blk_mem_addr		<= scale_blk_mem_addr + 1;
			read_scale_data_count_d <= read_scale_data_count;
			read_scale_data_count	<= read_scale_data_count + 1;
		end
		if(weight_0_blk_mem_ena)begin
			//weight_0_blk_mem_addr_d 	<= weight_0_blk_mem_addr;
			weight_0_blk_mem_addr 		<= weight_0_blk_mem_addr + 1;
			read_weight_0_data_count_d	<= read_weight_0_data_count;
			read_weight_0_data_count 	<= read_weight_0_data_count + 1;
		end
		if(weight_1_blk_mem_ena)begin
			//weight_1_blk_mem_addr_d 	<= weight_1_blk_mem_addr;
			weight_1_blk_mem_addr 		<= weight_1_blk_mem_addr + 1;
			read_weight_1_data_count_d	<= read_weight_1_data_count;
			read_weight_1_data_count 	<= read_weight_1_data_count + 1;
		end
		if(weight_2_blk_mem_ena)begin
			//weight_2_blk_mem_addr_d 	<= weight_2_blk_mem_addr;
			weight_2_blk_mem_addr 		<= weight_2_blk_mem_addr + 1;
			read_weight_2_data_count_d	<= read_weight_2_data_count;
			read_weight_2_data_count 	<= read_weight_2_data_count + 1;
		end
	end
end


//integer a, b, c;
//save output from bias ROM into local buffer
always@(posedge clk, negedge rstn)begin
	if(~rstn)begin
		mask_l1_b[0 ] <= 16'b0;
		mask_l1_b[1 ] <= 16'b0;
		mask_l1_b[2 ] <= 16'b0;
		mask_l1_b[3 ] <= 16'b0;

		mask_l2_b[0 ] <= 16'b0;
		mask_l2_b[1 ] <= 16'b0;
		mask_l2_b[2 ] <= 16'b0;
		mask_l2_b[3 ] <= 16'b0;

		mask_l3_b[0 ] <= 16'b0;
		mask_l3_b[1 ] <= 16'b0;
		mask_l3_b[2 ] <= 16'b0;
		mask_l3_b[3 ] <= 16'b0;
		mask_l3_b[4 ] <= 16'b0;
		mask_l3_b[5 ] <= 16'b0;
		mask_l3_b[6 ] <= 16'b0;
		mask_l3_b[7 ] <= 16'b0;
		mask_l3_b[8 ] <= 16'b0;
		mask_l3_b[9 ] <= 16'b0;
		mask_l3_b[10] <= 16'b0;
		mask_l3_b[11] <= 16'b0;
		mask_l3_b[12] <= 16'b0;
		mask_l3_b[13] <= 16'b0;
		mask_l3_b[14] <= 16'b0;
		mask_l3_b[15] <= 16'b0;
		mask_l3_b[16] <= 16'b0;
		mask_l3_b[17] <= 16'b0;
		mask_l3_b[18] <= 16'b0;
		mask_l3_b[19] <= 16'b0;
		mask_l3_b[20] <= 16'b0;
		mask_l3_b[21] <= 16'b0;
		mask_l3_b[22] <= 16'b0;
		mask_l3_b[23] <= 16'b0;
		mask_l3_b[24] <= 16'b0;
		mask_l3_b[25] <= 16'b0;
		mask_l3_b[26] <= 16'b0;
		mask_l3_b[27] <= 16'b0;
		mask_l3_b[28] <= 16'b0;
		mask_l3_b[29] <= 16'b0;
		mask_l3_b[30] <= 16'b0;
		mask_l3_b[31] <= 16'b0;
		//mask_l3_b[32] <= 16'b0;

	end
	else begin
		if(read_bias_data_count_d >= 1 && read_bias_data_count_d <= 4)begin
			mask_l1_b[read_bias_data_count_d - 1] <= bias_blk_mem_data;
		end
		else if(read_bias_data_count_d >= 5 && read_bias_data_count_d <= 8)begin
			mask_l2_b[read_bias_data_count_d - 5] <= bias_blk_mem_data;
		end
		else if(read_bias_data_count_d >= 9 && read_bias_data_count_d <= 40)begin
			mask_l3_b[read_bias_data_count_d - 9] <= bias_blk_mem_data;
		end
	end
end

//save output from scale ROM into local buffer
always@(posedge clk, negedge rstn)begin
	if(~rstn)begin
		mask_l1_s[0 ] <= 16'b0;
		mask_l1_s[1 ] <= 16'b0;
		mask_l1_s[2 ] <= 16'b0;
		mask_l1_s[3 ] <= 16'b0;

		mask_l2_s[0 ] <= 16'b0;
		mask_l2_s[1 ] <= 16'b0;
		mask_l2_s[2 ] <= 16'b0;
		mask_l2_s[3 ] <= 16'b0;

		mask_l3_s[0 ] <= 16'b0;
		mask_l3_s[1 ] <= 16'b0;
		mask_l3_s[2 ] <= 16'b0;
		mask_l3_s[3 ] <= 16'b0;
		mask_l3_s[4 ] <= 16'b0;
		mask_l3_s[5 ] <= 16'b0;
		mask_l3_s[6 ] <= 16'b0;
		mask_l3_s[7 ] <= 16'b0;
		mask_l3_s[8 ] <= 16'b0;
		mask_l3_s[9 ] <= 16'b0;
		mask_l3_s[10] <= 16'b0;
		mask_l3_s[11] <= 16'b0;
		mask_l3_s[12] <= 16'b0;
		mask_l3_s[13] <= 16'b0;
		mask_l3_s[14] <= 16'b0;
		mask_l3_s[15] <= 16'b0;
		mask_l3_s[16] <= 16'b0;
		mask_l3_s[17] <= 16'b0;
		mask_l3_s[18] <= 16'b0;
		mask_l3_s[19] <= 16'b0;
		mask_l3_s[20] <= 16'b0;
		mask_l3_s[21] <= 16'b0;
		mask_l3_s[22] <= 16'b0;
		mask_l3_s[23] <= 16'b0;
		mask_l3_s[24] <= 16'b0;
		mask_l3_s[25] <= 16'b0;
		mask_l3_s[26] <= 16'b0;
		mask_l3_s[27] <= 16'b0;
		mask_l3_s[28] <= 16'b0;
		mask_l3_s[29] <= 16'b0;
		mask_l3_s[30] <= 16'b0;
		mask_l3_s[31] <= 16'b0;
		//mask_l3_s[32] <= 16'b0;
	end
	else begin
		if(read_scale_data_count_d >= 1 && read_scale_data_count_d <= 4)begin
			mask_l1_s[read_scale_data_count_d - 1] <= scale_blk_mem_data;
		end
		else if(read_scale_data_count_d >= 5 && read_scale_data_count_d <= 8)begin
			mask_l2_s[read_scale_data_count_d - 5] <= scale_blk_mem_data;
		end
		else if(read_scale_data_count_d >= 9 && read_scale_data_count_d <= 40)begin
			mask_l3_s[read_scale_data_count_d - 9] <= scale_blk_mem_data;
		end
	end
end

//save output from weight_0 ROM into local buffer
always@(posedge clk, negedge rstn)begin
	if(~rstn)begin
		mask_l1_w[0] <= 256'd0;
		mask_l1_w[1] <= 256'd0;
		mask_l1_w[2] <= 256'd0;
		mask_l1_w[3] <= 256'd0;

		mask_l2_w[0] <= 128'd0;
		mask_l2_w[1] <= 128'd0;
		mask_l2_w[2] <= 128'd0;
		mask_l2_w[3] <= 128'd0;
		mask_l2_w[4] <= 128'd0;
		mask_l2_w[5] <= 128'd0;
		mask_l2_w[6] <= 128'd0;
		mask_l2_w[7] <= 128'd0;
		mask_l2_w[8] <= 128'd0;

		mask_l3_w[0 ] <= 32'b0;
		mask_l3_w[1 ] <= 32'd0;
		mask_l3_w[2 ] <= 32'd0;
		mask_l3_w[3 ] <= 32'd0;
		mask_l3_w[4 ] <= 32'd0;
		mask_l3_w[5 ] <= 32'd0;
		mask_l3_w[6 ] <= 32'd0;
		mask_l3_w[7 ] <= 32'd0;
		mask_l3_w[8 ] <= 32'd0;
		mask_l3_w[9 ] <= 32'd0;
		mask_l3_w[10] <= 32'd0;
		mask_l3_w[11] <= 32'd0;
		mask_l3_w[12] <= 32'd0;
		mask_l3_w[13] <= 32'd0;
		mask_l3_w[14] <= 32'd0;
		mask_l3_w[15] <= 32'd0;
		mask_l3_w[16] <= 32'd0;
		mask_l3_w[17] <= 32'd0;
		mask_l3_w[18] <= 32'd0;
		mask_l3_w[19] <= 32'd0;
		mask_l3_w[20] <= 32'd0;
		mask_l3_w[21] <= 32'd0;
		mask_l3_w[22] <= 32'd0;
		mask_l3_w[23] <= 32'd0;
		mask_l3_w[24] <= 32'd0;
		mask_l3_w[25] <= 32'd0;
		mask_l3_w[26] <= 32'd0;
		mask_l3_w[27] <= 32'd0;
		mask_l3_w[28] <= 32'd0;
		mask_l3_w[29] <= 32'd0;
		mask_l3_w[30] <= 32'd0;
		mask_l3_w[31] <= 32'd0;
		//mask_l3_w[32] <= 32'd0;
	end
	else begin
		mask_l1_w[read_weight_0_data_count_d - 1] <= weight_0_blk_mem_data;
		mask_l2_w[read_weight_1_data_count_d - 1] <= weight_1_blk_mem_data;
		mask_l3_w[read_weight_2_data_count_d - 1] <= weight_2_blk_mem_data;
	end
end

//-------------------------------------------------------------------------------
// Take in IFM pixels and save to RAM
//-------------------------------------------------------------------------------
reg [4:0] ram_buffer_counter; //from 0~3


assign read_IFM_finished = (ifm_data_addr == 15'd32767) ? 1'b1 : 1'b0;//tells when read is finished

wire [2:0] line_buf_state;
wire [127:0] line_buf_l1_rd_data;
wire line_buf_l1_load;
wire line_buf_l1_output;

reg [14:0] ifm_data_addr_adv;

reg maskgen_finished_ff;
reg maskgen_finished_ff2;
wire maskgen_finished_pulse;

always@(posedge clk, negedge rstn)begin
	if(~rstn)begin
		maskgen_finished_ff <= 0;
		maskgen_finished_ff2 <= 0;
	end
	else begin
		maskgen_finished_ff <= maskgen_finished;
		maskgen_finished_ff2 <= maskgen_finished_ff;
	end
end

assign maskgen_finished_pulse = (!maskgen_finished_ff2) && maskgen_finished_ff;
//writing input IFM to ifm_data and
//reading from IFM_data and send to line_buffer_wrapper

reg [4:0] burst_count;
reg [4:0] burst_count_adv;
reg [6:0] burst_delay;

localparam SENDER_IDLE = 0;
localparam SENDER_SEND = 1;
localparam SENDER_DELAY = 2;
localparam SENDER_REC  = 3;
localparam SENDER_FIN  = 4;

reg [127:0] omask_out_pix_buffer [7:0];
reg [3:0] omask_out_rd_cnt;//from 0 to 8
reg [19:0] output_pixel_cnt;//total number of 32 bits sent out

reg [2:0] sender_cstate;
reg [2:0] sender_cstate_d1;
reg [2:0] sender_cstate_d2;
reg [2:0] sender_nstate;



always@(posedge clk, negedge rstn)begin
	if(~rstn)begin
		sender_cstate_d1 <= 0;
		sender_cstate_d2 <= 0;
	end
	else begin
		sender_cstate_d1 <= sender_cstate;
		sender_cstate_d2 <= sender_cstate_d1;
	end
end

assign finished_sending = ((mask_layer == 'd3) && (ifm_data_addr == 'd32767));

//also reuse to store the OFM outputted from layer 3
always@(posedge clk, negedge rstn)begin
	if(~rstn)begin
		ifm_data_addr <= 15'b0;
		ifm_data_wr_data <= 128'b0;
		ifm_data_ena <= 1'b0;
		ifm_data_wr_ena <= 1'b0;
		ram_buffer_counter <= 0;
		ifm_data_addr_adv <= 15'b0;
		//finished_sending <= 0;
		output_pixel_cnt <= 0;
	end
	else begin
		//incoming input from DMA wrapper
		if(conv_out_pix_vld && ram_buffer_counter == 5'd3)begin //if finished accum IFM inputs, ready for write
			ifm_data_ena <= 1'b1;
			ifm_data_wr_ena <= 1'b1;
			ifm_data_wr_data[ram_buffer_counter*32 +: 32] <= conv_out_pix;
			ifm_data_addr_adv <= ifm_data_addr_adv + 1;
			ifm_data_addr <= ifm_data_addr_adv;
			ram_buffer_counter <= 5'd0;
		end
		else if(conv_out_pix_vld)begin //if still accuming IFM inputs
			ifm_data_ena <= 1'b1;
			ifm_data_wr_ena <= 1'b0;
			ifm_data_wr_data[ram_buffer_counter*32 +: 32] <= conv_out_pix;
			ram_buffer_counter <= ram_buffer_counter + 1;
		end

		else begin//if no incoming pixels
			if(ctrl_load_batch && mask_layer == 'd0)begin//if loading batch in L1, read from IFM data
				ifm_data_ena <= 1'b1;
				ifm_data_wr_ena <= 1'b0;
				ram_buffer_counter <= 0;

				if(line_buf_state == 2'b01)begin//if line buffer in receiving state
					ifm_data_addr <= ifm_data_addr + 1;
				end
			end
			//if in 3rd layer, write outputs to this memory
			else if(mask_layer == 'd2)begin
				if(vld_o[0]) begin
					ifm_data_ena <= 1'b1;
					ifm_data_wr_ena <= 1'b1;
					ifm_data_addr_adv <= ifm_data_addr_adv + 1;
					ifm_data_addr <= ifm_data_addr_adv;
					ifm_data_wr_data <= acc_o;
					output_pixel_cnt <= output_pixel_cnt + 1;
				end
				else if(read_IFM_finished)begin
					ifm_data_ena <= 0;
					ifm_data_wr_ena <= 0;
					ifm_data_addr <= 0;
					ifm_data_addr_adv <= 0;
				end
			end
			//sending to cnn_wrapper
			else if(mask_layer == 'd3)begin
				ifm_data_wr_ena <= 0;
				if(all_done || finished_sending)begin
					ifm_data_ena <= 0;
					ifm_data_addr <= 0;
				end
				else if(!all_done && (sender_cstate == SENDER_REC))begin
					ifm_data_ena <= 1;
					ifm_data_addr <= ifm_data_addr_adv;
					ifm_data_addr_adv <= ifm_data_addr_adv + 1;
				end
				else 
					ifm_data_ena <= 0;
				
			end
			else begin
				ifm_data_ena <= 1'b0;
				ifm_data_wr_ena <= 1'b0;
				ram_buffer_counter <= 0;
				if(read_IFM_finished) ifm_data_addr <= 0;
			end
		end
	end
end


always@(*)begin
	bias_shift = 'd0;
	act_shift = 'd0;

	if(!dummy_code)begin
		if(q_latched_layer == 'd3)begin
			if(mask_layer == 'd0)begin
				bias_shift 	= 'd14;
				act_shift 	= 'd5;
			end
			if(mask_layer == 'd1)begin
				bias_shift 	= 'd13;
				act_shift	= 'd6;
			end
			if(mask_layer == 'd2)begin
				bias_shift 	= 'd12;
				act_shift 	= 'd9;
			end
		end
		if(q_latched_layer == 'd4)begin
			if(mask_layer == 'd0)begin
				bias_shift 	= 'd13;
				act_shift 	= 'd4;
			end
			if(mask_layer == 'd1)begin
				bias_shift 	= 'd14;
				act_shift	= 'd6;
			end
			if(mask_layer == 'd2)begin
				bias_shift 	= 'd12;
				act_shift 	= 'd8;
			end
		end
		if(q_latched_layer == 'd5)begin
			if(mask_layer == 'd0)begin
				bias_shift 	= 'd14;
				act_shift 	= 'd3;
			end
			if(mask_layer == 'd1)begin
				bias_shift 	= 'd15;
				act_shift	= 'd5;
			end
			if(mask_layer == 'd2)begin
				bias_shift = 'd13;
				act_shift = 'd6;
			end
		end
		if(q_latched_layer == 'd6)begin
			if(mask_layer == 'd0)begin
				bias_shift 	= 'd15;
				act_shift 	= 'd4;
			end
			if(mask_layer == 'd1)begin
				bias_shift 	= 'd14;
				act_shift	= 'd5;
			end
			if(mask_layer == 'd2)begin
				bias_shift = 'd13;
				act_shift = 'd6;
			end
		end
	end
end	


//assign row and col from fsm
assign row = local_row_idx;
assign col = local_col_idx; 

reg [9:0] row_d1;
reg [9:0] row_d2;

reg [9:0] col_d1;
reg [9:0] col_d2;
reg [9:0] col_d3;

always@(posedge clk, negedge rstn)begin
	if(~rstn)begin
		row_d1 <= 0;
		row_d2 <= 0;
		col_d1 <= 0;
		col_d2 <= 0;
		col_d3 <= 0;
	end
	else begin
		row_d1 <= local_row_idx;
		row_d2 <= row_d1;
		col_d1 <= local_col_idx;
		col_d2 <= col_d1;
		col_d3 <= col_d2;
	end
end


// Boundary conditions
assign is_first_col = (col_d2==0         )  ? 1'b1: 1'b0;
assign is_last_col  = (col_d2==q_width-4 )  ? 1'b1: 1'b0;
assign is_first_row = (row_d2==0         )  ? 1'b1: 1'b0;
assign is_last_row  = (row_d2==q_height-1)  ? 1'b1: 1'b0;



// Data generation
assign data_count = (row * {q_width,1'b0} + {col,ni_idx[0]});

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//

always@(posedge clk, negedge rstn)begin
	if(!rstn)begin
		//bias		<= 0;
		//scale		<= 0;
		//din        	<= 0;
		//win        	<= 0;
		dummy_code 	<= 0; //DUMMY CODE 
		q_width		<= FMAP_WIDTH;
		q_height    <= FMAP_HEIGHT;
		//is_3x3_conv <= 0;
	end
end

wire [7:0] line_buf_l1_rd_addr;

assign line_buf_l1_load = ctrl_load_batch;
assign line_buf_l1_output = ctrl_data_run;

reg line_buf_l1_load_d1;
reg line_buf_l1_load_d2;

reg ctrl_data_run_d1;
reg ctrl_data_run_d2;
reg ctrl_data_run_d3;
reg ctrl_load_batch_d1;
reg ctrl_load_batch_d2;

always@(posedge clk, negedge rstn)begin
	if(~rstn)begin
		ctrl_data_run_d1 <= 0;
		ctrl_data_run_d2 <= 0;
		ctrl_data_run_d3 <= 0;
		ctrl_load_batch_d1 <= 0;
		ctrl_load_batch_d2 <= 0;

	end
	else begin
		ctrl_data_run_d1 <= ctrl_data_run;
		ctrl_data_run_d2 <= ctrl_data_run_d1;
		ctrl_data_run_d3 <= ctrl_data_run_d2;
		ctrl_load_batch_d1 <= ctrl_load_batch;
		ctrl_load_batch_d2 <= ctrl_load_batch_d1;
	end
end

line_buffer_wrapper_l1 u_line_buf_wrapper_l1(
	.clk(clk),
	.rstn(rstn),
	.ena(mask_layer == 2'd0),
	.line_buf_l1_load(ctrl_load_batch),
	.line_buf_l1_output(ctrl_data_run),
	.line_buf_l1_rd_addr(line_buf_l1_rd_addr),
	.line_buf_l1_wr_data(ifm_data_rd_data),
	.line_buf_l1_rd_data(line_buf_l1_rd_data),
	.line_buf_state(line_buf_state)
);

reg [127:0] layer1_din;
always@(posedge clk, negedge rstn)begin
	if(~rstn)begin
		layer1_din <= 0;
	end
	else begin
		layer1_din <= line_buf_l1_rd_data;
	end
end



wire [4:0] line_buf_l2_rd_addr;
wire [191:0] line_buf_l2_0_rd_data;
wire [191:0] line_buf_l2_1_rd_data;
wire [191:0] line_buf_l2_2_rd_data;
wire line_buf_l2_receiving;

wire l2_latch_done;
assign line_buf_l2_rd_addr = local_col_idx[6:2];

reg [191:0] layer2_din0;
reg [191:0] layer2_din1;
reg [191:0] layer2_din2;

always@(posedge clk, negedge rstn)begin
	if(~rstn)begin
		layer2_din0 <= 0;
		layer2_din1 <= 0;
		layer2_din2 <= 0;
	end
	else begin
		if(is_first_row)begin
			layer2_din0 <= 0;
			layer2_din1 <= line_buf_l2_0_rd_data;
			layer2_din2 <= line_buf_l2_1_rd_data;
		end
		else if(is_last_row)begin
			layer2_din0 <= line_buf_l2_1_rd_data;
			layer2_din1 <= line_buf_l2_2_rd_data;
			layer2_din2 <= 0;
		end
		else begin
			layer2_din0 <= line_buf_l2_0_rd_data;
			layer2_din1 <= line_buf_l2_1_rd_data;
			layer2_din2 <= line_buf_l2_2_rd_data;
		end
	end
end

line_buffer_wrapper_l2 u_line_buf_wrapper_l2(
	.clk(clk),
	.rstn(rstn),
	.ena(mask_layer == 2'd1),
	.line_buf_l2_load(ctrl_load_batch),
	.line_buf_l2_output(ctrl_data_run),
	.line_buf_l2_skip(ctrl_skip_run),
	.line_buf_l2_rd_addr(line_buf_l2_rd_addr),
	.line_buf_l2_wr_data(l1_o_data_rd_data),
	.line_buf_l2_0_rd_data(line_buf_l2_0_rd_data),
	.line_buf_l2_1_rd_data(line_buf_l2_1_rd_data),
	.line_buf_l2_2_rd_data(line_buf_l2_2_rd_data),
	.is_receiving_state(line_buf_l2_receiving),
	.latch_done(l2_latch_done),
	.is_finished_state(is_finished_state)
);

reg [127:0] layer3_din;
always@(posedge clk, negedge rstn)begin
	if(~rstn)begin
		layer3_din <= 0;
	end
	else begin
		layer3_din <= l2_o_data_rd_data;
	end
end

//local col idx goes up by 4
//each 1x4x32 batch takes up 8 lines
//row doesn't matter since each row is loaded up in row buffer
assign line_buf_l1_rd_addr = local_col_idx*2+batch_ch_idx;

reg [3:0] batch_ch_idx_d1;
reg [3:0] batch_ch_idx_d2;
reg [3:0] batch_ch_idx_d3;

reg [3:0] pix_idx_d1;
reg [3:0] pix_idx_d2;


always@(posedge clk, negedge rstn)begin
	if(~rstn)begin
		batch_ch_idx_d1 <= 0;
		batch_ch_idx_d2 <= 0;
		batch_ch_idx_d3 <= 0;

		pix_idx_d1 <= 0;
		pix_idx_d2 <= 0;
	end
	else begin
		batch_ch_idx_d1 <= batch_ch_idx;
		batch_ch_idx_d2 <= batch_ch_idx_d1;
		batch_ch_idx_d3 <= batch_ch_idx_d2;

		pix_idx_d1 <= pix_idx;
		pix_idx_d2 <= pix_idx_d1;
	end
end


always@(*) begin
    vld_i     	= (mask_layer == 2'd2) ? ctrl_data_run_d3 : ctrl_data_run_d2;
 
	vld_i_st	= 	(mask_layer == 2'd0) ? (ctrl_data_run_d2 && (batch_ch_idx_d2 == 0)) : 
					(mask_layer == 2'd1) ? (ctrl_data_run_d2 && pix_idx_d2 == 0) ://what to change for layer 2?
					ctrl_data_run_d3;
	vld_i_ed	= 	(mask_layer == 2'd0) ? (ctrl_data_run_d2 && (batch_ch_idx_d2 == 4'd7)) : 
					(mask_layer == 2'd1) ? (ctrl_data_run_d2 && pix_idx_d2 == 'd8) ://what to change for layer 2?
					ctrl_data_run_d3;

	bias = 64'd0;
	scale = 64'd0;
	is_3x3_conv = 0;
	din = 128'd0;
	win = 512'd0;

	MASKLAYER3START = 0;
	//DUMMY CODE TO MAKE BIAS, SCALE 0
	if(dummy_code)begin
		bias = 16'd0;
		scale = 16'd0;
		is_3x3_conv = 0;
	end
	else begin
		if(mask_layer == 2'd0)begin
			for(i = 0; i < 4; i = i + 1)begin
				bias [i*PARAM_BITS+:PARAM_BITS] = mask_l1_b[i];
				scale[i*PARAM_BITS+:PARAM_BITS] = mask_l1_s[i];
			end
			is_3x3_conv = 0;
		end
		if(mask_layer == 2'd1)begin
			for(i = 0; i < 4; i = i + 1)begin
				bias [i*PARAM_BITS+:PARAM_BITS] = mask_l2_b[i];
				scale[i*PARAM_BITS+:PARAM_BITS] = mask_l2_s[i];
			end
			is_3x3_conv = 1;
		end
		if(mask_layer == 2'd2)begin //must iterate through 0~31
			//probably need to change to batch_ch_idx for layer 3
			MASKLAYER3START = 1;
			for(i = 0; i < 4; i = i + 1)begin
				bias [i*PARAM_BITS+:PARAM_BITS] = mask_l3_b[i + (batch_ch_idx_d3 * 4)];
				scale[i*PARAM_BITS+:PARAM_BITS] = mask_l3_s[i + (batch_ch_idx_d3 * 4)];
			end
			is_3x3_conv = 0;
		end
		
	end	
	

	if(ctrl_data_run_d2 && dummy_code == 1'b0)begin //for middle conv layers
		if(mask_layer == 2'd0)begin //layer 1 win, din logic
			
			//din[0  +: 32] = ifm_data[(0 + local_col_idx) * 2 + local_row_idx * 256 + ch_indexing_offset][effective_batch * 32 +: 32];		
			//din[32 +: 32] = ifm_data[(1 + local_col_idx) * 2 + local_row_idx * 256 + ch_indexing_offset][effective_batch * 32 +: 32];	
			//din[64 +: 32] = ifm_data[(2 + local_col_idx) * 2 + local_row_idx * 256 + ch_indexing_offset][effective_batch * 32 +: 32];	
			//din[96 +: 32] = ifm_data[(3 + local_col_idx) * 2 + local_row_idx * 256 + ch_indexing_offset][effective_batch * 32 +: 32];	

			din[0  +: 32] = layer1_din[32*3+:32]; 
			din[32 +: 32] = layer1_din[32*2+:32];
			din[64 +: 32] = layer1_din[32*1+:32];
			din[96 +: 32] = layer1_din[32*0+:32];

			win[0   +: 32] = mask_l1_w[0][batch_ch_idx_d2 * 4 * WI +: 4 * WI];
			win[128 +: 32] = mask_l1_w[1][batch_ch_idx_d2 * 4 * WI +: 4 * WI];
			win[256 +: 32] = mask_l1_w[2][batch_ch_idx_d2 * 4 * WI +: 4 * WI];
			win[384 +: 32] = mask_l1_w[3][batch_ch_idx_d2 * 4 * WI +: 4 * WI];

			/*
			win[0   +: 32] = mask_l1_w[weight_row_offset][0  + 32 * (weight_col_offset) * 4 * WI +: 4 * WI];
			win[128 +: 32] = mask_l1_w[weight_row_offset][32 + 32 * (weight_col_offset) * 4 * WI +: 4 * WI];
			win[256 +: 32] = mask_l1_w[weight_row_offset][64 + 32 * (weight_col_offset) * 4 * WI +: 4 * WI];
			win[384 +: 32] = mask_l1_w[weight_row_offset][96 + 32 * (weight_col_offset) * 4 * WI +: 4 * WI];
			*/

		end
		if(mask_layer == 2'd1)begin //layer 2 win, din logic
			//MASKLAYER2START = 1'b1;

			case(pix_idx_d2)
				'd0 : begin
					win[0   +: 32] = mask_l2_w[0][0  +: 32];
					win[128 +: 32] = mask_l2_w[0][32 +: 32];
					win[256 +: 32] = mask_l2_w[0][64 +: 32];
					win[384 +: 32] = mask_l2_w[0][96 +: 32];

					if(is_first_row) din = 128'd0;
					else begin
						//if(is_first_col)begin
						//	din[0+:32] = 32'b0;
						//	din[32+:96] = layer2_din0[32+:96];
						//end
						//else
							din = layer2_din0[0+:128];
						
					end
				end
				'd1 : begin
					win[0   +: 32] = mask_l2_w[1][0  +: 32];
					win[128 +: 32] = mask_l2_w[1][32 +: 32];
					win[256 +: 32] = mask_l2_w[1][64 +: 32];
					win[384 +: 32] = mask_l2_w[1][96 +: 32];
					if(is_first_row) din = 128'd0;
					else begin
						din = layer2_din0[32+:128];
					end
				end
				'd2 : begin
					win[0   +: 32] = mask_l2_w[2][0  +: 32];
					win[128 +: 32] = mask_l2_w[2][32 +: 32];
					win[256 +: 32] = mask_l2_w[2][64 +: 32];
					win[384 +: 32] = mask_l2_w[2][96 +: 32];
					
					if(is_first_row) din = 128'd0;
					else begin
						//if(is_last_col)begin
						//	din[0+:96] = layer2_din0[0+:96];
						//	din[96+:32] = 32'b0;
						//end
						//else 
							din = layer2_din0[64+:128];
					end
				end
				'd3 : begin
					win[0   +: 32] = mask_l2_w[3][0  +: 32];
					win[128 +: 32] = mask_l2_w[3][32 +: 32];
					win[256 +: 32] = mask_l2_w[3][64 +: 32];
					win[384 +: 32] = mask_l2_w[3][96 +: 32];
					//if(is_first_col)begin
					//	din[0+:32] = 32'b0;
					//	din[32+:96] = layer2_din1[32+:96];
					//end
					//else
						din = layer2_din1[0+:128];
				end
				'd4 : begin
					win[0   +: 32] = mask_l2_w[4][0  +: 32];
					win[128 +: 32] = mask_l2_w[4][32 +: 32];
					win[256 +: 32] = mask_l2_w[4][64 +: 32];
					win[384 +: 32] = mask_l2_w[4][96 +: 32];
					
					din = layer2_din1[32+:128];
				end
				'd5 : begin
					win[0   +: 32] = mask_l2_w[5][0  +: 32];
					win[128 +: 32] = mask_l2_w[5][32 +: 32];
					win[256 +: 32] = mask_l2_w[5][64 +: 32];
					win[384 +: 32] = mask_l2_w[5][96 +: 32];
					//if(is_last_col)begin
					//	din[0+:96] = layer2_din1[0+:96];
					//	din[96+:32] = 32'b0;
					//end
					//else 
						din = layer2_din1[64+:128];
				end
				'd6 : begin
					win[0   +: 32] = mask_l2_w[6][0  +: 32];
					win[128 +: 32] = mask_l2_w[6][32 +: 32];
					win[256 +: 32] = mask_l2_w[6][64 +: 32];
					win[384 +: 32] = mask_l2_w[6][96 +: 32];
					
					if(is_last_row) din = 128'd0;
					else begin
						//if(is_first_col)begin
						//	din[0+:32] = 32'b0;
						//	din[32+:96] = layer2_din2[32+:96];
						//end
						//else 
							din = layer2_din2[0+:128];
					end
				end
				'd7 : begin
					win[0   +: 32] = mask_l2_w[7][0  +: 32];
					win[128 +: 32] = mask_l2_w[7][32 +: 32];
					win[256 +: 32] = mask_l2_w[7][64 +: 32];
					win[384 +: 32] = mask_l2_w[7][96 +: 32];
					
					if(is_last_row) din = 128'd0;
					else begin
						din = layer2_din2[32+:128];
					end
				end
				'd8 : begin
					win[0   +: 32] = mask_l2_w[8][0  +: 32];
					win[128 +: 32] = mask_l2_w[8][32 +: 32];
					win[256 +: 32] = mask_l2_w[8][64 +: 32];
					win[384 +: 32] = mask_l2_w[8][96 +: 32];
					
					if(is_last_row) din = 128'd0;
					else begin
					//	if(is_last_col)begin
					//		din[96+:32] = 32'b0;
					//		din[0+:96] = layer2_din2[0+:96];
					//	end
					//	else 
							din = layer2_din2[64+:128];
					end
				end
				default : begin
					din = 128'b0;
					win = 512'b0;
				end
			endcase

		end
	end
	if(ctrl_data_run_d3)begin
		if(mask_layer == 2'd2)begin //layer 3 win, din logic
			din = layer3_din;

			win[0   +: 32] = mask_l3_w[4 * batch_ch_idx_d3 + 0];
			win[128 +: 32] = mask_l3_w[4 * batch_ch_idx_d3 + 1];
			win[256 +: 32] = mask_l3_w[4 * batch_ch_idx_d3 + 2];
			win[384 +: 32] = mask_l3_w[4 * batch_ch_idx_d3 + 3];
		end
	end
end


wire [31:0] din0 = din[0+:32];
wire [31:0] din1 = din[32+:32];
wire [31:0] din2 = din[64+:32];
wire [31:0] din3 = din[96+:32];

wire [31:0] win0 = win[0+:32];
wire [31:0] win1 = win[128+:32];
wire [31:0] win2 = win[256+:32];
wire [31:0] win3 = win[384+:32];

wire read_l1_o_data_finished;
assign read_l1_o_data_finished = (l1_o_data_addr == 4095);

reg [11:0] layer1_current_batch;
reg l2_latch_done_d;
wire inc_batch_pulse;
wire load_batch_pulse;

assign load_batch_pulse = (!ctrl_load_batch_d2) && ctrl_load_batch_d1;

reg [11:0] base_line_addr;
always@(posedge clk, negedge rstn)begin
	if(~rstn)begin
		base_line_addr <= 0;
	end
	else begin
		if(load_batch_pulse && (mask_layer == 'd1))begin
			base_line_addr <= base_line_addr + 32;
		end
	end
end

assign inc_batch_pulse = (!l2_latch_done_d) && l2_latch_done;

always@(posedge clk, negedge rstn)begin
	if(~rstn) begin
		layer1_current_batch <= 12'b0;
		l2_latch_done_d <= 0;
	end
	else begin
		l2_latch_done_d <= l2_latch_done;
		if(inc_batch_pulse)begin
			layer1_current_batch <= layer1_current_batch + 1;
		end
		//set layer1_current_batch to base_line_addr when finished loading
		//prepare start address of layer1_current_batch for next batch
		else if(is_finished_state && (mask_layer == 'd1))begin
			layer1_current_batch <= base_line_addr;
		end
	end
end

//write acc_o to l2_o_data_128x4096
reg [11:0] l2_o_data_addr_adv;
wire read_l2_o_data_finished;
assign read_l2_o_data_finished = (l2_o_data_addr == 4095);

always@(posedge clk, negedge rstn)begin
	if(~rstn)begin
		l2_o_data_addr <= 12'b0;
		l2_o_data_wr_data <= 128'b0;
		l2_o_data_ena <= 1'b0;
		l2_o_data_wr_ena <= 1'b0;
		l2_o_data_addr_adv <= 12'b0;
	end
	else begin
		if(vld_o[0] && mask_layer == 'd1)begin
			l2_o_data_ena <= 1;
			l2_o_data_wr_ena <= 1;
			l2_o_data_wr_data <= acc_o;
			l2_o_data_addr_adv <= l2_o_data_addr_adv + 1;
			l2_o_data_addr <= l2_o_data_addr_adv;
		end
		
		//insert values directly without any preloading business
		else if(((vld_i)||(ctrl_data_run)) && mask_layer == 'd2)begin
			l2_o_data_ena <= 1;
			l2_o_data_wr_ena <= 0;
			if(batch_ch_idx_d1 == 'd7)
				l2_o_data_addr <= l2_o_data_addr + 1;
			//l2_o_data_addr <= col_d3[9:2];
		end
		else begin
			l2_o_data_ena <= 0;
			l2_o_data_wr_ena <= 0;
			if(read_l2_o_data_finished)
				l2_o_data_addr <= 0;
		end
	end
end


//write acc_o to l1_o_data_128x4096
//read l1_o_data, and write to line_buf_l2 when doing layer 2 calc

//opposite of delay adv (advance)
reg [11:0] l1_o_data_addr_adv; //to make write work properly

always@(posedge clk, negedge rstn)begin
	if(~rstn)begin
		l1_o_data_addr <= 12'd0;
		l1_o_data_wr_data <= 128'd0;
		l1_o_data_ena <= 1'd0;
		l1_o_data_addr_adv <= 12'd0;
		l1_o_data_wr_ena <= 1'b0;
	end
	else begin
		//if acc_o valid, write to layer 1
		if(vld_o[0] && mask_layer == 'd0)begin
			l1_o_data_ena <= 1'b1;
			l1_o_data_wr_ena <= 1'b1;
			l1_o_data_wr_data <= acc_o;
			l1_o_data_addr_adv <= l1_o_data_addr_adv + 1;
			l1_o_data_addr <= l1_o_data_addr_adv;
		end
		
		//read from o_l1_data and write to line_buf_l2
		else if(ctrl_load_batch && mask_layer == 'd1)begin
			l1_o_data_ena <= 1'b1;
			l1_o_data_wr_ena <= 1'b0;
			//must send 3 lines total
			if(line_buf_l2_receiving)begin
				l1_o_data_addr <= l1_o_data_addr + 1;
			end
			else begin
				l1_o_data_addr <= layer1_current_batch;
			end
		end

		//if nothing, turn off l1_o_data
		else begin
			l1_o_data_ena <= 0;
			l1_o_data_wr_ena <= 0;
			if(read_l1_o_data_finished) begin
				l1_o_data_addr <= 0;
			end
		end
	end
end


always@(posedge clk, negedge rstn)begin
	if(~rstn)begin
		sender_cstate <= 0;
		//sender_nstate <= 0;
	end
	else begin
		sender_cstate <= sender_nstate;
	end
end

always@(*)begin
	sender_nstate = SENDER_IDLE;
	case(sender_cstate)
		SENDER_IDLE : begin
			if(mask_layer == 'd3 && !all_done)
				sender_nstate = SENDER_DELAY;
			else
				sender_nstate = SENDER_IDLE;
		end
		SENDER_DELAY : begin
			if(burst_delay == 7'd100)
				sender_nstate = SENDER_REC;
			else if(all_done)
				sender_nstate = SENDER_FIN;
			else
				sender_nstate = SENDER_DELAY;
		end
		SENDER_REC : begin
			if(omask_out_rd_cnt == 'd7)//finished reading 8 lines
				sender_nstate = SENDER_SEND;
			else
				sender_nstate = SENDER_REC;
		end
		SENDER_SEND : begin
			if(burst_count == 6'd31)
				sender_nstate = SENDER_DELAY;
			//else if(all_done)
			//	sender_nstate = SENDER_IDLE;
			else
				sender_nstate = SENDER_SEND;
		end
		SENDER_FIN : begin
			if(ap_start)
				sender_nstate = SENDER_IDLE;
			else
				sender_nstate = SENDER_FIN;
		end
		default : begin
			sender_nstate = SENDER_IDLE;
		end
	endcase
end
reg [3:0] omask_out_rd_cnt_d1;
reg [3:0] omask_out_rd_cnt_d2;
always@(posedge clk, negedge rstn)begin
	if(~rstn)begin
		omask_out_rd_cnt_d1 <= 4'b0;
		omask_out_rd_cnt_d2 <= 4'b0;
	end
	else begin
		omask_out_rd_cnt_d1 <= omask_out_rd_cnt;
		omask_out_rd_cnt_d2 <= omask_out_rd_cnt_d1;
	end
end

wire sender_finished_reading;

assign sender_finished_reading = (omask_out_rd_cnt_d2 >= 4'd8);

always@(posedge clk, negedge rstn)begin
	if(~rstn) begin
		burst_count <= 5'b0;
		burst_count_adv <= 5'b0;
		burst_delay <= 7'd0;
		omask_out_rd_cnt <= 4'd0;
	end
	else begin
		if(sender_cstate == SENDER_DELAY)begin
			burst_count <= 5'b0;
			burst_count_adv <= 5'b0;
			burst_delay <= burst_delay + 1;
			omask_out_rd_cnt <= 4'd0;
		end
		else if(sender_cstate == SENDER_REC)begin
			burst_count <= 5'b0;
			burst_count_adv <= 5'b0;
			burst_delay <= 0;
			omask_out_rd_cnt <= omask_out_rd_cnt + 1;
		end
		else if(sender_cstate == SENDER_SEND)begin
			//if data read from ifm_data is valid
			if(sender_finished_reading)begin 
				//burst_count_adv <= burst_count_adv + 1;
				//burst_count <= burst_count_adv;
				burst_count <= burst_count + 1;
				burst_delay <= 0;
			end
			//omask_out_rd_cnt <= 4'd0;
		end
	end
end

always@(posedge clk, negedge rstn)begin
	if(~rstn)begin
		omask_out_pix_buffer[0] <= 128'd0;
		omask_out_pix_buffer[1] <= 128'd0;
		omask_out_pix_buffer[2] <= 128'd0;
		omask_out_pix_buffer[3] <= 128'd0;
		omask_out_pix_buffer[4] <= 128'd0;
		omask_out_pix_buffer[5] <= 128'd0;
		omask_out_pix_buffer[6] <= 128'd0;
		omask_out_pix_buffer[7] <= 128'd0;
	end
	else begin
		//write omask to omask_out_pix_buffer
		omask_out_pix_buffer[omask_out_rd_cnt_d2] <= ifm_data_rd_data;
		//omask_out_pix_buffer[burst_count[5:2]][burst_count[1:0]]
	end
end	

wire [1:0] bit_sel = burst_count[1:0];
wire [4:0] idx_sel = burst_count[4:2];

//assign omask_out_pix = omask_out_pix_buffer[burst_count[5:2]][burst_count[1:0]*32+:32];
assign omask_out_pix = omask_out_pix_buffer[idx_sel][bit_sel * 32 +: 32];
assign omask_out_pix_vld = (sender_cstate_d2 == SENDER_SEND) && (sender_cstate == SENDER_SEND);
assign last_pix = (all_done && (bit_sel == 2'd3 && idx_sel == 5'd7));

always@(posedge clk, negedge rstn)begin
	if(~rstn) all_done <= 0;
	else if(finished_sending) all_done <= 1;
end




//assign omask_out_pix = ifm_data_rd_data;
//assign omask_out_pix_vld = (sender_cstate_d2 == SENDER_SEND) && vld_o;

assign maskgen_finished = (output_pixel_cnt == 20'd32768);

//for debugging, check if omask stored correctly
/*
integer debug_fd;

initial begin
	debug_fd = $fopen("C:\\maskgenFPGA\\dfx\\ip\\omask_maskmaker.txt", "wb+");
end

always@(frame_done[0])begin
	if(frame_done[0])begin
		$display("checking output from maskmaker");
		for(i = 0; i< FMAP_FRAME_SIZE * 32; i = i + 1)begin
			if(i % 128 == 0 && i != 0)begin
				$fwrite(debug_fd, "\n");
			end
			$fwrite(debug_fd, "%x", omask[i]);
			//$fwrite(debug_fd, "%x", mask_l3_o[i]);
		end
		//$display("showing some elements of omask\n");
		//$display("%x\n",omask[133]);
		//$display("%x\n",omask[134]);
		$fclose(debug_fd);
	end
end*/


////////////////////////////////////////////////////////////////
//checking output stuff
// synopsys translate_off
parameter OUTFILE00 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch00.bmp";
parameter OUTFILE01 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch01.bmp";
parameter OUTFILE02 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch02.bmp";
parameter OUTFILE03 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch03.bmp";
parameter OUTFILE04 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch04.bmp";
parameter OUTFILE05 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch05.bmp";
parameter OUTFILE06 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch06.bmp";
parameter OUTFILE07 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch07.bmp";
parameter OUTFILE08 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch08.bmp";
parameter OUTFILE09 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch09.bmp";
parameter OUTFILE10 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch10.bmp";
parameter OUTFILE11 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch11.bmp";
parameter OUTFILE12 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch12.bmp";
parameter OUTFILE13 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch13.bmp";
parameter OUTFILE14 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch14.bmp";
parameter OUTFILE15 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch15.bmp";
parameter OUTFILE16 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch16.bmp";
parameter OUTFILE17 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch17.bmp";
parameter OUTFILE18 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch18.bmp";
parameter OUTFILE19 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch19.bmp";
parameter OUTFILE20 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch20.bmp";
parameter OUTFILE21 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch21.bmp";
parameter OUTFILE22 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch22.bmp";
parameter OUTFILE23 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch23.bmp";
parameter OUTFILE24 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch24.bmp";
parameter OUTFILE25 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch25.bmp";
parameter OUTFILE26 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch26.bmp";
parameter OUTFILE27 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch27.bmp";
parameter OUTFILE28 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch28.bmp";
parameter OUTFILE29 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch29.bmp";
parameter OUTFILE30 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch30.bmp";
parameter OUTFILE31 = "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/tv/wdatafile/out/convout_ch31.bmp";

//parameter OMASK_OUTFILE = "./out/omask.hex";

reg [2:0] write_ch;
always@(posedge clk, negedge rstn)begin
	if(~rstn)
		write_ch <= 0;
	else begin
		if(vld_o[0])begin
			if(write_ch == 'd7)
				write_ch <= 0;
			else
				write_ch <= write_ch + 1;
		end
	end
end

//for layer 3
wire en_bmp_0 = ((mask_layer == 'd2) && (write_ch == 'd0) && (vld_o[0])) ? 1 : 0;
wire en_bmp_1 = ((mask_layer == 'd2) && (write_ch == 'd1) && (vld_o[0])) ? 1 : 0;
wire en_bmp_2 = ((mask_layer == 'd2) && (write_ch == 'd2) && (vld_o[0])) ? 1 : 0;
wire en_bmp_3 = ((mask_layer == 'd2) && (write_ch == 'd3) && (vld_o[0])) ? 1 : 0;
wire en_bmp_4 = ((mask_layer == 'd2) && (write_ch == 'd4) && (vld_o[0])) ? 1 : 0;
wire en_bmp_5 = ((mask_layer == 'd2) && (write_ch == 'd5) && (vld_o[0])) ? 1 : 0;
wire en_bmp_6 = ((mask_layer == 'd2) && (write_ch == 'd6) && (vld_o[0])) ? 1 : 0;
wire en_bmp_7 = ((mask_layer == 'd2) && (write_ch == 'd7) && (vld_o[0])) ? 1 : 0;

//for layer 1 or layer 2
//for layer1 mask_layer == 'd0
//for layer2 mask_layer == 'd1
//wire en_bmp_0 = ((mask_layer == 'd0) && (vld_o[0])) ? 1 : 0;
//wire en_bmp_1 = 0;
//wire en_bmp_2 = 0;
//wire en_bmp_3 = 0;
//wire en_bmp_4 = 0;
//wire en_bmp_5 = 0;
//wire en_bmp_6 = 0;
//wire en_bmp_7 = 0;

wire bmp_rstn = rstn;

wire frame_done[0:31];

//for testing omask
//wire [7:0] acc_o_0  = (acc_o[0 + 8*0  +: 8] > 0) ? 8'd255 : 8'd0;
//wire [7:0] acc_o_1  = (acc_o[0 + 8*1  +: 8] > 0) ? 8'd255 : 8'd0;
//wire [7:0] acc_o_2  = (acc_o[0 + 8*2  +: 8] > 0) ? 8'd255 : 8'd0;
//wire [7:0] acc_o_3  = (acc_o[0 + 8*3  +: 8] > 0) ? 8'd255 : 8'd0;
//wire [7:0] acc_o_4  = (acc_o[0 + 8*4  +: 8] > 0) ? 8'd255 : 8'd0;
//wire [7:0] acc_o_5  = (acc_o[0 + 8*5  +: 8] > 0) ? 8'd255 : 8'd0;
//wire [7:0] acc_o_6  = (acc_o[0 + 8*6  +: 8] > 0) ? 8'd255 : 8'd0;
//wire [7:0] acc_o_7  = (acc_o[0 + 8*7  +: 8] > 0) ? 8'd255 : 8'd0;
//wire [7:0] acc_o_8  = (acc_o[0 + 8*8  +: 8] > 0) ? 8'd255 : 8'd0;
//wire [7:0] acc_o_9  = (acc_o[0 + 8*9  +: 8] > 0) ? 8'd255 : 8'd0;
//wire [7:0] acc_o_10 = (acc_o[0 + 8*10 +: 8] > 0) ? 8'd255 : 8'd0;
//wire [7:0] acc_o_11 = (acc_o[0 + 8*11 +: 8] > 0) ? 8'd255 : 8'd0;
//wire [7:0] acc_o_12 = (acc_o[0 + 8*12 +: 8] > 0) ? 8'd255 : 8'd0;
//wire [7:0] acc_o_13 = (acc_o[0 + 8*13 +: 8] > 0) ? 8'd255 : 8'd0;
//wire [7:0] acc_o_14 = (acc_o[0 + 8*14 +: 8] > 0) ? 8'd255 : 8'd0;
//wire [7:0] acc_o_15 = (acc_o[0 + 8*15 +: 8] > 0) ? 8'd255 : 8'd0;

//for testing non last layer
wire [7:0] acc_o_0  = acc_o[0 + 8*0  +: 8];
wire [7:0] acc_o_1  = acc_o[0 + 8*1  +: 8];
wire [7:0] acc_o_2  = acc_o[0 + 8*2  +: 8];
wire [7:0] acc_o_3  = acc_o[0 + 8*3  +: 8];
wire [7:0] acc_o_4  = acc_o[0 + 8*4  +: 8];
wire [7:0] acc_o_5  = acc_o[0 + 8*5  +: 8];
wire [7:0] acc_o_6  = acc_o[0 + 8*6  +: 8];
wire [7:0] acc_o_7  = acc_o[0 + 8*7  +: 8];
wire [7:0] acc_o_8  = acc_o[0 + 8*8  +: 8];
wire [7:0] acc_o_9  = acc_o[0 + 8*9  +: 8];
wire [7:0] acc_o_10 = acc_o[0 + 8*10 +: 8];
wire [7:0] acc_o_11 = acc_o[0 + 8*11 +: 8];
wire [7:0] acc_o_12 = acc_o[0 + 8*12 +: 8];
wire [7:0] acc_o_13 = acc_o[0 + 8*13 +: 8];
wire [7:0] acc_o_14 = acc_o[0 + 8*14 +: 8];
wire [7:0] acc_o_15 = acc_o[0 + 8*15 +: 8];

//image writers for verification
//with en_bmp_0
bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE00))
u_bmp_image_writer_00(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_0),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_0),
./*input [WI-1:0] 	*/din1(acc_o_4),
./*input [WI-1:0] 	*/din2(acc_o_8),
./*input [WI-1:0] 	*/din3(acc_o_12),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[0])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE01))
u_bmp_image_writer_01(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_0),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_1),
./*input [WI-1:0] 	*/din1(acc_o_5),
./*input [WI-1:0] 	*/din2(acc_o_9),
./*input [WI-1:0] 	*/din3(acc_o_13),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[1])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE02))
u_bmp_image_writer_02(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_0),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_2),
./*input [WI-1:0] 	*/din1(acc_o_6),
./*input [WI-1:0] 	*/din2(acc_o_10),
./*input [WI-1:0] 	*/din3(acc_o_14),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[2])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE03))
u_bmp_image_writer_03(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_0),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_3),
./*input [WI-1:0] 	*/din1(acc_o_7),
./*input [WI-1:0] 	*/din2(acc_o_11),
./*input [WI-1:0] 	*/din3(acc_o_15),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[3])
);

//with en_bmp_1
bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE04))
u_bmp_image_writer_04(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_1),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_0),
./*input [WI-1:0] 	*/din1(acc_o_4),
./*input [WI-1:0] 	*/din2(acc_o_8),
./*input [WI-1:0] 	*/din3(acc_o_12),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[4])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE05))
u_bmp_image_writer_05(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_1),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_1),
./*input [WI-1:0] 	*/din1(acc_o_5),
./*input [WI-1:0] 	*/din2(acc_o_9),
./*input [WI-1:0] 	*/din3(acc_o_13),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[5])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE06))
u_bmp_image_writer_06(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_1),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_2),
./*input [WI-1:0] 	*/din1(acc_o_6),
./*input [WI-1:0] 	*/din2(acc_o_10),
./*input [WI-1:0] 	*/din3(acc_o_14),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[6])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE07))
u_bmp_image_writer_07(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_1),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_3),
./*input [WI-1:0] 	*/din1(acc_o_7),
./*input [WI-1:0] 	*/din2(acc_o_11),
./*input [WI-1:0] 	*/din3(acc_o_15),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[7])
);

//en_bmp_2
bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE08))
u_bmp_image_writer_08(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_2),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_0),
./*input [WI-1:0] 	*/din1(acc_o_4),
./*input [WI-1:0] 	*/din2(acc_o_8),
./*input [WI-1:0] 	*/din3(acc_o_12),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[8])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE09))
u_bmp_image_writer_09(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_2),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_1),
./*input [WI-1:0] 	*/din1(acc_o_5),
./*input [WI-1:0] 	*/din2(acc_o_9),
./*input [WI-1:0] 	*/din3(acc_o_13),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[9])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE10))
u_bmp_image_writer_10(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_2),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_2),
./*input [WI-1:0] 	*/din1(acc_o_6),
./*input [WI-1:0] 	*/din2(acc_o_10),
./*input [WI-1:0] 	*/din3(acc_o_14),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[10])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE11))
u_bmp_image_writer_11(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_2),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_3),
./*input [WI-1:0] 	*/din1(acc_o_7),
./*input [WI-1:0] 	*/din2(acc_o_11),
./*input [WI-1:0] 	*/din3(acc_o_15),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[11])
);


//en_bmp_3
bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE12))
u_bmp_image_writer_12(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_3),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_0),
./*input [WI-1:0] 	*/din1(acc_o_4),
./*input [WI-1:0] 	*/din2(acc_o_8),
./*input [WI-1:0] 	*/din3(acc_o_12),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[12])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE13))
u_bmp_image_writer_13(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_3),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_1),
./*input [WI-1:0] 	*/din1(acc_o_5),
./*input [WI-1:0] 	*/din2(acc_o_9),
./*input [WI-1:0] 	*/din3(acc_o_13),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[13])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE14))
u_bmp_image_writer_14(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_3),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_2),
./*input [WI-1:0] 	*/din1(acc_o_6),
./*input [WI-1:0] 	*/din2(acc_o_10),
./*input [WI-1:0] 	*/din3(acc_o_14),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[14])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE15))
u_bmp_image_writer_15(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_3),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_3),
./*input [WI-1:0] 	*/din1(acc_o_7),
./*input [WI-1:0] 	*/din2(acc_o_11),
./*input [WI-1:0] 	*/din3(acc_o_15),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[15])
);

//en_bmp_4
bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE16))
u_bmp_image_writer_16(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_4),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_0),
./*input [WI-1:0] 	*/din1(acc_o_4),
./*input [WI-1:0] 	*/din2(acc_o_8),
./*input [WI-1:0] 	*/din3(acc_o_12),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[16])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE17))
u_bmp_image_writer_17(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_4),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_1),
./*input [WI-1:0] 	*/din1(acc_o_5),
./*input [WI-1:0] 	*/din2(acc_o_9),
./*input [WI-1:0] 	*/din3(acc_o_13),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[17])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE18))
u_bmp_image_writer_18(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_4),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_2),
./*input [WI-1:0] 	*/din1(acc_o_6),
./*input [WI-1:0] 	*/din2(acc_o_10),
./*input [WI-1:0] 	*/din3(acc_o_14),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[18])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE19))
u_bmp_image_writer_19(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_4),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_3),
./*input [WI-1:0] 	*/din1(acc_o_7),
./*input [WI-1:0] 	*/din2(acc_o_11),
./*input [WI-1:0] 	*/din3(acc_o_15),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[19])
);

//en_bmp_5
bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE20))
u_bmp_image_writer_20(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_5),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_0),
./*input [WI-1:0] 	*/din1(acc_o_4),
./*input [WI-1:0] 	*/din2(acc_o_8),
./*input [WI-1:0] 	*/din3(acc_o_12),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[20])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE21))
u_bmp_image_writer_21(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_5),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_1),
./*input [WI-1:0] 	*/din1(acc_o_5),
./*input [WI-1:0] 	*/din2(acc_o_9),
./*input [WI-1:0] 	*/din3(acc_o_13),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[21])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE22))
u_bmp_image_writer_22(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_5),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_2),
./*input [WI-1:0] 	*/din1(acc_o_6),
./*input [WI-1:0] 	*/din2(acc_o_10),
./*input [WI-1:0] 	*/din3(acc_o_14),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[22])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE23))
u_bmp_image_writer_23(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_5),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_3),
./*input [WI-1:0] 	*/din1(acc_o_7),
./*input [WI-1:0] 	*/din2(acc_o_11),
./*input [WI-1:0] 	*/din3(acc_o_15),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[23])
);

//en_bmp_6
bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE24))
u_bmp_image_writer_24(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_6),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_0),
./*input [WI-1:0] 	*/din1(acc_o_4),
./*input [WI-1:0] 	*/din2(acc_o_8),
./*input [WI-1:0] 	*/din3(acc_o_12),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[24])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE25))
u_bmp_image_writer_25(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_6),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_1),
./*input [WI-1:0] 	*/din1(acc_o_5),
./*input [WI-1:0] 	*/din2(acc_o_9),
./*input [WI-1:0] 	*/din3(acc_o_13),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[25])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE26))
u_bmp_image_writer_26(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_6),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_2),
./*input [WI-1:0] 	*/din1(acc_o_6),
./*input [WI-1:0] 	*/din2(acc_o_10),
./*input [WI-1:0] 	*/din3(acc_o_14),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[26])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE27))
u_bmp_image_writer_27(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_6),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_3),
./*input [WI-1:0] 	*/din1(acc_o_7),
./*input [WI-1:0] 	*/din2(acc_o_11),
./*input [WI-1:0] 	*/din3(acc_o_15),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[27])
);

//en_bmp_7
bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE28))
u_bmp_image_writer_28(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_7),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_0),
./*input [WI-1:0] 	*/din1(acc_o_4),
./*input [WI-1:0] 	*/din2(acc_o_8),
./*input [WI-1:0] 	*/din3(acc_o_12),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[28])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE29))
u_bmp_image_writer_29(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_7),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_1),
./*input [WI-1:0] 	*/din1(acc_o_5),
./*input [WI-1:0] 	*/din2(acc_o_9),
./*input [WI-1:0] 	*/din3(acc_o_13),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[29])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE30))
u_bmp_image_writer_30(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_7),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_2),
./*input [WI-1:0] 	*/din1(acc_o_6),
./*input [WI-1:0] 	*/din2(acc_o_10),
./*input [WI-1:0] 	*/din3(acc_o_14),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[30])
);

bmp_image_writer#(.WIDTH(FMAP_WIDTH),.HEIGHT(FMAP_HEIGHT),.OUTFILE(OUTFILE31))
u_bmp_image_writer_31(
./*input 			*/clk(clk),
./*input 			*/ena(en_bmp_7),
./*input 			*/rstn(bmp_rstn),
./*input [WI-1:0] 	*/din0(acc_o_3),
./*input [WI-1:0] 	*/din1(acc_o_7),
./*input [WI-1:0] 	*/din2(acc_o_11),
./*input [WI-1:0] 	*/din3(acc_o_15),
./*input 			*/vld(vld_o[0]),
./*output reg 		*/frame_done(frame_done[31])
);

//wire frame_done[0:31];
//synopsys translate_on
endmodule