transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {programador.vo}

vcom -93 -work work {C:/Users/Gaspar/Documents/GitHub/Proyecto_Final_DOME/programador/simulation/modelsim/Waveform1.vwf.vht}

vsim -t 1ps -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  programador_vhd_vec_tst

add wave *
view structure
view signals
run 1000 ns
