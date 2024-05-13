onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+red_pitaya_pll_mod -L xilinx_vip -L xpm -L xil_defaultlib -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.red_pitaya_pll_mod xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {red_pitaya_pll_mod.udo}

run -all

endsim

quit -force
