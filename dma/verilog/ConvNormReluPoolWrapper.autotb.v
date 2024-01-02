// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

 `timescale 1ns/1ps

`define DEBUG_SYNC_CLOCK	1


`define AUTOTB_DUT      BypassModule
`define AUTOTB_DUT_INST Bypass
`define AUTOTB_TOP      apatb_ConvNormReluPoolWrapper_top
`define AUTOTB_LAT_RESULT_FILE "ConvNormReluPoolWrapper.result.lat.rb"
`define AUTOTB_PER_RESULT_TRANS_FILE "ConvNormReluPoolWrapper.performance.result.transaction.xml"
`define AUTOTB_TOP_INST AESL_inst_apatb_ConvNormReluPoolWrapper_top
`define AUTOTB_MAX_ALLOW_LATENCY  15000000
//`define AUTOTB_CLOCK_PERIOD_DIV2 2.50
`define AUTOTB_CLOCK_PERIOD_DIV2 5.0

`define AESL_DEPTH_memory_bus 1
`define AESL_DEPTH_read_address 1
`define AESL_DEPTH_write_address 1
//`define AUTOTB_TVIN_memory_bus  "E:/Projects/2022/07_HLS/demo_testbench/tv/cdatafile/c.ConvNormReluPoolWrapper.autotvin_memory_bus.dat"
//`define AUTOTB_TVIN_read_address  "E:/Projects/2022/07_HLS/demo_testbench/tv/cdatafile/c.ConvNormReluPoolWrapper.autotvin_read_address.dat"
//`define AUTOTB_TVIN_write_address  "E:/Projects/2022/07_HLS/demo_testbench/tv/cdatafile/c.ConvNormReluPoolWrapper.autotvin_write_address.dat"
//`define AUTOTB_TVIN_memory_bus_out_wrapc  "E:/Projects/2022/07_HLS/demo_testbench/tv/rtldatafile/rtl.ConvNormReluPoolWrapper.autotvin_memory_bus.dat"
//`define AUTOTB_TVIN_read_address_out_wrapc  "E:/Projects/2022/07_HLS/demo_testbench/tv/rtldatafile/rtl.ConvNormReluPoolWrapper.autotvin_read_address.dat"
//`define AUTOTB_TVIN_write_address_out_wrapc  "E:/Projects/2022/07_HLS/demo_testbench/tv/rtldatafile/rtl.ConvNormReluPoolWrapper.autotvin_write_address.dat"
//`define AUTOTB_TVOUT_memory_bus  "E:/Projects/2022/07_HLS/demo_testbench/tv/cdatafile/c.ConvNormReluPoolWrapper.autotvout_memory_bus.dat"
//`define AUTOTB_TVOUT_memory_bus_out_wrapc  "E:/Projects/2022/07_HLS/demo_testbench/tv/rtldatafile/rtl.ConvNormReluPoolWrapper.autotvout_memory_bus.dat"

module `AUTOTB_TOP;
`include "params.v"

parameter AUTOTB_TRANSACTION_NUM = 1;
parameter PROGRESS_TIMEOUT = 10000000;
parameter LATENCY_ESTIMATION = 27;
parameter LENGTH_memory_bus = 12441600;
parameter LENGTH_read_address = 1;
parameter LENGTH_write_address = 1;

