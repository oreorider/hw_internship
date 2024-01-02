module reg_fifo(
	clk,
	rstn,
	srst,
	wdata,
	wren,
	wrdy,
	rdata,
	rden,
	rrdy,
	cnt
);

	parameter		DATA_WIDTH = 32;
    parameter       DEPTH = 256;
        localparam W_DEPTH = $clog2(DEPTH);
	input			clk;
	input			rstn;
	input			srst;
	input [DATA_WIDTH-1:0]		wdata;
	input			wren;
	output			wrdy;
	//output	reg [DATA_WIDTH-1:0]	rdata;
	output	[DATA_WIDTH-1:0]	rdata;
	input			rden;
	output			rrdy;
	output reg [W_DEPTH-1:0]	cnt;	
   //reg [DATA_WIDTH-1:0] buff [DEPTH-1:0];

	reg		[W_DEPTH-1:0]	waddr, raddr;


	wire			wrdy = (cnt < DEPTH);
	wire			rrdy = (cnt != 0);
    
    always @(posedge clk or negedge rstn) begin
        if(!rstn)
            waddr <= 'h0;
        else if(srst)
            waddr <= 'h0;
        else if(wren) begin
            if(waddr == DEPTH-1)
                waddr <= 'h0;
            else waddr <= waddr + 1;
        end
    end
    
    always @(posedge clk or negedge rstn) begin
        if(!rstn)
            raddr <= 'h0;
        else if(srst)
            raddr <= 'h0;
        else if(rden) begin
            if(raddr == DEPTH-1)
                raddr <= 'h0;
            else raddr <= raddr + 1;
        end
    end
    
    always @(posedge clk or negedge rstn) begin
        if(!rstn)
            cnt <= 'h0;
        else if(srst)
            cnt <= 'h0;
        else cnt <= cnt + wren - rden;
    end


dual_port_block_ram #(.W_DATA(DATA_WIDTH), .W_CELL(W_DEPTH),.N_CELL(DEPTH))
u_bram_fifo(
   .clk   (clk  ),
   .ena   (wren	),
   .wea   (wren	),
   .addra (waddr), 
   .enb   (rden	),	
   .addrb (raddr), 
   .dia   (wdata), 
   .dob   (rdata)   
);	
endmodule
