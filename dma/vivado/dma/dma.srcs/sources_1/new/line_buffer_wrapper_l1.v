`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2023 03:21:43 PM
// Design Name: 
// Module Name: line_buffer_wrapper_l1
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


module line_buffer_wrapper_l1#
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
    input line_buf_l1_load,
    input line_buf_l1_output,
    input [7:0] line_buf_l1_rd_addr,
    input [127:0] line_buf_l1_wr_data,
    output [127:0] line_buf_l1_rd_data,
    output [2:0] line_buf_state
);



reg [127:0] tmp_inputs [7:0];
reg [127:0] tmp_write  [7:0];

reg [2:0] cstate;
reg [2:0] cstate_d1;
reg [2:0] cstate_d2;
reg [2:0] nstate;

reg [3:0] receiving_line_cnt;//from 0 to 8
reg [3:0] receiving_line_cnt_d1;
reg [3:0] receiving_line_cnt_d2;
reg [8:0] writing_line_cnt;//from 0 to 256 
reg [5:0] batch_write_cnt;//from 0 to 32

wire [7:0] line_buf_l1_addr;
reg [7:0] line_buf_l1_addr_d;
wire line_buf_l1_ena;

wire [127:0] restructured_data;

wire line_buf_l1_wr_ena;
//wire line_buf_l1_load;


reg latch_done;

always@(posedge clk, negedge rstn)begin
    if(~rstn)begin
        tmp_write[0] <= 128'd0;
        tmp_write[1] <= 128'd0;
        tmp_write[2] <= 128'd0;
        tmp_write[3] <= 128'd0;
        tmp_write[4] <= 128'd0;
        tmp_write[5] <= 128'd0;
        tmp_write[6] <= 128'd0;
        tmp_write[7] <= 128'd0;

        receiving_line_cnt <= 0;
        latch_done <= 0;

        writing_line_cnt <= 0;
    end
    else begin
        if(cstate == ST_IDLE)begin
            receiving_line_cnt <= 0;
            writing_line_cnt <= 0;
            latch_done <= 0;
        end
        if(cstate == ST_RECEIVING)begin
            receiving_line_cnt  <= receiving_line_cnt + 1;
            latch_done <= 0;
        end
        if(cstate == ST_WRITING)begin
            //if receiving line cnt_d2 is not 0, do nothing!
            receiving_line_cnt  <= 0;
            //receiving_line_cnt_d2 <= receiving_line_cnt_d1;
            writing_line_cnt    <= writing_line_cnt + 1;
            latch_done <= 0;
        end
        if(cstate == ST_LATCH)begin
            if(receiving_line_cnt_d2 == 4'd8)begin
                tmp_write[0] <= {tmp_inputs[0][0*32+:32], tmp_inputs[2][0*32+:32], tmp_inputs[4][0*32+:32], tmp_inputs[6][0*32+:32]};
                tmp_write[1] <= {tmp_inputs[0][1*32+:32], tmp_inputs[2][1*32+:32], tmp_inputs[4][1*32+:32], tmp_inputs[6][1*32+:32]};
                tmp_write[2] <= {tmp_inputs[0][2*32+:32], tmp_inputs[2][2*32+:32], tmp_inputs[4][2*32+:32], tmp_inputs[6][2*32+:32]};
                tmp_write[3] <= {tmp_inputs[0][3*32+:32], tmp_inputs[2][3*32+:32], tmp_inputs[4][3*32+:32], tmp_inputs[6][3*32+:32]};
                
                tmp_write[4] <= {tmp_inputs[1][0*32+:32], tmp_inputs[3][0*32+:32], tmp_inputs[5][0*32+:32], tmp_inputs[7][0*32+:32]};
                tmp_write[5] <= {tmp_inputs[1][1*32+:32], tmp_inputs[3][1*32+:32], tmp_inputs[5][1*32+:32], tmp_inputs[7][1*32+:32]};
                tmp_write[6] <= {tmp_inputs[1][2*32+:32], tmp_inputs[3][2*32+:32], tmp_inputs[5][2*32+:32], tmp_inputs[7][2*32+:32]};
                tmp_write[7] <= {tmp_inputs[1][3*32+:32], tmp_inputs[3][3*32+:32], tmp_inputs[5][3*32+:32], tmp_inputs[7][3*32+:32]};

                latch_done <= 1;
            end
        end
    end
end

always@(posedge clk, negedge rstn)begin
    if(~rstn)begin
        tmp_inputs[0] <= 128'd0;
        tmp_inputs[1] <= 128'd0;
        tmp_inputs[2] <= 128'd0;
        tmp_inputs[3] <= 128'd0;
        tmp_inputs[4] <= 128'd0;
        tmp_inputs[5] <= 128'd0;
        tmp_inputs[6] <= 128'd0;
        tmp_inputs[7] <= 128'd0;

        receiving_line_cnt_d1 <= 0;
        receiving_line_cnt_d2 <= 0;
    end
    else begin
        receiving_line_cnt_d1 <= receiving_line_cnt;
        receiving_line_cnt_d2 <= receiving_line_cnt_d1;

        tmp_inputs[receiving_line_cnt_d1] <= line_buf_l1_wr_data;
    end
end

//update cstate
always@(posedge clk, negedge rstn)begin
    if(~rstn)begin
        cstate <= 0;
        //nstate <= 0;
        cstate_d1 <= 0;
        cstate_d2 <= 0;
    end
    else begin
        cstate <= nstate;
        cstate_d1 <= cstate;
        cstate_d2 <= cstate_d1;
    end
end

//??
always@(posedge clk, negedge rstn)begin
    if(~rstn)begin
        line_buf_l1_addr_d <= 0;
    end
    else begin
        line_buf_l1_addr_d <= line_buf_l1_addr;
    end
end


//state diagram
always@(*)begin
    nstate = ST_IDLE;
    case(cstate)
        ST_IDLE : begin
            if(line_buf_l1_load && ena) 
                nstate = ST_RECEIVING;
            else 
                nstate = ST_IDLE;
        end
        ST_RECEIVING : begin
            if(receiving_line_cnt == 4'd7)
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
            if(writing_line_cnt[2:0] == 4'd7)begin
                if(writing_line_cnt[7:0] == 8'd255)
                    nstate = ST_FIN;
                else 
                    nstate = ST_RECEIVING;
            end
            else 
                nstate = ST_WRITING;
        end
        ST_FIN : begin
            if(line_buf_l1_output)
                nstate = ST_SENDING;
            else 
                nstate = ST_FIN;
        end
        ST_SENDING : begin
            if(line_buf_l1_rd_addr == 8'd255)
                nstate = ST_IDLE;
            else
                nstate = ST_SENDING;
        end
        default : nstate = ST_IDLE;
    endcase
end

layer1_line_buffer_128x256 u_line_buf_l1(
    .clka(clk),
    .addra(line_buf_l1_addr),
    .dina(restructured_data),
    .douta(line_buf_l1_rd_data),
    .ena(line_buf_l1_ena),
    .wea(line_buf_l1_wr_ena)
);

assign line_buf_l1_ena = (line_buf_l1_load || line_buf_l1_output);//when ctrl_load_batch or ctrl_data_run
assign line_buf_l1_wr_ena = (cstate == ST_WRITING);
assign line_buf_l1_addr = (cstate != ST_SENDING) ? writing_line_cnt[7:0] : line_buf_l1_rd_addr;

assign line_buf_state = cstate;
assign restructured_data = tmp_write[writing_line_cnt[2:0]];

endmodule
