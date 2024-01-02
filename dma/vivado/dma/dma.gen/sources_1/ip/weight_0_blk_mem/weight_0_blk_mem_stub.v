// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Wed Nov 29 12:04:10 2023
// Host        : sml running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/Young Jae/OneDrive -
//               SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/weight_0_blk_mem/weight_0_blk_mem_stub.v}
// Design      : weight_0_blk_mem
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *)
module weight_0_blk_mem(clka, ena, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,addra[4:0],douta[255:0]" */;
  input clka;
  input ena;
  input [4:0]addra;
  output [255:0]douta;
endmodule
