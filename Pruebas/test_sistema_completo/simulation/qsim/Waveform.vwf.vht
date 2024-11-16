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
-- Generated on "11/14/2024 11:49:00"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          decod_control
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY decod_control_vhd_vec_tst IS
END decod_control_vhd_vec_tst;
ARCHITECTURE decod_control_arch OF decod_control_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL cntrl_envio : STD_LOGIC;
SIGNAL cntrl_reset : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL rx_byte : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL rx_dv_i : STD_LOGIC;
COMPONENT decod_control
	PORT (
	clk : IN STD_LOGIC;
	cntrl_envio : OUT STD_LOGIC;
	cntrl_reset : OUT STD_LOGIC;
	reset : IN STD_LOGIC;
	rx_byte : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	rx_dv_i : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : decod_control
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	cntrl_envio => cntrl_envio,
	cntrl_reset => cntrl_reset,
	reset => reset,
	rx_byte => rx_byte,
	rx_dv_i => rx_dv_i
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
	WAIT FOR 620000 ps;
	reset <= '1';
	WAIT FOR 20000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;

-- rx_dv_i
t_prcs_rx_dv_i: PROCESS
BEGIN
	rx_dv_i <= '0';
	WAIT FOR 60000 ps;
	rx_dv_i <= '1';
	WAIT FOR 20000 ps;
	rx_dv_i <= '0';
	WAIT FOR 240000 ps;
	rx_dv_i <= '1';
	WAIT FOR 20000 ps;
	rx_dv_i <= '0';
	WAIT FOR 120000 ps;
	rx_dv_i <= '1';
	WAIT FOR 20000 ps;
	rx_dv_i <= '0';
WAIT;
END PROCESS t_prcs_rx_dv_i;
-- rx_byte[7]
t_prcs_rx_byte_7: PROCESS
BEGIN
	rx_byte(7) <= '0';
	WAIT FOR 460000 ps;
	rx_byte(7) <= '1';
	WAIT FOR 70000 ps;
	rx_byte(7) <= '0';
WAIT;
END PROCESS t_prcs_rx_byte_7;
-- rx_byte[6]
t_prcs_rx_byte_6: PROCESS
BEGIN
	rx_byte(6) <= '0';
	WAIT FOR 460000 ps;
	rx_byte(6) <= '1';
	WAIT FOR 70000 ps;
	rx_byte(6) <= '0';
WAIT;
END PROCESS t_prcs_rx_byte_6;
-- rx_byte[5]
t_prcs_rx_byte_5: PROCESS
BEGIN
	rx_byte(5) <= '0';
	WAIT FOR 460000 ps;
	rx_byte(5) <= '1';
	WAIT FOR 70000 ps;
	rx_byte(5) <= '0';
WAIT;
END PROCESS t_prcs_rx_byte_5;
-- rx_byte[4]
t_prcs_rx_byte_4: PROCESS
BEGIN
	rx_byte(4) <= '0';
	WAIT FOR 460000 ps;
	rx_byte(4) <= '1';
	WAIT FOR 70000 ps;
	rx_byte(4) <= '0';
WAIT;
END PROCESS t_prcs_rx_byte_4;
-- rx_byte[3]
t_prcs_rx_byte_3: PROCESS
BEGIN
	rx_byte(3) <= '0';
	WAIT FOR 460000 ps;
	rx_byte(3) <= '1';
	WAIT FOR 70000 ps;
	rx_byte(3) <= '0';
WAIT;
END PROCESS t_prcs_rx_byte_3;
-- rx_byte[2]
t_prcs_rx_byte_2: PROCESS
BEGIN
	rx_byte(2) <= '0';
	WAIT FOR 460000 ps;
	rx_byte(2) <= '1';
	WAIT FOR 70000 ps;
	rx_byte(2) <= '0';
WAIT;
END PROCESS t_prcs_rx_byte_2;
-- rx_byte[1]
t_prcs_rx_byte_1: PROCESS
BEGIN
	rx_byte(1) <= '0';
	WAIT FOR 460000 ps;
	rx_byte(1) <= '1';
	WAIT FOR 70000 ps;
	rx_byte(1) <= '0';
WAIT;
END PROCESS t_prcs_rx_byte_1;
-- rx_byte[0]
t_prcs_rx_byte_0: PROCESS
BEGIN
	rx_byte(0) <= '0';
	WAIT FOR 60000 ps;
	rx_byte(0) <= '1';
	WAIT FOR 60000 ps;
	rx_byte(0) <= '0';
	WAIT FOR 200000 ps;
	rx_byte(0) <= '1';
	WAIT FOR 60000 ps;
	rx_byte(0) <= '0';
	WAIT FOR 80000 ps;
	rx_byte(0) <= '1';
	WAIT FOR 70000 ps;
	rx_byte(0) <= '0';
WAIT;
END PROCESS t_prcs_rx_byte_0;
END decod_control_arch;
