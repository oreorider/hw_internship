onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib l2_o_data_128x4096_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {l2_o_data_128x4096.udo}

run -all

quit -force
