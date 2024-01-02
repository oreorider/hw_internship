`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2023 04:41:15 PM
// Design Name: 
// Module Name: initialization_tb
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


module initialization_tb;
parameter CLK_PERIOD = 10;
parameter FMAP_FRAME_SIZE = 128 * 128;

reg clk;
reg rstn;
reg start;
reg [4:0] q_current_conv_layer;
wire [1:0] mask_layer;
wire [31:0] frame_done;
wire [127:0] omask_out_pix;//128b outputs
wire omask_out_pix_vld;
wire start_sending;

reg [15:0] ifm_data_addr;
reg [3:0] offset;
reg [31:0] ifm_data_input;
reg ifm_data_input_vld;
reg [0 : FMAP_FRAME_SIZE * 32 - 1] omask_buffer ;
reg [127:0] ifm_data [0:((FMAP_FRAME_SIZE * 32 * 8)/128)-1];
//reg [18 : 0] omask_buffer_idx ;
//reg finished_receiving;

initial begin //make clock
    clk = 0;
    rstn = 0;
    start = 0;
    //start_sending = 0;
    ifm_data_addr = 0;
    offset = 0;
    forever #(CLK_PERIOD/2) clk = !clk;
end

//parameter IFM_FILE = "convout_L3.hex";
parameter IFM_FILE = "C:/intelFPGA/sparsecnn/sparsecnn/out_sw/m3/convout_L2.hex";
initial begin
    $readmemh(IFM_FILE, ifm_data);
end



integer i;
initial begin
    #(CLK_PERIOD * 10 ) rstn = 1;
    #(CLK_PERIOD * 80)
    @ (posedge clk) start = 1; 
    #(CLK_PERIOD) 
    @ (posedge clk) start = 0;
    //start_sending = 1;
end

always@(posedge clk)begin
    if(start_sending && rstn)begin
        ifm_data_input <= ifm_data[ifm_data_addr][offset*32+:32];
        ifm_data_input_vld <= 1;
        if(offset == 'd3) begin
            offset <= 0;
            ifm_data_addr <= ifm_data_addr + 1;
        end
        else begin
            offset <= offset + 1;
        end
    end
    else begin
        ifm_data_input_vld <= 0;
    end
end

assign read_IFM_finished = (ifm_data_addr == 16'd32768) ? 1'b1 : 1'b0;//tells when read is finished
assign start_sending = !read_IFM_finished;
//always@(*)begin
//    if(read_IFM_finished) begin
//        $finish;
//    end
//end


reg [7:0] pix_input;

//read output from mask_maker.v
/*
always@(posedge clk, negedge rstn)begin
    if(!rstn)begin
        omask_buffer        <= 'b0;
        omask_buffer_idx    <= 'd0;
        finished_receiving  <= 'd0;
    end
    else begin
        if(frame_done[0] && omask_out_pix_vld && !finished_receiving)begin
            if(omask_buffer_idx == FMAP_FRAME_SIZE * 32 - 32)begin
                finished_receiving  <= 1'b1;
            end
            else begin
                omask_buffer_idx <= omask_buffer_idx + 32;
            end
            omask_buffer[omask_buffer_idx +: 32]  <= omask_out_pix;
        end
    end
end
*/

mask_maker u_mask_maker(
    .clk(clk),
    .rstn(rstn),
    .conv_out_pix(ifm_data_input), //ifm input pixels
    .conv_out_pix_vld(ifm_data_input_vld),
    .ap_start(start),//tells to start reading paramters from ROM
    .q_current_conv_layer(5'd3),
    .mask_layer(mask_layer),
    .omask_out_pix(omask_out_pix),
    .omask_out_pix_vld(omask_out_pix_vld),
    .maskgen_finished(),
    .last_pix(),
    .o_start()
);


//integer i;
/*
integer fd_binary;
integer fd_char;

initial begin
    fd_binary   = $fopen("C:\\maskgenFPGA\\dfx\\ip\\omap_b.txt", "wb+");
    //fd_char     = $fopen("./out/omap_c.txt", "wb+");
end

//check output received from TB
assign received_pixels = omask_out_pix;

always@(finished_receiving)begin
    if(finished_receiving == 1'b1)begin
        $display("checking output from TB \n");
        for(i = 0; i < FMAP_FRAME_SIZE * 32; i = i + 1)begin
            if(i % 128 == 0 && i != 0)begin
                //$fwrite(fd_char, "\n");
                $fwrite(fd_binary, "\n");
            end  
            //$fwrite(fd_char, "%x", (omask_buffer[i]) ? 8'd255 : 8'b0);
            //$fwrite(fd_char, "%c", (omask_buffer[i]) ? 8'd255 : 8'b0);
            //$fwrite(fd_char, "%c", (omask_buffer[i]) ? 8'd255 : 8'b0); 

            $fwrite(fd_binary, "%x", omask_buffer[i]);  
                 
        end
        $fclose(fd_binary);
        //$fclose(fd_char);
    end
end
*/

endmodule
