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
-- Generated on "05/08/2024 11:40:19"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          controlador
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY controlador_vhd_vec_tst IS
END controlador_vhd_vec_tst;
ARCHITECTURE controlador_arch OF controlador_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL buisy : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL clk_o : STD_LOGIC;
SIGNAL data : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL done_s : STD_LOGIC;
SIGNAL err : STD_LOGIC;
SIGNAL r_s : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL s_t : STD_LOGIC;
SIGNAL start : STD_LOGIC;
SIGNAL stop : STD_LOGIC;
SIGNAL w : STD_LOGIC;
COMPONENT controlador
	PORT (
	buisy : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	clk_o : OUT STD_LOGIC;
	data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	done_s : OUT STD_LOGIC;
	err : IN STD_LOGIC;
	r_s : OUT STD_LOGIC;
	reset : IN STD_LOGIC;
	s_t : OUT STD_LOGIC;
	start : IN STD_LOGIC;
	stop : OUT STD_LOGIC;
	w : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : controlador
	PORT MAP (
-- list connections between master ports and signals
	buisy => buisy,
	clk => clk,
	clk_o => clk_o,
	data => data,
	done_s => done_s,
	err => err,
	r_s => r_s,
	reset => reset,
	s_t => s_t,
	start => start,
	stop => stop,
	w => w
	);

-- buisy
t_prcs_buisy: PROCESS
BEGIN
	buisy <= '0';
WAIT;
END PROCESS t_prcs_buisy;

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

-- err
t_prcs_err: PROCESS
BEGIN
	err <= '0';
WAIT;
END PROCESS t_prcs_err;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '1';
	WAIT FOR 30000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;

-- start
t_prcs_start: PROCESS
BEGIN
	start <= '0';
	WAIT FOR 30000 ps;
	start <= '1';
	WAIT FOR 20000 ps;
	start <= '0';
WAIT;
END PROCESS t_prcs_start;
END controlador_arch;
