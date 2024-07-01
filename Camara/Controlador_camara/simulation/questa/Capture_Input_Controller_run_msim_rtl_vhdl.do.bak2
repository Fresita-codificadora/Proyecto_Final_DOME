transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -2008 -work work {C:/Users/Gaspar/Documents/GitHub/Proyecto_Final_DOME/Controlador_camara/Capture_Input_Controller.vhd}

vcom -2008 -work work {C:/Users/Gaspar/Documents/GitHub/Proyecto_Final_DOME/Controlador_camara/simulation/modelsim/Waveform.vwf.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  Capture_Input_Controller_vhd_vec_tst

add wave *
view structure
view signals
run 1 us
