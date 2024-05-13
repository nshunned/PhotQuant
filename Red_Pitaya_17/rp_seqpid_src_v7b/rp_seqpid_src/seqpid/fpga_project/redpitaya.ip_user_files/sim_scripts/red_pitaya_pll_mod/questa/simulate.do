onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib red_pitaya_pll_mod_opt

do {wave.do}

view wave
view structure
view signals

do {red_pitaya_pll_mod.udo}

run -all

quit -force
