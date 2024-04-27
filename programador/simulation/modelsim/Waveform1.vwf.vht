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
-- Generated on "04/27/2024 15:20:09"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          programador
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY programador_vhd_vec_tst IS
END programador_vhd_vec_tst;
ARCHITECTURE programador_arch OF programador_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL buisy : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL clk : STD_LOGIC;
SIGNAL clk_div2 : STD_LOGIC;
SIGNAL clk_div4 : STD_LOGIC;
SIGNAL count : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL start : STD_LOGIC;
SIGNAL stop : STD_LOGIC;
COMPONENT programador
	PORT (
	buisy : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	clk : IN STD_LOGIC;
	clk_div2 : OUT STD_LOGIC;
	clk_div4 : OUT STD_LOGIC;
	count : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	reset : IN STD_LOGIC;
	start : IN STD_LOGIC;
	stop : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : programador
	PORT MAP (
-- list connections between master ports and signals
	buisy => buisy,
	clk => clk,
	clk_div2 => clk_div2,
	clk_div4 => clk_div4,
	count => count,
	reset => reset,
	start => start,
	stop => stop
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
	reset <= '1';
	WAIT FOR 40000 ps;
	reset <= '0';
	WAIT FOR 320000 ps;
	reset <= '1';
	WAIT FOR 20000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;

-- start
t_prcs_start: PROCESS
BEGIN
	start <= '0';
	WAIT FOR 50000 ps;
	start <= '1';
	WAIT FOR 30000 ps;
	start <= '0';
	WAIT FOR 220000 ps;
	start <= '1';
	WAIT FOR 10000 ps;
	start <= '0';
	WAIT FOR 380000 ps;
	start <= '1';
	WAIT FOR 20000 ps;
	start <= '0';
WAIT;
END PROCESS t_prcs_start;

-- stop
t_prcs_stop: PROCESS
BEGIN
	stop <= '0';
	WAIT FOR 230000 ps;
	stop <= '1';
	WAIT FOR 20000 ps;
	stop <= '0';
	WAIT FOR 390000 ps;
	stop <= '1';
	WAIT FOR 20000 ps;
	stop <= '0';
WAIT;
END PROCESS t_prcs_stop;
END programador_arch;
