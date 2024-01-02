`timescale 1ns/1ps

`include "cnn_accel_h.v"
module out_writer#(
parameter W_ADDR 		= 32,
parameter W_DATA 		= 32,
parameter WB_DATA 		= 4,
parameter W_WB_DATA 	= 2,
//parameter DEF_HPROT 	= {`PROT_NOTCACHE, `PROT_UNBUF, `PROT_USER, `PROT_DATA},
parameter W_SIZE 		= 12, 
parameter WIDTH 		= 128,
parameter HEIGHT 		= 128,
parameter MAX_WIDTH	 	= 1920)(
clk,
rstn,
start,
write_address,		//220726 ++
frame_size,
i_pix,
i_vld,
o_layer_done,
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
M_BREADY     // Response info ready (to slave)
);
`include "params.v"
input clk;
input rstn;
input start;
input [W_ADDR-1:0] write_address;		//220726 ++
input [23:0] 	   frame_size;		//220726 ++
input [W_DATA-1:0] i_pix;
input 			   i_vld;
output reg o_layer_done;
output  [M_AXI_ID_WIDTH  -1:0]     M_AWID;       // Address ID
output  [M_AXI_ADDR_WIDTH-1:0]     M_AWADDR;     // Address Write
output  [7:0]     M_AWLEN;      // Transfer length
output  [2:0]       M_AWSIZE;     // Transfer width
output  [1:0]       M_AWBURST;    // Burst type
output  [1:0]       M_AWLOCK;     // Atomic access information
output  [3:0]       M_AWCACHE;    // Cachable/bufferable infor
output  [2:0]       M_AWPROT;     // Protection info
output  [3:0]       M_AWREGION;
output  [3:0]       M_AWQOS;
output              M_AWVALID;    // address/control valid handshake
input               M_AWREADY;
//Write data channel
output  [M_AXI_ID_WIDTH   -1:0]     M_WID;        // Write ID
output  [M_AXI_DATA_WIDTH -1:0]     M_WDATA;      // Write Data bus
output  [M_AXI_WSTRB_WIDTH-1:0]     M_WSTRB;      // Write Data byte lane strobes
output              M_WLAST;      // Last beat of a burst transfer
output              M_WVALID;     // Write data valid
input               M_WREADY;     // Write data ready
//Write response chaDnel
input  [M_AXI_ID_WIDTH-1:0]      M_BID;        // buffered response ID
input  [1:0]        M_BRESP;      // Buffered write response
input               M_BVALID;     // Response info valid
output              M_BREADY;     // Response info ready (to slave)
//Read address channDl

//-------------------------------------------------------------------------------
// Internal signals
//-------------------------------------------------------------------------------
parameter		DATA_WIDTH = 32;
parameter       DEPTH = 256;
	localparam W_DEPTH = $clog2(DEPTH);
reg 				 start_dma_wr;
reg [BITS_TRANS-1:0] num_trans;
reg [W_ADDR    -1:0] dst_addr_wr;
reg [W_ADDR    -1:0] req_addr_wr;
wire 				 read_req;
wire [W_DATA-1:0] 	 data_i; 
wire 				 dma_data_last_wr;
wire 				 rrdy;
wire[W_DEPTH-1:0] cnt;
reg [23:0]	blk_addr_wr;
//reg [23:0]	blk_addr_in;

//-------------------------------------------------------------------------------
// Make output
//-------------------------------------------------------------------------------
//FSM
always @(posedge clk or negedge rstn)begin
	if(!rstn) begin	
		//dst_addr_wr <= write_address;
		dst_addr_wr 	<= 0;
		blk_addr_wr 	<= 0;
		o_layer_done	<= 0;
	end
	else begin
		if(start) begin 
			dst_addr_wr 	<= write_address;
			blk_addr_wr 	<= 0;
			o_layer_done	<= 0;
		end 
		else if(dma_data_last_wr) begin 			
			//if(blk_addr_wr == frame_size[23:5] - 1) begin 
			if(blk_addr_wr == frame_size[23:7] - 1) begin //frame_size/(32*4)
				dst_addr_wr 	<= write_address;	// BURST_LENGTH = 32, WDATA = 4 bytes
				blk_addr_wr 	<= 0;			
				o_layer_done	<= 1;
			end 
			else begin 
				dst_addr_wr <= dst_addr_wr + 32;	// BURST_LENGTH = 32, WDATA = 4 bytes
				blk_addr_wr <= blk_addr_wr + 1;
			end			
		end 
	end
end

always @(posedge clk or negedge rstn)begin
	if(!rstn) begin	
		start_dma_wr 	<= 0;
		num_trans 		<= 0;
		req_addr_wr 	<= 0;
	end
	else begin
		if(start) begin 
			start_dma_wr 	<= 0;
			num_trans 		<= 32;
			req_addr_wr 	<= write_address;				
		end 
		else begin 
			//if(i_vld && blk_addr_in[5:0] == 5'b11111) begin
			if(rrdy && (cnt[4:0] == 5'b0_0000)) begin
				start_dma_wr <= 1'b1;
				req_addr_wr  <= dst_addr_wr;
			end
			else
				start_dma_wr <= 1'b0;
		end 
	end
end	

reg_fifo
u_fifo_ofm(
	.clk	(clk		),
	.rstn	(rstn		),
	.srst	(~rstn		),	// WARNING
	.wdata	(i_pix		),
	.wren	(i_vld		),
	.wrdy	(			),
	.rdata	(data_i		),
	.rden	(read_req	),
	.rrdy	(rrdy		),
	.cnt	(cnt		)
);
//-------------------------------------------------------------------------------
// DMA for writing the output image
//-------------------------------------------------------------------------------
// dma write module
axi_dma_wr u_dma_write(
	.M_AWID			(M_AWID				),  // Address ID
	.M_AWADDR		(M_AWADDR			),  // Address Write
	.M_AWLEN		(M_AWLEN			),  // Transfer length
	.M_AWSIZE		(M_AWSIZE			),  // Transfer width
	.M_AWBURST		(M_AWBURST			),  // Burst type
	.M_AWLOCK		(M_AWLOCK			),  // Atomic access information
	.M_AWCACHE		(M_AWCACHE			),  // Cachable/bufferable infor
	.M_AWPROT		(M_AWPROT			),  // Protection info
	.M_AWREGION		(M_AWREGION			),
	.M_AWQOS		(M_AWQOS			),
	.M_AWVALID		(M_AWVALID			),  // address/control valid handshake
	.M_AWREADY		(M_AWREADY			),
	//Write data channel		
	.M_WID			(M_WID				),  // Write ID
	.M_WDATA		(M_WDATA			),  // Write Data bus
	.M_WSTRB		(M_WSTRB			),  // Write Data byte lane strobes
	.M_WLAST		(M_WLAST			),  // Last beat of a burst transfer
	.M_WVALID		(M_WVALID			),  // Write data valid
	.M_WREADY		(M_WREADY			),  // Write data ready
	//Write response chaDnel		
	.M_BID			(M_BID				),  // buffered response ID
	.M_BRESP		(M_BRESP			),  // Buffered write response
	.M_BVALID		(M_BVALID			),  // Response info valid
	.M_BREADY		(M_BREADY			),  // Response info ready (to slave)
	//Read address channDl
	//User interface
	.start_dma		(start_dma_wr		),
	.num_trans		(num_trans			),  // Number of words transferred
	.start_addr		(req_addr_wr		),
	.indata			(data_i				),
	.indata_req_o	(read_req			),
	.data_last_o	(dma_data_last_wr	),   //Blk transfer done
	//User signals
	.clk			(clk				),
	.rstn			(rstn				)
); 

//-------------------------------------------------
// Debugging
//-------------------------------------------------
// synopsys translate_off
reg read_req_d;
always @(posedge clk or negedge rstn)begin
	if(!rstn) begin	
		read_req_d 	<= 0;
	end
	else begin
	    read_req_d  <= read_req;
	end
end 

integer fp_output_log;
integer idx;
always @(posedge clk or negedge rstn) begin
	if(~rstn) begin
		fp_output_log <= 0;
		idx <= 0;
	end
	else begin
		if(start) begin 
			fp_output_log <= $fopen(FILE_OUTPUT_LOG, "w");	
		end 
		else if(read_req_d) begin
			for(idx = 7; idx >= 0; idx=idx-1) begin
				if(idx == 0) begin
					$fwrite(fp_output_log,"%01h\n", data_i[idx*4+:4]);						
				end	
				else begin
					$fwrite(fp_output_log,"%01h", data_i[idx*4+:4]);
				end
			end
		end
		else if(dma_data_last_wr && (blk_addr_wr == frame_size[23:7] - 1)) begin
			$fclose(fp_output_log);				
		end
	end
end

//synopsys translate_on
endmodule
