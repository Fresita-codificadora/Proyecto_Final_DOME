onerror {exit -code 1}
vlib work
vcom -work work pruebas_algoritmo.vho
vcom -work work Waveform3.vwf.vht
vsim  -c -t 1ps -L cycloneive -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.test_algo_sim_vhd_vec_tst
vcd file -direction pruebas_algoritmo.msim.vcd
vcd add -internal test_algo_sim_vhd_vec_tst/*
vcd add -internal test_algo_sim_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f


