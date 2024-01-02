`timescale 1 ns / 1 ps 

module cnn_dma_wrapper (
        ap_clk,
        ap_rst_n,
        m_axi_AWVALID,
        m_axi_AWREADY,
        m_axi_AWADDR,
        m_axi_AWID,
        m_axi_AWLEN,
        m_axi_AWSIZE,
        m_axi_AWBURST,
        m_axi_AWLOCK,
        m_axi_AWCACHE,
        m_axi_AWPROT,
        m_axi_AWQOS,
        m_axi_AWREGION,
        m_axi_AWUSER,
        m_axi_WVALID,
        m_axi_WREADY,
        m_axi_WDATA,
        m_axi_WSTRB,
        m_axi_WLAST,
        m_axi_WID,
        m_axi_WUSER,
        m_axi_ARVALID,
        m_axi_ARREADY,
        m_axi_ARADDR,
        m_axi_ARID,
        m_axi_ARLEN,
        m_axi_ARSIZE,
        m_axi_ARBURST,
        m_axi_ARLOCK,
        m_axi_ARCACHE,
        m_axi_ARPROT,
        m_axi_ARQOS,
        m_axi_ARREGION,
        m_axi_ARUSER,
        m_axi_RVALID,
        m_axi_RREADY,
        m_axi_RDATA,
        m_axi_RLAST,
        m_axi_RID,
        m_axi_RUSER,
        m_axi_RRESP,
        m_axi_BVALID,
        m_axi_BREADY,
        m_axi_BRESP,
        m_axi_BID,
        m_axi_BUSER,
        s_axilite_AWVALID,
        s_axilite_AWREADY,
        s_axilite_AWADDR,
        s_axilite_WVALID,
        s_axilite_WREADY,
        s_axilite_WDATA,
        s_axilite_WSTRB,
        s_axilite_ARVALID,
        s_axilite_ARREADY,
        s_axilite_ARADDR,
        s_axilite_RVALID,
        s_axilite_RREADY,
        s_axilite_RDATA,
        s_axilite_RRESP,
        s_axilite_BVALID,
        s_axilite_BREADY,
        s_axilite_BRESP,
        interrupt
);
`include "params.v"

// FSM
localparam ST_IDLE = 0;
localparam ST_READ = 1;
localparam ST_PRE_WRITE = 2;
localparam ST_WRITE = 3;
localparam ST_DONE = 4;

input   ap_clk;
input   ap_rst_n;
output   m_axi_AWVALID;
input   m_axi_AWREADY;
output  [M_AXI_ADDR_WIDTH - 1:0] m_axi_AWADDR;
output  [M_AXI_ID_WIDTH - 1:0] m_axi_AWID;
output  [7:0] m_axi_AWLEN;
output  [2:0] m_axi_AWSIZE;
output  [1:0] m_axi_AWBURST;
output  [1:0] m_axi_AWLOCK;
output  [3:0] m_axi_AWCACHE;
output  [2:0] m_axi_AWPROT;
output  [3:0] m_axi_AWQOS;
output  [3:0] m_axi_AWREGION;
output  [M_AXI_AWUSER_WIDTH - 1:0] m_axi_AWUSER;
output   m_axi_WVALID;
input   m_axi_WREADY;
output  [M_AXI_DATA_WIDTH - 1:0] m_axi_WDATA;
output  [M_AXI_WSTRB_WIDTH - 1:0] m_axi_WSTRB;
output   m_axi_WLAST;
output  [M_AXI_ID_WIDTH - 1:0] m_axi_WID;
output  [M_AXI_WUSER_WIDTH - 1:0] m_axi_WUSER;
output   m_axi_ARVALID;
input   m_axi_ARREADY;
output  [M_AXI_ADDR_WIDTH - 1:0] m_axi_ARADDR;
output  [M_AXI_ID_WIDTH - 1:0] m_axi_ARID;
output  [7:0] m_axi_ARLEN;
output  [2:0] m_axi_ARSIZE;
output  [1:0] m_axi_ARBURST;
output  [1:0] m_axi_ARLOCK;
output  [3:0] m_axi_ARCACHE;
output  [2:0] m_axi_ARPROT;
output  [3:0] m_axi_ARQOS;
output  [3:0] m_axi_ARREGION;
output  [M_AXI_ARUSER_WIDTH - 1:0] m_axi_ARUSER;
input   m_axi_RVALID;
output   m_axi_RREADY;
input  [M_AXI_DATA_WIDTH - 1:0] m_axi_RDATA;
input   m_axi_RLAST;
input  [M_AXI_ID_WIDTH - 1:0] m_axi_RID;
input  [M_AXI_RUSER_WIDTH - 1:0] m_axi_RUSER;
input  [1:0] m_axi_RRESP;
input   m_axi_BVALID;
output   m_axi_BREADY;
input  [1:0] m_axi_BRESP;
input  [M_AXI_ID_WIDTH - 1:0] m_axi_BID;
input  [M_AXI_BUSER_WIDTH - 1:0] m_axi_BUSER;
input   s_axilite_AWVALID;
output   s_axilite_AWREADY;
input  [S_AXI_ADDR_WIDTH - 1:0] s_axilite_AWADDR;
input   s_axilite_WVALID;
output   s_axilite_WREADY;
input  [S_AXI_DATA_WIDTH - 1:0] s_axilite_WDATA;
input  [S_AXI_WSTRB_WIDTH - 1:0] s_axilite_WSTRB;
input   s_axilite_ARVALID;
output   s_axilite_ARREADY;
input  [S_AXI_ADDR_WIDTH - 1:0] s_axilite_ARADDR;
output   s_axilite_RVALID;
input   s_axilite_RREADY;
output  [S_AXI_DATA_WIDTH - 1:0] s_axilite_RDATA;
output  [1:0] s_axilite_RRESP;
output   s_axilite_BVALID;
input   s_axilite_BREADY;
output  [1:0] s_axilite_BRESP;
output  interrupt;

