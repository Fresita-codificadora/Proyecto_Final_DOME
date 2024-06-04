transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -2008 -work work {C:/Users/Gaspar/Documents/GitHub/Proyecto_Final_DOME/Programador_i2c_master/i2c_master.vhd}
vcom -2008 -work work {C:/Users/Gaspar/Documents/GitHub/Proyecto_Final_DOME/Programador_i2c_master/control.vhd}

vcom -2008 -work work {C:/Users/Gaspar/Documents/GitHub/Proyecto_Final_DOME/Programador_i2c_master/simulation/modelsim/Waveform.vwf.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  Block1_vhd_vec_tst

add wave *
view structure
view signals
run 10 us
