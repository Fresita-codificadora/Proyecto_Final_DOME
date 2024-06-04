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
-- Generated on "06/02/2024 16:43:09"
                                                             
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
SIGNAL add : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL buisy_int : STD_LOGIC;
SIGNAL CLK : STD_LOGIC;
SIGNAL data_LSB : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL data_MSB : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL done : STD_LOGIC;
SIGNAL enable_int : STD_LOGIC;
SIGNAL r_w_int : STD_LOGIC;
SIGNAL rest : STD_LOGIC;
SIGNAL rst_int : STD_LOGIC;
SIGNAL SCA : STD_LOGIC;
SIGNAL SDA : STD_LOGIC;
SIGNAL start : STD_LOGIC;
COMPONENT Block1
	PORT (
	add : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	buisy_int : OUT STD_LOGIC;
	CLK : IN STD_LOGIC;
	data_LSB : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	data_MSB : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	done : OUT STD_LOGIC;
	enable_int : OUT STD_LOGIC;
	r_w_int : OUT STD_LOGIC;
	rest : IN STD_LOGIC;
	rst_int : OUT STD_LOGIC;
	SCA : INOUT STD_LOGIC;
	SDA : INOUT STD_LOGIC;
	start : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Block1
	PORT MAP (
-- list connections between master ports and signals
	add => add,
	buisy_int => buisy_int,
	CLK => CLK,
	data_LSB => data_LSB,
	data_MSB => data_MSB,
	done => done,
	enable_int => enable_int,
	r_w_int => r_w_int,
	rest => rest,
	rst_int => rst_int,
	SCA => SCA,
	SDA => SDA,
	start => start
	);

-- CLK
t_prcs_CLK: PROCESS
BEGIN
LOOP
	CLK <= '0';
	WAIT FOR 5000 ps;
	CLK <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 10000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLK;

-- rest
t_prcs_rest: PROCESS
BEGIN
	rest <= '0';
	WAIT FOR 140000 ps;
	rest <= '1';
WAIT;
END PROCESS t_prcs_rest;

-- start
t_prcs_start: PROCESS
BEGIN
	start <= '0';
	WAIT FOR 280000 ps;
	start <= '1';
WAIT;
END PROCESS t_prcs_start;

-- SCA
t_prcs_SCA: PROCESS
BEGIN
	SCA <= 'Z';
WAIT;
END PROCESS t_prcs_SCA;

-- SDA
t_prcs_SDA: PROCESS
BEGIN
	SDA <= 'Z';
WAIT;
END PROCESS t_prcs_SDA;
END Block1_arch;
