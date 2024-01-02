`include "cnn_accel_h.v"
// Notes
// acc0  = win0[0]*din[0] + ... + win0[15]*din[15]
// acc0  = win0[0]*din[0] + ... + win0[15]*din[15]
// Weights are always signed numbers
// Activation is a unsigned 8-bit number
// TODO: Add a signed mode
module mac(
input clk,
input rstn,
input vld_i,
input [127:0] win0,
input [127:0] win1,
input [127:0] din, 
output[ 21:0] acc_out0,
output[ 21:0] acc_out1,
output  vld_out0, 
output  vld_out1
);

wire [31:0] din_short = din[31:0];
wire [31:0] win0_short = win0[31:0];
wire [31:0] win1_short = win1[31:0];

(* dont_touch = "true" *)wire[17:0] mul0_00, mul0_01, mul0_02, mul0_03, mul0_04, mul0_05, mul0_06, mul0_07, mul0_08, mul0_09, mul0_10, mul0_11, mul0_12, mul0_13, mul0_14, mul0_15;
(* dont_touch = "true" *)wire[17:0] mul1_00, mul1_01, mul1_02, mul1_03, mul1_04, mul1_05, mul1_06, mul1_07, mul1_08, mul1_09, mul1_10, mul1_11, mul1_12, mul1_13, mul1_14, mul1_15;
(* dont_touch = "true" *)reg vld_i_d1, vld_i_d2, vld_i_d3, vld_i_d4;

(* dont_touch = "true" *)wire [8:0] din_00 = $signed({1'b0,din[  7:  0]});
(* dont_touch = "true" *)wire [8:0] din_01 = $signed({1'b0,din[ 15:  8]});
(* dont_touch = "true" *)wire [8:0] din_02 = $signed({1'b0,din[ 23: 16]});
(* dont_touch = "true" *)wire [8:0] din_03 = $signed({1'b0,din[ 31: 24]});
(* dont_touch = "true" *)wire [8:0] din_04 = $signed({1'b0,din[ 39: 32]});
(* dont_touch = "true" *)wire [8:0] din_05 = $signed({1'b0,din[ 47: 40]});
(* dont_touch = "true" *)wire [8:0] din_06 = $signed({1'b0,din[ 55: 48]});
(* dont_touch = "true" *)wire [8:0] din_07 = $signed({1'b0,din[ 63: 56]});
(* dont_touch = "true" *)wire [8:0] din_08 = $signed({1'b0,din[ 71: 64]});
(* dont_touch = "true" *)wire [8:0] din_09 = $signed({1'b0,din[ 79: 72]});
(* dont_touch = "true" *)wire [8:0] din_10 = $signed({1'b0,din[ 87: 80]});
(* dont_touch = "true" *)wire [8:0] din_11 = $signed({1'b0,din[ 95: 88]});
(* dont_touch = "true" *)wire [8:0] din_12 = $signed({1'b0,din[103: 96]});
(* dont_touch = "true" *)wire [8:0] din_13 = $signed({1'b0,din[111:104]});
(* dont_touch = "true" *)wire [8:0] din_14 = $signed({1'b0,din[119:112]});
(* dont_touch = "true" *)wire [8:0] din_15 = $signed({1'b0,din[127:120]});

(* dont_touch = "true" *)wire [7:0] win0_00 = win0[  7:  0];
(* dont_touch = "true" *)wire [7:0] win0_01 = win0[ 15:  8];
(* dont_touch = "true" *)wire [7:0] win0_02 = win0[ 23: 16];
(* dont_touch = "true" *)wire [7:0] win0_03 = win0[ 31: 24];
(* dont_touch = "true" *)wire [7:0] win0_04 = win0[ 39: 32];
(* dont_touch = "true" *)wire [7:0] win0_05 = win0[ 47: 40];
(* dont_touch = "true" *)wire [7:0] win0_06 = win0[ 55: 48];
(* dont_touch = "true" *)wire [7:0] win0_07 = win0[ 63: 56];
(* dont_touch = "true" *)wire [7:0] win0_08 = win0[ 71: 64];
(* dont_touch = "true" *)wire [7:0] win0_09 = win0[ 79: 72];
(* dont_touch = "true" *)wire [7:0] win0_10 = win0[ 87: 80];
(* dont_touch = "true" *)wire [7:0] win0_11 = win0[ 95: 88];
(* dont_touch = "true" *)wire [7:0] win0_12 = win0[103: 96];
(* dont_touch = "true" *)wire [7:0] win0_13 = win0[111:104];
(* dont_touch = "true" *)wire [7:0] win0_14 = win0[119:112];
(* dont_touch = "true" *)wire [7:0] win0_15 = win0[127:120];

(* dont_touch = "true" *)wire [7:0] win1_00 = win1[  7:  0];
(* dont_touch = "true" *)wire [7:0] win1_01 = win1[ 15:  8];
(* dont_touch = "true" *)wire [7:0] win1_02 = win1[ 23: 16];
(* dont_touch = "true" *)wire [7:0] win1_03 = win1[ 31: 24];
(* dont_touch = "true" *)wire [7:0] win1_04 = win1[ 39: 32];
(* dont_touch = "true" *)wire [7:0] win1_05 = win1[ 47: 40];
(* dont_touch = "true" *)wire [7:0] win1_06 = win1[ 55: 48];
(* dont_touch = "true" *)wire [7:0] win1_07 = win1[ 63: 56];
(* dont_touch = "true" *)wire [7:0] win1_08 = win1[ 71: 64];
(* dont_touch = "true" *)wire [7:0] win1_09 = win1[ 79: 72];
(* dont_touch = "true" *)wire [7:0] win1_10 = win1[ 87: 80];
(* dont_touch = "true" *)wire [7:0] win1_11 = win1[ 95: 88];
(* dont_touch = "true" *)wire [7:0] win1_12 = win1[103: 96];
(* dont_touch = "true" *)wire [7:0] win1_13 = win1[111:104];
(* dont_touch = "true" *)wire [7:0] win1_14 = win1[119:112];
(* dont_touch = "true" *)wire [7:0] win1_15 = win1[127:120];
//-------------------------------------------------
//Delays
//-------------------------------------------------
always@(posedge clk, negedge rstn) begin
	if(!rstn) begin
		vld_i_d1 <= 0;
		vld_i_d2 <= 0;
		vld_i_d3 <= 0;
		vld_i_d4 <= 0;
	end
	else begin 
		vld_i_d1 <= vld_i   ;
		vld_i_d2 <= vld_i_d1;
		vld_i_d3 <= vld_i_d2;
		vld_i_d4 <= vld_i_d3;	
	end
end
//-------------------------------------------------
// Format inputs
//-------------------------------------------------
dsp_wrapper u_dsp_wrapper_00(
./*input 		*/clk(clk),
./*input 		*/rstn(rstn),
./*input [ 7:0] */weight0(  win0_00),
./*input [ 7:0] */weight1(  win1_00),
./*input [ 8:0] */data_i(    din_00),	//data_i[8]: 0 -> unsigned data_i[7:0], 1 -> Signed data_i[7:0]
./*output[17:0] */mult_out0(mul0_00),
./*output[17:0] */mult_out1(mul1_00)
);

dsp_wrapper u_dsp_wrapper_01(
./*input 		*/clk(clk),
./*input 		*/rstn(rstn),
./*input [ 7:0] */weight0(  win0_01),
./*input [ 7:0] */weight1(  win1_01),
./*input [ 8:0] */data_i(    din_01),	//data_i[8]: 0 -> unsigned data_i[7:0], 1 -> Signed data_i[7:0]
./*output[17:0] */mult_out0(mul0_01),
./*output[17:0] */mult_out1(mul1_01)
);

dsp_wrapper u_dsp_wrapper_02(
./*input 		*/clk(clk),
./*input 		*/rstn(rstn),
./*input [ 7:0] */weight0(  win0_02),
./*input [ 7:0] */weight1(  win1_02),
./*input [ 8:0] */data_i(    din_02),	//data_i[8]: 0 -> unsigned data_i[7:0], 1 -> Signed data_i[7:0]
./*output[17:0] */mult_out0(mul0_02),
./*output[17:0] */mult_out1(mul1_02)
);

dsp_wrapper u_dsp_wrapper_03(
./*input 		*/clk(clk),
./*input 		*/rstn(rstn),
./*input [ 7:0] */weight0(  win0_03),
./*input [ 7:0] */weight1(  win1_03),
./*input [ 8:0] */data_i(    din_03),	//data_i[8]: 0 -> unsigned data_i[7:0], 1 -> Signed data_i[7:0]
./*output[17:0] */mult_out0(mul0_03),
./*output[17:0] */mult_out1(mul1_03)
);

dsp_wrapper u_dsp_wrapper_04(
./*input 		*/clk(clk),
./*input 		*/rstn(rstn),
./*input [ 7:0] */weight0(  win0_04),
./*input [ 7:0] */weight1(  win1_04),
./*input [ 8:0] */data_i(    din_04),	//data_i[8]: 0 -> unsigned data_i[7:0], 1 -> Signed data_i[7:0]
./*output[17:0] */mult_out0(mul0_04),
./*output[17:0] */mult_out1(mul1_04)
);

dsp_wrapper u_dsp_wrapper_05(
./*input 		*/clk(clk),
./*input 		*/rstn(rstn),
./*input [ 7:0] */weight0(  win0_05),
./*input [ 7:0] */weight1(  win1_05),
./*input [ 8:0] */data_i(    din_05),	//data_i[8]: 0 -> unsigned data_i[7:0], 1 -> Signed data_i[7:0]
./*output[17:0] */mult_out0(mul0_05),
./*output[17:0] */mult_out1(mul1_05)
);

dsp_wrapper u_dsp_wrapper_06(
./*input 		*/clk(clk),
./*input 		*/rstn(rstn),
./*input [ 7:0] */weight0(  win0_06),
./*input [ 7:0] */weight1(  win1_06),
./*input [ 8:0] */data_i(    din_06),	//data_i[8]: 0 -> unsigned data_i[7:0], 1 -> Signed data_i[7:0]
./*output[17:0] */mult_out0(mul0_06),
./*output[17:0] */mult_out1(mul1_06)
);

dsp_wrapper u_dsp_wrapper_07(
./*input 		*/clk(clk),
./*input 		*/rstn(rstn),
./*input [ 7:0] */weight0(  win0_07),
./*input [ 7:0] */weight1(  win1_07),
./*input [ 8:0] */data_i(    din_07),	//data_i[8]: 0 -> unsigned data_i[7:0], 1 -> Signed data_i[7:0]
./*output[17:0] */mult_out0(mul0_07),
./*output[17:0] */mult_out1(mul1_07)
);

dsp_wrapper u_dsp_wrapper_08(
./*input 		*/clk(clk),
./*input 		*/rstn(rstn),
./*input [ 7:0] */weight0(  win0_08),
./*input [ 7:0] */weight1(  win1_08),
./*input [ 8:0] */data_i(    din_08),	//data_i[8]: 0 -> unsigned data_i[7:0], 1 -> Signed data_i[7:0]
./*output[17:0] */mult_out0(mul0_08),
./*output[17:0] */mult_out1(mul1_08)
);

dsp_wrapper u_dsp_wrapper_09(
./*input 		*/clk(clk),
./*input 		*/rstn(rstn),
./*input [ 7:0] */weight0(  win0_09),
./*input [ 7:0] */weight1(  win1_09),
./*input [ 8:0] */data_i(    din_09),	//data_i[8]: 0 -> unsigned data_i[7:0], 1 -> Signed data_i[7:0]
./*output[17:0] */mult_out0(mul0_09),
./*output[17:0] */mult_out1(mul1_09)
);

dsp_wrapper u_dsp_wrapper_10(
./*input 		*/clk(clk),
./*input 		*/rstn(rstn),
./*input [ 7:0] */weight0(  win0_10),
./*input [ 7:0] */weight1(  win1_10),
./*input [ 8:0] */data_i(    din_10),	//data_i[8]: 0 -> unsigned data_i[7:0], 1 -> Signed data_i[7:0]
./*output[17:0] */mult_out0(mul0_10),
./*output[17:0] */mult_out1(mul1_10)
);

dsp_wrapper u_dsp_wrapper_11(
./*input 		*/clk(clk),
./*input 		*/rstn(rstn),
./*input [ 7:0] */weight0(  win0_11),
./*input [ 7:0] */weight1(  win1_11),
./*input [ 8:0] */data_i(    din_11),	//data_i[8]: 0 -> unsigned data_i[7:0], 1 -> Signed data_i[7:0]
./*output[17:0] */mult_out0(mul0_11),
./*output[17:0] */mult_out1(mul1_11)
);

dsp_wrapper u_dsp_wrapper_12(
./*input 		*/clk(clk),
./*input 		*/rstn(rstn),
./*input [ 7:0] */weight0(  win0_12),
./*input [ 7:0] */weight1(  win1_12),
./*input [ 8:0] */data_i(    din_12),	//data_i[8]: 0 -> unsigned data_i[7:0], 1 -> Signed data_i[7:0]
./*output[17:0] */mult_out0(mul0_12),
./*output[17:0] */mult_out1(mul1_12)
);

dsp_wrapper u_dsp_wrapper_13(
./*input 		*/clk(clk),
./*input 		*/rstn(rstn),
./*input [ 7:0] */weight0(  win0_13),
./*input [ 7:0] */weight1(  win1_13),
./*input [ 8:0] */data_i(    din_13),	//data_i[8]: 0 -> unsigned data_i[7:0], 1 -> Signed data_i[7:0]
./*output[17:0] */mult_out0(mul0_13),
./*output[17:0] */mult_out1(mul1_13)
);

dsp_wrapper u_dsp_wrapper_14(
./*input 		*/clk(clk),
./*input 		*/rstn(rstn),
./*input [ 7:0] */weight0(  win0_14),
./*input [ 7:0] */weight1(  win1_14),
./*input [ 8:0] */data_i(    din_14),	//data_i[8]: 0 -> unsigned data_i[7:0], 1 -> Signed data_i[7:0]
./*output[17:0] */mult_out0(mul0_14),
./*output[17:0] */mult_out1(mul1_14)
);

dsp_wrapper u_dsp_wrapper_15(
./*input 		*/clk(clk),
./*input 		*/rstn(rstn),
./*input [ 7:0] */weight0(  win0_15),
./*input [ 7:0] */weight1(  win1_15),
./*input [ 8:0] */data_i(    din_15),	//data_i[8]: 0 -> unsigned data_i[7:0], 1 -> Signed data_i[7:0]
./*output[17:0] */mult_out0(mul0_15),
./*output[17:0] */mult_out1(mul1_15)
);
//-------------------------------------------------
// Components: Reduction Tree
// TODO: Change to DSP
//-------------------------------------------------

reduction_tree u_reduction_tree_0(
./*input 		*/clk(clk), 
./*input 		*/rstn(rstn),
./*input 		*/vld_i(vld_i_d3),
./*input [17:0] */mul_00(mul0_00), 
./*input [17:0] */mul_01(mul0_01), 
./*input [17:0] */mul_02(mul0_02), 
./*input [17:0] */mul_03(mul0_03), 
./*input [17:0] */mul_04(mul0_04), 
./*input [17:0] */mul_05(mul0_05), 
./*input [17:0] */mul_06(mul0_06), 
./*input [17:0] */mul_07(mul0_07),
./*input [17:0] */mul_08(mul0_08), 
./*input [17:0] */mul_09(mul0_09), 
./*input [17:0] */mul_10(mul0_10), 
./*input [17:0] */mul_11(mul0_11),
./*input [17:0] */mul_12(mul0_12), 
./*input [17:0] */mul_13(mul0_13), 
./*input [17:0] */mul_14(mul0_14), 
./*input [17:0] */mul_15(mul0_15),
./*output[21:0] */acc_o(acc_out0),
./*output       */vld_o(vld_out0) 
);

reduction_tree u_reduction_tree_1(
./*input 		*/clk(clk), 
./*input 		*/rstn(rstn),
./*input 		*/vld_i(vld_i_d3),
./*input [17:0] */mul_00(mul1_00), 
./*input [17:0] */mul_01(mul1_01), 
./*input [17:0] */mul_02(mul1_02), 
./*input [17:0] */mul_03(mul1_03), 
./*input [17:0] */mul_04(mul1_04), 
./*input [17:0] */mul_05(mul1_05), 
./*input [17:0] */mul_06(mul1_06), 
./*input [17:0] */mul_07(mul1_07),
./*input [17:0] */mul_08(mul1_08), 
./*input [17:0] */mul_09(mul1_09), 
./*input [17:0] */mul_10(mul1_10), 
./*input [17:0] */mul_11(mul1_11),
./*input [17:0] */mul_12(mul1_12), 
./*input [17:0] */mul_13(mul1_13), 
./*input [17:0] */mul_14(mul1_14), 
./*input [17:0] */mul_15(mul1_15),
./*output[21:0] */acc_o(acc_out1),
./*output       */vld_o(vld_out1) 
);
endmodule 

module reduction_tree(
input clk, 
input rstn,
input vld_i,
input [17:0] mul_00, 
input [17:0] mul_01, 
input [17:0] mul_02, 
input [17:0] mul_03, 
input [17:0] mul_04, 
input [17:0] mul_05, 
input [17:0] mul_06, 
input [17:0] mul_07,
input [17:0] mul_08, 
input [17:0] mul_09, 
input [17:0] mul_10, 
input [17:0] mul_11,
input [17:0] mul_12, 
input [17:0] mul_13, 
input [17:0] mul_14, 
input [17:0] mul_15,
output[21:0] acc_o,
output       vld_o 
);

// Level 1
(* dont_touch = "true" *)reg [18:0] y1_0;
(* dont_touch = "true" *)reg [18:0] y1_1;
(* dont_touch = "true" *)reg [18:0] y1_2;
(* dont_touch = "true" *)reg [18:0] y1_3;
(* dont_touch = "true" *)reg [18:0] y1_4;
(* dont_touch = "true" *)reg [18:0] y1_5;
(* dont_touch = "true" *)reg [18:0] y1_6;
(* dont_touch = "true" *)reg [18:0] y1_7;
// Level 2
(* dont_touch = "true" *)reg [19:0] y2_0;
(* dont_touch = "true" *)reg [19:0] y2_1;
(* dont_touch = "true" *)reg [19:0] y2_2;
(* dont_touch = "true" *)reg [19:0] y2_3;
// Level 3
(* dont_touch = "true" *)reg [20:0] y3_0;
(* dont_touch = "true" *)reg [20:0] y3_1;
// Level 4
(* dont_touch = "true" *)reg [21:0] y4;
// Delays
(* dont_touch = "true" *)reg vld_i_d1, vld_i_d2, vld_i_d3, vld_i_d4;
//-------------------------------------------------
// Reduction tree
//-------------------------------------------------
always@(posedge clk, negedge rstn) begin
	if(!rstn) begin
		vld_i_d1 <= 0;
		vld_i_d2 <= 0;
		vld_i_d3 <= 0;
		vld_i_d4 <= 0;
	end
	else begin 
		vld_i_d1 <= vld_i   ;
		vld_i_d2 <= vld_i_d1;
		vld_i_d3 <= vld_i_d2;
		vld_i_d4 <= vld_i_d3;	
	end
end
// Level 1
always@(posedge clk, negedge rstn) begin
	if(!rstn) begin
		y1_0 <= 19'd0;
		y1_1 <= 19'd0;
		y1_2 <= 19'd0;
		y1_3 <= 19'd0;
		y1_4 <= 19'd0;
		y1_5 <= 19'd0;
		y1_6 <= 19'd0;
		y1_7 <= 19'd0;	
	end
	else begin 
		y1_0 <= $signed(mul_00) + $signed(mul_01);
		y1_1 <= $signed(mul_02) + $signed(mul_03);
		y1_2 <= $signed(mul_04) + $signed(mul_05);
		y1_3 <= $signed(mul_06) + $signed(mul_07);
		y1_4 <= $signed(mul_08) + $signed(mul_09);
		y1_5 <= $signed(mul_10) + $signed(mul_11);
		y1_6 <= $signed(mul_12) + $signed(mul_13);
		y1_7 <= $signed(mul_14) + $signed(mul_15);		
	end
end

// Level 2
always@(posedge clk, negedge rstn) begin
	if(!rstn) begin
		y2_0 <= 20'd0;
		y2_1 <= 20'd0;
		y2_2 <= 20'd0;
		y2_3 <= 20'd0;	
	end
	else begin 
		y2_0 <= $signed(y1_0) + $signed(y1_1);
		y2_1 <= $signed(y1_2) + $signed(y1_3);
		y2_2 <= $signed(y1_4) + $signed(y1_5);
		y2_3 <= $signed(y1_6) + $signed(y1_7);	
	end
end

// Level 3
always@(posedge clk, negedge rstn) begin
	if(!rstn) begin
		y3_0 <= 21'd0;
		y3_1 <= 21'd0;
	end
	else begin 
		y3_0 <= $signed(y2_0) + $signed(y2_1);
		y3_1 <= $signed(y2_2) + $signed(y2_3);
	end
end

// Level 4
always@(posedge clk, negedge rstn) begin
	if(!rstn)
		y4 <= 22'd0;
	else
		y4 <= $signed(y3_0) + $signed(y3_1);
end

//Output -- FOR FULL 16 NUMBERS (128 BIT)
/*
assign vld_o = vld_i_d4;
assign acc_o = $signed(y4);
*/


//FOR 4 NUMBERS (32 BIT)
assign vld_o = vld_i_d2;
assign acc_o = $signed(y2_0);


endmodule

