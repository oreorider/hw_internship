onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+layer2_line_buffer_192x32 -L xpm -L blk_mem_gen_v8_4_5 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.layer2_line_buffer_192x32 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {layer2_line_buffer_192x32.udo}

run -all

endsim

quit -force
