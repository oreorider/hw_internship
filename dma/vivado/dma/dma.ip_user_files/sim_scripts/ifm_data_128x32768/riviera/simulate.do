onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+ifm_data_128x32768 -L xpm -L blk_mem_gen_v8_4_5 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.ifm_data_128x32768 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {ifm_data_128x32768.udo}

run -all

endsim

quit -force
