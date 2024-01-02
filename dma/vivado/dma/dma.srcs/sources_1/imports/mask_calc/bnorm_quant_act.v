//`include "debug.v"

module bnorm_quant_act(
    clk,
    resetn,
    is_last_layer,
    scale,
    bias,
    act_shift,
    bias_shift,
    accum_in,
    accum_vld_in,
    accum_out,
    accum_vld_out
    );

// Parameter declarations
	parameter PARAM_BITS 	= 16;
	parameter WEIGHT_BITS 	= 8;
	parameter ACT_BITS		= 8;
	parameter DATA_BITS 	= 27;
	localparam N_DELAY = 4;
// Port declarations
    input clk;
    input resetn;
    input is_last_layer;
    input [PARAM_BITS-1:0] scale;
    input [PARAM_BITS-1:0] bias;
    input [3:0] act_shift;
    input [4:0] bias_shift;
    input [DATA_BITS-1:0] accum_in;
    input accum_vld_in;
    output [ACT_BITS-1:0] accum_out;
    output accum_vld_out;

// Internel port declarations
(* dont_touch = "true" *)    reg [N_DELAY-1:0] accum_vld;
(* dont_touch = "true" *) reg [3:0] act_shift_r, act_shift_rr, act_shift_rrr;
(* dont_touch = "true" *) reg [4:0] bias_shift_r, bias_shift_rr, bias_shift_rrr;
(* dont_touch = "true" *) reg [PARAM_BITS:0] scale_r;
//(* dont_touch = "true" *)reg [PARAM_BITS-1:0] scale_r;
(* dont_touch = "true" *) reg [PARAM_BITS-1:0] bias_r;
(* dont_touch = "true" *) reg [PARAM_BITS-1:0] bias_rr;
(* dont_touch = "true" *) reg [DATA_BITS-1:0] accum_in_r;

(* dont_touch = "true" *) reg [DATA_BITS+PARAM_BITS-1:0] acc_mult;
(* dont_touch = "true" *) wire [DATA_BITS-1:0] acc_mult_shift; 
(* dont_touch = "true" *) wire [DATA_BITS-1:0] acc_mean_shift; 
(* dont_touch = "true" *) reg [DATA_BITS-1:0] acc_mean;
(* dont_touch = "true" *) wire signed [DATA_BITS-1:0] acc_quant;   
(* dont_touch = "true" *) wire signed [DATA_BITS-1:0] acc_relu;
(* dont_touch = "true" *) reg signed [ACT_BITS-1:0] accum_relu;
(* dont_touch = "true" *) reg [ACT_BITS-1:0] accum_final;
(* dont_touch = "true" *) reg is_last_layer_d1, is_last_layer_d2, is_last_layer_d3;
//-------------------------------------------------
// Batch normalization
//-------------------------------------------------
    always @(posedge clk)
    begin
        accum_in_r <= accum_in;
        act_shift_r <= act_shift;
		act_shift_rr <= act_shift_r;
		act_shift_rrr <= act_shift_rr;
        bias_shift_r <= bias_shift;
		bias_shift_rr <= bias_shift_r;
		bias_shift_rrr <= bias_shift_rr;
        scale_r <= {1'b0,scale};
        bias_r <= bias;
		bias_rr <= bias_r;
		is_last_layer_d1 <= is_last_layer;
		is_last_layer_d2 <= is_last_layer_d1;
		is_last_layer_d3 <= is_last_layer_d2;
    end
    
    always @(posedge clk)
    begin
        acc_mult <= $signed(accum_in_r) * $signed(scale_r);		
    end
   
//-------------------------------------------------
// Bias shift
//-------------------------------------------------
    bias_shifter #(
        .DATA_BITS (DATA_BITS+PARAM_BITS),
        .SHIFT_W (5),
		.OUT_DATA_BITS(DATA_BITS)
    )
    u_bias_shift (
        .d_in (acc_mult),
        .n_shift (bias_shift_r),
        .d_out (acc_mult_shift)
    );

    always @(posedge clk) begin
        //acc_mean <= $signed(acc_mult_shift) + $signed(bias_r);
		acc_mean <= $signed(acc_mult_shift) + $signed(bias_rr);
    end

//-------------------------------------------------
// Activation Shift
//-------------------------------------------------
    act_shifter #(
        .DATA_BITS (DATA_BITS),
        .SHIFT_W (4)
    )
    u_act_shift (
        .d_in (acc_mean),
		.n_shift(act_shift_rrr),
        //.n_shift(act_shift_r),
        .d_out (acc_mean_shift)
    );

   // RELU
   assign acc_relu = $signed(~acc_mean_shift[DATA_BITS-1] ? acc_mean_shift : 'h0);   
   //assign acc_quant = (~is_last_layer) ? acc_relu :acc_mean_shift; //linear    
   assign acc_quant = (~is_last_layer_d2) ? acc_relu :acc_mean_shift; //linear    
   always @(posedge clk or negedge resetn)
     if(!resetn)  
		accum_relu <= 'h0;
    else begin
		// Clipping
		accum_relu <= (acc_quant > 255) ? 255 : acc_quant[ACT_BITS-1:0];
	end
											   
    // Linear (Last Layer)
    always @(posedge clk or negedge resetn)
        if(!resetn) 
			accum_final <= 'h0;
		else        
            accum_final <= acc_quant; //ver 0

			//accum_final <=  ($signed(acc_quant) < -128) ? -128 : 
            //                ($signed(acc_quant) > 127) ? 127 :
            //                acc_quant;// changed slightly, ver 1

            //accum_final <=  ($signed(acc_quant) < -128) ? -128 : 
            //                ($signed(acc_quant) > 255) ? 255 :
            //                acc_quant;// changed slightly ver 2
//-------------------------------------------------
// Delays and valid signals	
//-------------------------------------------------    
    //assign accum_out = is_last_layer ? accum_final : accum_relu;    
	assign accum_out = is_last_layer_d3 ? accum_final : accum_relu;    
    always @(posedge clk or negedge resetn)
    begin
        if(!resetn) accum_vld <= 'h0;
        else        accum_vld <= {accum_vld[N_DELAY-2:0], accum_vld_in};
    end 
    assign accum_vld_out = accum_vld[N_DELAY-1];

endmodule
