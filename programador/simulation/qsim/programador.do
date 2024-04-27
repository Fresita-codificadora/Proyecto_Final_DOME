onerror {exit -code 1}
vlib work
vcom -work work programador.vho
vcom -work work Waveform.vwf.vht
vsim -voptargs="+acc"  -c -t 1ps -sdfmax serialout_vhd_vec_tst/i1=programador_vhd.sdo -L cycloneive -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.serialout_vhd_vec_tst
vcd file -direction programador.msim.vcd
vcd add -internal serialout_vhd_vec_tst/*
vcd add -internal serialout_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f





