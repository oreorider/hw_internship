//---------------------------------------------------------------------
// AXI 32-bit for YOLO param loading 
// 2018.07.19  thanhnd     Initial release
//---------------------------------------------------------------------

module axi_dma_wr (
   //AXI Master Interface
   //Write address channel
   M_AWID,       // Address ID
   M_AWADDR,     // Address Write
   M_AWLEN,      // Transfer length
   M_AWSIZE,     // Transfer width
   M_AWBURST,    // Burst type
   M_AWLOCK,     // Atomic access information
   M_AWCACHE,    // Cachable/bufferable infor
   M_AWPROT,     // Protection info
   M_AWREGION,
   M_AWQOS,
   M_AWVALID,    // address/control valid handshake
   M_AWREADY,
   //Write data channel
   M_WID,        // Write ID
   M_WDATA,      // Write Data bus
   M_WSTRB,      // Write Data byte lane strobes
   M_WLAST,      // Last beat of a burst transfer
   M_WVALID,     // Write data valid
   M_WREADY,     // Write data ready
   //Write response chaDnel
   M_BID,        // buffered response ID
   M_BRESP,      // Buffered write response
   M_BVALID,     // Response info valid
   M_BREADY,     // Response info ready (to slave)
   //Read address channDl
   //User interface
   start_dma,
   num_trans, //Number of words transferred
   start_addr,
   indata,
   indata_req_o,
   data_last_o, //Blk transfer done
   //User signals
   clk, rstn
);
   `include "params.v"

   //AXI Master Interface
   //Write address channel
   output  [M_AXI_ID_WIDTH-1:0]     M_AWID;       // Address ID
   output  [M_AXI_ADDR_WIDTH-1:0]     M_AWADDR;     // Address Write
   output  [7:0]     M_AWLEN;      // Transfer length
   output  [2:0]       M_AWSIZE;     // Transfer width
   output  [1:0]       M_AWBURST;    // Burst type
   output  [1:0]       M_AWLOCK;     // Atomic access information
   output  [3:0]       M_AWCACHE;    // Cachable/bufferable infor
   output  [2:0]       M_AWPROT;     // Protection info
   output  [3:0]       M_AWREGION;
   output  [3:0]       M_AWQOS;
   output              M_AWVALID;    // address/control valid handshake
   input               M_AWREADY;
   //Write data channel
   output  [M_AXI_ID_WIDTH-1:0]     M_WID;        // Write ID
   output  [M_AXI_DATA_WIDTH-1:0]     M_WDATA;      // Write Data bus
   output  [M_AXI_WSTRB_WIDTH-1:0]     M_WSTRB;      // Write Data byte lane strobes
   output              M_WLAST;      // Last beat of a burst transfer
   output              M_WVALID;     // Write data valid
   input               M_WREADY;     // Write data ready
   //Write response chaDnel
   input  [M_AXI_ID_WIDTH-1:0]      M_BID;        // buffered response ID
   input  [1:0]        M_BRESP;      // Buffered write response
   input               M_BVALID;     // Response info valid
   output              M_BREADY;     // Response info ready (to slave)
   //Read address channDl
   //User interface
   input                start_dma;
   input [BITS_TRANS-1:0] num_trans; //Number of words transferred
   input [M_AXI_ADDR_WIDTH-1:0]        start_addr;
   input [M_AXI_DATA_WIDTH-1:0]        indata;
   output reg           indata_req_o;
   output               data_last_o; //Blk transfer done

   //User signals
   input                clk, rstn;

//---------------------------------------------------------------------
// parameter definitions 
//---------------------------------------------------------------------
   //AXI3 supports upto 16 transfers
   //AXI4 supports upto 256 transfers
   //DDR3 vc707 has 64bit burst length of 8, so the fixed busrt size
   //should be >= 8.
   localparam DEFAULT_ID = 0;
   //AXI data width: number of bytes
   localparam  SIZE_1B     = 3'b000;
   localparam  SIZE_2B     = 3'b001;
   localparam  SIZE_4B     = 3'b010;
   localparam  SIZE_8B     = 3'b011;
   localparam  SIZE_16B    = 3'b100;      // not supported    
   localparam  SIZE_32B    = 3'b101;      // not supported
   localparam  SIZE_64B    = 3'b110;      // not supported
   localparam  SIZE_128B   = 3'b111;      // not supported
   
   localparam  RESP_OKAY   = 2'b00;
   localparam  RESP_EXOKAY = 2'b01;
   localparam  RESP_SLVERR = 2'b10;
   localparam  RESP_DECERR = 2'b11;
   
   localparam  BURST_FIXED = 2'b00;
   localparam  BURST_INCR  = 2'b01;
   localparam  BURST_WRAP  = 2'b10;
   
   localparam  LOCK_NORMAL = 2'b00;
   localparam  LOCK_EX     = 2'b01;
   localparam  LOCK_LOCKED = 2'b10;
//---------------------------------------------------------------------
// Internal signals declaration
//---------------------------------------------------------------------
   
   //AXI External memory internal signal declaration
   (* dont_touch = "true" *) reg     [M_AXI_ID_WIDTH-1:0] ext_awid   ; 
   (* dont_touch = "true" *) reg     [M_AXI_ADDR_WIDTH-1:0] ext_awaddr ;
   (* dont_touch = "true" *) reg     [7:0] ext_awlen  ;
   (* dont_touch = "true" *) reg     [2:0]   ext_awsize ;
   (* dont_touch = "true" *) reg     [1:0]   ext_awburst;
   (* dont_touch = "true" *) reg     [1:0]   ext_awlock = 2'b0 ;
   (* dont_touch = "true" *) reg     [3:0]   ext_awcache = 4'b0;
   (* dont_touch = "true" *) reg     [2:0]   ext_awprot = 3'b0;
   (* dont_touch = "true" *) reg             ext_awvalid;
   (* dont_touch = "true" *) wire            ext_awready;
                        
   (* dont_touch = "true" *) reg     [M_AXI_ID_WIDTH-1:0] ext_wid    ;
   (* dont_touch = "true" *) reg     [M_AXI_DATA_WIDTH-1:0] ext_wdata  ;
   (* dont_touch = "true" *) reg     [M_AXI_WSTRB_WIDTH-1:0] ext_wstrb  ;
   (* dont_touch = "true" *) reg             ext_wlast  ;
   (* dont_touch = "true" *) reg             ext_wvalid ;
   (* dont_touch = "true" *) wire            ext_wready ;
                            
   (* dont_touch = "true" *) wire    [M_AXI_ID_WIDTH-1:0] ext_bid    ;
   (* dont_touch = "true" *) wire    [1:0]   ext_bresp  ;
   (* dont_touch = "true" *) wire            ext_bvalid ;
   (* dont_touch = "true" *) reg             ext_bready ;

   assign  M_AWVALID = ext_awvalid;
   assign  M_AWID    = ext_awid;
   assign  M_AWADDR  = ext_awaddr;
   assign  M_AWLEN   = ext_awlen;
   assign  M_AWSIZE  = ext_awsize;
   assign  M_AWBURST = ext_awburst;
   assign  M_AWLOCK  = ext_awlock;
   assign  M_AWCACHE = ext_awcache;
   assign  M_AWPROT  = ext_awprot;
   assign  M_AWREGION = 4'd0;
   assign  M_AWQOS = 4'b1111;

   assign  ext_awready = M_AWREADY;
               
   assign  M_WVALID  = ext_wvalid;
   assign  M_WID     = ext_wid;
   assign  M_WDATA   = ext_wdata;
   assign  M_WSTRB   = ext_wstrb;
   assign  M_WLAST   = ext_wlast;
   assign  ext_wready = M_WREADY;
               
   assign  ext_bid     = M_BID;
   assign  ext_bresp   = M_BRESP;
   assign  ext_bvalid  = M_BVALID;
   assign  M_BREADY  = ext_bready;

   reg [BITS_TRANS-1:0] num_trans_d;
   reg [BITS_TRANS-1:0] data_cnt;
   reg [7:0] d_beat_cnt_wr, q_beat_cnt_wr;
   reg [BITS_TRANS-1:0] d_burst_cnt_wr, q_burst_cnt_wr;
   reg [7:0] q_burst_size_wr;
   reg [8:0] q_burst_size_wr_1;   //added 1 to q_burst_size_wr
   reg [M_AXI_ADDR_WIDTH-1:0] q_ext_addr_wr; //current AXI address for Write

   //FSM for Write to axi
   reg [2:0] st_wr2axi, next_st_wr2axi;
   localparam  WR_IDLE = 0,
               WR_PRE = 1,
               WR_START = 2,
               WR_SEQ = 3,
               WR_WAIT = 4;
//---------------------------------------------------------------------
// Module designs 
//---------------------------------------------------------------------
   //---------------------------------------------------------------
   // FSM for Write data to AXI Interface 
   //---------------------------------------------------------------
   always @(posedge clk or negedge rstn)
      if(!rstn) num_trans_d <= 'h0;
      else if(start_dma) num_trans_d <= num_trans;

   always @(posedge clk or negedge rstn) begin
      if(!rstn) begin
         q_beat_cnt_wr <= 0;
         q_burst_cnt_wr <= 0;
      end
      else begin
         q_beat_cnt_wr <= d_beat_cnt_wr;
         q_burst_cnt_wr <= d_burst_cnt_wr;
      end
   end
   
   always @(posedge clk or negedge rstn)
   begin
      if(!rstn) begin
         q_burst_size_wr <= 0; 
         q_burst_size_wr_1 <= 0; 
      end
      else if(q_burst_cnt_wr + FIXED_BURST_SIZE > num_trans_d)
      begin
         q_burst_size_wr <= num_trans_d - q_burst_cnt_wr - 1;
         q_burst_size_wr_1 <= num_trans_d - q_burst_cnt_wr;
      end
      else begin
         q_burst_size_wr <= FIXED_BURST_SIZE-1;
         q_burst_size_wr_1 <= FIXED_BURST_SIZE;
      end
   end
   always @(posedge clk or negedge rstn) begin
      if(!rstn) 
         q_ext_addr_wr <= 0;
      else if(start_dma)
         q_ext_addr_wr <= start_addr;
      else if((st_wr2axi == WR_WAIT) && (next_st_wr2axi == WR_PRE))
         q_ext_addr_wr <= q_ext_addr_wr + {q_burst_size_wr_1, {M_W{1'b0}}}; 
   end

   assign data_last_o = (st_wr2axi == WR_PRE)&&(q_burst_cnt_wr == num_trans_d);

   always @(posedge clk or negedge rstn)
      if(!rstn)  st_wr2axi <= WR_IDLE;
      else       st_wr2axi <= next_st_wr2axi;

   always @* begin
      next_st_wr2axi = st_wr2axi;
      d_beat_cnt_wr = q_beat_cnt_wr;
      d_burst_cnt_wr = q_burst_cnt_wr;
      
      indata_req_o = 1'b0;
      //AXI signals for write
      ext_awid = DEFAULT_ID;
      ext_awvalid = 1'b0;
      ext_awaddr = 0;
      ext_awlen = 0;
      ext_awsize = 0;
      ext_awburst = 0;
      ext_awlock = 0;
      ext_awcache = 4'b0000; //TODO: for width(SI) < width(MI) AXI IC
      ext_awprot = 0;

      ext_wid = DEFAULT_ID;
      ext_wvalid = 1'b0;
      ext_wdata = 0;
      ext_wstrb = 0;
      ext_wlast = 1'b0;

      ext_bready = 1'b0;

      case(st_wr2axi)
         default: next_st_wr2axi = WR_IDLE;
         WR_IDLE: begin
            if(start_dma)
               next_st_wr2axi = WR_PRE;
         end
         WR_PRE: begin
            if(q_burst_cnt_wr == num_trans_d) begin   //end of blk transfer
               d_burst_cnt_wr = 0;
               next_st_wr2axi = WR_IDLE;
            end
            else
               next_st_wr2axi = WR_START;
         end
         WR_START: begin   //start burst transfer
               ext_awvalid = 1'b1; //start write cmd
               ext_awaddr = q_ext_addr_wr;
               ext_awlen = q_burst_size_wr;
               ext_awburst = BURST_INCR;
               //ext_awsize = SIZE_16B;      //data width is 32bit		//2023.03.12 DEL -- axi-datawidth=128
			   ext_awsize = SIZE_4B;      //data width is 32bit			//2023.03.12 MOD ++ axi-datawidth=32
            if(ext_awready) begin //valid data and axiwr is ready
               indata_req_o = 1'b1;
               next_st_wr2axi = WR_SEQ;
            end
         end
         WR_SEQ: begin
            ext_wvalid = 1'b1;
            ext_wdata = indata;
            ext_wstrb = {M_AXI_WSTRB_WIDTH{1'b1}};
            if(ext_wready) begin
               // ext_wvalid = 1'b1;   //start output data
               // ext_wdata = indata;
               // ext_wstrb = {M_AXI_WSTRB_WIDTH{1'b1}};  //no support for narrow transfer

               if(q_burst_size_wr == q_beat_cnt_wr) begin //last beat of burst
                  d_beat_cnt_wr = 'h0;
                  ext_wlast = 1'b1;
                  next_st_wr2axi = WR_WAIT;
               end
               else begin
                  indata_req_o = 1'b1;
                  d_beat_cnt_wr = q_beat_cnt_wr + 1'b1;
               end
            end
         end
         WR_WAIT: begin //wait bresp from AXI
            ext_bready = 1'b1;
			if(ext_bvalid) begin
               //if((ext_bid == ext_wid) && (ext_bresp == RESP_OKAY)) begin
               if((ext_bresp == RESP_OKAY)) begin //TODO: to compatible with AXI IC
                  d_beat_cnt_wr = 0;
                  d_burst_cnt_wr = q_burst_cnt_wr + q_burst_size_wr_1;
                  next_st_wr2axi = WR_PRE;
               end
            end
         end
      endcase
   end
endmodule



