onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib internal_clks_pll_opt

do {wave.do}

view wave
view structure
view signals

do {internal_clks_pll.udo}

run -all

quit -force
