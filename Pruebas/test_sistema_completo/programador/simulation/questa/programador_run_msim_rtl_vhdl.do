transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -2008 -work work {C:/Users/gazpa/Documents/GitHub/Proyecto_Final_DOME/programador/camara.vhd}

vcom -2008 -work work {C:/Users/gazpa/Documents/GitHub/Proyecto_Final_DOME/programador/simulation/modelsim/Waveform1.vwf.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  programador_vhd_vec_tst

add wave *
view structure
view signals
run 1000 ns
