module axi_dma_rd(
    //AXI Master Interface
    //Read address channel
    M_ARVALID,    // address/control valid handshake
    M_ARREADY,    // Read addr ready
    M_ARADDR,     // Address Read 
    M_ARID,       // Read addr ID
    M_ARLEN,      // Transfer length
    M_ARSIZE,     // Transfer width
    M_ARBURST,    // Burst type
    M_ARLOCK,     // Atomic access information
    M_ARCACHE,    // Cachable/bufferable infor
    M_ARPROT,     // Protection info
    M_ARQOS,      // Quality of Service
    M_ARREGION,   // Region signaling
    M_ARUSER,     // User defined signal
 
    //Read data channel
    M_RVALID,     // Read data valid 
    M_RREADY,     // Read data ready (to Slave)
    M_RDATA,      // Read data bus
    M_RLAST,      // Last beat of a burst transfer
    M_RID,        // Read ID
    M_RUSER,      // User defined signal
    M_RRESP,      // Read response
     
    //Functional Ports
    start_dma,
    num_trans, //Number of 128-bit words transferred
    start_addr,
    data_o,
    data_vld_o,
    data_cnt_o,
    done_o,

    //Global signals
    clk, rstn
);
   `include "params.v"
   localparam  SIZE_1B     = 3'b000;
   localparam  SIZE_2B     = 3'b001;
   localparam  SIZE_4B     = 3'b010;
   localparam  SIZE_8B     = 3'b011;
   localparam  SIZE_16B    = 3'b100;      // not supported    
   localparam  SIZE_32B    = 3'b101;      // not supported
   localparam  SIZE_64B    = 3'b110;      // not supported
   localparam  SIZE_128B   = 3'b111;      // not supported

//------------------------------------------------------------------------------
// Port declarations
//------------------------------------------------------------------------------
    //AXI Master Interface
    //Read address channel
    output                      M_ARVALID;  // address/control valid handshake
    input                       M_ARREADY;
    output  [M_AXI_ADDR_WIDTH-1:0]  M_ARADDR;   // Address Read 
    output  [M_AXI_ID_WIDTH-1:0]  M_ARID;     // Read addr ID
    output  [7:0]               M_ARLEN;    // Transfer length
    output  [2:0]               M_ARSIZE;   // Transfer width
    output  [1:0]               M_ARBURST;  // Burst type
    output  [1:0]               M_ARLOCK;   // Atomic access information
    output  [3:0]               M_ARCACHE;  // Cachable/bufferable infor
    output  [2:0]               M_ARPROT;   // Protection info
    output  [3:0]               M_ARQOS;    // Quality of Service
    output  [3:0]               M_ARREGION; // Region signaling
    output  [M_AXI_ARUSER_WIDTH-1:0]M_ARUSER;   // User defined signal
   
    //Read data channel
    input                       M_RVALID;   // Read data valid 
    output                      M_RREADY;   // Read data ready (to Slave)
    input   [M_AXI_DATA_WIDTH-1:0]  M_RDATA;    // Read data bus
    input                       M_RLAST;    // Last beat of a burst transfer
    input   [M_AXI_ID_WIDTH-1:0]  M_RID;      // Read ID
    input   [M_AXI_RUSER_WIDTH-1:0]   M_RUSER;    // User defiend signal
    input   [1:0]               M_RRESP;    // Read response

    //Functional Ports
    input                           start_dma;
    input [BITS_TRANS-1:0]                    num_trans;     //Number of 128-bit words transferred
    input [M_AXI_ADDR_WIDTH-1:0]        start_addr;
    output reg [M_AXI_DATA_WIDTH-1:0]   data_o;
    output reg                      data_vld_o;
    output reg [BITS_TRANS-1:0]     data_cnt_o;
    output reg                      done_o;

    //Global signals
    input               clk;
    input               rstn;


//------------------------------------------------------------------------------
// Internal Signal declarations
//------------------------------------------------------------------------------
    assign M_ARID = 3'd0;           // Read addr ID
    assign M_ARLOCK = 2'd0;         // Atomic access information
    assign M_ARCACHE = 4'd0;        // Cachable/bufferable infor
    assign M_ARPROT = 3'd0;         // Protection info
    assign M_ARQOS = 4'b1111;       // Highest priority
    assign M_ARREGION = 4'd0;       // Region signaling
    assign M_ARUSER = 4'd0;         // User defiend signal
        
    reg     [M_AXI_ADDR_WIDTH-1:0]  ext_araddr ;
	reg     [M_AXI_ADDR_WIDTH-1:0]  ext_arlen  ;
	reg     [2:0]               ext_arsize ;
	reg     [1:0]               ext_arburst;
	reg                         ext_arvalid;
	wire                        ext_arready;
	wire    [M_AXI_DATA_WIDTH-1:0]  ext_rdata  ;
	wire    [1:0]               ext_rresp  ;
	wire                        ext_rlast  ;
	wire                        ext_rvalid ;
	wire                        ext_rready ;

    assign  M_ARVALID = ext_arvalid;
    assign  M_ARADDR  = ext_araddr;
    assign  M_ARLEN   = ext_arlen;
    assign  M_ARSIZE  = ext_arsize;
    assign  M_ARBURST = ext_arburst;
    assign  ext_arready = M_ARREADY;

    assign  ext_rdata   = M_RDATA;
    assign  ext_rresp   = M_RRESP;
    assign  ext_rlast   = M_RLAST;
    assign  ext_rvalid  = M_RVALID;
    assign  M_RREADY  = ext_rready;

    reg ext_rlast_r;  
    reg [1:0] ext_rresp_r;
    reg last_trans;   
    reg [7:0] q_burst_size_rd;
    reg [8:0] q_burst_size_rd_1;
    reg [M_AXI_ADDR_WIDTH-1:0] q_ext_addr_rd;
    reg [2:0] st_rdaxi, next_st_rdaxi;  
    reg [BITS_TRANS-1:0] num_trans_d;
    reg [BITS_TRANS-1:0] data_cnt;
    reg [BITS_TRANS-1:0] d_burst_cnt_rd, q_burst_cnt_rd;
    reg start_dma_d;
   
    always @(posedge clk or negedge rstn)
        if(!rstn)   ext_rlast_r <= 'h0;
        else        ext_rlast_r <= ext_rlast & ext_rvalid & ext_rready;
   
    always @(posedge clk or negedge rstn)
        if(!rstn)   ext_rresp_r <= 'h0;
        else        ext_rresp_r <= ext_rresp;

//------------------------------------------------------------------------------
// Main body of code
//------------------------------------------------------------------------------
   //FSM for Read from AXI
    localparam RD_IDLE = 0, RD_PRE = 1, RD_START = 2, RD_SEQ = 3, RD_WAIT = 4;

    always @(posedge clk or negedge rstn)
        if(!rstn)         st_rdaxi <= RD_IDLE;
        else              st_rdaxi <= next_st_rdaxi;//flow setting


    assign ext_rready = 1'b1;
    always @(posedge clk or negedge rstn)
        if(!rstn) start_dma_d <= 'b0;
        else start_dma_d <= start_dma;

    always @(posedge clk or negedge rstn)
        if(!rstn) num_trans_d <= 'h0;
        else if(start_dma) num_trans_d <= num_trans; //start_dma access only 1time?


    always @(posedge clk or negedge rstn)
        if(!rstn)   q_burst_cnt_rd <= 0;
        else        q_burst_cnt_rd <= d_burst_cnt_rd;

    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            q_burst_size_rd <= 0;
            q_burst_size_rd_1 <= 0;
            last_trans <= 1'b0;
        end
        // else if(q_burst_cnt_rd + FIXED_BURST_SIZE >= num_trans_d) begin
        //     q_burst_size_rd <= num_trans_d - q_burst_cnt_rd - 1;
        //     q_burst_size_rd_1 <= num_trans_d - q_burst_cnt_rd;//The # of remaining transaction
        //     if(st_rdaxi == RD_SEQ) last_trans <= 1'b1;
        //     else last_trans <= 1'b0;
         
        // end
        else if(q_burst_cnt_rd + FIXED_BURST_SIZE > num_trans_d) begin
            q_burst_size_rd <= num_trans_d[LOG_BURST_SIZE - 1 :0] - 1;
            q_burst_size_rd_1 <= num_trans_d[LOG_BURST_SIZE - 1 :0];    //The # of remaining transaction
            if(st_rdaxi == RD_SEQ) last_trans <= 1'b1;
            else last_trans <= 1'b0;
        end
        else if(q_burst_cnt_rd + FIXED_BURST_SIZE == num_trans_d) begin
            q_burst_size_rd <= FIXED_BURST_SIZE-1;
            q_burst_size_rd_1 <= FIXED_BURST_SIZE;    //The # of remaining transaction
            if(st_rdaxi == RD_SEQ) last_trans <= 1'b1;
            else last_trans <= 1'b0;
        end
        else begin
            q_burst_size_rd <= FIXED_BURST_SIZE-1;
            q_burst_size_rd_1 <= FIXED_BURST_SIZE;
        end
    end


    always @(posedge clk or negedge rstn) begin
        if(!rstn)
            q_ext_addr_rd <= 0;
        else if(start_dma)
            q_ext_addr_rd <= start_addr;
        else if((st_rdaxi == RD_WAIT) && (next_st_rdaxi == RD_PRE))
            q_ext_addr_rd <= q_ext_addr_rd + {FIXED_BURST_SIZE,{2'b00}};//4B 
    end


    always @(*) begin
        next_st_rdaxi = st_rdaxi;
        d_burst_cnt_rd = q_burst_cnt_rd;

        //AXI read addr channel
        ext_araddr = 0;
        ext_arlen = 0;
        ext_arsize = 0;
        ext_arburst = 0;
        ext_arvalid = 1'b0;

        case(st_rdaxi)
            default: next_st_rdaxi = RD_IDLE;
            RD_IDLE: begin
                if(start_dma_d)
                next_st_rdaxi = RD_PRE;
            end
            RD_PRE: begin
                if(q_burst_cnt_rd == num_trans_d) begin //end of blk read
                d_burst_cnt_rd = 0;
                next_st_rdaxi = RD_IDLE;
                end
                else next_st_rdaxi = RD_START;
            end
            RD_START: begin   //start burst read
                ext_arvalid = 1'b1;
                ext_araddr = q_ext_addr_rd;
                ext_arlen = q_burst_size_rd;
                //ext_arsize = SIZE_16B;	//2023.03.12 DEL -- axi-datawidth=128
				ext_arsize = SIZE_4B;		//2023.03.12 MOD ++ axi-datawidth=32
                ext_arburst = 2'b01;// BURST_INCR
                if(ext_arready) begin
                // ext_arvalid = 1'b1;
                next_st_rdaxi = RD_SEQ;
                end
            end
            RD_SEQ: begin  //currently, wai until finishing reading data
                //if(ext_rlast && ext_rvalid && ext_rready) begin //last beat of a burst
                //   if(ext_rresp == RESP_OKAY)
                if(ext_rlast_r) begin //last beat of a burst
                    if(ext_rresp_r == 2'b00)
                        next_st_rdaxi = RD_WAIT;
                    else     //error, restart the burst transfer
                        next_st_rdaxi = RD_START;
                end
            end
            RD_WAIT: begin //wait data written to ofifo
                d_burst_cnt_rd = q_burst_cnt_rd + q_burst_size_rd_1;
                next_st_rdaxi = RD_PRE;
            end
        endcase

    end


    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            data_cnt_o <= 'h0;
            data_o <= 'h0;
            data_vld_o <= 'h0;
        end
        else begin
            data_cnt_o <= data_cnt;
            data_o <= ext_rdata;
            data_vld_o <= ext_rvalid;
        end
    end
  
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            done_o <= 'h0;
        end
        else begin
            done_o <= last_trans && ext_rlast && ext_rvalid && (ext_rresp == 2'b00);
        end

    end// Timing check needed



    always @(posedge clk or negedge rstn) begin
        if(!rstn)               data_cnt <= 'h0;
        else begin
            if(st_rdaxi == RD_START) data_cnt <= q_burst_cnt_rd;
            else if(ext_rvalid) data_cnt <= data_cnt + 'h1;
            end
        end
endmodule