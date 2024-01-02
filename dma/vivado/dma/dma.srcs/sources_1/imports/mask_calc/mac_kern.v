`include "cnn_accel_h.v"
module mac_kern (
input clk,
input rstn,
input vld_i, 
input vld_i_st, 
input vld_i_ed, 
input [127:0] win0, 
input [127:0] win1, 
input [127:0] din, 
output [26:0] acc_out0,
output [26:0] acc_out1,
output vld_out0,
output vld_out1,
input is_3x3_conv
);

localparam CONV3x3_DELAY 	= 9;
localparam CONV3x3_DELAY_W 	= $clog2(CONV3x3_DELAY);	
// Incoming signals from MACs
(* dont_touch = "true" *)wire[21:0]  sub_acc_out0;	
(* dont_touch = "true" *)wire 		sub_vld_out0;
(* dont_touch = "true" *)wire[21:0]  sub_acc_out1;	
(* dont_touch = "true" *)wire 		sub_vld_out1;
(* dont_touch = "true" *)reg [26:0]  psum0;
(* dont_touch = "true" *)reg [26:0]  psum1;
(* dont_touch = "true" *)reg vld_i_st_d1;
(* dont_touch = "true" *)reg vld_i_st_d2;
(* dont_touch = "true" *)reg vld_i_st_d3;
(* dont_touch = "true" *)reg vld_i_st_d4;
(* dont_touch = "true" *)reg vld_i_st_d5;
(* dont_touch = "true" *)reg vld_i_st_d6;
(* dont_touch = "true" *)reg vld_i_st_d7;
//(* dont_touch = "true" *)reg vld_i_st_d8;
(* dont_touch = "true" *)reg vld_i_ed_d1;
(* dont_touch = "true" *)reg vld_i_ed_d2;
(* dont_touch = "true" *)reg vld_i_ed_d3;
(* dont_touch = "true" *)reg vld_i_ed_d4;
(* dont_touch = "true" *)reg vld_i_ed_d5;
(* dont_touch = "true" *)reg vld_i_ed_d6;
(* dont_touch = "true" *)reg vld_i_ed_d7;
(* dont_touch = "true" *)reg vld_i_ed_d8;
//reg vld_i_ed_d9;
//-------------------------------------------------
// Component: MAC
//-------------------------------------------------
// DUT
mac u_mac(
./*input 			*/clk(clk),
./*input 			*/rstn(rstn),
./*input 			*/vld_i(vld_i), 
./*input [127:0]	*/win0(win0), 
./*input [127:0] 	*/win1(win1), 
./*input [127-1:0] 	*/din(din), 
./*output[21:0] 	*/acc_out0(sub_acc_out0),
./*output reg 		*/vld_out0(sub_vld_out0),
./*output[21:0] 	*/acc_out1(sub_acc_out1),
./*output reg 		*/vld_out1(sub_vld_out1)
);
//-------------------------------------------------
// Accumulation
//-------------------------------------------------
//{{{

wire [26:0] psum0_first_part 	= {(CONV3x3_DELAY_W){sub_acc_out0[21]}};
wire [26:0] psum_add 			= $signed({{(CONV3x3_DELAY_W){sub_acc_out0[21]}},sub_acc_out0[20:0]});
wire [26:0] psum0_second_part 	= sub_acc_out0[20:0];
wire [31:0] win0_short			= win0[31 : 0];
wire [31:0] win1_short 			= win1[31 : 0];
wire [31:0] din_short 			= din[31 : 0];

always@(posedge clk, negedge rstn) begin
	if(!rstn) begin
		psum0 <= 0;
		psum1 <= 0;
	end
	else begin
		if(sub_vld_out0) begin
			if(vld_i_st_d5)
				psum0 <= $signed({{(CONV3x3_DELAY_W){sub_acc_out0[21]}},sub_acc_out0[20:0]});
			else
				psum0 <= $signed(psum0) + $signed({{(CONV3x3_DELAY_W){sub_acc_out0[21]}},sub_acc_out0[20:0]});
		end
		if(sub_vld_out1) begin
			if(vld_i_st_d5)
				psum1 <= $signed({{(CONV3x3_DELAY_W){sub_acc_out1[21]}},sub_acc_out1[20:0]});
			else
				psum1 <= $signed(psum1) + $signed({{(CONV3x3_DELAY_W){sub_acc_out1[21]}},sub_acc_out1[20:0]});
		end		
	end
end

//-------------------------------------------------
//Output and Delay signals
//-------------------------------------------------
always@(posedge clk, negedge rstn) begin
	if(!rstn) begin
		vld_i_st_d1 <= 0;
		vld_i_st_d2 <= 0;	
		vld_i_st_d3 <= 0;
		vld_i_st_d4 <= 0;			
		vld_i_st_d5 <= 0;
		vld_i_st_d6 <= 0;	
		vld_i_st_d7 <= 0;
		//vld_i_st_d8 <= 0;	
		vld_i_ed_d1 <= 0;
		vld_i_ed_d2 <= 0;	
		vld_i_ed_d3 <= 0;
		vld_i_ed_d4 <= 0;			
		vld_i_ed_d5 <= 0;
		vld_i_ed_d6 <= 0;	
		vld_i_ed_d7 <= 0;
		vld_i_ed_d8 <= 0;	
		//vld_i_ed_d9 <= 0;		
	end
	else begin
		vld_i_st_d1 <= vld_i_st   ;
		vld_i_st_d2 <= vld_i_st_d1;	
		vld_i_st_d3 <= vld_i_st_d2;
		vld_i_st_d4 <= vld_i_st_d3;			
		vld_i_st_d5 <= vld_i_st_d4;
		vld_i_st_d6 <= vld_i_st_d5;	
		vld_i_st_d7 <= vld_i_st_d6;
		//vld_i_st_d8 <= vld_i_st_d7;	
		vld_i_ed_d1 <= vld_i_ed   ;
		vld_i_ed_d2 <= vld_i_ed_d1;	
		vld_i_ed_d3 <= vld_i_ed_d2;
		vld_i_ed_d4 <= vld_i_ed_d3;			
		vld_i_ed_d5 <= vld_i_ed_d4;
		vld_i_ed_d6 <= vld_i_ed_d5;	
		vld_i_ed_d7 <= vld_i_ed_d6;
		vld_i_ed_d8 <= vld_i_ed_d7;		
		//vld_i_ed_d9 <= vld_i_ed_d8;	
	end
end
assign acc_out0 = $signed(psum0);
assign acc_out1 = $signed(psum1);
assign vld_out0 = (is_3x3_conv) ? vld_i_ed_d6 : vld_i_ed_d6;
assign vld_out1 = (is_3x3_conv) ? vld_i_ed_d6 : vld_i_ed_d6;
endmodule