task read_token;
    input integer fp;
    output reg [223 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end
endtask


// yhnko
reg custom_clk;
`ifndef DEBUG_SYNC_CLOCK
	initial begin
		custom_clk = 0;
		#0.1
		//forever #7.5 custom_clk = ~custom_clk;
		forever #2.5 custom_clk = ~custom_clk;      //NXT Mode: Use 200MHz clock
	end
`endif
reg AESL_clock;
reg rst;
reg start;
reg ce;
reg tb_continue;
wire AESL_start;
wire AESL_reset;
wire AESL_ce;
wire AESL_ready;
wire AESL_idle;
wire AESL_continue;
wire AESL_done;
reg AESL_done_delay = 0;
reg AESL_done_delay2 = 0;
reg AESL_ready_delay = 0;
wire ready;
wire ready_wire;
wire [4 : 0] axilite_AWADDR;
wire  axilite_AWVALID;
wire  axilite_AWREADY;
wire  axilite_WVALID;
wire  axilite_WREADY;
wire [31 : 0] axilite_WDATA;
wire [3 : 0] axilite_WSTRB;
wire [4 : 0] axilite_ARADDR;
wire  axilite_ARVALID;
wire  axilite_ARREADY;
wire  axilite_RVALID;
wire  axilite_RREADY;
wire [31 : 0] axilite_RDATA;
wire [1 : 0] axilite_RRESP;
wire  axilite_BVALID;
wire  axilite_BREADY;
wire [1 : 0] axilite_BRESP;
wire  axilite_INTERRUPT;
wire  memory_bus_AWVALID;
wire  memory_bus_AWREADY;
wire [31 : 0] memory_bus_AWADDR;
wire [0 : 0] memory_bus_AWID;
wire [7 : 0] memory_bus_AWLEN;
wire [2 : 0] memory_bus_AWSIZE;
wire [1 : 0] memory_bus_AWBURST;
wire [1 : 0] memory_bus_AWLOCK;
wire [3 : 0] memory_bus_AWCACHE;
wire [2 : 0] memory_bus_AWPROT;
wire [3 : 0] memory_bus_AWQOS;
wire [3 : 0] memory_bus_AWREGION;
wire [0 : 0] memory_bus_AWUSER;
wire  memory_bus_WVALID;
wire  memory_bus_WREADY;
wire [31 : 0] memory_bus_WDATA;
wire [3 : 0] memory_bus_WSTRB;
wire  memory_bus_WLAST;
wire [0 : 0] memory_bus_WID;
wire [0 : 0] memory_bus_WUSER;
wire  memory_bus_ARVALID;
wire  memory_bus_ARREADY;
wire [31 : 0] memory_bus_ARADDR;
wire [0 : 0] memory_bus_ARID;
wire [7 : 0] memory_bus_ARLEN;
wire [2 : 0] memory_bus_ARSIZE;
wire [1 : 0] memory_bus_ARBURST;
wire [1 : 0] memory_bus_ARLOCK;
wire [3 : 0] memory_bus_ARCACHE;
wire [2 : 0] memory_bus_ARPROT;
wire [3 : 0] memory_bus_ARQOS;
wire [3 : 0] memory_bus_ARREGION;
wire [0 : 0] memory_bus_ARUSER;
wire  memory_bus_RVALID;
wire  memory_bus_RREADY;
wire [31 : 0] memory_bus_RDATA;
wire  memory_bus_RLAST;
wire [0 : 0] memory_bus_RID;
wire [0 : 0] memory_bus_RUSER;
wire [1 : 0] memory_bus_RRESP;
wire  memory_bus_BVALID;
wire  memory_bus_BREADY;
wire [1 : 0] memory_bus_BRESP;
wire [0 : 0] memory_bus_BID;
wire [0 : 0] memory_bus_BUSER;

//wire  mem_to_pl_AWVALID;
//wire  mem_to_pl_AWREADY;
//wire [31 : 0] mem_to_pl_AWADDR;
//wire [0 : 0] mem_to_pl_AWID;
//wire [7 : 0] mem_to_pl_AWLEN;
//wire [2 : 0] mem_to_pl_AWSIZE;
//wire [1 : 0] mem_to_pl_AWBURST;
//wire [1 : 0] mem_to_pl_AWLOCK;
//wire [3 : 0] mem_to_pl_AWCACHE;
//wire [2 : 0] mem_to_pl_AWPROT;
//wire [3 : 0] mem_to_pl_AWQOS;
//wire [3 : 0] mem_to_pl_AWREGION;
//wire [0 : 0] mem_to_pl_AWUSER;
//wire  mem_to_pl_WVALID;
//wire  mem_to_pl_WREADY;
//wire [127 : 0] mem_to_pl_WDATA;
//wire [15 : 0] mem_to_pl_WSTRB;
//wire  mem_to_pl_WLAST;
//wire [0 : 0] mem_to_pl_WID;
//wire [0 : 0] mem_to_pl_WUSER;
//wire  mem_to_pl_ARVALID;
//wire  mem_to_pl_ARREADY;
//wire [31 : 0] mem_to_pl_ARADDR;
//wire [0 : 0] mem_to_pl_ARID;
//wire [7 : 0] mem_to_pl_ARLEN;
//wire [2 : 0] mem_to_pl_ARSIZE;
//wire [1 : 0] mem_to_pl_ARBURST;
//wire [1 : 0] mem_to_pl_ARLOCK;
//wire [3 : 0] mem_to_pl_ARCACHE;
//wire [2 : 0] mem_to_pl_ARPROT;
//wire [3 : 0] mem_to_pl_ARQOS;
//wire [3 : 0] mem_to_pl_ARREGION;
//wire [0 : 0] mem_to_pl_ARUSER;
//wire  mem_to_pl_RVALID;
//wire  mem_to_pl_RREADY;
//wire [127 : 0] mem_to_pl_RDATA;
//wire  mem_to_pl_RLAST;
//wire [0 : 0] mem_to_pl_RID;
//wire [0 : 0] mem_to_pl_RUSER;
//wire [1 : 0] mem_to_pl_RRESP;
//wire  mem_to_pl_BVALID;
//wire  mem_to_pl_BREADY;
//wire [1 : 0] mem_to_pl_BRESP;
//wire [0 : 0] mem_to_pl_BID;
//wire [0 : 0] mem_to_pl_BUSER;

integer done_cnt = 0;
integer AESL_ready_cnt = 0;
integer ready_cnt = 0;
reg ready_initial;
reg ready_initial_n;
reg ready_last_n;
reg ready_delay_last_n;
reg done_delay_last_n;
reg interface_done = 0;
wire axilite_write_data_finish;
wire AESL_slave_start;
reg AESL_slave_start_lock = 0;
wire AESL_slave_write_start_in;
wire AESL_slave_write_start_finish;
reg AESL_slave_ready;
wire AESL_slave_output_done;
wire AESL_slave_done;
reg ready_rise = 0;
reg start_rise = 0;
reg slave_start_status = 0;
reg slave_done_status = 0;
reg ap_done_lock = 0;

wire ap_clk;
wire ap_rst_n;
wire ap_rst_n_n;

wire s_clk;
wire m_clk;
wire s_rst_n;
wire m_rst_n;

wire  axi_AWVALID;
wire  axi_AWREADY;
wire  [32 - 1:0] axi_AWADDR;
wire  [1 - 1:0] axi_AWID;
wire  [7:0] axi_AWLEN;
wire  [2:0] axi_AWSIZE;
wire  [1:0] axi_AWBURST;
wire  [1:0] axi_AWLOCK;
wire  [3:0] axi_AWCACHE;
wire  [2:0] axi_AWPROT;
wire  [3:0] axi_AWQOS;
wire  [3:0] axi_AWREGION;
wire  [1 - 1:0] axi_AWUSER;
wire  axi_WVALID;
wire  axi_WREADY;
wire  [128 - 1:0] axi_WDATA;
wire  [16 - 1:0] axi_WSTRB;
wire  axi_WLAST;
wire  [1 - 1:0] axi_WID;
wire  [1 - 1:0] axi_WUSER;
wire  axi_ARVALID;
wire  axi_ARREADY;
wire  [32 - 1:0] axi_ARADDR;
wire  [1 - 1:0] axi_ARID;
wire  [7:0] axi_ARLEN;
wire  [2:0] axi_ARSIZE;
wire  [1:0] axi_ARBURST;
wire  [1:0] axi_ARLOCK;
wire  [3:0] axi_ARCACHE;
wire  [2:0] axi_ARPROT;
wire  [3:0] axi_ARQOS;
wire  [3:0] axi_ARREGION;
wire  [1 - 1:0] axi_ARUSER;
wire  axi_RVALID;
wire  axi_RREADY;
wire  [128 - 1:0] axi_RDATA;
wire  axi_RLAST;
wire  [1 - 1:0] axi_RID;
wire  [1 - 1:0] axi_RUSER;
wire  [1:0] axi_RRESP;
wire  axi_BVALID;
wire  axi_BREADY;
wire  [1:0] axi_BRESP;
wire  [1 - 1:0] axi_BID;
wire  [1 - 1:0] axi_BUSER;

wire  s_axilite_AWVALID;
wire  s_axilite_AWREADY;
wire  [5 - 1:0] s_axilite_AWADDR;
wire  s_axilite_WVALID;
wire  s_axilite_WREADY;
wire  [32 - 1:0] s_axilite_WDATA;
wire  [4 - 1:0] s_axilite_WSTRB;
wire  s_axilite_ARVALID;
wire  s_axilite_ARREADY;
wire  [5 - 1:0] s_axilite_ARADDR;
wire  s_axilite_RVALID;
wire  s_axilite_RREADY;
wire  [32 - 1:0] s_axilite_RDATA;
wire  [1:0] s_axilite_RRESP;
wire  s_axilite_BVALID;
wire  s_axilite_BREADY;
wire  [1:0] s_axilite_BRESP;

//BypassWrapper BypassWrapper_U(
cnn_dma_wrapper u_cnn_dma_wrapper(
    .s_axilite_AWADDR(s_axilite_AWADDR),
    .s_axilite_AWVALID(s_axilite_AWVALID),
    .s_axilite_AWREADY(s_axilite_AWREADY),
    .s_axilite_WVALID(s_axilite_WVALID),
    .s_axilite_WREADY(s_axilite_WREADY),
    .s_axilite_WDATA(s_axilite_WDATA),
    .s_axilite_WSTRB(s_axilite_WSTRB),
    .s_axilite_ARADDR(s_axilite_ARADDR),
    .s_axilite_ARVALID(s_axilite_ARVALID),
    .s_axilite_ARREADY(s_axilite_ARREADY),
    .s_axilite_RVALID(s_axilite_RVALID),
    .s_axilite_RREADY(s_axilite_RREADY),
    .s_axilite_RDATA(s_axilite_RDATA),
    .s_axilite_RRESP(s_axilite_RRESP),
    .s_axilite_BVALID(s_axilite_BVALID),
    .s_axilite_BREADY(s_axilite_BREADY),
    .s_axilite_BRESP(s_axilite_BRESP),
    .interrupt(axilite_INTERRUPT),
    .ap_clk(custom_clk),
    .ap_rst_n(ap_rst_n),
    .m_axi_AWVALID(axi_AWVALID),
    .m_axi_AWREADY(axi_AWREADY),
    .m_axi_AWADDR(axi_AWADDR),
    .m_axi_AWID(axi_AWID),
    .m_axi_AWLEN(axi_AWLEN),
    .m_axi_AWSIZE(axi_AWSIZE),
    .m_axi_AWBURST(axi_AWBURST),
    .m_axi_AWLOCK(axi_AWLOCK),
    .m_axi_AWCACHE(axi_AWCACHE),
    .m_axi_AWPROT(axi_AWPROT),
    .m_axi_AWQOS(axi_AWQOS),
    .m_axi_AWREGION(axi_AWREGION),
    .m_axi_AWUSER(axi_AWUSER),
    .m_axi_WVALID(axi_WVALID),
    .m_axi_WREADY(axi_WREADY),
    .m_axi_WDATA(axi_WDATA),
    .m_axi_WSTRB(axi_WSTRB),
    .m_axi_WLAST(axi_WLAST),
    .m_axi_WID(axi_WID),
    .m_axi_WUSER(axi_WUSER),
    .m_axi_ARVALID(axi_ARVALID),
    .m_axi_ARREADY(axi_ARREADY),
    .m_axi_ARADDR(axi_ARADDR),
    .m_axi_ARID(axi_ARID),
    .m_axi_ARLEN(axi_ARLEN),
    .m_axi_ARSIZE(axi_ARSIZE),
    .m_axi_ARBURST(axi_ARBURST),
    .m_axi_ARLOCK(axi_ARLOCK),
    .m_axi_ARCACHE(axi_ARCACHE),
    .m_axi_ARPROT(axi_ARPROT),
    .m_axi_ARQOS(axi_ARQOS),
    .m_axi_ARREGION(axi_ARREGION),
    .m_axi_ARUSER(axi_ARUSER),
    .m_axi_RVALID(axi_RVALID),
    .m_axi_RREADY(axi_RREADY),
    .m_axi_RDATA(axi_RDATA),
    .m_axi_RLAST(axi_RLAST),
    .m_axi_RID(axi_RID),
    .m_axi_RUSER(axi_RUSER),
    .m_axi_RRESP(axi_RRESP),
    .m_axi_BVALID(axi_BVALID),
    .m_axi_BREADY(axi_BREADY),
    .m_axi_BRESP(axi_BRESP),
    .m_axi_BID(axi_BID),
    .m_axi_BUSER(axi_BUSER));

axilite_clock_converter_0 u_axilite_converter(
    .m_axi_awvalid(s_axilite_AWVALID),
    .m_axi_awready(s_axilite_AWREADY),
    .m_axi_awaddr(s_axilite_AWADDR),
    .m_axi_wvalid(s_axilite_WVALID),
    .m_axi_wready(s_axilite_WREADY),
    .m_axi_wdata(s_axilite_WDATA),
    .m_axi_wstrb(s_axilite_WSTRB),
    .m_axi_arvalid(s_axilite_ARVALID),
    .m_axi_arready(s_axilite_ARREADY),
    .m_axi_araddr(s_axilite_ARADDR),
    .m_axi_rvalid(s_axilite_RVALID),
    .m_axi_rready(s_axilite_RREADY),
    .m_axi_rdata(s_axilite_RDATA),
    .m_axi_rresp(s_axilite_RRESP),
    .m_axi_bvalid(s_axilite_BVALID),
    .m_axi_bready(s_axilite_BREADY),
    .m_axi_bresp(s_axilite_BRESP),
    
    .s_axi_awvalid(axilite_AWVALID),
    .s_axi_awready(axilite_AWREADY),
    .s_axi_awaddr(axilite_AWADDR),
    .s_axi_awprot(3'd0),
    .s_axi_wvalid(axilite_WVALID),
    .s_axi_wready(axilite_WREADY),
    .s_axi_wdata(axilite_WDATA),
    .s_axi_wstrb(axilite_WSTRB),
    .s_axi_arvalid(axilite_ARVALID),
    .s_axi_arready(axilite_ARREADY),
    .s_axi_araddr(axilite_ARADDR),
    .s_axi_arprot(3'd0),
    .s_axi_rvalid(axilite_RVALID),
    .s_axi_rready(axilite_RREADY),
    .s_axi_rdata(axilite_RDATA),
    .s_axi_rresp(axilite_RRESP),
    .s_axi_bvalid(axilite_BVALID),
    .s_axi_bready(axilite_BREADY),
    .s_axi_bresp(axilite_BRESP),
    
    .s_axi_aclk(ap_clk),
    .s_axi_aresetn(ap_rst_n),
    .m_axi_aclk(custom_clk),
    .m_axi_aresetn(ap_rst_n)
);

axi_clock_converter_0 u_axi_converter(
//    .m_axi_awvalid(mem_to_pl_AWVALID),
//    .m_axi_awready(mem_to_pl_AWREADY),
//    .m_axi_awaddr(mem_to_pl_AWADDR),
//    .m_axi_awlen(mem_to_pl_AWLEN),
//    .m_axi_awsize(mem_to_pl_AWSIZE),
//    .m_axi_awburst(mem_to_pl_AWBURST),
//    .m_axi_awlock(mem_to_pl_AWLOCK),
//    .m_axi_awcache(mem_to_pl_AWCACHE),
//    .m_axi_awprot(mem_to_pl_AWPROT),
//    .m_axi_awqos(mem_to_pl_AWQOS),
//    .m_axi_awregion(mem_to_pl_AWREGION),
//    .m_axi_wvalid(mem_to_pl_WVALID),
//    .m_axi_wready(mem_to_pl_WREADY),
//    .m_axi_wdata(mem_to_pl_WDATA),
//    .m_axi_wstrb(mem_to_pl_WSTRB),
//    .m_axi_wlast(mem_to_pl_WLAST),
//    .m_axi_arvalid(mem_to_pl_ARVALID),
//    .m_axi_arready(mem_to_pl_ARREADY),
//    .m_axi_araddr(mem_to_pl_ARADDR),
//    .m_axi_arlen(mem_to_pl_ARLEN),
//    .m_axi_arsize(mem_to_pl_ARSIZE),
//    .m_axi_arburst(mem_to_pl_ARBURST),
//    .m_axi_arlock(mem_to_pl_ARLOCK),
//    .m_axi_arcache(mem_to_pl_ARCACHE),
//    .m_axi_arprot(mem_to_pl_ARPROT),
//    .m_axi_arqos(mem_to_pl_ARQOS),
//    .m_axi_arregion(mem_to_pl_ARREGION),
//    .m_axi_rvalid(mem_to_pl_RVALID),
//    .m_axi_rready(mem_to_pl_RREADY),
//    .m_axi_rdata(mem_to_pl_RDATA),
//    .m_axi_rlast(mem_to_pl_RLAST),
//    .m_axi_rresp(mem_to_pl_RRESP),
//    .m_axi_bvalid(mem_to_pl_BVALID),
//    .m_axi_bready(mem_to_pl_BREADY),
//    .m_axi_bresp(mem_to_pl_BRESP),
    .m_axi_awvalid(memory_bus_AWVALID),
    .m_axi_awready(memory_bus_AWREADY),
    .m_axi_awaddr(memory_bus_AWADDR),
    .m_axi_awlen(memory_bus_AWLEN),
    .m_axi_awsize(memory_bus_AWSIZE),
    .m_axi_awburst(memory_bus_AWBURST),
    .m_axi_awlock(memory_bus_AWLOCK),
    .m_axi_awcache(memory_bus_AWCACHE),
    .m_axi_awprot(memory_bus_AWPROT),
    .m_axi_awqos(memory_bus_AWQOS),
    .m_axi_awregion(memory_bus_AWREGION),
    .m_axi_wvalid(memory_bus_WVALID),
    .m_axi_wready(memory_bus_WREADY),
    .m_axi_wdata(memory_bus_WDATA),
    .m_axi_wstrb(memory_bus_WSTRB),
    .m_axi_wlast(memory_bus_WLAST),
    .m_axi_arvalid(memory_bus_ARVALID),
    .m_axi_arready(memory_bus_ARREADY),
    .m_axi_araddr(memory_bus_ARADDR),
    .m_axi_arlen(memory_bus_ARLEN),
    .m_axi_arsize(memory_bus_ARSIZE),
    .m_axi_arburst(memory_bus_ARBURST),
    .m_axi_arlock(memory_bus_ARLOCK),
    .m_axi_arcache(memory_bus_ARCACHE),
    .m_axi_arprot(memory_bus_ARPROT),
    .m_axi_arqos(memory_bus_ARQOS),
    .m_axi_arregion(memory_bus_ARREGION),
    .m_axi_rvalid(memory_bus_RVALID),
    .m_axi_rready(memory_bus_RREADY),
    .m_axi_rdata(memory_bus_RDATA),
    .m_axi_rlast(memory_bus_RLAST),
    .m_axi_rresp(memory_bus_RRESP),
    .m_axi_bvalid(memory_bus_BVALID),
    .m_axi_bready(memory_bus_BREADY),
    .m_axi_bresp(memory_bus_BRESP),
	
    .s_axi_awvalid(axi_AWVALID),
    .s_axi_awready(axi_AWREADY),
    .s_axi_awaddr(axi_AWADDR),
    .s_axi_awlen(axi_AWLEN),
    .s_axi_awsize(axi_AWSIZE),
    .s_axi_awburst(axi_AWBURST),
    .s_axi_awlock(axi_AWLOCK),
    .s_axi_awcache(axi_AWCACHE),
    .s_axi_awprot(axi_AWPROT),
    .s_axi_awqos(axi_AWQOS),
    .s_axi_awregion(axi_AWREGION),
    .s_axi_wvalid(axi_WVALID),
    .s_axi_wready(axi_WREADY),
    .s_axi_wdata(axi_WDATA),
    .s_axi_wstrb(axi_WSTRB),
    .s_axi_wlast(axi_WLAST),
    .s_axi_arvalid(axi_ARVALID),
    .s_axi_arready(axi_ARREADY),
    .s_axi_araddr(axi_ARADDR),
    .s_axi_arlen(axi_ARLEN),
    .s_axi_arsize(axi_ARSIZE),
    .s_axi_arburst(axi_ARBURST),
    .s_axi_arlock(axi_ARLOCK),
    .s_axi_arcache(axi_ARCACHE),
    .s_axi_arprot(axi_ARPROT),
    .s_axi_arqos(axi_ARQOS),
    .s_axi_arregion(axi_ARREGION),
    .s_axi_rvalid(axi_RVALID),
    .s_axi_rready(axi_RREADY),
    .s_axi_rdata(axi_RDATA),
    .s_axi_rlast(axi_RLAST),
    .s_axi_rresp(axi_RRESP),
    .s_axi_bvalid(axi_BVALID),
    .s_axi_bready(axi_BREADY),
    .s_axi_bresp(axi_BRESP),

    .s_axi_aclk(custom_clk),
    .s_axi_aresetn(ap_rst_n),
    .m_axi_aclk(ap_clk),
    .m_axi_aresetn(ap_rst_n)
);



//axi_dwidth_converter_0 axi_dwith_conv(
//    .m_axi_awvalid(memory_bus_AWVALID),
//    .m_axi_awready(memory_bus_AWREADY),
//    .m_axi_awaddr(memory_bus_AWADDR),
//    .m_axi_awlen(memory_bus_AWLEN),
//    .m_axi_awsize(memory_bus_AWSIZE),
//    .m_axi_awburst(memory_bus_AWBURST),
//    .m_axi_awlock(memory_bus_AWLOCK),
//    .m_axi_awcache(memory_bus_AWCACHE),
//    .m_axi_awprot(memory_bus_AWPROT),
//    .m_axi_awqos(memory_bus_AWQOS),
//    .m_axi_awregion(memory_bus_AWREGION),
//    .m_axi_wvalid(memory_bus_WVALID),
//    .m_axi_wready(memory_bus_WREADY),
//    .m_axi_wdata(memory_bus_WDATA),
//    .m_axi_wstrb(memory_bus_WSTRB),
//    .m_axi_wlast(memory_bus_WLAST),
//    .m_axi_arvalid(memory_bus_ARVALID),
//    .m_axi_arready(memory_bus_ARREADY),
//    .m_axi_araddr(memory_bus_ARADDR),
//    .m_axi_arlen(memory_bus_ARLEN),
//    .m_axi_arsize(memory_bus_ARSIZE),
//    .m_axi_arburst(memory_bus_ARBURST),
//    .m_axi_arlock(memory_bus_ARLOCK),
//    .m_axi_arcache(memory_bus_ARCACHE),
//    .m_axi_arprot(memory_bus_ARPROT),
//    .m_axi_arqos(memory_bus_ARQOS),
//    .m_axi_arregion(memory_bus_ARREGION),
//    .m_axi_rvalid(memory_bus_RVALID),
//    .m_axi_rready(memory_bus_RREADY),
//    .m_axi_rdata(memory_bus_RDATA),
//    .m_axi_rlast(memory_bus_RLAST),
//    .m_axi_rresp(memory_bus_RRESP),
//    .m_axi_bvalid(memory_bus_BVALID),
//    .m_axi_bready(memory_bus_BREADY),
//    .m_axi_bresp(memory_bus_BRESP),
//
//    .s_axi_awvalid(mem_to_pl_AWVALID),
//    .s_axi_awready(mem_to_pl_AWREADY),
//    .s_axi_awaddr(mem_to_pl_AWADDR),
//    .s_axi_awlen(mem_to_pl_AWLEN),
//    .s_axi_awsize(mem_to_pl_AWSIZE),
//    .s_axi_awburst(mem_to_pl_AWBURST),
//    .s_axi_awlock(mem_to_pl_AWLOCK),
//    .s_axi_awcache(mem_to_pl_AWCACHE),
//    .s_axi_awprot(mem_to_pl_AWPROT),
//    .s_axi_awqos(mem_to_pl_AWQOS),
//    .s_axi_awregion(mem_to_pl_AWREGION),
//    .s_axi_wvalid(mem_to_pl_WVALID),
//    .s_axi_wready(mem_to_pl_WREADY),
//    .s_axi_wdata(mem_to_pl_WDATA),
//    .s_axi_wstrb(mem_to_pl_WSTRB),
//    .s_axi_wlast(mem_to_pl_WLAST),
//    .s_axi_arvalid(mem_to_pl_ARVALID),
//    .s_axi_arready(mem_to_pl_ARREADY),
//    .s_axi_araddr(mem_to_pl_ARADDR),
//    .s_axi_arlen(mem_to_pl_ARLEN),
//    .s_axi_arsize(mem_to_pl_ARSIZE),
//    .s_axi_arburst(mem_to_pl_ARBURST),
//    .s_axi_arlock(mem_to_pl_ARLOCK),
//    .s_axi_arcache(mem_to_pl_ARCACHE),
//    .s_axi_arprot(mem_to_pl_ARPROT),
//    .s_axi_arqos(mem_to_pl_ARQOS),
//    .s_axi_arregion(mem_to_pl_ARREGION),
//    .s_axi_rvalid(mem_to_pl_RVALID),
//    .s_axi_rready(mem_to_pl_RREADY),
//    .s_axi_rdata(mem_to_pl_RDATA),
//    .s_axi_rlast(mem_to_pl_RLAST),
//    .s_axi_rresp(mem_to_pl_RRESP),
//    .s_axi_bvalid(mem_to_pl_BVALID),
//    .s_axi_bready(mem_to_pl_BREADY),
//    .s_axi_bresp(mem_to_pl_BRESP),
//
//    .s_axi_aclk(ap_clk),
//    .s_axi_aresetn(ap_rst_n)
//    // .M00_AXI_ARESET_OUT_N(m_rst_n),
//    // .S00_AXI_ARESET_OUT_N(s_rst_n),
//);

// Assignment for control signal
assign ap_clk = AESL_clock;
assign ap_rst_n = AESL_reset;
assign ap_rst_n_n = ~AESL_reset;
assign AESL_reset = rst;
assign AESL_start = start;
assign AESL_ce = ce;
assign AESL_continue = tb_continue;
  assign AESL_slave_write_start_in = slave_start_status  & axilite_write_data_finish;
  assign AESL_slave_start = AESL_slave_write_start_finish;
  assign AESL_done = slave_done_status ;

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
    begin
        slave_start_status <= 1;
    end
    else begin
        if (AESL_start == 1 ) begin
            start_rise = 1;
        end
        if (start_rise == 1 && AESL_done == 1 ) begin
            slave_start_status <= 1;
        end
        if (AESL_slave_write_start_in == 1 && AESL_done == 0) begin 
            slave_start_status <= 0;
            start_rise = 0;
        end
    end
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
    begin
        AESL_slave_ready <= 0;
        ready_rise = 0;
    end
    else begin
        if (AESL_ready == 1 ) begin
            ready_rise = 1;
        end
        if (ready_rise == 1 && AESL_done_delay == 1 ) begin
            AESL_slave_ready <= 1;
        end
        if (AESL_slave_ready == 1) begin 
            AESL_slave_ready <= 0;
            ready_rise = 0;
        end
    end
end

always @ (posedge AESL_clock)
begin
    if (AESL_done == 1) begin
        slave_done_status <= 0;
    end
    else if (AESL_slave_output_done == 1 ) begin
        slave_done_status <= 1;
    end
end



wire    AESL_axi_master_memory_bus_ready;
wire    AESL_axi_master_memory_bus_done;
wire [32 - 1:0] read_address;
wire [32 - 1:0] write_address;
wire [32 - 1:0] width_height;		//NXT ++
wire [32 - 1:0] frame_size;		//NXT ++
AESL_axi_master_memory_bus AESL_AXI_MASTER_memory_bus(
    .clk   (AESL_clock),
    .reset (AESL_reset),
    .TRAN_memory_bus_AWVALID (memory_bus_AWVALID),
    .TRAN_memory_bus_AWREADY (memory_bus_AWREADY),
    .TRAN_memory_bus_AWADDR (memory_bus_AWADDR),
    .TRAN_memory_bus_AWID (memory_bus_AWID),
    .TRAN_memory_bus_AWLEN (memory_bus_AWLEN),
    .TRAN_memory_bus_AWSIZE (memory_bus_AWSIZE),
    .TRAN_memory_bus_AWBURST (memory_bus_AWBURST),
    .TRAN_memory_bus_AWLOCK (memory_bus_AWLOCK),
    .TRAN_memory_bus_AWCACHE (memory_bus_AWCACHE),
    .TRAN_memory_bus_AWPROT (memory_bus_AWPROT),
    .TRAN_memory_bus_AWQOS (memory_bus_AWQOS),
    .TRAN_memory_bus_AWREGION (memory_bus_AWREGION),
    .TRAN_memory_bus_AWUSER (memory_bus_AWUSER),
    .TRAN_memory_bus_WVALID (memory_bus_WVALID),
    .TRAN_memory_bus_WREADY (memory_bus_WREADY),
    .TRAN_memory_bus_WDATA (memory_bus_WDATA),
    .TRAN_memory_bus_WSTRB (memory_bus_WSTRB),
    .TRAN_memory_bus_WLAST (memory_bus_WLAST),
    .TRAN_memory_bus_WID (memory_bus_WID),
    .TRAN_memory_bus_WUSER (memory_bus_WUSER),
    .TRAN_memory_bus_ARVALID (memory_bus_ARVALID),
    .TRAN_memory_bus_ARREADY (memory_bus_ARREADY),
    .TRAN_memory_bus_ARADDR (memory_bus_ARADDR),
    .TRAN_memory_bus_ARID (memory_bus_ARID),
    .TRAN_memory_bus_ARLEN (memory_bus_ARLEN),
    .TRAN_memory_bus_ARSIZE (memory_bus_ARSIZE),
    .TRAN_memory_bus_ARBURST (memory_bus_ARBURST),
    .TRAN_memory_bus_ARLOCK (memory_bus_ARLOCK),
    .TRAN_memory_bus_ARCACHE (memory_bus_ARCACHE),
    .TRAN_memory_bus_ARPROT (memory_bus_ARPROT),
    .TRAN_memory_bus_ARQOS (memory_bus_ARQOS),
    .TRAN_memory_bus_ARREGION (memory_bus_ARREGION),
    .TRAN_memory_bus_ARUSER (memory_bus_ARUSER),
    .TRAN_memory_bus_RVALID (memory_bus_RVALID),
    .TRAN_memory_bus_RREADY (memory_bus_RREADY),
    .TRAN_memory_bus_RDATA (memory_bus_RDATA),
    .TRAN_memory_bus_RLAST (memory_bus_RLAST),
    .TRAN_memory_bus_RID (memory_bus_RID),
    .TRAN_memory_bus_RUSER (memory_bus_RUSER),
    .TRAN_memory_bus_RRESP (memory_bus_RRESP),
    .TRAN_memory_bus_BVALID (memory_bus_BVALID),
    .TRAN_memory_bus_BREADY (memory_bus_BREADY),
    .TRAN_memory_bus_BRESP (memory_bus_BRESP),
    .TRAN_memory_bus_BID (memory_bus_BID),
    .TRAN_memory_bus_BUSER (memory_bus_BUSER),
    .TRAN_memory_bus_read_address (read_address),
    .TRAN_memory_bus_write_address (write_address),
	.TRAN_memory_bus_width_height (width_height),	//NXT ++
	.TRAN_memory_bus_frame_size (frame_size),		//NXT ++
    .ready (AESL_axi_master_memory_bus_ready),
    .done  (AESL_axi_master_memory_bus_done)
);
assign    AESL_axi_master_memory_bus_ready    =   ready;
assign    AESL_axi_master_memory_bus_done    =   AESL_done_delay;

AESL_axi_slave_axilite AESL_AXI_SLAVE_axilite(
    .clk   (AESL_clock),
    .reset (AESL_reset),
    .TRAN_s_axi_axilite_AWADDR (axilite_AWADDR),
    .TRAN_s_axi_axilite_AWVALID (axilite_AWVALID),
    .TRAN_s_axi_axilite_AWREADY (axilite_AWREADY),
    .TRAN_s_axi_axilite_WVALID (axilite_WVALID),
    .TRAN_s_axi_axilite_WREADY (axilite_WREADY),
    .TRAN_s_axi_axilite_WDATA (axilite_WDATA),
    .TRAN_s_axi_axilite_WSTRB (axilite_WSTRB),
    .TRAN_s_axi_axilite_ARADDR (axilite_ARADDR),
    .TRAN_s_axi_axilite_ARVALID (axilite_ARVALID),
    .TRAN_s_axi_axilite_ARREADY (axilite_ARREADY),
    .TRAN_s_axi_axilite_RVALID (axilite_RVALID),
    .TRAN_s_axi_axilite_RREADY (axilite_RREADY),
    .TRAN_s_axi_axilite_RDATA (axilite_RDATA),
    .TRAN_s_axi_axilite_RRESP (axilite_RRESP),
    .TRAN_s_axi_axilite_BVALID (axilite_BVALID),
    .TRAN_s_axi_axilite_BREADY (axilite_BREADY),
    .TRAN_s_axi_axilite_BRESP (axilite_BRESP),
    .TRAN_axilite_interrupt (axilite_INTERRUPT),
    .TRAN_read_address (read_address),
    .TRAN_write_address (write_address),
	.TRAN_frame_size(frame_size),		//NXT ++
	.TRAN_width_height(width_height),		//NXT ++
    .TRAN_axilite_write_data_finish(axilite_write_data_finish),
    .TRAN_axilite_ready_out (AESL_ready),
    .TRAN_axilite_ready_in (AESL_slave_ready),
    .TRAN_axilite_done_out (AESL_slave_output_done),
    .TRAN_axilite_idle_out (AESL_idle),
    .TRAN_axilite_write_start_in     (AESL_slave_write_start_in),
    .TRAN_axilite_write_start_finish (AESL_slave_write_start_finish),
    .TRAN_axilite_transaction_done_in (AESL_done_delay),
    .TRAN_axilite_start_in  (AESL_slave_start)
);

initial begin : generate_AESL_ready_cnt_proc
    AESL_ready_cnt = 0;
    wait(AESL_reset === 1);
    while(AESL_ready_cnt != AUTOTB_TRANSACTION_NUM) begin
        while(AESL_ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        AESL_ready_cnt = AESL_ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end

    event next_trigger_ready_cnt;
    
    initial begin : gen_ready_cnt
        ready_cnt = 0;
        wait (AESL_reset === 1);
        forever begin
            @ (posedge AESL_clock);
            if (ready == 1) begin
                if (ready_cnt < AUTOTB_TRANSACTION_NUM) begin
                    ready_cnt = ready_cnt + 1;
                end
            end
            -> next_trigger_ready_cnt;
        end
    end
    
    wire all_finish = (done_cnt == AUTOTB_TRANSACTION_NUM);
    
    // done_cnt
    always @ (posedge AESL_clock) begin
        if (~AESL_reset) begin
            done_cnt <= 0;
        end else begin
            if (AESL_done == 1) begin
                if (done_cnt < AUTOTB_TRANSACTION_NUM) begin
                    done_cnt <= done_cnt + 1;
                end
            end
        end
    end
    
    initial begin : finish_simulation
        wait (all_finish == 1);
        // last transaction is saved at negedge right after last done
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        $finish;
    end
    
initial begin
    AESL_clock = 0;
    forever #`AUTOTB_CLOCK_PERIOD_DIV2 AESL_clock = ~AESL_clock;
end


reg end_memory_bus;
reg [31:0] size_memory_bus;
reg [31:0] size_memory_bus_backup;
reg end_read_address;
reg [31:0] size_read_address;
reg [31:0] size_read_address_backup;
reg end_write_address;
reg [31:0] size_write_address;
reg [31:0] size_write_address_backup;

initial begin : initial_process
    integer proc_rand;
    rst = 0;
    # 100;
    repeat(3) @ (posedge AESL_clock);
    rst = 1;
end
initial begin : start_process
    integer proc_rand;
    reg [31:0] start_cnt;
    ce = 1;
    start = 0;
    start_cnt = 0;
    wait (AESL_reset === 1);
    @ (posedge AESL_clock);
    #0 start = 1;
    start_cnt = start_cnt + 1;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt >= AUTOTB_TRANSACTION_NUM) begin
            // keep pushing garbage in
            #0 start = 1;
        end
        if (AESL_ready) begin
            start_cnt = start_cnt + 1;
        end
    end
end

always @(AESL_done)
begin
    tb_continue = AESL_done;
end

initial begin : ready_initial_process
    ready_initial = 0;
    wait (AESL_start === 1);
    ready_initial = 1;
    @(posedge AESL_clock);
    ready_initial = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      AESL_ready_delay = 0;
  else
      AESL_ready_delay = AESL_ready;
end
initial begin : ready_last_n_process
  ready_last_n = 1;
  wait(ready_cnt == AUTOTB_TRANSACTION_NUM)
  @(posedge AESL_clock);
  ready_last_n <= 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      ready_delay_last_n = 0;
  else
      ready_delay_last_n <= ready_last_n;
end
assign ready = (ready_initial | AESL_ready_delay);
assign ready_wire = ready_initial | AESL_ready_delay;
initial begin : done_delay_last_n_process
  done_delay_last_n = 1;
  while(done_cnt < AUTOTB_TRANSACTION_NUM)
      @(posedge AESL_clock);
  # 0.1;
  done_delay_last_n = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
  begin
      AESL_done_delay <= 0;
      AESL_done_delay2 <= 0;
  end
  else begin
      AESL_done_delay <= AESL_done & done_delay_last_n;
      AESL_done_delay2 <= AESL_done_delay;
  end
end
always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      interface_done = 0;
  else begin
      # 0.01;
      if(ready === 1 && ready_cnt > 0 && ready_cnt < AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else if(AESL_done_delay === 1 && done_cnt == AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else
          interface_done = 0;
  end
end

reg dump_tvout_finish_memory_bus;

initial begin : dump_tvout_runtime_sign_memory_bus
    integer fp;
    dump_tvout_finish_memory_bus = 0;
    fp = $fopen(`AUTOTB_TVOUT_memory_bus_out_wrapc, "w");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_memory_bus_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    $fclose(fp);
    wait (done_cnt == AUTOTB_TRANSACTION_NUM);
    // last transaction is saved at negedge right after last done
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    fp = $fopen(`AUTOTB_TVOUT_memory_bus_out_wrapc, "a");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_memory_bus_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
    dump_tvout_finish_memory_bus = 1;
end


////////////////////////////////////////////
// progress and performance
////////////////////////////////////////////

task wait_start();
    while (~AESL_start) begin
        @ (posedge AESL_clock);
    end
endtask

reg [31:0] clk_cnt = 0;
reg AESL_ready_p1;
reg AESL_start_p1;

always @ (posedge AESL_clock) begin
    clk_cnt <= clk_cnt + 1;
    AESL_ready_p1 <= AESL_ready;
    AESL_start_p1 <= AESL_start;
end

reg [31:0] start_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] start_cnt;
reg [31:0] ready_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] ap_ready_cnt;
reg [31:0] finish_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] finish_cnt;
event report_progress;

initial begin
    start_cnt = 0;
    finish_cnt = 0;
    ap_ready_cnt = 0;
    wait (AESL_reset == 1);
    wait_start();
    start_timestamp[start_cnt] = clk_cnt;
    start_cnt = start_cnt + 1;
    if (AESL_done) begin
        finish_timestamp[finish_cnt] = clk_cnt;
        finish_cnt = finish_cnt + 1;
    end
    -> report_progress;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt < AUTOTB_TRANSACTION_NUM) begin
            if ((AESL_start && AESL_ready_p1)||(AESL_start && ~AESL_start_p1)) begin
                start_timestamp[start_cnt] = clk_cnt;
                start_cnt = start_cnt + 1;
            end
        end
        if (ap_ready_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_start_p1 && AESL_ready_p1) begin
                ready_timestamp[ap_ready_cnt] = clk_cnt;
                ap_ready_cnt = ap_ready_cnt + 1;
            end
        end
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                finish_timestamp[finish_cnt] = clk_cnt;
                finish_cnt = finish_cnt + 1;
            end
        end
        -> report_progress;
    end
end

reg [31:0] progress_timeout;

initial begin : simulation_progress
    real intra_progress;
    wait (AESL_reset == 1);
    progress_timeout = PROGRESS_TIMEOUT;
    $display("////////////////////////////////////////////////////////////////////////////////////");
    $display("// Inter-Transaction Progress: Completed Transaction / Total Transaction");
    $display("// Intra-Transaction Progress: Measured Latency / Latency Estimation * 100%%");
    $display("//");
    $display("// RTL Simulation : \"Inter-Transaction Progress\" [\"Intra-Transaction Progress\"] @ \"Simulation Time\"");
    $display("////////////////////////////////////////////////////////////////////////////////////");
    print_progress();
    while (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
        @ (report_progress);
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                print_progress();
                progress_timeout = PROGRESS_TIMEOUT;
            end else begin
                if (progress_timeout == 0) begin
                    print_progress();
                    progress_timeout = PROGRESS_TIMEOUT;
                end else begin
                    progress_timeout = progress_timeout - 1;
                end
            end
        end
    end
    print_progress();
    $display("////////////////////////////////////////////////////////////////////////////////////");
    calculate_performance();
end

task get_intra_progress(output real intra_progress);
    begin
        if (start_cnt > finish_cnt) begin
            intra_progress = clk_cnt - start_timestamp[finish_cnt];
        end else if(finish_cnt > 0) begin
            intra_progress = LATENCY_ESTIMATION;
        end else begin
            intra_progress = 0;
        end
        intra_progress = intra_progress / LATENCY_ESTIMATION;
    end
endtask

task print_progress();
    real intra_progress;
    begin
        if (LATENCY_ESTIMATION > 0) begin
            get_intra_progress(intra_progress);
            $display("// RTL Simulation : %0d / %0d [%2.2f%%] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, intra_progress * 100, $time);
        end else begin
            $display("// RTL Simulation : %0d / %0d [n/a] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, $time);
        end
    end
endtask

task calculate_performance();
   
    integer i;
    integer fp;
    reg [31:0] latency [0:AUTOTB_TRANSACTION_NUM - 1];
    reg [31:0] latency_min;
    reg [31:0] latency_max;
    reg [31:0] latency_total;
    reg [31:0] latency_average;
    reg [31:0] interval [0:AUTOTB_TRANSACTION_NUM - 2];
    reg [31:0] interval_min;
    reg [31:0] interval_max;
    reg [31:0] interval_total;
    reg [31:0] interval_average;
    begin
        latency_min = -1;
        latency_max = 0;
        latency_total = 0;
        interval_min = -1;
        interval_max = 0;
        interval_total = 0;
        //$display("calculating performance");

        for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
            // calculate latency
            latency[i] = finish_timestamp[i] - start_timestamp[i];
            if (latency[i] > latency_max) latency_max = latency[i];
            if (latency[i] < latency_min) latency_min = latency[i];
            latency_total = latency_total + latency[i];
            // calculate interval
            if (AUTOTB_TRANSACTION_NUM == 1) begin
                interval[i] = 0;
                interval_max = 0;
                interval_min = 0;
                interval_total = 0;
            end else if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                interval[i] = finish_timestamp[i] - start_timestamp[i]+1;
                if (interval[i] > interval_max) interval_max = interval[i];
                if (interval[i] < interval_min) interval_min = interval[i];
                interval_total = interval_total + interval[i];
            end
        end

        latency_average = latency_total / AUTOTB_TRANSACTION_NUM;
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            interval_average = 0;
        end else begin
            interval_average = interval_total / (AUTOTB_TRANSACTION_NUM - 1);
        end

        fp = $fopen(`AUTOTB_LAT_RESULT_FILE, "w");

        $fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latency_max);
        $fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latency_min);
        $fdisplay(fp, "$AVER_LATENCY = \"%0d\"", latency_average);
        $fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", interval_max);
        $fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", interval_min);
        $fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", interval_average);

        $fclose(fp);

        fp = $fopen(`AUTOTB_PER_RESULT_TRANS_FILE, "w");

        $fdisplay(fp, "%20s%16s%16s", "", "latency", "interval");
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            i = 0;
            $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
        end else begin
            for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
                if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                    $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
                end else begin
                    $fdisplay(fp, "transaction%8d:%16d               x", i, latency[i]);
                end
            end
        end

        $fclose(fp);
    end
endtask


////////////////////////////////////////////
// Dependence Check
////////////////////////////////////////////

`ifndef POST_SYN

`endif

`ifdef DEBUG_SYNC_CLOCK
	always@(*) begin
	custom_clk = AESL_clock;
	end
`endif

endmodule
