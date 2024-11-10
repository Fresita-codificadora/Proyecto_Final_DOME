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
-- Generated on "05/29/2024 16:45:21"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Block1
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Block1_vhd_vec_tst IS
END Block1_vhd_vec_tst;
ARCHITECTURE Block1_arch OF Block1_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL clk_out : STD_LOGIC;
SIGNAL DONE : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL reset_camara : STD_LOGIC;
SIGNAL sca : STD_LOGIC;
SIGNAL sda : STD_LOGIC;
SIGNAL start : STD_LOGIC;
SIGNAL trigg : STD_LOGIC;
COMPONENT Block1
	PORT (
	clk : IN STD_LOGIC;
	clk_out : OUT STD_LOGIC;
	DONE : OUT STD_LOGIC;
	reset : IN STD_LOGIC;
	reset_camara : OUT STD_LOGIC;
	sca : OUT STD_LOGIC;
	sda : INOUT STD_LOGIC;
	start : IN STD_LOGIC;
	trigg : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Block1
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	clk_out => clk_out,
	DONE => DONE,
	reset => reset,
	reset_camara => reset_camara,
	sca => sca,
	sda => sda,
	start => start,
	trigg => trigg
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 5000 ps;
	clk <= '1';
	WAIT FOR 5000 ps;
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

-- sda
t_prcs_sda: PROCESS
BEGIN
	sda <= 'Z';
WAIT;
END PROCESS t_prcs_sda;

-- start
t_prcs_start: PROCESS
BEGIN
	start <= '0';
	WAIT FOR 60000 ps;
	start <= '1';
WAIT;
END PROCESS t_prcs_start;
END Block1_arch;
