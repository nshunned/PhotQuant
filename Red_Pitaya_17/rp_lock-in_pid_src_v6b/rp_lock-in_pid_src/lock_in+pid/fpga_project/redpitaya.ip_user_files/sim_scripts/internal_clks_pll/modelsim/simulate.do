onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L xpm -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.internal_clks_pll xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {internal_clks_pll.udo}

run -all

quit -force
