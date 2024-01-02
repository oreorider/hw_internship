vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/fifo_generator_v13_2_6
vlib riviera/axi_clock_converter_v2_1_24
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap fifo_generator_v13_2_6 riviera/fifo_generator_v13_2_6
vmap axi_clock_converter_v2_1_24 riviera/axi_clock_converter_v2_1_24
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../ipstatic/hdl" \
"/TOOLS/XILINX/Vivado/2021.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/TOOLS/XILINX/Vivado/2021.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/TOOLS/XILINX/Vivado/2021.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../ipstatic/hdl" \
"../../../ipstatic/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_6  -v2k5 "+incdir+../../../ipstatic/hdl" \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_6 -93 \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_6  -v2k5 "+incdir+../../../ipstatic/hdl" \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_clock_converter_v2_1_24  -v2k5 "+incdir+../../../ipstatic/hdl" \
"../../../ipstatic/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic/hdl" \
"../../../../dma.gen/sources_1/ip/axilite_clock_converter_0/sim/axilite_clock_converter_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

