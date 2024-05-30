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
-- Generated on "05/29/2024 19:25:38"
                                                             
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
SIGNAL Buisy_int : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL CLK_int : STD_LOGIC;
SIGNAL clk_out : STD_LOGIC;
SIGNAL Data : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DONE : STD_LOGIC;
SIGNAL ERR_int : STD_LOGIC;
SIGNAL R_W_iknt : STD_LOGIC;
SIGNAL Res_int : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL reset_camara : STD_LOGIC;
SIGNAL S_T_int : STD_LOGIC;
SIGNAL sca : STD_LOGIC;
SIGNAL sda : STD_LOGIC;
SIGNAL start : STD_LOGIC;
SIGNAL stop_int : STD_LOGIC;
SIGNAL trigg : STD_LOGIC;
COMPONENT Block1
	PORT (
	Buisy_int : OUT STD_LOGIC;
	clk : IN STD_LOGIC;
	CLK_int : OUT STD_LOGIC;
	clk_out : OUT STD_LOGIC;
	Data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	DONE : OUT STD_LOGIC;
	ERR_int : OUT STD_LOGIC;
	R_W_iknt : OUT STD_LOGIC;
	Res_int : OUT STD_LOGIC;
	reset : IN STD_LOGIC;
	reset_camara : OUT STD_LOGIC;
	S_T_int : OUT STD_LOGIC;
	sca : OUT STD_LOGIC;
	sda : INOUT STD_LOGIC;
	start : IN STD_LOGIC;
	stop_int : OUT STD_LOGIC;
	trigg : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Block1
	PORT MAP (
-- list connections between master ports and signals
	Buisy_int => Buisy_int,
	clk => clk,
	CLK_int => CLK_int,
	clk_out => clk_out,
	Data => Data,
	DONE => DONE,
	ERR_int => ERR_int,
	R_W_iknt => R_W_iknt,
	Res_int => Res_int,
	reset => reset,
	reset_camara => reset_camara,
	S_T_int => S_T_int,
	sca => sca,
	sda => sda,
	start => start,
	stop_int => stop_int,
	trigg => trigg
	);

-- start
t_prcs_start: PROCESS
BEGIN
	start <= '0';
	WAIT FOR 1040000 ps;
	start <= '1';
WAIT;
END PROCESS t_prcs_start;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
	WAIT FOR 410000 ps;
	reset <= '1';
WAIT;
END PROCESS t_prcs_reset;

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 5000 ps;
	clk <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 10000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- sda
t_prcs_sda: PROCESS
BEGIN
	sda <= 'Z';
WAIT;
END PROCESS t_prcs_sda;
END Block1_arch;
