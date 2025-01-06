onerror {exit -code 1}
vlib work
vcom -work work test_sistema_completo_uart.vho
vcom -work work Waveform.vwf.vht
vsim  -c -t 1ps -L cycloneive -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.ack_sender_vhd_vec_tst
vcd file -direction test_sistema_completo_uart.msim.vcd
vcd add -internal ack_sender_vhd_vec_tst/*
vcd add -internal ack_sender_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f
