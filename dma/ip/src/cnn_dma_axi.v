`timescale 1ns/1ps

`include "cnn_accel_h.v"
module cnn_dma_axi(
	HCLK,
	HRESETn,
    //AXI Master Interface
    //Read address channel
    M_ARVALID,    // address/control valid handshake
    M_ARREADY,    // Read addr ready
    M_ARADDR,     // Address Read 
    M_ARID,       // Read addr ID
    M_ARLEN,      // Transfer length
    M_ARSIZE,     // Transfer width
    M_ARBURST,    // Burst type
    M_ARLOCK,     // Atomic access information
    M_ARCACHE,    // Cachable/bufferable infor
    M_ARPROT,     // Protection info
    M_ARQOS,      // Quality of Service
    M_ARREGION,   // Region signaling
    M_ARUSER,     // User defined signal
 
    //Read data channel
    M_RVALID,     // Read data valid 
    M_RREADY,     // Read data ready (to Slave)
    M_RDATA,      // Read data bus
    M_RLAST,      // Last beat of a burst transfer
    M_RID,        // Read ID
    M_RUSER,      // User defined signal
    M_RRESP,      // Read response
    
	//AXI Master Interface
    //Write address channel
    M_AWID,       // Address ID
    M_AWADDR,     // Address Write
    M_AWLEN,      // Transfer length
    M_AWSIZE,     // Transfer width
    M_AWBURST,    // Burst type
    M_AWLOCK,     // Atomic access information
    M_AWCACHE,    // Cachable/bufferable infor
    M_AWPROT,     // Protection info
    M_AWREGION,
    M_AWQOS,
    M_AWVALID,    // address/control valid handshake
    M_AWREADY,
    //Write data channel
    M_WID,        // Write ID
    M_WDATA,      // Write Data bus
    M_WSTRB,      // Write Data byte lane strobes
    M_WLAST,      // Last beat of a burst transfer
    M_WVALID,     // Write data valid
    M_WREADY,     // Write data ready
    //Write response chaDnel
    M_BID,        // buffered response ID
    M_BRESP,      // Buffered write response
    M_BVALID,     // Response info valid
    M_BREADY,     // Response info ready (to slave)
	
    //Control signals	
    ap_start,
    ap_ready,
    ap_done,
    ap_idle,
    // Setting
    read_address,
    write_address,
    input_width,
    input_height,
    input_framesize,
    layer_idx_dbg,
    //For uploading the parameter from Host
    i_boot_mode,			// 0:    
    i_boot_req_sel_sub,		// 0: Core-M, 1: core-S (sub_pixel_conv)
    i_boot_req_we,   		// 0: read, 1: write   
    i_boot_req_cs,			// 01/11: weight, 10: bias, 00: scale
    i_boot_req_waddr,		// Address
    i_boot_req_wdata		// Write data
);

