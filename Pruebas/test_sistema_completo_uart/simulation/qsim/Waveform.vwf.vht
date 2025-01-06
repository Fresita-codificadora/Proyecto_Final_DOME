-- Copyright (C) 2023  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "12/12/2024 20:01:43"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ack_sender
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ack_sender_vhd_vec_tst IS
END ack_sender_vhd_vec_tst;
ARCHITECTURE ack_sender_arch OF ack_sender_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL trigger : STD_LOGIC;
SIGNAL tx_enable : STD_LOGIC;
SIGNAL uart_busy : STD_LOGIC;
SIGNAL uart_byte : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT ack_sender
	PORT (
	clk : IN STD_LOGIC;
	reset : IN STD_LOGIC;
	trigger : IN STD_LOGIC;
	tx_enable : BUFFER STD_LOGIC;
	uart_busy : IN STD_LOGIC;
	uart_byte : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ack_sender
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	reset => reset,
	trigger => trigger,
	tx_enable => tx_enable,
	uart_busy => uart_busy,
	uart_byte => uart_byte
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
	WAIT FOR 10000 ps;
	reset <= '1';
	WAIT FOR 30000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;

-- trigger
t_prcs_trigger: PROCESS
BEGIN
	trigger <= '0';
	WAIT FOR 50000 ps;
	trigger <= '1';
	WAIT FOR 50000 ps;
	trigger <= '0';
	WAIT FOR 190000 ps;
	trigger <= '1';
	WAIT FOR 50000 ps;
	trigger <= '0';
	WAIT FOR 210000 ps;
	trigger <= '1';
	WAIT FOR 50000 ps;
	trigger <= '0';
WAIT;
END PROCESS t_prcs_trigger;

-- uart_busy
t_prcs_uart_busy: PROCESS
BEGIN
	uart_busy <= '0';
	WAIT FOR 110000 ps;
	uart_busy <= '1';
	WAIT FOR 330000 ps;
	uart_busy <= '0';
WAIT;
END PROCESS t_prcs_uart_busy;
END ack_sender_arch;