wire ap_start;
wire ap_ready;
wire ap_done;
wire ap_idle;
wire [31:0] read_address;
wire [31:0] write_address;
wire [11:0] input_width;
wire [11:0] input_height;
wire [23:0] input_framesize;
wire [ 3:0] layer_idx_dbg;
wire 		boot_mode;			// 0:    
wire 		boot_req_sel_sub;	// 0: Core-M, 1: core-S (sub_pixel_conv)
wire 		boot_req_we;   		// 0: read, 1: write   
wire [ 1:0] boot_req_cs;		// 01/11: weight, 10: bias, 00: scale
wire [12:0] boot_req_waddr;		// Address
wire [16:0] boot_req_wdata;		// Write data

cnn_dma_axi u_cnn_dma_axi(
.HCLK(ap_clk),
.HRESETn(ap_rst_n),
//AXI Master Interface: Read address channel
.M_ARVALID(m_axi_ARVALID),    // address/control valid handshake
.M_ARREADY(m_axi_ARREADY),    // Read addr ready
.M_ARADDR(m_axi_ARADDR),     // Address Read 
.M_ARID(m_axi_ARID),       // Read addr ID
.M_ARLEN(m_axi_ARLEN),      // Transfer length
.M_ARSIZE(m_axi_ARSIZE),     // Transfer width
.M_ARBURST(m_axi_ARBURST),    // Burst type
.M_ARLOCK(m_axi_ARLOCK),     // Atomic access information
.M_ARCACHE(m_axi_ARCACHE),    // Cachable/bufferable infor
.M_ARPROT(m_axi_ARPROT),     // Protection info
.M_ARQOS(m_axi_ARQOS),      // Quality of Service
.M_ARREGION(m_axi_ARREGION),   // Region signaling
.M_ARUSER(m_axi_ARUSER),     // User defined signal
//Read data channel
.M_RVALID(m_axi_RVALID),     // Read data valid 
.M_RREADY(m_axi_RREADY),     // Read data ready (to Slave)
.M_RDATA(m_axi_RDATA),      // Read data bus
.M_RLAST(m_axi_RLAST),      // Last beat of a burst transfer
.M_RID(m_axi_RID),        // Read ID
.M_RUSER(m_axi_RUSER),      // User defined signal
.M_RRESP(m_axi_RRESP),      // Read response
//AXI Master Interface: Write address channel
.M_AWID(m_axi_AWID),       // Address ID
.M_AWADDR(m_axi_AWADDR),     // Address Write
.M_AWLEN(m_axi_AWLEN),      // Transfer length
.M_AWSIZE(m_axi_AWSIZE),     // Transfer width
.M_AWBURST(m_axi_AWBURST),    // Burst type
.M_AWLOCK(m_axi_AWLOCK),     // Atomic access information
.M_AWCACHE(m_axi_AWCACHE),    // Cachable/bufferable infor
.M_AWPROT(m_axi_AWPROT),     // Protection info
.M_AWREGION(m_axi_AWREGION),
.M_AWQOS(m_axi_AWQOS),
.M_AWVALID(m_axi_AWVALID),    // address/control valid handshake
.M_AWREADY(m_axi_AWREADY),
//Write data channel
.M_WID(m_axi_WID),        // Write ID
.M_WDATA(m_axi_WDATA),      // Write Data bus
.M_WSTRB(m_axi_WSTRB),      // Write Data byte lane strobes
.M_WLAST(m_axi_WLAST),      // Last beat of a burst transfer
.M_WVALID(m_axi_WVALID),     // Write data valid
.M_WREADY(m_axi_WREADY),     // Write data ready
//Write response chaDnel
.M_BID(m_axi_BID),        // buffered response ID
.M_BRESP(m_axi_BRESP),      // Buffered write response
.M_BVALID(m_axi_BVALID),     // Response info valid
.M_BREADY(m_axi_BREADY),     // Response info ready (to slave)
//Read address channDl
.ap_start(ap_start),
.ap_ready(ap_ready),
.ap_done(ap_done),
.ap_idle(ap_idle),
.read_address(read_address),
.write_address(write_address),
// NXT ++: Change the frame resolution externally
.input_width(input_width),
.input_height(input_height),
.input_framesize(input_framesize),
.layer_idx_dbg(layer_idx_dbg),
// BOOT mode
.i_boot_mode		(boot_mode			),	// 0:    
.i_boot_req_sel_sub	(boot_req_sel_sub	),	// 0: Core-M, 1: core-S (sub_pixel_conv)
.i_boot_req_we		(boot_req_we		),  // 0: read, 1: write   
.i_boot_req_cs		(boot_req_cs		),	// 01/11: weight, 10: bias, 00: scale
.i_boot_req_waddr	(boot_req_waddr		),	// Address
.i_boot_req_wdata	(boot_req_wdata		)	// Write data	
);

