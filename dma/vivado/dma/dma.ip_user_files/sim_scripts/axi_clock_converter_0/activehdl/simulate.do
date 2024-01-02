onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+axi_clock_converter_0 -L xpm -L axi_infrastructure_v1_1_0 -L fifo_generator_v13_2_6 -L axi_clock_converter_v2_1_24 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.axi_clock_converter_0 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {axi_clock_converter_0.udo}

run -all

endsim

quit -force
