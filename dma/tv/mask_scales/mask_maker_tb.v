`timescale 1ns/1ps


module mask_maker_tb;
// Files
parameter IFM_FILE    = "./sparsecnn/out_sw/m3/convout_L2.hex";
parameter OFM_FILE    = "./sparsecnn/out_sw/m3/convout_L3.hex";

//weights for layers ALL PARAMETERS HARD CODED FOR LAYER 3

parameter MASK_L1_WEIGHT	= "./sparsecnn/input_data/mask_weights/mask_gen_weight_2_0.hex";
parameter MASK_L2_WEIGHT	= "./sparsecnn/input_data/mask_weights/mask_gen_weight_2_1.hex";
parameter MASK_L3_WEIGHT	= "./sparsecnn/input_data/mask_weights/mask_gen_weight_2_2.hex";

//biases for layers
parameter MASK_L1_BIAS = "./sparsecnn/input_data/mask_biases/mask_gen_bias_2_0.hex";
parameter MASK_L2_BIAS = "./sparsecnn/input_data/mask_biases/mask_gen_bias_2_1.hex";
parameter MASK_L3_BIAS = "./sparsecnn/input_data/mask_biases/mask_gen_bias_2_2.hex";

//scales for layers
parameter MASK_L1_SCALES = "./sparsecnn/input_data/mask_scales/mask_gen_scale_2_0.hex";
parameter MASK_L2_SCALES = "./sparsecnn/input_data/mask_scales/mask_gen_scale_2_1.hex";
parameter MASK_L3_SCALES = "./sparsecnn/input_data/mask_scales/mask_gen_scale_2_2.hex";


//-------------------------------------------------
// Parameters
//-------------------------------------------------
parameter   CLK_PERIOD       = 10.0;		// 100 MHz
parameter   FMAP_WIDTH       = 128;
parameter   FMAP_HEIGHT      = 128;
 localparam FMAP_FRAME_SIZE  =  FMAP_WIDTH * FMAP_HEIGHT;
parameter   FILTER_SIZE_X    = 1;
parameter   FILTER_SIZE_Y    = 1;
 localparam FILTER_SIZE_2D   = FILTER_SIZE_X * FILTER_SIZE_Y;
parameter   INP_CHANNEL_NUM  = 32;
parameter   OUT_CHANNEL_NUM  = 4; //for first layer of mask generation

parameter   Ti = 4; // number multipliers in each kernel
parameter	Tw = 4; //width of input
parameter   To = 4;// number of kernels
parameter   WI = 8; //width of quantized numbers

parameter	L1_MASK_DIM_1	= 1;
parameter	L1_MASK_DIM_2	= 1;
parameter	L1_MASK_DIM_3	= 32;
parameter	L1_MASK_DIM_4	= 4;

parameter	L2_MASK_DIM_1	= 3;
parameter	L2_MASK_DIM_2	= 3;
parameter	L2_MASK_DIM_3	= 4;
parameter	L2_MASK_DIM_4	= 4;

parameter	L3_MASK_DIM_1	= 1;
parameter	L3_MASK_DIM_2	= 1;
parameter	L3_MASK_DIM_3	= 4;
parameter	L3_MASK_DIM_4	= 32;

parameter	FM_OFFSET		= 4096; //1024 * 4


 localparam N  = 3*Ti; 
 localparam NW = $clog2(N+1);
parameter   ACT_BITS   = 8;
parameter   PARAM_BITS = 16;

//total 		128 * 128 * 32 numbers, each number is 8 bit
//organized as 	16 * 32768 numbers, 16 * 32768 * 8 bit total = 
//				[16 * 8bit-1:0] ifm_data [0:(128 * 128 * 32) / 16 * 8bit - 1]
//				128b * 4096b
reg [127: 0] ifm_data 	[0:((FMAP_FRAME_SIZE*INP_CHANNEL_NUM               )/16)-1]; 
reg [127: 0] omask		[0:((FMAP_FRAME_SIZE*INP_CHANNEL_NUM               )/16)-1];
reg [127: 0] wgt_data 	[0:((INP_CHANNEL_NUM*OUT_CHANNEL_NUM*FILTER_SIZE_2D)/16)-1];
reg [127: 0] ofm_data 	[0:((FMAP_FRAME_SIZE*INP_CHANNEL_NUM               )/16)-1];
reg [ 15: 0] biases  	[0:OUT_CHANNEL_NUM-1];
reg [ 15: 0] scales   	[0:OUT_CHANNEL_NUM-1];
 
//@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//
//mask we ights for layers 3 to 6
//1*1*32* 4
reg [255: 0] mask_l1_w	[0:3]; 		//32 * 8bit by 4 	|| [255:0]*[3:0]
reg [ 15: 0] mask_l1_b 	[0:3]; 		//32*8bit bias		|| 
reg	[ 15: 0] mask_l1_s	[0:3];
//output from layer 1 of mask generation
//reg [7:0] mask_l1_o [0 : 128*128*4-1] consider having each 8 bit pixel as its own row, similar to class
reg [1023:0] mask_l1_o	[0: 511];		//(128*8b by 128) * 4

//3*3*4*4
reg [287:0] mask_l2_w	[0:3]; 	//3x3x4xWI = 288 size filter, 4 of them
reg	[15:0 ]	mask_l2_b	[0:3]; //4*8bit bias
reg [15:0 ] mask_l2_s	[0:3];
reg [1023:0] mask_l2_o	[0: 11];

//1*1*4*32
reg [127:0] mask_l3_w	[0:7];	//16*8bit by 8, 16*8 8bit numbers total
reg	[15:0]	mask_l3_b	[0:31];//32*8bit bias
//reg [127:0] mask_l3_o	[];
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//

//-------------------------------------------------
// Internal signalsz
//-------------------------------------------------
reg 		clk;
reg 		rstn;
reg 		start; 
reg  [11:0] q_width;
reg  [11:0] q_height;
reg  [ 5:0] q_2d_filter_size;		// fx * fy	--> Support both 1D and 2D conv
reg  [ 2:0] q_in_channels;
reg  [ 2:0] q_out_channels;
reg  [11:0] q_pix_idx_max;
reg  [ 5:0] q_stride;

wire 		ctrl_data_run;
wire [11:0] col;
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
wire [1:0] mask_layer; 			//output from FSM, tells current mask generation alyer

// Convolutional kernel's signals
reg [To*128-1:0]		win;	  // mask weight, 4 * 128bit, use only first 32 bit in each 128 block
reg [127:0]				din;	  // Input block data, 1*4*4
reg 					vld_i;	  // Input valid signal
reg 					vld_i_st; // Input valid signal (Start beat)
reg 					vld_i_ed; // Input valid signal (end beat)	
wire[16*ACT_BITS-1:0]   acc_o;	  // Output block data
wire[15:0] 				vld_o;	  // Output valid signal
reg [To*PARAM_BITS-1:0] scale;	  // Scales (Batch normalization), 	[64-1:0]
reg [To*PARAM_BITS-1:0] bias;	  // Biases							[4*16-1:0]

reg [11:0] row;
wire[23:0] data_count;
reg [23:0] pixel_count;
reg        layer_done;
reg [ 4:0] bias_shift;
reg [ 3:0] act_shift ;

wire  is_first_col, is_last_col;
wire  is_first_row, is_last_row;
reg dummy_code;

integer i; 
reg			is_3x3_conv;


//-------------------------------------------------------------------------------
// Mask generation FSM
//-------------------------------------------------------------------------------
mask_gen_fsm u_mask_gen_fsm(
./*input 		 */clk					(clk				),
./*input 		 */rstn					(rstn				),
./*input 		 */i_start				(start				),
./*input  [11:0] */q_width				(q_width			),
./*input  [ 3:0] */i_current_conv_layer	(4'b0				),
./*input 		 */i_mask_loaded		(1'b0				),	
./*input  [ 5:0] */q_2d_filter_size		(q_2d_filter_size	),//not actually used
./*output 		 */o_ctrl_data_run		(ctrl_data_run		),
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
		./*input 			 */is_last_layer(1'b0		),
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
		./*output[16-1:0]    */vld_o		(vld_o      )		
	);	
endgenerate

//-------------------------------------------------
// Load the input feature maps (IFMs)
//-------------------------------------------------
initial begin 
	//$readmemh(WGT_FILE   , wgt_data);
	$readmemh(IFM_FILE   	, ifm_data);
	$readmemh(OFM_FILE  	, ofm_data);
	//$readmemh(FILE_BIASES, biases   );
	//$readmemh(FILE_SCALES, scales   );

	//read mask weights
	$readmemh(MASK_L1	 	, mask_l1_w);
	$readmemh(MASK_L2	 	, mask_l2_w);
	$readmemh(MASK_L3	 	, mask_l3_w);

	//read mask bias
	$readmemh(MASK_L1_BIAS	, mask_l1_b);

	//read mask scale
	$readmemh(MASK_L1_SCALES , mask_l1_s);
end 

//-------------------------------------------------
// Clock
//-------------------------------------------------
initial begin 
	clk = 0;
	forever #(CLK_PERIOD/2) clk = !clk;
end 
// Test vector
initial begin 
	rstn 				= 0;
	start				= 0;
	q_width				= FMAP_WIDTH;
	q_height            = FMAP_HEIGHT;
	q_2d_filter_size	= FILTER_SIZE_2D; 		//1 for 1st layer
	q_in_channels		= INP_CHANNEL_NUM/Ti;	//8
	q_out_channels		= OUT_CHANNEL_NUM/Ti;	//8
	q_stride			= 1;
	q_pix_idx_max		= (FILTER_SIZE_2D * INP_CHANNEL_NUM)/Ti; //128x128x32/4
	
	row                 = 0;	//WARNING: HARD CODING
	// RESET, ACTIVE LOW 	--> WARNING!!!

	//added signal to signify when the mask conv is 3x3, 1x1
	is_3x3_conv			= 0;

	#(CLK_PERIOD * 10) rstn = 1;

	//DUMMY CODE
	if(dummy_code)begin
		bias_shift = 0;
		act_shift = 6;
	end
	else begin
		bias_shift 	= 15;
		act_shift 	= 10;
	end

	// Test vector
	#(CLK_PERIOD * 10) @(posedge clk) start = 1;
	#(CLK_PERIOD     ) @(posedge clk) start = 0;
end

// Boundary conditions
assign is_first_col = (col==0         	)  ? 1'b1: 1'b0;
assign is_last_col  = (col==q_width-1	)  ? 1'b1: 1'b0;
assign is_first_row = (row==0           )  ? 1'b1: 1'b0;
assign is_last_row  = (row==q_height-1  )  ? 1'b1: 1'b0;

// Data generation
assign data_count = (row * {q_width,1'b0} + {col,ni_idx[0]});

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//

initial begin
	bias		= 0;
	scale		= 0;
	din        	= 0;
	win        	= 0;
	dummy_code 	= 0; //DUMMY CODE 
end

reg MASKLAYER2START;
reg MASKLAYER3START;
reg din_is_zero;
reg [9:0] effective_col;
reg [9:0] effective_row;

always@(*)begin
	if(~rstn) begin	
		pixel_count 	<= 0;
		MASKLAYER2START <= 0;
		MASKLAYER3START <= 0;
		effective_col 	<= 0;
		effective_row 	<= 0;
		din_is_zero 	<= 0;
	end
end

always@(*) begin
    vld_i     	= ctrl_data_run;
    //vld_i_st  = ctrl_data_run && (pix_idx == 0) && (ni_idx == 0);
    //vld_i_ed  = ctrl_data_run && (pix_idx ==  q_2d_filter_size-1) && (ni_idx == q_in_channels-1);  
	vld_i_st	= 	(mask_layer == 2'd0) ? (ctrl_data_run && (batch_ch_idx == 0)) : 
					(mask_layer == 2'd1) ? (ctrl_data_run && pix_idx == 0) :
					ctrl_data_run;
	vld_i_ed	= 	(mask_layer == 2'd0) ? (ctrl_data_run && (batch_ch_idx == 4'd7)) : 
					(mask_layer == 2'd1) ? (ctrl_data_run && pix_idx == 'd8) :
					ctrl_data_run;

	//DUMMY CODE TO MAKE BIAS, SCALE 0
	if(dummy_code)begin
		bias = 16'd0;
		scale = 16'd0;
	end
	else begin
		for(i = 0; i < 4; i = i + 1)begin
			bias [i*PARAM_BITS+:PARAM_BITS] = mask_l1_b[i];
			scale[i*PARAM_BITS+:PARAM_BITS] = mask_l1_s[i];
		end
	end	
	

	if(ctrl_data_run && dummy_code == 1'b0)begin //for middle conv layers
		if(mask_layer == 2'd0)begin //if first layer of mask generation		
			din[0 +: 32] = {
				ifm_data[(0 + 4 * batch_ch_idx) * 1024 + local_row_idx][(local_col_idx) * WI +: WI],
				ifm_data[(1 + 4 * batch_ch_idx) * 1024 + local_row_idx][(local_col_idx) * WI +: WI],
				ifm_data[(2 + 4 * batch_ch_idx) * 1024 + local_row_idx][(local_col_idx) * WI +: WI],
				ifm_data[(3 + 4 * batch_ch_idx) * 1024 + local_row_idx][(local_col_idx) * WI +: WI]
			};

			din[32 +: 32] = {
				ifm_data[(0 + 4 * batch_ch_idx) * 1024 + local_row_idx][(local_col_idx + 1) * WI +: WI],
				ifm_data[(1 + 4 * batch_ch_idx) * 1024 + local_row_idx][(local_col_idx + 1) * WI +: WI],
				ifm_data[(2 + 4 * batch_ch_idx) * 1024 + local_row_idx][(local_col_idx + 1) * WI +: WI],
				ifm_data[(3 + 4 * batch_ch_idx) * 1024 + local_row_idx][(local_col_idx + 1) * WI +: WI]
			};

			din[64 +: 32] = {
				ifm_data[(0 + 4 * batch_ch_idx) * 1024 + local_row_idx][(local_col_idx + 2) * WI +: WI],
				ifm_data[(1 + 4 * batch_ch_idx) * 1024 + local_row_idx][(local_col_idx + 2) * WI +: WI],
				ifm_data[(2 + 4 * batch_ch_idx) * 1024 + local_row_idx][(local_col_idx + 2) * WI +: WI],
				ifm_data[(3 + 4 * batch_ch_idx) * 1024 + local_row_idx][(local_col_idx + 2) * WI +: WI]
			};

			din[96 +: 32] = {
				ifm_data[(0 + 4 * batch_ch_idx) * 1024 + local_row_idx][(local_col_idx + 3) * WI +: WI],
				ifm_data[(1 + 4 * batch_ch_idx) * 1024 + local_row_idx][(local_col_idx + 3) * WI +: WI],
				ifm_data[(2 + 4 * batch_ch_idx) * 1024 + local_row_idx][(local_col_idx + 3) * WI +: WI],
				ifm_data[(3 + 4 * batch_ch_idx) * 1024 + local_row_idx][(local_col_idx + 3) * WI +: WI]
			};

			win[0   +: 32] = mask_l1_w[0][batch_ch_idx * 4 * WI +: 4 * WI];
			win[128 +: 32] = mask_l1_w[1][batch_ch_idx * 4 * WI +: 4 * WI];
			win[256 +: 32] = mask_l1_w[2][batch_ch_idx * 4 * WI +: 4 * WI];
			win[384 +: 32] = mask_l1_w[3][batch_ch_idx * 4 * WI +: 4 * WI];
		end
		if(mask_layer == 2'd1)begin //3x3 conv, need to create logic for row, col
			MASKLAYER2START = 1'b1;
			
			case(pix_idx)
				'd0 : begin
					effective_row = row - 1;
					effective_col = col - 1;
					if(is_first_row | is_first_col) 
						din_is_zero = 1;
					else 
						din_is_zero = 0;
				end
				'd1 : begin
					effective_row = row - 1;
					effective_col = col;
					if(is_first_row)
						din_is_zero = 1;
					else
						din_is_zero = 0;
				end
				'd2 : begin
					effective_row = row - 1;
					effective_col = col + 1;
					if(is_first_row | is_last_col)
						din_is_zero = 1;
					else
						din_is_zero = 0;
				end
				'd3 : begin
					effective_row = row;
					effective_col = col - 1;
					if(is_first_col)
						din_is_zero = 1;
					else
						din_is_zero = 0;
				end
				'd4 : begin
					effective_row = row;
					effective_col = col;
					din_is_zero = 0;
				end
				'd5 : begin
					effective_row = row;
					effective_col = col + 1;
					if(is_last_col)
						din_is_zero = 1;
					else
						din_is_zero = 0;
				end
				'd6 : begin
					effective_row = row + 1;
					effective_col = col - 1;
					if(is_last_row | is_first_col)
						din_is_zero = 1;
					else
						din_is_zero = 0;
				end
				'd7 : begin
					effective_row = row + 1;
					effective_col = col;
					if(is_last_row)
						din_is_zero = 1;
					else
						din_is_zero = 0;
				end
				'd8 : begin
					effective_row = row + 1;
					effective_col = col + 1;
					if(is_last_row | is_last_col)
						din_is_zero = 1;
					else
						din_is_zero = 0;
				end
			endcase
			if(din_is_zero)
				din = 0;
			else begin
				din[0  +: 32] = {
					mask_l1_o[effective_row + 0 * 128][effective_col * WI +: WI],
					mask_l1_o[effective_row + 1 * 128][effective_col * WI +: WI],
					mask_l1_o[effective_row + 2 * 128][effective_col * WI +: WI],
					mask_l1_o[effective_row + 3 * 128][effective_col * WI +: WI]
				};
				din[32 +: 32] = {
					mask_l1_o[effective_row + 0 * 128][(effective_col+1) * WI +: WI],
					mask_l1_o[effective_row + 1 * 128][(effective_col+1) * WI +: WI],
					mask_l1_o[effective_row + 2 * 128][(effective_col+1) * WI +: WI],
					mask_l1_o[effective_row + 3 * 128][(effective_col+1) * WI +: WI]		
				};
				din[64 +: 32] = {
					mask_l1_o[effective_row + 0 * 128][(effective_col+2) * WI +: WI],
					mask_l1_o[effective_row + 1 * 128][(effective_col+2) * WI +: WI],
					mask_l1_o[effective_row + 2 * 128][(effective_col+2) * WI +: WI],
					mask_l1_o[effective_row + 3 * 128][(effective_col+2) * WI +: WI]
				};
				din[96 +: 32] = {
					mask_l1_o[effective_row + 0 * 128][(effective_col+3) * WI +: WI],
					mask_l1_o[effective_row + 1 * 128][(effective_col+3) * WI +: WI],
					mask_l1_o[effective_row + 2 * 128][(effective_col+3) * WI +: WI],
					mask_l1_o[effective_row + 3 * 128][(effective_col+3) * WI +: WI]
				};
			end
			
			/*
			if(pix_idx == 'd0)begin
				if(is_first_row | is_first_col) din = 128'd0;
				else begin
					din[0  +: 32] = mask_l1_o[(row-1) + 0 * 128][(col-1)*WI +: WI];
					din[32 +: 32] = mask_l1_o[(row-1) + 1 * 128][(col-1)*WI +: WI];
					din[64 +: 32] = mask_l1_o[(row-1) + 2 * 128][(col-1)*WI +: WI];
					din[96 +: 32] = mask_l1_o[(row-1) + 3 * 128][(col-1)*WI +: WI];
				end
			end
			if(pix_idx == 'd1)begin
				if(is_first_row) 
					din = 128'd0;
				else begin
					din[0  +: 32] = mask_l1_o[(row-1) + 0 * 128][(col)*WI +: WI];
					din[32 +: 32] = mask_l1_o[(row-1) + 1 * 128][(col)*WI +: WI];
					din[64 +: 32] = mask_l1_o[(row-1) + 2 * 128][(col)*WI +: WI];
					din[96 +: 32] = mask_l1_o[(row-1) + 3 * 128][(col)*WI +: WI];
				end
			end
			if(pix_idx == 'd2)begin
				if(is_first_row | is_last_col) 
					din = 128'd0;
				else begin
					din[0  +: 32] = mask_l1_o[(row-1) + 0 * 128][(col+1)*WI +: WI];
					din[32 +: 32] = mask_l1_o[(row-1) + 1 * 128][(col+1)*WI +: WI];
					din[64 +: 32] = mask_l1_o[(row-1) + 2 * 128][(col+1)*WI +: WI];
					din[96 +: 32] = mask_l1_o[(row-1) + 3 * 128][(col+1)*WI +: WI];
				end
			end
			if(pix_idx == 'd3)begin
				if(is_first_col) 
					din = 128'd0;
				else begin
					din[0  +: 32] = mask_l1_o[(row) + 0 * 128][(col-1)*WI +: WI];
					din[32 +: 32] = mask_l1_o[(row) + 1 * 128][(col-1)*WI +: WI];
					din[64 +: 32] = mask_l1_o[(row) + 2 * 128][(col-1)*WI +: WI];
					din[96 +: 32] = mask_l1_o[(row) + 3 * 128][(col-1)*WI +: WI];
				end
			end
			if(pix_idx == 'd4)begin
					din[0  +: 32] = mask_l1_o[row + 0 * 128][col*WI +: WI];
					din[32 +: 32] = mask_l1_o[row + 1 * 128][col*WI +: WI];
					din[64 +: 32] = mask_l1_o[row + 2 * 128][col*WI +: WI];
					din[96 +: 32] = mask_l1_o[row + 3 * 128][col*WI +: WI];
			end
			if(pix_idx == 'd5)begin
				if(is_last_col) 
					din = 128'd0;
				else begin
					din[0  +: 32] = mask_l1_o[(row) + 0 * 128][(col+1)*WI +: WI];
					din[32 +: 32] = mask_l1_o[(row) + 1 * 128][(col+1)*WI +: WI];
					din[64 +: 32] = mask_l1_o[(row) + 2 * 128][(col+1)*WI +: WI];
					din[96 +: 32] = mask_l1_o[(row) + 3 * 128][(col+1)*WI +: WI];
				end
			end
			if(pix_idx == 'd6)begin
				if(is_last_row | is_first_col) 
					din = 128'd0;
				else begin
					din[0  +: 32] = mask_l1_o[(row+1) + 0 * 128][(col-1)*WI +: WI];
					din[32 +: 32] = mask_l1_o[(row+1) + 1 * 128][(col-1)*WI +: WI];
					din[64 +: 32] = mask_l1_o[(row+1) + 2 * 128][(col-1)*WI +: WI];
					din[96 +: 32] = mask_l1_o[(row+1) + 3 * 128][(col-1)*WI +: WI];
				end
			end
			if(pix_idx == 'd7)begin
				if(is_last_row) 
					din = 128'd0;
				else begin
					din[0  +: 32] = mask_l1_o[(row+1) + 0 * 128][(col)*WI +: WI];
					din[32 +: 32] = mask_l1_o[(row+1) + 1 * 128][(col)*WI +: WI];
					din[64 +: 32] = mask_l1_o[(row+1) + 2 * 128][(col)*WI +: WI];
					din[96 +: 32] = mask_l1_o[(row+1) + 3 * 128][(col)*WI +: WI];
				end
			end
			if(pix_idx == 'd8)begin
				if(is_last_row | is_last_col) 
					din = 128'd0;
				else begin
					din[0  +: 32] = mask_l1_o[(row+1) + 0 * 128][(col+1)*WI +: WI];
					din[32 +: 32] = mask_l1_o[(row+1) + 1 * 128][(col+1)*WI +: WI];
					din[64 +: 32] = mask_l1_o[(row+1) + 2 * 128][(col+1)*WI +: WI];
					din[96 +: 32] = mask_l1_o[(row+1) + 3 * 128][(col+1)*WI +: WI];
				end
			end*/
		end
		if(mask_layer == 2'd2)begin
			MASKLAYER3START = 1'b1;


		end

	end
end


//debugging wires
wire[127:0] ifm_row_0 = ifm_data[(0 + 4 * batch_ch_idx) * 1024 + local_row_idx];
wire[127:0] ifm_row_1 = ifm_data[(1 + 4 * batch_ch_idx) * 1024 + local_row_idx];
wire[127:0] ifm_row_2 = ifm_data[(2 + 4 * batch_ch_idx) * 1024 + local_row_idx];
wire[127:0] ifm_row_3 = ifm_data[(3 + 4 * batch_ch_idx) * 1024 + local_row_idx];

wire [31:0] din0 = din[0+:32];
wire [31:0] din1 = din[32+:32];
wire [31:0] din2 = din[64+:32];
wire [31:0] din3 = din[96+:32];

wire [31:0] win0 = win[0+:32];
wire [31:0] win1 = win[128+:32];
wire [31:0] win2 = win[256+:32];
wire [31:0] win3 = win[384+:32];

//-------------------------------------------------
// Update the output buffers.
//-------------------------------------------------
always@(posedge clk, negedge rstn) begin
    if(!rstn) begin
		pixel_count <= 0;
		layer_done <= 0;
    end else begin
		if(start) begin
			pixel_count <= 0;
			layer_done <= 0;			
		end
		else begin
			if(vld_o[0]) begin
				if(pixel_count == q_width-1) begin
					pixel_count <= 0;
					layer_done <= 1'b1;
				end
				else begin
					pixel_count <= pixel_count + 1;
				end
			end
		end
    end
end 
//-------------------------------------------------
// Check output
//-------------------------------------------------
reg check_output_flag [0:To-1];
always@(posedge clk, negedge rstn) begin
    if(!rstn) begin
		for(i=0; i < To; i=i+1) begin 
		    check_output_flag[i] <= 0;
		end 
    end 
	else begin
		if(vld_o[0]) begin
			for(i=0; i < To; i=i+1) begin 
				check_output_flag[i] <= (acc_o[i*WI+:WI] == ofm_data[row * {q_width,1'b0} + {pixel_count,1'b0}][i*WI+:WI]) ? 1'b1 : 1'b0;
			end 
		end
		else begin 
			for(i=0; i < To; i=i+1) begin 
				check_output_flag[i] <= 0;
			end 			
		end 
    end
end

//-------------------------------------------------
// Write output to OFM
//-------------------------------------------------
//reg [1023:0] mask_l1_o	[0: 511];	

reg [7:0] write_col; //ranges from 0~128
reg [7:0] write_row; //ranges from 0~128
reg [7:0] row_count;//ranges from 0~128


//write_col, write_row, row_count signals
always@(posedge clk, negedge rstn)begin
	if(!rstn) begin
		write_col <= 0;
		write_row <= 0;
		row_count <= 0;
	end
	else begin
		if(vld_o[0])begin
			if(write_col == q_width - 4)begin//end of column
				write_col <= 0;
				write_row <= write_row + 1;
				row_count <= row_count + 1;
			end
			else write_col <= write_col + 4;
		end
	end
end

//write output data
always@(posedge clk, negedge rstn)begin
	if(!rstn)begin
		for(i=0; i<512; i=i+1)begin
			mask_l1_o[i] <= 'd0;
			mask_l2_o[i] <= 'd0;
		end

	end
	else begin
		if(vld_o[0] && mask_layer == 'd0)begin//layer 1 write to output, add logic to write and lock
			mask_l1_o[0 * FMAP_FRAME_SIZE + write_col + 0 + write_row * q_width] <= acc_o[0  + 8*0 +: 8];
			mask_l1_o[0 * FMAP_FRAME_SIZE + write_col + 1 + write_row * q_width] <= acc_o[32 + 8*0 +: 8];
			mask_l1_o[0 * FMAP_FRAME_SIZE + write_col + 2 + write_row * q_width] <= acc_o[64 + 8*0 +: 8];
			mask_l1_o[0 * FMAP_FRAME_SIZE + write_col + 3 + write_row * q_width] <= acc_o[96 + 8*0 +: 8];

			mask_l1_o[1 * FMAP_FRAME_SIZE + write_col + 0 + write_row * q_width] <= acc_o[0  + 8*1 +: 8];
			mask_l1_o[1 * FMAP_FRAME_SIZE + write_col + 1 + write_row * q_width] <= acc_o[32 + 8*1 +: 8];
			mask_l1_o[1 * FMAP_FRAME_SIZE + write_col + 2 + write_row * q_width] <= acc_o[64 + 8*1 +: 8];
			mask_l1_o[1 * FMAP_FRAME_SIZE + write_col + 3 + write_row * q_width] <= acc_o[96 + 8*1 +: 8];

			mask_l1_o[2 * FMAP_FRAME_SIZE + write_col + 0 + write_row * q_width] <= acc_o[0  + 8*2 +: 8];
			mask_l1_o[2 * FMAP_FRAME_SIZE + write_col + 1 + write_row * q_width] <= acc_o[32 + 8*2 +: 8];
			mask_l1_o[2 * FMAP_FRAME_SIZE + write_col + 2 + write_row * q_width] <= acc_o[64 + 8*2 +: 8];
			mask_l1_o[2 * FMAP_FRAME_SIZE + write_col + 3 + write_row * q_width] <= acc_o[96 + 8*2 +: 8];

			mask_l1_o[3 * FMAP_FRAME_SIZE + write_col + 0 + write_row * q_width] <= acc_o[0  + 8*3 +: 8];
			mask_l1_o[3 * FMAP_FRAME_SIZE + write_col + 1 + write_row * q_width] <= acc_o[32 + 8*3 +: 8];
			mask_l1_o[3 * FMAP_FRAME_SIZE + write_col + 2 + write_row * q_width] <= acc_o[64 + 8*3 +: 8];
			mask_l1_o[3 * FMAP_FRAME_SIZE + write_col + 3 + write_row * q_width] <= acc_o[96 + 8*3 +: 8];

			/*
			mask_l1_o[write_row + 0 * 128][write_col * WI +: 4 * WI] = {acc_o[0 + 8*0 +: 8], acc_o[32 + 8*0 +: 8], acc_o[64 + 8*0 +: 8], acc_o[96 + 8*0 +: 8]};
			mask_l1_o[write_row + 1 * 128][write_col * WI +: 4 * WI] = {acc_o[0 + 8*1 +: 8], acc_o[32 + 8*1 +: 8], acc_o[64 + 8*1 +: 8], acc_o[96 + 8*1 +: 8]};
			mask_l1_o[write_row + 2 * 128][write_col * WI +: 4 * WI] = {acc_o[0 + 8*2 +: 8], acc_o[32 + 8*2 +: 8], acc_o[64 + 8*2 +: 8], acc_o[96 + 8*2 +: 8]};
			mask_l1_o[write_row + 3 * 128][write_col * WI +: 4 * WI] = {acc_o[0 + 8*3 +: 8], acc_o[32 + 8*3 +: 8], acc_o[64 + 8*3 +: 8], acc_o[96 + 8*3 +: 8]};
			*/
		end
		
		if(vld_o[0] && mask_layer == 'd1)begin//layer 2 output
			mask_l2_o[0 * FMAP_FRAME_SIZE + write_col + 0 + write_row * q_width] <= acc_o[0  + 8*0 +: 8];
			mask_l2_o[0 * FMAP_FRAME_SIZE + write_col + 1 + write_row * q_width] <= acc_o[32 + 8*0 +: 8];
			mask_l2_o[0 * FMAP_FRAME_SIZE + write_col + 2 + write_row * q_width] <= acc_o[64 + 8*0 +: 8];
			mask_l2_o[0 * FMAP_FRAME_SIZE + write_col + 3 + write_row * q_width] <= acc_o[96 + 8*0 +: 8];

			mask_l2_o[1 * FMAP_FRAME_SIZE + write_col + 0 + write_row * q_width] <= acc_o[0  + 8*1 +: 8];
			mask_l2_o[1 * FMAP_FRAME_SIZE + write_col + 1 + write_row * q_width] <= acc_o[32 + 8*1 +: 8];
			mask_l2_o[1 * FMAP_FRAME_SIZE + write_col + 2 + write_row * q_width] <= acc_o[64 + 8*1 +: 8];
			mask_l2_o[1 * FMAP_FRAME_SIZE + write_col + 3 + write_row * q_width] <= acc_o[96 + 8*1 +: 8];

			mask_l2_o[2 * FMAP_FRAME_SIZE + write_col + 0 + write_row * q_width] <= acc_o[0  + 8*2 +: 8];
			mask_l2_o[2 * FMAP_FRAME_SIZE + write_col + 1 + write_row * q_width] <= acc_o[32 + 8*2 +: 8];
			mask_l2_o[2 * FMAP_FRAME_SIZE + write_col + 2 + write_row * q_width] <= acc_o[64 + 8*2 +: 8];
			mask_l2_o[2 * FMAP_FRAME_SIZE + write_col + 3 + write_row * q_width] <= acc_o[96 + 8*2 +: 8];

			mask_l2_o[3 * FMAP_FRAME_SIZE + write_col + 0 + write_row * q_width] <= acc_o[0  + 8*3 +: 8];
			mask_l2_o[3 * FMAP_FRAME_SIZE + write_col + 1 + write_row * q_width] <= acc_o[32 + 8*3 +: 8];
			mask_l2_o[3 * FMAP_FRAME_SIZE + write_col + 2 + write_row * q_width] <= acc_o[64 + 8*3 +: 8];
			mask_l2_o[3 * FMAP_FRAME_SIZE + write_col + 3 + write_row * q_width] <= acc_o[96 + 8*3 +: 8];
		end

		if(vld_)

	end
end

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


endmodule