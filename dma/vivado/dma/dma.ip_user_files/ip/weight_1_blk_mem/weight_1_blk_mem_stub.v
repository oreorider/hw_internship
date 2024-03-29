// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Mon Aug 28 13:46:10 2023
// Host        : sml running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/weight_1_blk_mem/weight_1_blk_mem_stub.v
// Design      : weight_1_blk_mem
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *)
module weight_1_blk_mem(clka, ena, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,addra[5:0],douta[127:0]" */;
  input clka;
  input ena;
  input [5:0]addra;
  output [127:0]douta;
endmodule
