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
-- Generated on "06/03/2024 12:32:07"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          i2c_fsm_2
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY i2c_fsm_2_vhd_vec_tst IS
END i2c_fsm_2_vhd_vec_tst;
ARCHITECTURE i2c_fsm_2_arch OF i2c_fsm_2_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL address : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL busy : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL data_LSB : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL data_MSB : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL enable : STD_LOGIC;
SIGNAL error : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL SCA : STD_LOGIC;
SIGNAL SDA : STD_LOGIC;
SIGNAL start : STD_LOGIC;
SIGNAL stop : STD_LOGIC;
COMPONENT i2c_fsm_2
	PORT (
	address : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	busy : OUT STD_LOGIC;
	clk : IN STD_LOGIC;
	data_LSB : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	data_MSB : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	enable : IN STD_LOGIC;
	error : OUT STD_LOGIC;
	reset : IN STD_LOGIC;
	SCA : INOUT STD_LOGIC;
	SDA : INOUT STD_LOGIC;
	start : IN STD_LOGIC;
	stop : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : i2c_fsm_2
	PORT MAP (
-- list connections between master ports and signals
	address => address,
	busy => busy,
	clk => clk,
	data_LSB => data_LSB,
	data_MSB => data_MSB,
	enable => enable,
	error => error,
	reset => reset,
	SCA => SCA,
	SDA => SDA,
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
	IF (NOW >= 10000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- enable
t_prcs_enable: PROCESS
BEGIN
	enable <= '1';
WAIT;
END PROCESS t_prcs_enable;

-- stop
t_prcs_stop: PROCESS
BEGIN
	stop <= '0';
WAIT;
END PROCESS t_prcs_stop;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '1';
	WAIT FOR 20000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;

-- start
t_prcs_start: PROCESS
BEGIN
	start <= '0';
	WAIT FOR 20000 ps;
	start <= '1';
	WAIT FOR 80000 ps;
	start <= '0';
WAIT;
END PROCESS t_prcs_start;
-- address[7]
t_prcs_address_7: PROCESS
BEGIN
	address(7) <= '0';
WAIT;
END PROCESS t_prcs_address_7;
-- address[6]
t_prcs_address_6: PROCESS
BEGIN
	address(6) <= '0';
WAIT;
END PROCESS t_prcs_address_6;
-- address[5]
t_prcs_address_5: PROCESS
BEGIN
	address(5) <= '0';
WAIT;
END PROCESS t_prcs_address_5;
-- address[4]
t_prcs_address_4: PROCESS
BEGIN
	address(4) <= '0';
WAIT;
END PROCESS t_prcs_address_4;
-- address[3]
t_prcs_address_3: PROCESS
BEGIN
	address(3) <= '0';
WAIT;
END PROCESS t_prcs_address_3;
-- address[2]
t_prcs_address_2: PROCESS
BEGIN
	address(2) <= '1';
WAIT;
END PROCESS t_prcs_address_2;
-- address[1]
t_prcs_address_1: PROCESS
BEGIN
	address(1) <= '1';
WAIT;
END PROCESS t_prcs_address_1;
-- address[0]
t_prcs_address_0: PROCESS
BEGIN
	address(0) <= '1';
WAIT;
END PROCESS t_prcs_address_0;
-- data_LSB[7]
t_prcs_data_LSB_7: PROCESS
BEGIN
	data_LSB(7) <= '0';
WAIT;
END PROCESS t_prcs_data_LSB_7;
-- data_LSB[6]
t_prcs_data_LSB_6: PROCESS
BEGIN
	data_LSB(6) <= '0';
WAIT;
END PROCESS t_prcs_data_LSB_6;
-- data_LSB[5]
t_prcs_data_LSB_5: PROCESS
BEGIN
	data_LSB(5) <= '0';
WAIT;
END PROCESS t_prcs_data_LSB_5;
-- data_LSB[4]
t_prcs_data_LSB_4: PROCESS
BEGIN
	data_LSB(4) <= '0';
WAIT;
END PROCESS t_prcs_data_LSB_4;
-- data_LSB[3]
t_prcs_data_LSB_3: PROCESS
BEGIN
	data_LSB(3) <= '0';
WAIT;
END PROCESS t_prcs_data_LSB_3;
-- data_LSB[2]
t_prcs_data_LSB_2: PROCESS
BEGIN
	data_LSB(2) <= '0';
WAIT;
END PROCESS t_prcs_data_LSB_2;
-- data_LSB[1]
t_prcs_data_LSB_1: PROCESS
BEGIN
	data_LSB(1) <= '0';
WAIT;
END PROCESS t_prcs_data_LSB_1;
-- data_LSB[0]
t_prcs_data_LSB_0: PROCESS
BEGIN
	data_LSB(0) <= '0';
WAIT;
END PROCESS t_prcs_data_LSB_0;
-- data_MSB[7]
t_prcs_data_MSB_7: PROCESS
BEGIN
	data_MSB(7) <= '0';
WAIT;
END PROCESS t_prcs_data_MSB_7;
-- data_MSB[6]
t_prcs_data_MSB_6: PROCESS
BEGIN
	data_MSB(6) <= '0';
WAIT;
END PROCESS t_prcs_data_MSB_6;
-- data_MSB[5]
t_prcs_data_MSB_5: PROCESS
BEGIN
	data_MSB(5) <= '0';
WAIT;
END PROCESS t_prcs_data_MSB_5;
-- data_MSB[4]
t_prcs_data_MSB_4: PROCESS
BEGIN
	data_MSB(4) <= '0';
WAIT;
END PROCESS t_prcs_data_MSB_4;
-- data_MSB[3]
t_prcs_data_MSB_3: PROCESS
BEGIN
	data_MSB(3) <= '0';
WAIT;
END PROCESS t_prcs_data_MSB_3;
-- data_MSB[2]
t_prcs_data_MSB_2: PROCESS
BEGIN
	data_MSB(2) <= '0';
WAIT;
END PROCESS t_prcs_data_MSB_2;
-- data_MSB[1]
t_prcs_data_MSB_1: PROCESS
BEGIN
	data_MSB(1) <= '1';
WAIT;
END PROCESS t_prcs_data_MSB_1;
-- data_MSB[0]
t_prcs_data_MSB_0: PROCESS
BEGIN
	data_MSB(0) <= '0';
WAIT;
END PROCESS t_prcs_data_MSB_0;

-- SCA
t_prcs_SCA: PROCESS
BEGIN
	SCA <= 'Z';
	WAIT FOR 999000 ps;
	SCA <= '0';
WAIT;
END PROCESS t_prcs_SCA;

-- SDA
t_prcs_SDA: PROCESS
BEGIN
	SDA <= 'Z';
	WAIT FOR 999000 ps;
	SDA <= '0';
WAIT;
END PROCESS t_prcs_SDA;
END i2c_fsm_2_arch;
