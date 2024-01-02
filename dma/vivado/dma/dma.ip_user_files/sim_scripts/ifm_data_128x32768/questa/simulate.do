onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib ifm_data_128x32768_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {ifm_data_128x32768.udo}

run -all

quit -force
