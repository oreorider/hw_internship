-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
-- Date        : Wed Nov 29 12:04:08 2023
-- Host        : sml running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {c:/Users/Young Jae/OneDrive -
--               SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/weight_1_blk_mem/weight_1_blk_mem_stub.vhdl}
-- Design      : weight_1_blk_mem
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity weight_1_blk_mem is
  Port ( 
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 5 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 127 downto 0 )
  );

end weight_1_blk_mem;

architecture stub of weight_1_blk_mem is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,ena,addra[5:0],douta[127:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_4_5,Vivado 2021.2";
begin
end;
