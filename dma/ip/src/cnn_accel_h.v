//`define EXEC_MODEL_M3


// FPGA Optimization
// 1. Use the plain coding style
// 2. Change the delay style which is not removed due to FPGA optimization

`define USE_OPT_MAC 1

//`define FPGA 1
`ifndef FPGA	
	//`define ASIC
`endif

//`define USE_DMA_SYNC 	1//20230606