//-------------------------------------------------
// DSP wrapper: 
// Note: It takes three-cycles delay
//-------------------------------------------------
//`ifdef XILINX_DSP
//`define XILINX_DSP 1
module dsp_wrapper(
input clk,
input rstn,
input [ 7:0] weight0,
input [ 7:0] weight1,
input [ 8:0] data_i,	//data_i[8]: 0 -> unsigned data_i[7:0], 1 -> Signed data_i[7:0]
output[17:0] mult_out0,
output[17:0] mult_out1
);
	// 3 cycles delays
// Internel signal declarations
(* dont_touch = "true" *) wire[8:0] data_i_c;
(* dont_touch = "true" *) reg [7:0] data_d;
(* dont_touch = "true" *) wire[8:0] weight_0, weight_0_c;
(* dont_touch = "true" *) wire[8:0] weight_1, weight_1_c;
(* dont_touch = "true" *) reg [2:0] mult_0_s, mult_1_s;   // sign of mult0
    
    // TODO: DSP Check
(* dont_touch = "true" *) wire [24:0] A1;
(* dont_touch = "true" *) wire [17:0] B1;
(* dont_touch = "true" *) wire [24:0] D1;
(* dont_touch = "true" *) reg  [24:0] PREADD;
`ifdef XILINX_DSP
(* dont_touch = "true" *)wire [31:0] C1;
(* dont_touch = "true" *)wire [31:0] P_POST;
`else
(* dont_touch = "true" *)reg [31:0] C1;
(* dont_touch = "true" *)reg [31:0] P_POST;
`endif
    reg [31:0] P;
    
// Main body of code    
    assign weight_0_c = $signed({weight0, 1'b0}) + 1;
    assign weight_1_c = $signed({weight1, 1'b0}) + 1;

    assign weight_0 = (weight0[7]) ? ~weight_0_c + 1'b1 : weight_0_c;
    assign weight_1 = (weight1[7]) ? ~weight_1_c + 1'b1 : weight_1_c;
    
    assign data_i_c = (data_i[8]) ? ~data_i + 1'b1 : data_i;

    always @(posedge clk) begin
            mult_0_s[0] <= (weight0[7] ^ data_i[8]) && |data_i;
            mult_0_s[1] <= mult_0_s[0];
            mult_0_s[2] <= mult_0_s[1];
        end       
        
    always @(posedge clk) begin
            mult_1_s[0] <= (weight1[7] ^ data_i[8]) && |data_i;
            mult_1_s[1] <= mult_1_s[0];
            mult_1_s[2] <= mult_1_s[1];
        end

// TODO : -2^8 case
    assign A1 = { 1'b0, weight_1[7:0], 16'b0};
    assign D1 = {17'b0, weight_0[7:0]};
    assign B1 = {10'b0, data_i_c[7:0]};     
    
`ifdef XILINX_DSP
//    assign C1 = {{18{mult_0_s}), {18{1'b0}}};
    assign C1 = {15'b0, mult_1_s[0], 15'b0, mult_0_s[0]};
    xbip_dsp48_macro_0 u_dsp (
        .CLK (clk),
        // .SCLR (~rstn),
        .A (A1),
        .D (D1),
        .B (B1),
        .C (C1),
        .P (P_POST)
        );
`else
    always @(posedge clk) begin
        C1 <= {15'b0, mult_1_s[0], 15'b0, mult_0_s[0]}; //{{18{mult_0_s}}, {18{1'b0}}};

        data_d <= {1'b0, data_i_c[7:0]};
        PREADD <= A1 + D1;

        P <= PREADD * data_d;

        P_POST <= P - C1;
    end
`endif

    assign mult_out0 = mult_0_s[2] ? $signed({1'b1, ~P_POST[15: 0]}) : $signed({1'b0, P_POST[15: 0]});
    assign mult_out1 = mult_1_s[2] ? $signed({1'b1, ~P_POST[31:16]}) : $signed({1'b0, P_POST[31:16]});
    
endmodule