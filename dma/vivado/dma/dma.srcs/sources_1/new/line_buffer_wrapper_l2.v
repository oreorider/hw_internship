`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2023 10:47:03 PM
// Design Name: 
// Module Name: line_buffer_wrapper_l2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module line_buffer_wrapper_l2#
(
    parameter ST_IDLE           = 0,
    parameter ST_RECEIVING      = 1,
    parameter ST_LATCH          = 2,
    parameter ST_WRITING        = 3,
    parameter ST_FIN            = 4,
    parameter ST_SENDING        = 5
)
(
    input clk,
    input rstn,
    input ena,
    input line_buf_l2_load,
    input line_buf_l2_output,
    input line_buf_l2_skip,
    input [4:0] line_buf_l2_rd_addr,
    input [127:0] line_buf_l2_wr_data,
    output [191:0] line_buf_l2_0_rd_data,
    output [191:0] line_buf_l2_1_rd_data,
    output [191:0] line_buf_l2_2_rd_data,
    output is_receiving_state,
    output reg latch_done,
    output is_finished_state
);

reg [127:0] tmp_inputs [2:0];
reg [191:0] tmp_write;

reg [5:0] receiving_col_cnt;//from 0 to 3
wire writing_done;
reg [7:0] writing_line_cnt;//from 0 to 96
reg [7:0] writing_line_cnt_adv;

reg [2:0] cstate;
reg [2:0] nstate;

always@(posedge clk, negedge rstn)begin
    if(~rstn)begin
        cstate <= 0;
        //nstate <= 0;
    end
    else begin
        cstate <= nstate;
    end
end

always@(*)begin
    nstate = 0;
    case(cstate)
        ST_IDLE : begin
            if(line_buf_l2_load && ena)
                nstate = ST_RECEIVING;
            else if(line_buf_l2_skip && ena)
                nstate = ST_SENDING;
            else   
                nstate = ST_IDLE;
        end
        ST_RECEIVING : begin
            if(receiving_col_cnt == 'd2)
                nstate = ST_LATCH;
            else 
                nstate = ST_RECEIVING;
        end
        ST_LATCH : begin
            if(latch_done)
                nstate = ST_WRITING;
            else
                nstate = ST_LATCH;
        end
        ST_WRITING : begin
            if(writing_line_cnt[6:0] == 7'd95)
                nstate = ST_FIN;
            else   
                nstate = ST_RECEIVING;
        end
        ST_FIN : begin
            if(line_buf_l2_output)
                nstate = ST_SENDING;
            else   
                nstate = ST_FIN;
        end
        ST_SENDING : begin
            if(line_buf_l2_rd_addr == 5'd31)
                nstate = ST_IDLE;
            else
                nstate = ST_SENDING;
        end
        default : nstate = ST_IDLE;
    endcase
end

reg is_last_batch_col;
reg is_first_batch_col;
reg [5:0] receiving_col_cnt_d1;
reg [5:0] receiving_col_cnt_d2;
reg [191:0] zeroth_batch;
wire zeroth_batch_write;

reg [2:0] c_state_ff;
reg [2:0] c_state_ff2;

always@(posedge clk, negedge rstn)begin
    if(~rstn)begin
        c_state_ff <= 0;
        c_state_ff2 <= 0;           
    end
    else begin
        c_state_ff <= cstate;
        c_state_ff2 <= c_state_ff;
    end
end

assign zeroth_batch_write = (c_state_ff2 != ST_FIN) && (c_state_ff == ST_FIN);

always@(posedge clk, negedge rstn)begin
    if(~rstn)begin
        tmp_write <= 192'b0;
        receiving_col_cnt <= 0;
        writing_line_cnt <= 0;
        latch_done <= 0;
        is_last_batch_col <= 0;
        is_first_batch_col <= 0;
        zeroth_batch <= 192'b0;
    end
    else begin
        if(cstate == ST_IDLE)begin
            receiving_col_cnt <= 0;
            writing_line_cnt <= 0;
            latch_done <= 0;
            tmp_write <= 0;
        end
        if(cstate == ST_RECEIVING)begin
            receiving_col_cnt <= receiving_col_cnt + 1;
            latch_done <= 0;
        end
        if(cstate == ST_WRITING)begin
            receiving_col_cnt <= 0;
            writing_line_cnt <= writing_line_cnt + 1;
            latch_done <= 0;
        end
        if(cstate == ST_LATCH)begin
            if(receiving_col_cnt_d1 == 'd3)begin
                if(writing_line_cnt[4:0] == 5'd30)begin//last col batch
                    is_last_batch_col <= 1;
                    is_first_batch_col <= 0;
                    tmp_write[0  +:32 ] <= tmp_inputs[0][96+:32];
                    tmp_write[32 +:128] <= tmp_inputs[1];
                    tmp_write[160+:32 ] <= 32'b0;
                end
                else if(writing_line_cnt[4:0] == 5'd31)begin//first col batch
                    is_last_batch_col <= 0;
                    is_first_batch_col <= 1;
                    tmp_write[0  +:32 ] <= 32'd0;
                    tmp_write[32 +:128] <= tmp_inputs[1];
                    tmp_write[160+:32 ] <= tmp_inputs[2][0+:32];
                end
                else begin
                    is_last_batch_col <= 0;
                    is_first_batch_col <= 0;
                    if(writing_line_cnt == 0)begin
                        zeroth_batch[0+:32] <= 32'd0;
                        zeroth_batch[32 +: 128] <= tmp_inputs[0];
                        zeroth_batch[160+: 32 ] <= tmp_inputs[1][0+:32];
                    end
                    tmp_write[0  +:32 ] <= tmp_inputs[0][96+:32];
                    tmp_write[32 +:128] <= tmp_inputs[1];
                    tmp_write[160+:32 ] <= tmp_inputs[2][0+:32];
                end

                latch_done <= 1;
            end
        end
    end
end

always@(posedge clk, negedge rstn)begin
    if(~rstn)begin
        tmp_inputs[0] <= 128'b0;
        tmp_inputs[1] <= 128'b0;
        tmp_inputs[2] <= 128'b0;

        receiving_col_cnt_d1 <= 0;
        receiving_col_cnt_d2 <= 0;
    end
    else begin
        receiving_col_cnt_d1 <= receiving_col_cnt;
        receiving_col_cnt_d2 <= receiving_col_cnt_d1;

        tmp_inputs[receiving_col_cnt_d1] <= line_buf_l2_wr_data;
    end
end

wire [4:0] line_buf_l2_0_addr;
wire line_buf_l2_0_ena;
wire line_buf_l2_0_wr_ena;

wire [4:0] line_buf_l2_1_addr;
wire line_buf_l2_1_ena;
wire line_buf_l2_1_wr_ena;

wire [4:0] line_buf_l2_2_addr;
wire line_buf_l2_2_ena;
wire line_buf_l2_2_wr_ena;

wire [191:0] restructured_data;

//enable for write or read
//assign line_buf_l2_0_ena = (line_buf_l2_load && writing_line_cnt >=  0 && writing_line_cnt < 32) || (line_buf_l2_output);
//assign line_buf_l2_1_ena = (line_buf_l2_load && writing_line_cnt >= 32 && writing_line_cnt < 64) || (line_buf_l2_output);
//assign line_buf_l2_2_ena = (line_buf_l2_load && writing_line_cnt >= 64 && writing_line_cnt < 96) || (line_buf_l2_output);
assign line_buf_l2_0_ena =  ((zeroth_batch_write) || 
                            (line_buf_l2_load && writing_line_cnt >=  0 && writing_line_cnt < 31)) || (line_buf_l2_output);
assign line_buf_l2_1_ena =  (line_buf_l2_load && writing_line_cnt >= 31 && writing_line_cnt < 63) || (line_buf_l2_output);
assign line_buf_l2_2_ena =  (line_buf_l2_load && writing_line_cnt >= 63 && writing_line_cnt < 95) || (line_buf_l2_output);

//enable write 
assign line_buf_l2_0_wr_ena =   (zeroth_batch_write ) ||
                                ((cstate == ST_WRITING) && (writing_line_cnt >=  0 && writing_line_cnt < 31));
assign line_buf_l2_1_wr_ena =   (cstate == ST_WRITING) && (writing_line_cnt >= 31 && writing_line_cnt < 63);
assign line_buf_l2_2_wr_ena =   (cstate == ST_WRITING) && (writing_line_cnt >= 63 && writing_line_cnt < 95);

//if loading addr = wr_ena ? write_line_cnt : 0
//if reading addr = rd_addr
assign line_buf_l2_0_addr = (zeroth_batch_write  ) ?    0 :  
                            (cstate != ST_SENDING) ?    (line_buf_l2_0_wr_ena ? writing_line_cnt+1 : line_buf_l2_rd_addr) :
                                                        (line_buf_l2_rd_addr);
assign line_buf_l2_1_addr = (cstate != ST_SENDING) ?    (line_buf_l2_1_wr_ena ? writing_line_cnt+1 : line_buf_l2_rd_addr) :
                                                        (line_buf_l2_rd_addr);
assign line_buf_l2_2_addr = (cstate != ST_SENDING) ?    (line_buf_l2_2_wr_ena ? writing_line_cnt+1 : line_buf_l2_rd_addr) :
                                                        (line_buf_l2_rd_addr);                                                        

assign restructured_data = (zeroth_batch_write) ? zeroth_batch : tmp_write;

assign is_receiving_state = (cstate == ST_RECEIVING);

assign is_finished_state = (cstate == ST_FIN);

layer2_line_buffer_192x32 u_line_buf_l2_0(
    .clka(clk),
    .addra(line_buf_l2_0_addr),
    .dina(restructured_data),
    .douta(line_buf_l2_0_rd_data),
    .ena(line_buf_l2_0_ena),
    .wea(line_buf_l2_0_wr_ena)
);

layer2_line_buffer_192x32 u_line_buf_l2_1(
    .clka(clk),
    .addra(line_buf_l2_1_addr),
    .dina(restructured_data),
    .douta(line_buf_l2_1_rd_data),
    .ena(line_buf_l2_1_ena),
    .wea(line_buf_l2_1_wr_ena)
);

layer2_line_buffer_192x32 u_line_buf_l2_2(
    .clka(clk),
    .addra(line_buf_l2_2_addr),
    .dina(restructured_data),
    .douta(line_buf_l2_2_rd_data),
    .ena(line_buf_l2_2_ena),
    .wea(line_buf_l2_2_wr_ena)
);



endmodule
