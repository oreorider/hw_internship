// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

`timescale 1ns/1ps

//`define DUMMY_LAYER_INDEX 1
//`define DEBUG_BOOT_MODE	1

module S_axilite
#(parameter
    C_S_AXI_ADDR_WIDTH = 5,
    C_S_AXI_DATA_WIDTH = 32
)(
    // axi4 lite slave signals
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    // user signals
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle,
    output wire [31:0]                   read_address,
    output wire [31:0]                   write_address,
	// NXT ++: Change the frame resolution externally
	output wire [11:0]                   input_width,
	output wire [11:0]                   input_height,
	output wire [23:0]                   input_framesize,
	output wire [ 3:0]                   layer_idx_dbg,		// Layer index for debugging
	// Boot Mode
	output 		  o_boot_mode,			// 0:    
	output 		  o_boot_req_sel_sub,	// 0: Core-M, 1: core-S (sub_pixel_conv)
	output 		  o_boot_req_we,   		// 0: read, 1: write   
	output [ 1:0] o_boot_req_cs,		// 01/11: weight, 10: bias, 00: scale
	output [12:0] o_boot_req_waddr,		// Address
	output [16:0] o_boot_req_wdata		// Write data	
);
//------------------------Address Info-------------------
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - Timer
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x10 : Data signal of read_address			
//        bit 31~0 - read_address[31:0] (Read/Write)
// 0x14 : Width/Height
//		  bits 11~ 0:  width
//		  bits 23~12:  height
//		  bits 31~24:  Reserved	=> Advanced configurations
// 0x18 : Data signal of write_address
//        bit 31~0 - write_address[31:0] (Read/Write)
// 0x1c : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)
//		  bits 23~ 0:  framesize[23:0]
//		  bits 31~24:  Reserved	=> Advanced configurations
//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL              = 5'h00,
    ADDR_GIE                  = 5'h04,
    ADDR_IER                  = 5'h08,
    ADDR_ISR                  = 5'h0c,
    ADDR_READ_ADDRESS_DATA_0  = 5'h10,
    ADDR_READ_ADDRESS_CTRL    = 5'h14,
    ADDR_WRITE_ADDRESS_DATA_0 = 5'h18,
    ADDR_WRITE_ADDRESS_CTRL   = 5'h1c,
	
	
    WRIDLE                    = 2'd0,
    WRDATA                    = 2'd1,
    WRRESP                    = 2'd2,
    WRRESET                   = 2'd3,
    RDIDLE                    = 2'd0,
    RDDATA                    = 2'd1,
    RDRESET                   = 2'd2,
    ADDR_BITS  = 5;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [31:0]                   wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [31:0]                   rdata;	
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_ap_idle;
    reg                           int_ap_ready;
    reg                           int_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           int_gie = 1'b0;
    reg  [1:0]                    int_ier = 2'b0;
    reg  [1:0]                    int_isr = 2'b0;
	
	reg  [31:0]                   int_boot_mode_ena = 'b0;
	reg  [31:0]                   int_boot_mode_reg = 'b0;
	
    reg  [31:0]                   int_read_address  = 'b0;    
	reg  [31:0]                   int_write_address = 'b0;
    reg  [31:0]					  int_width_height 	= 'b0; 	// NXT ++ width height
	reg  [31:0]                   int_framesize		= 'b0; 	// NXT ++ framesize
	reg  [23:0]					  reg_cycle_count   = 'b0;	// NXT ++ Cycle Counts
	reg  [23:0]					  int_cycle_count   = 'b0;	// NXT ++ Cycle Counts
	
	reg 		 r_boot_mode		 = 0;	// 0:    
	reg 		 r_boot_req_sel_sub  = 0;	// 0: Core-M, 1: core-S (sub_pixel_conv)
	reg 		 r_boot_req_we		 = 0;   // 0: read, 1: write   
	reg [ 1:0] 	 r_boot_req_cs		 = 0;	// 01/11: weight, 10: bias, 00: scale
	reg [12:0] 	 r_boot_req_waddr	 = 0;	// Address
	reg [16:0] 	 r_boot_req_wdata	 = 0;	// Write data	
//------------------------Instantiation------------------

