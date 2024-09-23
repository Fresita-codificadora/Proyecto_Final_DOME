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
-- Generated on "09/21/2024 21:05:52"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          uart_algo
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY uart_algo_vhd_vec_tst IS
END uart_algo_vhd_vec_tst;
ARCHITECTURE uart_algo_arch OF uart_algo_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL byte_o : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL clk : STD_LOGIC;
SIGNAL pix_count : STD_LOGIC_VECTOR(20 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL rx_byte : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL rx_dv : STD_LOGIC;
COMPONENT uart_algo
	PORT (
	byte_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	clk : IN STD_LOGIC;
	pix_count : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
	reset : IN STD_LOGIC;
	rx_byte : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	rx_dv : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : uart_algo
	PORT MAP (
-- list connections between master ports and signals
	byte_o => byte_o,
	clk => clk,
	pix_count => pix_count,
	reset => reset,
	rx_byte => rx_byte,
	rx_dv => rx_dv
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
	WAIT FOR 20000 ps;
	reset <= '1';
WAIT;
END PROCESS t_prcs_reset;
-- rx_byte[7]
t_prcs_rx_byte_7: PROCESS
BEGIN
	rx_byte(7) <= '0';
WAIT;
END PROCESS t_prcs_rx_byte_7;
-- rx_byte[6]
t_prcs_rx_byte_6: PROCESS
BEGIN
	rx_byte(6) <= '0';
WAIT;
END PROCESS t_prcs_rx_byte_6;
-- rx_byte[5]
t_prcs_rx_byte_5: PROCESS
BEGIN
	rx_byte(5) <= '0';
WAIT;
END PROCESS t_prcs_rx_byte_5;
-- rx_byte[4]
t_prcs_rx_byte_4: PROCESS
BEGIN
	rx_byte(4) <= '0';
WAIT;
END PROCESS t_prcs_rx_byte_4;
-- rx_byte[3]
t_prcs_rx_byte_3: PROCESS
BEGIN
	rx_byte(3) <= '0';
	WAIT FOR 700000 ps;
	rx_byte(3) <= '1';
WAIT;
END PROCESS t_prcs_rx_byte_3;
-- rx_byte[2]
t_prcs_rx_byte_2: PROCESS
BEGIN
	rx_byte(2) <= '0';
	WAIT FOR 300000 ps;
	rx_byte(2) <= '1';
	WAIT FOR 400000 ps;
	rx_byte(2) <= '0';
WAIT;
END PROCESS t_prcs_rx_byte_2;
-- rx_byte[1]
t_prcs_rx_byte_1: PROCESS
BEGIN
	rx_byte(1) <= '0';
	WAIT FOR 100000 ps;
	FOR i IN 1 TO 2
	LOOP
		rx_byte(1) <= '1';
		WAIT FOR 200000 ps;
		rx_byte(1) <= '0';
		WAIT FOR 200000 ps;
	END LOOP;
	rx_byte(1) <= '1';
WAIT;
END PROCESS t_prcs_rx_byte_1;
-- rx_byte[0]
t_prcs_rx_byte_0: PROCESS
BEGIN
LOOP
	rx_byte(0) <= '1';
	WAIT FOR 100000 ps;
	rx_byte(0) <= '0';
	WAIT FOR 100000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_rx_byte_0;

-- rx_dv
t_prcs_rx_dv: PROCESS
BEGIN
	rx_dv <= '0';
	WAIT FOR 60000 ps;
	rx_dv <= '1';
	WAIT FOR 20000 ps;
	rx_dv <= '0';
	WAIT FOR 180000 ps;
	rx_dv <= '1';
	WAIT FOR 20000 ps;
	rx_dv <= '0';
	WAIT FOR 80000 ps;
	rx_dv <= '1';
	WAIT FOR 20000 ps;
	rx_dv <= '0';
	WAIT FOR 180000 ps;
	rx_dv <= '1';
	WAIT FOR 20000 ps;
	rx_dv <= '0';
	WAIT FOR 180000 ps;
	rx_dv <= '1';
	WAIT FOR 20000 ps;
	rx_dv <= '0';
WAIT;
END PROCESS t_prcs_rx_dv;
END uart_algo_arch;
