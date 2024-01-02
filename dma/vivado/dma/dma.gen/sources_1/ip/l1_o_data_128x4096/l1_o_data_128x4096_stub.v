// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Tue Nov  7 22:22:52 2023
// Host        : sml running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top l1_o_data_128x4096 -prefix
//               l1_o_data_128x4096_ l1_o_data_128x4096_stub.v
// Design      : l1_o_data_128x4096
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *)
module l1_o_data_128x4096(clka, ena, wea, addra, dina, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[11:0],dina[127:0],douta[127:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [11:0]addra;
  input [127:0]dina;
  output [127:0]douta;
endmodule
