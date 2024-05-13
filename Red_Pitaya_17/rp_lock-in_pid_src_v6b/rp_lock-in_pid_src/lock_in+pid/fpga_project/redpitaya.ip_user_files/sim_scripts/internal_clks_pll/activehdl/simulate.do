onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+internal_clks_pll -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.internal_clks_pll xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {internal_clks_pll.udo}

run -all

endsim

quit -force