`include "params.v"
//------------------------------------------------------------------------------
// Port declarations
//------------------------------------------------------------------------------
// Global signals
input HCLK;
input HRESETn;
//AXI Master Interface
//Read address channel
output                          M_ARVALID;    // address/control valid handshake
input                           M_ARREADY;
output  [M_AXI_ADDR_WIDTH-1:0]  M_ARADDR;     // Address Read 
output  [M_AXI_ID_WIDTH  -1:0]  M_ARID;       // Read addr ID
output  [7:0]                   M_ARLEN;      // Transfer length
output  [2:0]                   M_ARSIZE;     // Transfer width
output  [1:0]                   M_ARBURST;    // Burst type
output  [1:0]                   M_ARLOCK;     // Atomic access information
output  [3:0]                   M_ARCACHE;    // Cachable/bufferable infor
output  [2:0]                   M_ARPROT;     // Protection info
output  [3:0]                   M_ARQOS;      // Quality of Service
output  [3:0]                   M_ARREGION;   // Region signaling
output  [M_AXI_ARUSER_WIDTH-1:0]M_ARUSER;     // User defined signal

//Read data channel
input                       M_RVALID;         // Read data valid 
output                      M_RREADY;         // Read data ready (to Slave)
input   [M_AXI_DATA_WIDTH-1:0]  M_RDATA;      // Read data bus
input                       M_RLAST;          // Last beat of a burst transfer
input   [M_AXI_ID_WIDTH-1:0]  M_RID;          // Read ID
input   [M_AXI_RUSER_WIDTH-1:0]   M_RUSER;    // User defiend signal
input   [1:0]               M_RRESP;          // Read response

//AXI Master Interface
//Write address channel
output  [M_AXI_ID_WIDTH  -1:0]     M_AWID;    // Address ID
output  [M_AXI_ADDR_WIDTH-1:0]     M_AWADDR;  // Address Write
output  [7:0]  M_AWLEN;      				  // Transfer length
output  [2:0]  M_AWSIZE;     				  // Transfer width
output  [1:0]  M_AWBURST;    				  // Burst type
output  [1:0]  M_AWLOCK;     				  // Atomic access information
output  [3:0]  M_AWCACHE;    				  // Cachable/bufferable infor
output  [2:0]  M_AWPROT;     				  // Protection info
output  [3:0]  M_AWREGION;
output  [3:0]  M_AWQOS;
output         M_AWVALID;                     // address/control valid handshake
input          M_AWREADY;
//Write data channel
output  [M_AXI_ID_WIDTH-1:0]     M_WID;        // Write ID
output  [M_AXI_DATA_WIDTH-1:0]   M_WDATA;      // Write Data bus
output  [M_AXI_WSTRB_WIDTH-1:0]  M_WSTRB;      // Write Data byte lane strobes
output              M_WLAST;                   // Last beat of a burst transfer
output              M_WVALID;                  // Write data valid
input               M_WREADY;                  // Write data ready
//Write response chaDnel
input  [M_AXI_ID_WIDTH-1:0]      M_BID;        // buffered response ID
input  [1:0]        M_BRESP;                   // Buffered write response
input               M_BVALID;                  // Response info valid
output              M_BREADY;                  // Response info ready (to slave)
//Read address channDl

//CSR
input  ap_start;
output reg ap_ready;
output reg ap_done;
output reg ap_idle;
input [31:0] read_address;
input [31:0] write_address;
input [11:0] input_width;
input [11:0] input_height;
input [23:0] input_framesize;
input [ 3:0] layer_idx_dbg;
// For debugging during both mode
input 		 i_boot_mode;			// 0:    
input 		 i_boot_req_sel_sub;	// 0: Core-M, 1: core-S (sub_pixel_conv)
input 		 i_boot_req_we;   		// 0: read, 1: write   
input [ 1:0] i_boot_req_cs;			// 01/11: weight, 10: bias, 00: scale
input [12:0] i_boot_req_waddr;		// Address
input [16:0] i_boot_req_wdata;		// Write data

//-----------------------------------------------------------------
// Registers
//-----------------------------------------------------------------
parameter W_ADDR = 32;
parameter W_DATA = 32;
parameter WB_DATA = 4;
parameter W_WB_DATA = 2;
parameter MAX_TRANS = 1024; //Maximum number of transfers

parameter	MAX_WIDTH  		= 1920, 
			MAX_HEIGHT 		= 1080,
			//WIDTH 		= 960,
			//HEIGHT 		= 540,
			//WIDTH 		= 480,
			//HEIGHT 		= 270,			
			WIDTH 			= 128,
			HEIGHT			= 128,
			START_UP_DELAY 	= 200,					
			HSYNC_DELAY 	= 160,
			FRAME_SIZE 		= WIDTH * HEIGHT;
localparam 	W_SIZE  		= 12;					// Max 4K QHD (3840x1920).
localparam 	W_FRAME_SIZE  	= 2 * W_SIZE + 1;	// Max 4K QHD (3840x1920).
localparam 	W_DELAY 		= 12;

// Loading input line
reg [W_ADDR-1:0]		start_addr_ld;
reg 					start_dma_ld;
reg	[BITS_TRANS-1:0]	num_trans_ld;
wire[W_DATA-1:0]		data_o_ld;
wire					data_vld_o_ld;
wire					data_last_o_ld;
wire[BITS_TRANS-1:0]	data_cnt_o; 		//counting the number of data output
reg [W_FRAME_SIZE-1:0]  in_img_addr_offset;

wire [W_FRAME_SIZE-1:0] q_frame_size;
wire [W_SIZE-1 :0] 		q_width;
wire [W_SIZE-1 :0] 		q_height;
reg [W_DELAY-1:0] 		q_start_up_delay;
reg [W_DELAY-1:0] 		q_hsync_delay;;
reg 					q_start;
// Signals for sliding windows and FSM
wire 					ctrl_vsync_run;
wire [W_DELAY-1:0]		ctrl_vsync_cnt;
wire 					ctrl_hsync_run;
wire [W_DELAY-1:0]		ctrl_hsync_cnt;
wire 					ctrl_data_run;
wire [W_SIZE-1:0] 		row;
wire [W_SIZE-1:0] 		col;
wire [W_FRAME_SIZE-1:0] data_count;
wire layer_done;
wire end_frame;
// Clock and reset
wire clk, rstn;
assign clk = HCLK;
assign rstn = HRESETn;

assign q_width 		= input_width;
assign q_height 	= input_height;
assign q_frame_size = input_framesize;
//-------------------------------------------------
// FSM
//-------------------------------------------------
reg ap_start_d;
always@(posedge HCLK or negedge HRESETn)begin		
	if(!HRESETn)
		ap_start_d <= 0;
	else 
		ap_start_d <= ap_start;
end
always@(*) begin
	q_start = ap_start && !ap_start_d;
end

always @(posedge HCLK or negedge HRESETn)begin
	if(!HRESETn)begin
		q_start_up_delay 	<= 0;
		q_hsync_delay		<= 0;
	end
    else begin
        if(q_start)  begin 
			q_start_up_delay 	<= START_UP_DELAY;
			q_hsync_delay		<= HSYNC_DELAY;		
		end 
    end
end

//-------------------------------------------------
// FSM
//-------------------------------------------------
cnn_fsm u_cnn_fsm (
.clk				(clk				),
.rstn				(rstn				),
// Inputs
.q_width			(q_width			),
.q_height			(q_height			),
.q_start_up_delay	(q_start_up_delay	),
.q_hsync_delay		(q_hsync_delay		),
.q_frame_size		(q_frame_size		),
.q_start			(q_start			),
//output
.o_ctrl_vsync_run	(ctrl_vsync_run		),
.o_ctrl_vsync_cnt	(ctrl_vsync_cnt		),
.o_ctrl_hsync_run	(ctrl_hsync_run		),
.o_ctrl_hsync_cnt	(ctrl_hsync_cnt		),
.o_ctrl_data_run	(ctrl_data_run		),
.o_row				(row				),
.o_col				(col				),
.o_data_count		(data_count			),
.o_end_frame		(end_frame			)
);
//-------------------------------------------------------------------------------
// DMA for loading the input image
//-------------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn)begin
	if(!HRESETn)begin
		in_img_addr_offset <= 0;
	end
	else begin
		if(q_start)
			in_img_addr_offset <= read_address;
		else begin
			if(data_last_o_ld) 
				if(in_img_addr_offset < q_frame_size)
					in_img_addr_offset <= in_img_addr_offset + q_width;
					//in_img_addr_offset <= in_img_addr_offset + q_width[W_SIZE-1:2];
				else 
					in_img_addr_offset <= 0;
		end
	end
end

always@ (*) begin
	start_dma_ld 	 = 1'b0;
	num_trans_ld 	 = q_width[W_SIZE-1:2];
	start_addr_ld 	 = 0;	
	if(ctrl_hsync_run && ctrl_hsync_cnt == 0) begin 
		start_dma_ld = 1;
		start_addr_ld = in_img_addr_offset;
	end
end 

// DMA read module
axi_dma_rd u_dma_read(
    //AXI Master Interface
    //Read address channel
    .M_ARVALID	(M_ARVALID		),    // address/control valid handshake
    .M_ARREADY	(M_ARREADY		),    // Read addr ready
    .M_ARADDR	(M_ARADDR		),    // Address Read 
    .M_ARID		(M_ARID			),    // Read addr ID
    .M_ARLEN	(M_ARLEN		),    // Transfer length
    .M_ARSIZE	(M_ARSIZE		),    // Transfer width
    .M_ARBURST	(M_ARBURST		),    // Burst type
    .M_ARLOCK	(M_ARLOCK		),    // Atomic access information
    .M_ARCACHE	(M_ARCACHE		),    // Cachable/bufferable infor
    .M_ARPROT	(M_ARPROT		),    // Protection info
    .M_ARQOS	(M_ARQOS		),    // Quality of Service
    .M_ARREGION	(M_ARREGION		),    // Region signaling
    .M_ARUSER	(M_ARUSER		),    // User defined signal
 
    //Read data channel
    .M_RVALID	(M_RVALID		),    // Read data valid 
    .M_RREADY	(M_RREADY		),    // Read data ready (to Slave)
    .M_RDATA	(M_RDATA		),    // Read data bus
    .M_RLAST	(M_RLAST		),    // Last beat of a burst transfer
    .M_RID		(M_RID			),    // Read ID
    .M_RUSER	(M_RUSER		),    // User defined signal
    .M_RRESP	(M_RRESP		),    // Read response
     
    //Functional Ports
    .start_dma	(start_dma_ld	),
    .num_trans	(num_trans_ld	),    //Number of 128-bit words transferred
    .start_addr	(start_addr_ld	),
    .data_o		(data_o_ld		),
    .data_vld_o	(data_vld_o_ld	),
    .data_cnt_o	(data_cnt_o		),
    .done_o		(data_last_o_ld	),

    //Global signals
    .clk		(HCLK			),
    .rstn		(HRESETn		)
);

//-------------------------------------------------------------------------------
// WARNING: Do Loop-Back by connecting outputs of DMA-READ to inputs of DMA-WRITE
//-------------------------------------------------------------------------------
reg [31:0] pixel_val;
reg        pixel_ena;

always@(*) begin 
	pixel_val = data_o_ld;
	pixel_ena = data_vld_o_ld;
end 
//-------------------------------------------------------------------------------
// DMA for loading the input image
//-------------------------------------------------------------------------------
out_writer #(.WIDTH(WIDTH),.HEIGHT(HEIGHT),.MAX_WIDTH(MAX_WIDTH))	
u_out_writer(
	.clk			(clk				),
	.rstn			(rstn				),
	.write_address	(write_address		),
	.frame_size		(q_frame_size[23:0]	),
	.start			(q_start			),
	.i_pix			(pixel_val			),
	.i_vld			(pixel_ena			),
	.o_layer_done	(layer_done			),
	.M_AWID			(M_AWID				),   // Address ID
	.M_AWADDR		(M_AWADDR			),   // Address Write
	.M_AWLEN		(M_AWLEN			),   // Transfer length
	.M_AWSIZE		(M_AWSIZE			),   // Transfer width
	.M_AWBURST		(M_AWBURST			),   // Burst type
	.M_AWLOCK		(M_AWLOCK			),   // Atomic access information
	.M_AWCACHE		(M_AWCACHE			),   // Cachable/bufferable infor
	.M_AWPROT		(M_AWPROT			),   // Protection info
	.M_AWREGION		(M_AWREGION			),
	.M_AWQOS		(M_AWQOS			),
	.M_AWVALID		(M_AWVALID			),    // address/control valid handshake
	.M_AWREADY		(M_AWREADY			),
	//Write data channel	
	.M_WID			(M_WID				),    // Write ID
	.M_WDATA		(M_WDATA			),    // Write Data bus
	.M_WSTRB		(M_WSTRB			),    // Write Data byte lane strobes
	.M_WLAST		(M_WLAST			),    // Last beat of a burst transfer
	.M_WVALID		(M_WVALID			),    // Write data valid
	.M_WREADY		(M_WREADY			),    // Write data ready
	//Write response chaDnel	
	.M_BID			(M_BID				),    // buffered response ID
	.M_BRESP		(M_BRESP			),    // Buffered write response
	.M_BVALID		(M_BVALID			),    // Response info valid
	.M_BREADY		(M_BREADY			)     // Response info ready (to slave)
);

always@(posedge clk or negedge rstn) begin
	if(!rstn) begin
		ap_done  <= 0;
		ap_idle  <= 0;
		ap_ready <= 1'b1;
	end
	else begin
		if(q_start) begin
			ap_done <= 1'b0;
		end
		else begin
			if(!ap_done && layer_done)
				ap_done <= 1'b1;
		end
	end
end
//-------------------------------------------------
// Debugging
//-------------------------------------------------
// synopsys translate_off
integer fp_input_log;
integer idx;
always @(posedge clk or negedge rstn) begin
	if(~rstn) begin
		fp_input_log <= 0;
		idx <= 0;
	end
	else begin
		if(q_start) begin 
			fp_input_log <= $fopen(FILE_INPUT_LOG, "w");	
		end 
		else if(data_vld_o_ld) begin
			for(idx = 7; idx >= 0; idx=idx-1) begin
				if(idx == 0) begin
					$fwrite(fp_input_log,"%01h\n", data_o_ld[idx*4+:4]);						
				end	
				else begin
					$fwrite(fp_input_log,"%01h", data_o_ld[idx*4+:4]);
				end
			end
		end
		else if(!ap_done && layer_done) begin
			$fclose(fp_input_log);				
		end
	end
end
//synopsys translate_on
endmodule