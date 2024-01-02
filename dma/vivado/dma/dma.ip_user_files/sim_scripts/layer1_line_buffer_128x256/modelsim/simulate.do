onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L xpm -L blk_mem_gen_v8_4_5 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.layer1_line_buffer_128x256 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {layer1_line_buffer_128x256.udo}

run -all

quit -force