//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 1'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] 	<= int_ap_start;
                    rdata[1] 	<= int_ap_done;
                    rdata[2] 	<= int_ap_idle;
                    rdata[3] 	<= int_ap_ready;
                    rdata[7] 	<= int_auto_restart;
					rdata[31:8] <= int_cycle_count;		//NXT ++
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_READ_ADDRESS_DATA_0: begin
                    rdata <= int_read_address[31:0];
                end
                ADDR_WRITE_ADDRESS_DATA_0: begin
                    rdata <= int_write_address[31:0];
                end
				// NXT ++: Change the frame resolution externally
				ADDR_READ_ADDRESS_CTRL: begin
					rdata <= int_width_height[31:0];
				end
				ADDR_WRITE_ADDRESS_CTRL: begin
					rdata <= int_framesize[31:0];
				end				
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign interrupt     	= int_gie & (|int_isr);
`ifndef DEBUG_BOOT_MODE
assign ap_start      	= int_ap_start;
`endif
assign read_address  	= int_read_address;
assign write_address 	= int_write_address;
// NXT ++: Change the frame resolution externally
assign input_width   	= int_width_height[11: 0];
assign input_height  	= int_width_height[23:12];
assign input_framesize  = int_framesize[23:0];

assign o_boot_mode			= r_boot_mode		;	// 0:    
assign o_boot_req_sel_sub	= r_boot_req_sel_sub;	// 0: Core-M, 1: core-S (sub_pixel_conv)
assign o_boot_req_we		= r_boot_req_we		;   // 0: read, 1: write   
assign o_boot_req_cs		= r_boot_req_cs		;	// 01/11: weight, 10: bias, 00: scale
assign o_boot_req_waddr		= r_boot_req_waddr	;	// Address
assign o_boot_req_wdata		= r_boot_req_wdata	;	// Write data

`ifdef DUMMY_LAYER_INDEX
	assign layer_idx_dbg    = 4'd15;						// Add a layer index for debugging feature maps
`else 
	assign layer_idx_dbg    = int_width_height[27:24];	// Add a layer index for debugging feature maps
`endif
// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_ready)
            int_ap_start <= int_auto_restart; // clear on handshake/auto restart
    end
end

// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
        if (ap_done)
            int_ap_done <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_done <= 1'b0; // clear on read
    end
end

// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end

// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_ready <= ap_ready;
    end
end

// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <=  WDATA[7];
    end
end

// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end

// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[1:0];
    end
end

// int_isr[0]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[0] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[0] & ap_done)
            int_isr[0] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[0] <= int_isr[0] ^ WDATA[0]; // toggle on write
    end
end

// int_isr[1]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[1] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[1] & ap_ready)
            int_isr[1] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[1] <= int_isr[1] ^ WDATA[1]; // toggle on write
    end
end

// int_read_address[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_read_address[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_READ_ADDRESS_DATA_0)
            int_read_address[31:0] <= (WDATA[31:0] & wmask) | (int_read_address[31:0] & ~wmask);
    end
end

// int_write_address[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_write_address[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_WRITE_ADDRESS_DATA_0)
            int_write_address[31:0] <= (WDATA[31:0] & wmask) | (int_write_address[31:0] & ~wmask);
    end
end

// NXT ++: Change the frame resolution externally
// int_width_height[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_width_height[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_READ_ADDRESS_CTRL)
            int_width_height[31:0] <= (WDATA[31:0] & wmask) | (int_width_height[31:0] & ~wmask);
    end
end

// int_framesize[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_framesize[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_WRITE_ADDRESS_CTRL)
            int_framesize[31:0] <= (WDATA[31:0] & wmask) | (int_framesize[31:0] & ~wmask);
    end
end


// NXT ++: Add BOOT
//{{{
// int_boot_mode_reg[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_boot_mode_ena[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER)
            int_boot_mode_ena[31:0] <= (WDATA[31:0] & wmask) | (int_boot_mode_ena[31:0] & ~wmask);
    end
end
// int_boot_mode_reg[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_boot_mode_reg[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_ISR)
            int_boot_mode_reg[31:0] <= (WDATA[31:0] & wmask) | (int_boot_mode_reg[31:0] & ~wmask);
    end
end

//{{{
`ifndef DEBUG_BOOT_MODE
always@(*) begin 
	// From ADDR_IER	= 5'h08
	r_boot_mode			= int_boot_mode_ena[8];
	r_boot_req_sel_sub	= int_boot_mode_ena[9];	// 0: Core-M, 1: core-S (sub_pixel_conv)
	
	// From ADDR_ISR 	= 5'h0C
	r_boot_req_we		= int_boot_mode_reg[    0];    // 0: read, 1: write   
	r_boot_req_cs		= int_boot_mode_reg[ 2: 1];	// 01/11: weight, 10: bias, 00: scale
	r_boot_req_waddr	= int_boot_mode_reg[15: 3];	// Address
	r_boot_req_wdata	= int_boot_mode_reg[31:16];	// Write data
