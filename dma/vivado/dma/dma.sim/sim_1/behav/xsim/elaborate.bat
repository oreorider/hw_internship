@echo off
REM ****************************************************************************
REM Vivado (TM) v2021.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Wed Dec 27 17:44:02 +0900 2023
REM SW Build 3367213 on Tue Oct 19 02:48:09 MDT 2021
REM
REM IP Build 3369179 on Thu Oct 21 08:25:16 MDT 2021
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
REM elaborate design
echo "xelab --incr --debug typical --relax --mt 2 -L xil_defaultlib -L axi_infrastructure_v1_1_0 -L fifo_generator_v13_2_6 -L axi_clock_converter_v2_1_24 -L blk_mem_gen_v8_4_5 -L uvm -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot apatb_ConvNormReluPoolWrapper_top_behav xil_defaultlib.apatb_ConvNormReluPoolWrapper_top xil_defaultlib.glbl -log elaborate.log"
call xelab  --incr --debug typical --relax --mt 2 -L xil_defaultlib -L axi_infrastructure_v1_1_0 -L fifo_generator_v13_2_6 -L axi_clock_converter_v2_1_24 -L blk_mem_gen_v8_4_5 -L uvm -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot apatb_ConvNormReluPoolWrapper_top_behav xil_defaultlib.apatb_ConvNormReluPoolWrapper_top xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0