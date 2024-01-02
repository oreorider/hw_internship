module conv_kern_wrapper_mask #(parameter To = 4)(
input 				clk,
input 				rstn,
input 				is_last_layer,
input [To*16-1:0] 	scale,
input [To*16-1:0] 	bias,
input [ 3:0] 		act_shift,
input [ 4:0] 		bias_shift,
input 				vld_i,
input 				vld_i_st, 
input 				vld_i_ed, 
input [To*128-1:0] 	win,
input [   127:0] 	din, 
output[16*8-1:0] 	acc_o,
output[16-1:0] 		vld_o,
input				is_3x3_conv
);

reg [To-1:0]    conv_kern_vld_o;
reg [To*8-1:0]   conv_kern_acc_o;

wire [31:0] win0 = win[0*128+:32];
wire [31:0] win1 = win[1*128+:32];
wire [31:0] win2 = win[2*128+:32];
wire [31:0] win3 = win[3*128+:32];

wire [31:0] din0 = din[0 +: 32];
wire [31:0] din1 = din[32 +: 32];
wire [31:0] din2 = din[64 +: 32];
wire [31:0] din3 = din[96 +: 32];

wire [15:0] bias0 = bias[0*16+:16];
wire [15:0] bias1 = bias[1*16+:16];
wire [15:0] bias2 = bias[2*16+:16];
wire [15:0] bias3 = bias[3*16+:16];

wire [15:0] scale0 = scale[0*16+:16];
wire [15:0] scale1 = scale[1*16+:16];
wire [15:0] scale2 = scale[2*16+:16];
wire [15:0] scale3 = scale[3*16+:16];

