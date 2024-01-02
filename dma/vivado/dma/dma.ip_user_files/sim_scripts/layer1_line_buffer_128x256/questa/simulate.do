onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib layer1_line_buffer_128x256_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {layer1_line_buffer_128x256.udo}

run -all

quit -force
