transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Gaspar/Desktop/sram-controller-master/sram.vhd}

vcom -93 -work work {C:/Users/Gaspar/Desktop/sram-controller-master/simulation/modelsim/Waveform.vwf.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  sram_vhd_vec_tst

add wave *
view structure
view signals
run -all