generate
	genvar j;
	for(j = 0; j<To/2; j=j+1) begin: conv_kern
		conv_kern u_din0_conv_kern(
			.clk			(clk						),
			.rstn			(rstn						),
			.is_last_layer	(is_last_layer				),
			.scale0			(scale[(2*j  )*16+:16]		),
			.scale1			(scale[(2*j+1)*16+:16]		),
			.bias0			(bias [(2*j  )*16+:16]		),
			.bias1			(bias [(2*j+1)*16+:16]		),
			.act_shift		(act_shift					),
			.bias_shift		(bias_shift					),
			.vld_i			(vld_i						), 
			.vld_i_st		(vld_i_st					),
			.vld_i_ed		(vld_i_ed					),
			.win0			(win[(2*j  )*128+:128]		), 
			.win1			(win[(2*j+1)*128+:128]		), 
			.din			({96'b0, din[0 +: 32]}		),	
			.acc_out0		(acc_o[(2*(j+0)  )*8+:8]	),
			.acc_out1		(acc_o[(2*(j+0)+1)*8+:8]	),
			.vld_out0		(vld_o[(2*(j+0)  )]     	),					
			.vld_out1		(vld_o[(2*(j+0)+1)]     	),
			.is_3x3_conv	(is_3x3_conv				)	
		);

		conv_kern u_din1_conv_kern(
			.clk			(clk						),
			.rstn			(rstn						),
			.is_last_layer	(is_last_layer				),
			.scale0			(scale[(2*j  )*16+:16]		),
			.scale1			(scale[(2*j+1)*16+:16]		),
			.bias0			(bias [(2*j  )*16+:16]		),
			.bias1			(bias [(2*j+1)*16+:16]		),
			.act_shift		(act_shift					),
			.bias_shift		(bias_shift					),
			.vld_i			(vld_i						), 
			.vld_i_st		(vld_i_st					),
			.vld_i_ed		(vld_i_ed					),
			.win0			(win[(2*j  )*128+:128]		), 
			.win1			(win[(2*j+1)*128+:128]		), 
			.din			({96'b0, din[32 +: 32]}		),	
			.acc_out0		(acc_o[(2*(j+2)  )*8+:8]	),
			.acc_out1		(acc_o[(2*(j+2)+1)*8+:8]	),
			.vld_out0		(vld_o[(2*(j+2)  )]     	),					
			.vld_out1		(vld_o[(2*(j+2)+1)]     	),
			.is_3x3_conv	(is_3x3_conv				)		
		);

		conv_kern u_din2_conv_kern(
			.clk			(clk						),
			.rstn			(rstn						),
			.is_last_layer	(is_last_layer				),
			.scale0			(scale[(2*j  )*16+:16]		),
			.scale1			(scale[(2*j+1)*16+:16]		),
			.bias0			(bias [(2*j  )*16+:16]		),
			.bias1			(bias [(2*j+1)*16+:16]		),
			.act_shift		(act_shift					),
			.bias_shift		(bias_shift					),
			.vld_i			(vld_i						), 
			.vld_i_st		(vld_i_st					),
			.vld_i_ed		(vld_i_ed					),
			.win0			(win[(2*j  )*128+:128]		), 
			.win1			(win[(2*j+1)*128+:128]		), 
			.din			({96'b0, din[64 +: 32]}		),	
			.acc_out0		(acc_o[(2*(j+4)  )*8+:8]	),
			.acc_out1		(acc_o[(2*(j+4)+1)*8+:8]	),
			.vld_out0		(vld_o[(2*(j+4)  )]     	),					
			.vld_out1		(vld_o[(2*(j+4)+1)]     	),
			.is_3x3_conv	(is_3x3_conv				)		
		);

		conv_kern u_din3_conv_kern(
			.clk			(clk						),
			.rstn			(rstn						),
			.is_last_layer	(is_last_layer				),
			.scale0			(scale[(2*j  )*16+:16]		),
			.scale1			(scale[(2*j+1)*16+:16]		),
			.bias0			(bias [(2*j  )*16+:16]		),
			.bias1			(bias [(2*j+1)*16+:16]		),
			.act_shift		(act_shift					),
			.bias_shift		(bias_shift					),
			.vld_i			(vld_i						), 
			.vld_i_st		(vld_i_st					),
			.vld_i_ed		(vld_i_ed					),
			.win0			(win[(2*j  )*128+:128]		), 
			.win1			(win[(2*j+1)*128+:128]		), 
			.din			({96'b0, din[96 +: 32]}		),	
			.acc_out0		(acc_o[(2*(j+6)  )*8+:8]	),
			.acc_out1		(acc_o[(2*(j+6)+1)*8+:8]	),
			.vld_out0		(vld_o[(2*(j+6)  )]     	),					
			.vld_out1		(vld_o[(2*(j+6)+1)]     	),
			.is_3x3_conv	(is_3x3_conv				)		
		);

		
	end

endgenerate 

/*
conv_kern u_conv_kern1(
	.clk(clk),
	.rstn(rstn),
	.is_last_layer  (is_last_layer          ),
	.scale0         (scale[0+:16]           ),
	.scale1         (scale[16+:16]          ),
	.bias0          (bias[0+:16]            ),
	.bias1          (bias[16+:16]           ),
    .act_shift		(act_shift				),
    .bias_shift		(bias_shift				),
    .vld_i			(vld_i					), 
    .vld_i_st		(vld_i_st				),
    .vld_i_ed		(vld_i_ed				),
    .win0           (win[0+:128]            ),
    .win1           (win[128+:128]          ),
    .din            (din                    ),
    .acc_out0       (acc_o[0+:8]            ),
    .acc_out1       (acc_o[8+:8]            ),
    .vld_out0       (vld_o[0]               ),
    .vld_out1       (vld_o[1]               )
);

conv_kern u_conv_kern2(
    .clk(clk),
	.rstn(rstn),
	.is_last_layer  (is_last_layer          ),
	.scale0         (scale[32+:16]          ),
	.scale1         (scale[48+:16]          ),
	.bias0          (bias[32+:16]           ),
	.bias1          (bias[48+:16]           ),
    .act_shift		(act_shift				),
    .bias_shift		(bias_shift				),
    .vld_i			(vld_i					), 
    .vld_i_st		(vld_i_st				),
    .vld_i_ed		(vld_i_ed				),
    .win0           (win[256+:128]          ),
    .win1           (win[384+:128]          ),
    .din            (din                    ),
    .acc_out0       (acc_o[16+:8]           ),
    .acc_out1       (acc_o[24+:8]           ),
    .vld_out0       (vld_o[2]               ),
    .vld_out1       (vld_o[3]               )
);*/

endmodule
