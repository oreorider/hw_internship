parameter    S_AXI_DATA_WIDTH = 32;
parameter    S_AXI_ADDR_WIDTH = 5;

parameter    M_AXI_ID_WIDTH = 1;
parameter    M_AXI_ADDR_WIDTH = 32;
//parameter    M_AXI_DATA_WIDTH = 128;		// 220726: NXT -- DEL
parameter    M_AXI_DATA_WIDTH = 32;		// 220726: NXT ++ MOD
parameter    M_AXI_AWUSER_WIDTH = 1;
parameter    M_AXI_ARUSER_WIDTH = 1;
parameter    M_AXI_WUSER_WIDTH = 1;
parameter    M_AXI_RUSER_WIDTH = 1;
parameter    M_AXI_BUSER_WIDTH = 1;
parameter    M_AXI_USER_VALUE = 0;
parameter    M_AXI_PROT_VALUE = 0;
parameter    M_AXI_CACHE_VALUE = 3;

parameter S_AXI_WSTRB_WIDTH = (S_AXI_DATA_WIDTH / 8);
parameter M_AXI_WSTRB_WIDTH = (M_AXI_DATA_WIDTH / 8);
parameter M_W = $clog2(M_AXI_WSTRB_WIDTH);

//parameter  FIXED_BURST_SIZE = 64;		// 220726: NXT -- DEL
parameter  FIXED_BURST_SIZE = 16;		// 220726: NXT ++ MOD
parameter  LOG_BURST_SIZE = $clog2(FIXED_BURST_SIZE);
parameter  BITS_TRANS = 10;

//FIXED ME: Change the directory as your local directory

`define TV_IN_memory_bus 					 "/home/truongnx/FPGA/2023/dfx/ip/dma/tv/cdatafile/c.ConvNormReluPoolWrapper.autotvin_memory_bus.dat"
`define TV_OUT_memory_bus 					 "/home/truongnx/FPGA/2023/dfx/ip/dma/tv/rtldatafile/rtl.ConvNormReluPoolWrapper.autotvout_memory_bus.dat"
`define AUTOTB_TVIN_memory_bus  			 "/home/truongnx/FPGA/2023/dfx/ip/dma/tv/cdatafile/c.ConvNormReluPoolWrapper.autotvin_memory_bus.dat"
`define AUTOTB_TVIN_read_address  			 "/home/truongnx/FPGA/2023/dfx/ip/dma/tv/cdatafile/c.ConvNormReluPoolWrapper.autotvin_read_address.dat"
`define AUTOTB_TVIN_write_address  		 	 "/home/truongnx/FPGA/2023/dfx/ip/dma/tv/cdatafile/c.ConvNormReluPoolWrapper.autotvin_write_address.dat"
`define AUTOTB_TVOUT_memory_bus  			 "/home/truongnx/FPGA/2023/dfx/ip/dma/tv/cdatafile/c.ConvNormReluPoolWrapper.autotvout_memory_bus.dat"
`define AUTOTB_TVIN_memory_bus_out_wrapc     "/home/truongnx/FPGA/2023/dfx/ip/dma/tv/rtldatafile/rtl.ConvNormReluPoolWrapper.autotvin_memory_bus.dat"
`define AUTOTB_TVIN_read_address_out_wrapc   "/home/truongnx/FPGA/2023/dfx/ip/dma/tv/rtldatafile/rtl.ConvNormReluPoolWrapper.autotvin_read_address.dat"
`define AUTOTB_TVIN_write_address_out_wrapc  "/home/truongnx/FPGA/2023/dfx/ip/dma/tv/rtldatafile/rtl.ConvNormReluPoolWrapper.autotvin_write_address.dat"
`define AUTOTB_TVOUT_memory_bus_out_wrapc    "/home/truongnx/FPGA/2023/dfx/ip/dma/tv/rtldatafile/rtl.ConvNormReluPoolWrapper.autotvout_memory_bus.dat"

parameter FILE_INPUT_LOG  =  "/home/truongnx/FPGA/2023/dfx/ip/dma/tv/wdatafile/conv_input.hex";
parameter FILE_OUTPUT_LOG =  "/home/truongnx/FPGA/2023/dfx/ip/dma/tv/wdatafile/conv_output.hex";	

parameter OUTFILE00   =    "/home/truongnx/FPGA/2023/dfx/ip/dma/tv/wdatafile/convout_ch01.bmp";
parameter OUTFILE01   =    "/home/truongnx/FPGA/2023/dfx/ip/dma/tv/wdatafile/convout_ch02.bmp";
parameter OUTFILE02   =    "/home/truongnx/FPGA/2023/dfx/ip/dma/tv/wdatafile/convout_ch03.bmp";
parameter OUTFILE03   =    "/home/truongnx/FPGA/2023/dfx/ip/dma/tv/wdatafile/convout_ch04.bmp";