wire ap_rst_n_inv;
assign ap_rst_n_inv = ~ap_rst_n;
S_axilite #(
    .C_S_AXI_ADDR_WIDTH( S_AXI_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( S_AXI_DATA_WIDTH ))
u_axi_lite_slave(
    .AWVALID(s_axilite_AWVALID),
    .AWREADY(s_axilite_AWREADY),
    .AWADDR(s_axilite_AWADDR),
    .WVALID(s_axilite_WVALID),
    .WREADY(s_axilite_WREADY),
    .WDATA(s_axilite_WDATA),
    .WSTRB(s_axilite_WSTRB),
    .ARVALID(s_axilite_ARVALID),
    .ARREADY(s_axilite_ARREADY),
    .ARADDR(s_axilite_ARADDR),
    .RVALID(s_axilite_RVALID),
    .RREADY(s_axilite_RREADY),
    .RDATA(s_axilite_RDATA),
    .RRESP(s_axilite_RRESP),
    .BVALID(s_axilite_BVALID),
    .BREADY(s_axilite_BREADY),
    .BRESP(s_axilite_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .read_address(read_address),
    .write_address(write_address),
	// NXT ++: Change the frame resolution externally
	.input_width	(input_width	),
	.input_height	(input_height	),
	.input_framesize(input_framesize),
	.layer_idx_dbg	(layer_idx_dbg	),
	// BOOT mode
    .o_boot_mode		(boot_mode			),	// 0:    
    .o_boot_req_sel_sub	(boot_req_sel_sub	),	// 0: Core-M, 1: core-S (sub_pixel_conv)
    .o_boot_req_we		(boot_req_we		),  // 0: read, 1: write   
    .o_boot_req_cs		(boot_req_cs		),	// 01/11: weight, 10: bias, 00: scale
    .o_boot_req_waddr	(boot_req_waddr		),	// Address
    .o_boot_req_wdata	(boot_req_wdata		)	// Write data	
);

endmodule //ConvNormReluPoolWrapper
