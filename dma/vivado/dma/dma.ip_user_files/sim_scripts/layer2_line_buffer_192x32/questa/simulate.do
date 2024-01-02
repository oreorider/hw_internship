onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib layer2_line_buffer_192x32_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {layer2_line_buffer_192x32.udo}

run -all

quit -force
