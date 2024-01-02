module conv_kern(
input 		  clk,
input 		  rstn,
input 		  is_last_layer,
input [15:0]  scale0,
input [15:0]  scale1,
input [15:0]  bias0,
input [15:0]  bias1,
input [ 3:0]  act_shift,
input [ 4:0]  bias_shift,
input 		  vld_i, 
input 		  vld_i_st,
input 		  vld_i_ed, 
input [127:0] win0,
input [127:0] win1, 
input [127:0] din,
output[  7:0] acc_out0,
output[  7:0] acc_out1,
output        vld_out0,
output        vld_out1,
input         is_3x3_conv
);

parameter DATA_BITS = 27;
wire [26:0] mac_kern_acc_out0;
wire [26:0] mac_kern_acc_out1;
wire mac_kern_vld_out0;
wire mac_kern_vld_out1;

wire [31:0] win0_short = win0[31 : 0];
wire [31:0] win1_short = win1[31 : 0];
wire [31:0] din_short = din[31 : 0];

wire [15:0] input_bias0;
wire [15:0] input_bias1;
wire [15:0] input_scale0;
wire [15:0] input_scale1;

reg [15:0] bias0_d1;
reg [15:0] bias0_d2;
reg [15:0] bias0_d3;
reg [15:0] bias0_d4;
reg [15:0] bias0_d5;
reg [15:0] bias0_d6;

reg [15:0] bias1_d1;
reg [15:0] bias1_d2;
reg [15:0] bias1_d3;
reg [15:0] bias1_d4;
reg [15:0] bias1_d5;
reg [15:0] bias1_d6;

reg [15:0] scale0_d1;
reg [15:0] scale0_d2;
reg [15:0] scale0_d3;
reg [15:0] scale0_d4;
reg [15:0] scale0_d5;
reg [15:0] scale0_d6;

reg [15:0] scale1_d1;
reg [15:0] scale1_d2;
reg [15:0] scale1_d3;
reg [15:0] scale1_d4;
reg [15:0] scale1_d5;
reg [15:0] scale1_d6;

always@(posedge clk)begin
    if(!rstn)begin
        bias0_d1 <= 0;
        bias0_d2 <= 0;
        bias0_d3 <= 0;
        bias0_d4 <= 0;
        bias0_d5 <= 0;
        bias0_d6 <= 0;

        bias1_d1 <= 0;
        bias1_d2 <= 0;
        bias1_d3 <= 0;
        bias1_d4 <= 0;
        bias1_d5 <= 0;
        bias1_d6 <= 0;

        scale0_d1 <= 0;
        scale0_d2 <= 0;
        scale0_d3 <= 0;
        scale0_d4 <= 0;
        scale0_d5 <= 0;
        scale0_d6 <= 0;

        scale1_d1 <= 0;
        scale1_d2 <= 0;
        scale1_d3 <= 0;
        scale1_d4 <= 0;
        scale1_d5 <= 0;
        scale1_d6 <= 0;
    end
    else begin
        bias0_d1 <= bias0;
        bias0_d2 <= bias0_d1;
        bias0_d3 <= bias0_d2;
        bias0_d4 <= bias0_d3;
        bias0_d5 <= bias0_d4;
        bias0_d6 <= bias0_d5;

        bias1_d1 <= bias1;
        bias1_d2 <= bias1_d1;
        bias1_d3 <= bias1_d2;
        bias1_d4 <= bias1_d3;
        bias1_d5 <= bias1_d4;
        bias1_d6 <= bias1_d5;

        scale0_d1 <= scale0;
        scale0_d2 <= scale0_d1;
        scale0_d3 <= scale0_d2;
        scale0_d4 <= scale0_d3;
        scale0_d5 <= scale0_d4;
        scale0_d6 <= scale0_d5;

        scale1_d1 <= scale1;
        scale1_d2 <= scale1_d1;
        scale1_d3 <= scale1_d2;
        scale1_d4 <= scale1_d3;
        scale1_d5 <= scale1_d4;
        scale1_d6 <= scale1_d5;
    end
end

assign input_bias0 = (is_last_layer) ? bias0_d6 : bias0;
assign input_bias1 = (is_last_layer) ? bias1_d6 : bias1;
assign input_scale0 = (is_last_layer) ? scale0_d6 : scale0;
assign input_scale1 = (is_last_layer) ? scale1_d6 : scale1;

//doens't actually matter if i do it like this
//assign input_bias0  = bias0_d6; 
//assign input_bias1  = bias1_d6;
//assign input_scale0 = scale0_d6;
//assign input_scale1 = scale1_d6;


//--------------------------------------------------------
// Component: MAC
//--------------------------------------------------------
// DUT
mac_kern u_mac_kern (
./*input         */clk     (clk              ),
./*input         */rstn    (rstn             ),
./*input         */vld_i   (vld_i            ), 
./*input         */vld_i_st(vld_i_st         ), 
./*input         */vld_i_ed(vld_i_ed         ), 
./*input [127:0] */win0    (win0             ), 
./*input [127:0] */win1    (win1             ), 
./*input [127:0] */din     (din              ), 
./*output [26:0] */acc_out0(mac_kern_acc_out0),
./*output [26:0] */acc_out1(mac_kern_acc_out1),
./*output        */vld_out0(mac_kern_vld_out0),
./*output        */vld_out1(mac_kern_vld_out1),
./*input         */is_3x3_conv(is_3x3_conv)
);
//--------------------------------------------------------
// Component: Batch-normalization, Activation quantization
//--------------------------------------------------------
bnorm_quant_act #(.DATA_BITS(DATA_BITS))
u_bnorm_quant_act_0
(
./*input 				 */clk          (clk              ),
./*input 				 */resetn       (rstn             ),
./*input 				 */is_last_layer(1'b0             ),
./*input [PARAM_BITS-1:0]*/scale        (input_scale0     ),
./*input [PARAM_BITS-1:0]*/bias         (input_bias0      ),
./*input [3:0] 			 */act_shift    (act_shift        ),
./*input [4:0] 			 */bias_shift   (bias_shift       ),
./*input [DATA_BITS-1:0] */accum_in     (mac_kern_acc_out0),
./*input 				 */accum_vld_in (mac_kern_vld_out0),
./*output [ACT_BITS-1:0] */accum_out    (acc_out0         ),
./*output 				 */accum_vld_out(vld_out0         )
);

bnorm_quant_act #(.DATA_BITS(DATA_BITS))
u_bnorm_quant_act_1
(
./*input 				 */clk          (clk              ),
./*input 				 */resetn       (rstn             ),
./*input 				 */is_last_layer(1'b0             ),
./*input [PARAM_BITS-1:0]*/scale        (input_scale1     ),
./*input [PARAM_BITS-1:0]*/bias         (input_bias1      ),
./*input [3:0] 			 */act_shift    (act_shift        ),
./*input [4:0] 			 */bias_shift   (bias_shift       ),
./*input [DATA_BITS-1:0] */accum_in     (mac_kern_acc_out1),
./*input 				 */accum_vld_in (mac_kern_vld_out1),
./*output [ACT_BITS-1:0] */accum_out    (acc_out1         ),
./*output 				 */accum_vld_out(vld_out1         )
);
endmodule