end 
`endif
//}}}
//}}}
//------------------------Memory logic-------------------
//
//// wstate
//always @(posedge ACLK) begin
//    if (ARESET)
//        wstate <= WRRESET;
//    else if (ACLK_EN)
//        wstate <= wnext;
//end

//------------------------Count --------------------------
reg ap_done_d;
wire ap_done_edge = ap_done && !ap_done_d;
always @(posedge ACLK) begin
    if (ARESET) begin 
        int_cycle_count <= 0;
		reg_cycle_count <= 0;
		ap_done_d <= 0;
	end 
    else if (ACLK_EN) begin
		ap_done_d <= ap_done;
		if(reg_cycle_count != 0)
			reg_cycle_count <= reg_cycle_count + 1;
		else if (ap_start)
			reg_cycle_count <= reg_cycle_count + 1;
		else if (ap_done_d)
			reg_cycle_count <= 0;
		
		if (ap_start)
			int_cycle_count <= 0;
		else if(ap_done_edge)
			int_cycle_count <= reg_cycle_count;
			
    end
end

//-------------------------------------------------
// Debuging the boot mode
//-------------------------------------------------
// synopsys translate_off
`ifdef DEBUG_BOOT_MODE
	parameter FILENAME_WEIGHT	= "/home/truongnx/FPGA/2023/srcnn_accel/tv/input_data/m1/all_conv_weights.hex";
	parameter FILENAME_BIAS		= "/home/truongnx/FPGA/2023/srcnn_accel/tv/input_data/m1/all_conv_biases.hex";
	parameter FILENAME_SCALE 	= "/home/truongnx/FPGA/2023/srcnn_accel/tv/input_data/m1/all_conv_scales.hex";

	reg [127:0] ram_weight[744-1:0];
	reg [ 15:0] ram_bias  [144-1:0];
	reg [ 15:0] ram_scale [144-1:0];
	initial begin
		 if (FILENAME_WEIGHT != "") begin
			$display("### Loading internal memory from %s ###", FILENAME_WEIGHT);
			$readmemh(FILENAME_WEIGHT, ram_weight);
		 end
		 
		  if (FILENAME_BIAS != "") begin
			$display("### Loading internal memory from %s ###", FILENAME_BIAS);
			$readmemh(FILENAME_BIAS, ram_bias);
		 end
		 
		  if (FILENAME_SCALE != "") begin
			$display("### Loading internal memory from %s ###", FILENAME_SCALE);
			$readmemh(FILENAME_SCALE, ram_scale);
		 end
	end
	localparam 	ST_IDLE 			= 3'd0,
				ST_BOOT_START		= 3'd1,
				ST_SEND_WEIGHT 		= 3'd2,
				ST_SEND_BIAS		= 3'd3, 
				ST_SEND_SCALE		= 3'd4,
				ST_SEND_WEIGHT_SUB 	= 3'd5,
				ST_BOOT_DONE		= 3'd6;	
	reg [2:0] c_state, n_state;

	reg ctrl_boot_start;
	reg ctrl_send_weight;
	reg ctrl_send_bias;
	reg ctrl_send_scale;
	reg ctrl_send_weight_sub;
	reg ctrl_boot_done;
	reg [12:0] counter;


	always@(posedge ACLK) begin 
		if(ARESET) 
			c_state <= ST_IDLE;
		else 
			c_state <= n_state;
	end

	always@(*) begin 
		ctrl_boot_start			= 0;
		ctrl_send_weight		= 0;
		ctrl_send_bias			= 0;
		ctrl_send_scale			= 0;
		ctrl_send_weight_sub	= 0;
		ctrl_boot_done			= 0;
		
		n_state = c_state;
		case(c_state)  
			ST_IDLE: begin 
				if(int_ap_start) 
					n_state = ST_BOOT_START;			
			end 
			ST_BOOT_START: begin 
				ctrl_boot_start = 1;
				n_state = ST_SEND_WEIGHT;
			end
			ST_SEND_WEIGHT: begin 
				ctrl_send_weight = 1;
				if(counter == 8*672-1)
					n_state = ST_SEND_BIAS;
			end 
			ST_SEND_BIAS: begin 
				ctrl_send_bias = 1;
				if(counter == 144-1)
					n_state = ST_SEND_SCALE;
			end 
			ST_SEND_SCALE: begin 
				ctrl_send_scale = 1;
				if(counter == 144-1)
					n_state = ST_SEND_WEIGHT_SUB;
			end 
			ST_SEND_WEIGHT_SUB: begin 
				ctrl_send_weight_sub = 1;
				if(counter == 8*72-1)
					n_state = ST_BOOT_DONE;
			end 
			ST_BOOT_DONE: begin 
				ctrl_boot_done = 1;
				n_state = ST_IDLE;
			end 
			default: begin 
			end 
		endcase
	end 
	always@(posedge ACLK) begin 
		if(ARESET) begin 
			counter <= 0;
		end 
		else begin 
			if(ctrl_send_weight) begin 
				if(counter == 8*672-1)
					counter <= 0;
				else 
					counter <= counter + 1;
			end 
			if(ctrl_send_bias) begin 
				if(counter == 144-1)
					counter <= 0;
				else 
					counter <= counter + 1;
			end 
			if(ctrl_send_scale) begin 
				if(counter == 144-1)
					counter <= 0;
				else 
					counter <= counter + 1;
			end
			if(ctrl_send_weight_sub) begin 
				if(counter == 8*72-1)
					counter <= 0;
				else 
					counter <= counter + 1;
			end 		
		end 
	end	
	always@(posedge ACLK) begin 
		if(ARESET) begin 
			r_boot_mode <= 1;
		end 
		else begin 
			//if(ap_start) 
			//	r_boot_mode <= 1'b1;
			//else i
			if (ctrl_boot_done)
				r_boot_mode <= 1'b0;
		end
	end 


	always@(*) begin 
		r_boot_req_sel_sub	= 0;	// 0: Core-M, 1: core-S (sub_pixel_conv)
		r_boot_req_we		= 0;    // 0: read, 1: write   
		r_boot_req_cs		= 0;	// 01/11: weight, 10: bias, 00: scale
		r_boot_req_waddr	= 0;	// Address
		r_boot_req_wdata	= 0;	// Write data
		
		case(c_state)  
			ST_SEND_WEIGHT: begin 
				r_boot_req_we	 = 1;
				r_boot_req_cs    = 2'b11;
				r_boot_req_waddr = counter;
				r_boot_req_wdata = ram_weight[counter[12:3]][counter[2:0]*16+:16];
			end 
			ST_SEND_BIAS: begin 
				r_boot_req_we	 = 1;
				r_boot_req_cs    = 2'b10;
				r_boot_req_waddr = counter;
				r_boot_req_wdata = ram_bias[counter];
			end 
			ST_SEND_SCALE: begin 
				r_boot_req_we	 = 1;
				r_boot_req_cs    = 2'b00;
				r_boot_req_waddr = counter;
				r_boot_req_wdata = ram_scale[counter];
			end 
			ST_SEND_WEIGHT_SUB: begin 
				r_boot_req_we	 	= 1;
				r_boot_req_sel_sub 	= 1;
				r_boot_req_cs    	= 2'b11;
				r_boot_req_waddr 	= counter;
				r_boot_req_wdata 	= ram_weight[counter[12:3]+672][counter[2:0]*16+:16];
			end 
			default: begin 
			end 
		endcase	
	end 

	assign ap_start = ctrl_boot_done;
`endif
// synopsys translate_on
endmodule
