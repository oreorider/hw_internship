vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/fifo_generator_v13_2_6
vlib questa_lib/msim/axi_clock_converter_v2_1_24
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap fifo_generator_v13_2_6 questa_lib/msim/fifo_generator_v13_2_6
vmap axi_clock_converter_v2_1_24 questa_lib/msim/axi_clock_converter_v2_1_24
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm -64 -incr -mfcu -sv "+incdir+../../../ipstatic/hdl" \
"/TOOLS/XILINX/Vivado/2021.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/TOOLS/XILINX/Vivado/2021.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/TOOLS/XILINX/Vivado/2021.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr -mfcu "+incdir+../../../ipstatic/hdl" \
"../../../ipstatic/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_6 -64 -incr -mfcu "+incdir+../../../ipstatic/hdl" \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_6 -64 -93 \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_6 -64 -incr -mfcu "+incdir+../../../ipstatic/hdl" \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_clock_converter_v2_1_24 -64 -incr -mfcu "+incdir+../../../ipstatic/hdl" \
"../../../ipstatic/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../ipstatic/hdl" \
"../../../../dma.gen/sources_1/ip/axi_clock_converter_0/sim/axi_clock_converter_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

