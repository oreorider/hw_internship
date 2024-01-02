//------------------------------------------------------------------------------------
// coding style : XST user manual
// Dual Port RAM with Enable on Each Port
// data width : 8 bits
//------------------------------------------------------------------------------------
//`define FPGA
//`define ASIC
`include "cnn_accel_h.v"
module dual_port_block_ram(
   clk   ,
   ena   ,  //enable
   wea   ,  //primary synchronous write enable
   addra ,  //Write address
   enb   ,
   addrb ,  //Address for read 
   dia   ,  //Primary Data Input
   dob      //Primary Data Output
);
	parameter W_DATA = 8;
	
   parameter N_CELL = 512; 
   parameter W_CELL = 9;
   parameter FILENAME = "";
   parameter N_DELAY = 1;

   input                 clk;   // Clock input

   input ena; //primary enable
   input wea   ; //primary synchronous write enable
   input [W_CELL-1:0] addra ; //Write address/ Primary read address
   input enb; //read port enable
   input [W_CELL-1:0] addrb ; //Write address/ Primary read address
   input [W_DATA-1:0] dia   ; //Primary Data Input
   output [W_DATA-1:0] dob   ; //Primary Data Output

//------------------------------------------------------------------------------
// Main body of code
//------------------------------------------------------------------------------
`ifdef FPGA
generate
	
	if (N_CELL==1920 && W_DATA==32) begin: xil_dpram_1920x32
	 dpram_1920x32 u_dual_port_1920x32 (
		.clka    (clk	),
		.ena     (ena	),
		.wea     (wea	),
		.addra   (addra	),
		.dina    (dia	),
		
		.clkb    (clk	),
		.enb     (enb	),
		.addrb   (addrb	),
		.doutb   (dob	)
	 );
	end
	else if (N_CELL==480 && W_DATA==32) begin: xil_dpram_480x32
	 dpram_480x32 u_dual_port_480x32 (
		.clka    (clk	),
		.ena     (ena	),
		.wea     (wea	),
		.addra   (addra	),
		.dina    (dia	),
		
		.clkb    (clk	),
		.enb     (enb	),
		.addrb   (addrb	),
		.doutb   (dob	)
	 );
	end	
	// // Feature map for the last layer
	else if (N_CELL==7200 && W_DATA==128) begin: xil_dpram_7200x128
	 dpram_7200x128 u_dual_port_7200x128 (
		.clka    (clk),
		.ena     (ena),
		.wea     (wea),
		.addra   (addra),
		.dina    (dia),
		
		.clkb    (clk),
		.enb     (enb),
		.addrb   (addrb),
		.doutb   (dob)
	 );	 
	end	
	// // Feature map for the last layer
	else if (N_CELL==1800 && W_DATA==128) begin: xil_dpram_1800x128
	 dpram_1800x128 u_dual_port_1800x128 (
		.clka    (clk),
		.ena     (ena),
		.wea     (wea),
		.addra   (addra),
		.dina    (dia),
		
		.clkb    (clk),
		.enb     (enb),
		.addrb   (addrb),
		.doutb   (dob)
	 );	 
	end		
	// Weight -> Sub-pixel layer
	else if (N_CELL==18 && W_DATA==512) begin: xil_dpram_18x512
	 dpram_72x128 u_dual_port_72x128 (
		.clka    (clk),
		.ena     (ena),
		.wea     (wea),
		.addra   (addra),
		.dina    (dia),
		
		.clkb    (clk),
		.enb     (enb),
		.addrb   (addrb),
		.doutb   (dob)
	 );	 
	end	
	else if (N_CELL==42 && W_DATA==2048) begin: xil_dpram_168x512
	 dpram_672x128 u_dual_port_672x128 (
		.clka    (clk),
		.ena     (ena),
		.wea     (wea),
		.addra   (addra),
		.dina    (dia),
		
		.clkb    (clk),
		.enb     (enb),
		.addrb   (addrb),
		.doutb   (dob)
	 );	 
	end		
	else if (N_CELL==9 && W_DATA==256) begin: xil_dpram_36x64
	 dpram_144x16 u_dual_port_144x16 (
		.clka    (clk),
		.ena     (ena),
		.wea     (wea),
		.addra   (addra),
		.dina    (dia),
		
		.clkb    (clk),
		.enb     (enb),
		.addrb   (addrb),
		.doutb   (dob)
	 );	 
	end		
	//// Feature map
	//else if (N_CELL==10080 && W_DATA==128) begin: xil_dpram_10080x128
	// DPSRAM10080x128 u_dual_port_10080x128 (
	//	.clka    (clk),
	//	.ena     (ena),
	//	.wea     (wea),
	//	.addra   (addra),
	//	.dina    (dia),
	//	
	//	.clkb    (clk),
	//	.enb     (enb),
	//	.addrb   (addrb),
	//	.doutb   (dob)
	// );
	//end
	// // Feature map for the last layer
	//else if (N_CELL==7200 && W_DATA==128) begin: xil_dpram_7200x128
	// DPSRAM7200x128 u_dual_port_7200x128 (
	//	.clka    (clk),
	//	.ena     (ena),
	//	.wea     (wea),
	//	.addra   (addra),
	//	.dina    (dia),
	//	
	//	.clkb    (clk),
	//	.enb     (enb),
	//	.addrb   (addrb),
	//	.doutb   (dob)
	// );	 
	//end
endgenerate

`else
   `ifdef ASIC

   `else //simulation
   
      //share memory
	   reg [W_DATA-1:0] ram[N_CELL-1:0] /* synthesis syn_ramstyle="block_ram" */;

      // synopsys translate_off
      initial
      begin
         if (FILENAME != "") begin
            $display("### Loading internal memory from %s ###", FILENAME);
            $readmemh(FILENAME, ram);
         end
      end
      // synopsys translate_on

      //Write port	
      always @(posedge clk)
      begin: write
         if(ena)
         begin
            if(wea)
               ram[addra] <= dia;
         end
      end

      generate 
         if(N_DELAY == 1) begin: delay_1
            reg [W_DATA-1:0] rdata   ; //Primary Data Output
            //Read port
            always @(posedge clk)
            begin: read
               if(enb)
                  rdata <= ram[addrb];
            end
            assign dob = rdata;
         end
         else begin: delay_n
            reg [N_DELAY*W_DATA-1:0] rdata_r;
            always @(posedge clk)
            begin: read
               if(enb)
                  rdata_r[0+:W_DATA] <= ram[addrb];
            end

            always @(posedge clk) begin: delay
               integer i;
               for(i = 0; i < N_DELAY-1; i = i+1)
                  if(enb)
                     rdata_r[(i+1)*W_DATA+:W_DATA] <= rdata_r[i*W_DATA+:W_DATA];
            end
            assign dob = rdata_r[(N_DELAY-1)*W_DATA+:W_DATA];
         end
      endgenerate
   `endif
`endif
  
endmodule

