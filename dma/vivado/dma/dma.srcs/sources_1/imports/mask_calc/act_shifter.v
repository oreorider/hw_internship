`timescale 1ns/1ps
// Activation Shifter
module act_shifter(
    d_in,
    n_shift,
    d_out
    );

// Parameter declarations
    parameter DATA_BITS = 32;
    parameter SHIFT_W = 4;

// Port declarations
    input [DATA_BITS-1:0] d_in;
    input [SHIFT_W-1:0] n_shift;
    output [DATA_BITS-1:0] d_out;

// Internel port declarations
    reg [DATA_BITS-1:0] d_out_r;
//-------------------------------------------------
// Main body
//-------------------------------------------------
// NOTE: Use a barrel shifter for further optimization
    always @*
    begin
		if(d_in[DATA_BITS-1]) begin
			case (n_shift)
				'd0 : d_out_r = d_in;
				'd1 : d_out_r = {{ 1{1'b1}}, d_in[DATA_BITS-1: 1]} + d_in[ 0];
				'd2 : d_out_r = {{ 2{1'b1}}, d_in[DATA_BITS-1: 2]} + d_in[ 1];
				'd3 : d_out_r = {{ 3{1'b1}}, d_in[DATA_BITS-1: 3]} + d_in[ 2];
				'd4 : d_out_r = {{ 4{1'b1}}, d_in[DATA_BITS-1: 4]} + d_in[ 3];
				'd5 : d_out_r = {{ 5{1'b1}}, d_in[DATA_BITS-1: 5]} + d_in[ 4];
				'd6 : d_out_r = {{ 6{1'b1}}, d_in[DATA_BITS-1: 6]} + d_in[ 5];
				'd7 : d_out_r = {{ 7{1'b1}}, d_in[DATA_BITS-1: 7]} + d_in[ 6];
				'd8 : d_out_r = {{ 8{1'b1}}, d_in[DATA_BITS-1: 8]} + d_in[ 7];
				'd9 : d_out_r = {{ 9{1'b1}}, d_in[DATA_BITS-1: 9]} + d_in[ 8];
				'd10: d_out_r = {{10{1'b1}}, d_in[DATA_BITS-1:10]} + d_in[ 9];
				'd11: d_out_r = {{11{1'b1}}, d_in[DATA_BITS-1:11]} + d_in[10];
				'd12: d_out_r = {{12{1'b1}}, d_in[DATA_BITS-1:12]} + d_in[11];
				'd13: d_out_r = {{13{1'b1}}, d_in[DATA_BITS-1:13]} + d_in[12];
				'd14: d_out_r = {{14{1'b1}}, d_in[DATA_BITS-1:14]} + d_in[13];
				'd15: d_out_r = {{15{1'b1}}, d_in[DATA_BITS-1:15]} + d_in[14];			
				default: d_out_r = 'h0;
			endcase
		end
		else begin
			case (n_shift)
				'd0 : d_out_r = d_in;
				'd1 : d_out_r = {{ 1{1'b0}}, d_in[DATA_BITS-1: 1]} + d_in[ 0];
				'd2 : d_out_r = {{ 2{1'b0}}, d_in[DATA_BITS-1: 2]} + d_in[ 1];
				'd3 : d_out_r = {{ 3{1'b0}}, d_in[DATA_BITS-1: 3]} + d_in[ 2];
				'd4 : d_out_r = {{ 4{1'b0}}, d_in[DATA_BITS-1: 4]} + d_in[ 3];
				'd5 : d_out_r = {{ 5{1'b0}}, d_in[DATA_BITS-1: 5]} + d_in[ 4];
				'd6 : d_out_r = {{ 6{1'b0}}, d_in[DATA_BITS-1: 6]} + d_in[ 5];
				'd7 : d_out_r = {{ 7{1'b0}}, d_in[DATA_BITS-1: 7]} + d_in[ 6];
				'd8 : d_out_r = {{ 8{1'b0}}, d_in[DATA_BITS-1: 8]} + d_in[ 7];
				'd9 : d_out_r = {{ 9{1'b0}}, d_in[DATA_BITS-1: 9]} + d_in[ 8];
				'd10: d_out_r = {{10{1'b0}}, d_in[DATA_BITS-1:10]} + d_in[ 9];
				'd11: d_out_r = {{11{1'b0}}, d_in[DATA_BITS-1:11]} + d_in[10];
				'd12: d_out_r = {{12{1'b0}}, d_in[DATA_BITS-1:12]} + d_in[11];
				'd13: d_out_r = {{13{1'b0}}, d_in[DATA_BITS-1:13]} + d_in[12];
				'd14: d_out_r = {{14{1'b0}}, d_in[DATA_BITS-1:14]} + d_in[13];
				'd15: d_out_r = {{15{1'b0}}, d_in[DATA_BITS-1:15]} + d_in[14];			
				default: d_out_r = 'h0;
			endcase
		
		end
    end

    assign d_out = d_out_r;

endmodule