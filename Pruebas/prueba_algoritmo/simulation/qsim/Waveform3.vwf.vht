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
-- Generated on "09/22/2024 13:14:12"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          test_algo_sim
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY test_algo_sim_vhd_vec_tst IS
END test_algo_sim_vhd_vec_tst;
ARCHITECTURE test_algo_sim_arch OF test_algo_sim_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL byte_entrada : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL clk : STD_LOGIC;
SIGNAL enable : STD_LOGIC;
SIGNAL estado : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL fifo_data : STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL fifo_data_i : STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL fifo_dir : STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL fifo_rw : STD_LOGIC;
SIGNAL hab_byte : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL trigger : STD_LOGIC;
COMPONENT test_algo_sim
	PORT (
	byte_entrada : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	clk : IN STD_LOGIC;
	enable : IN STD_LOGIC;
	estado : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	fifo_data : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
	fifo_data_i : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
	fifo_dir : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
	fifo_rw : OUT STD_LOGIC;
	hab_byte : IN STD_LOGIC;
	reset : IN STD_LOGIC;
	trigger : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : test_algo_sim
	PORT MAP (
-- list connections between master ports and signals
	byte_entrada => byte_entrada,
	clk => clk,
	enable => enable,
	estado => estado,
	fifo_data => fifo_data,
	fifo_data_i => fifo_data_i,
	fifo_dir => fifo_dir,
	fifo_rw => fifo_rw,
	hab_byte => hab_byte,
	reset => reset,
	trigger => trigger
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
-- byte_entrada[7]
t_prcs_byte_entrada_7: PROCESS
BEGIN
	byte_entrada(7) <= '0';
WAIT;
END PROCESS t_prcs_byte_entrada_7;
-- byte_entrada[6]
t_prcs_byte_entrada_6: PROCESS
BEGIN
	byte_entrada(6) <= '0';
WAIT;
END PROCESS t_prcs_byte_entrada_6;
-- byte_entrada[5]
t_prcs_byte_entrada_5: PROCESS
BEGIN
	byte_entrada(5) <= '0';
WAIT;
END PROCESS t_prcs_byte_entrada_5;
-- byte_entrada[4]
t_prcs_byte_entrada_4: PROCESS
BEGIN
	byte_entrada(4) <= '0';
WAIT;
END PROCESS t_prcs_byte_entrada_4;
-- byte_entrada[3]
t_prcs_byte_entrada_3: PROCESS
BEGIN
	byte_entrada(3) <= '0';
WAIT;
END PROCESS t_prcs_byte_entrada_3;
-- byte_entrada[2]
t_prcs_byte_entrada_2: PROCESS
BEGIN
	byte_entrada(2) <= '0';
WAIT;
END PROCESS t_prcs_byte_entrada_2;
-- byte_entrada[1]
t_prcs_byte_entrada_1: PROCESS
BEGIN
	byte_entrada(1) <= '0';
	WAIT FOR 40000 ps;
	byte_entrada(1) <= '1';
	WAIT FOR 90000 ps;
	byte_entrada(1) <= '0';
	WAIT FOR 190000 ps;
	byte_entrada(1) <= '1';
	WAIT FOR 70000 ps;
	byte_entrada(1) <= '0';
WAIT;
END PROCESS t_prcs_byte_entrada_1;
-- byte_entrada[0]
t_prcs_byte_entrada_0: PROCESS
BEGIN
	byte_entrada(0) <= '0';
	WAIT FOR 320000 ps;
	byte_entrada(0) <= '1';
	WAIT FOR 70000 ps;
	byte_entrada(0) <= '0';
WAIT;
END PROCESS t_prcs_byte_entrada_0;

-- hab_byte
t_prcs_hab_byte: PROCESS
BEGIN
	hab_byte <= '0';
	WAIT FOR 70000 ps;
	hab_byte <= '1';
	WAIT FOR 40000 ps;
	hab_byte <= '0';
	WAIT FOR 220000 ps;
	hab_byte <= '1';
	WAIT FOR 30000 ps;
	hab_byte <= '0';
WAIT;
END PROCESS t_prcs_hab_byte;
-- fifo_data_i[10]
t_prcs_fifo_data_i_10: PROCESS
BEGIN
	fifo_data_i(10) <= '0';
WAIT;
END PROCESS t_prcs_fifo_data_i_10;
-- fifo_data_i[9]
t_prcs_fifo_data_i_9: PROCESS
BEGIN
	fifo_data_i(9) <= '0';
WAIT;
END PROCESS t_prcs_fifo_data_i_9;
-- fifo_data_i[8]
t_prcs_fifo_data_i_8: PROCESS
BEGIN
	fifo_data_i(8) <= '0';
WAIT;
END PROCESS t_prcs_fifo_data_i_8;
-- fifo_data_i[7]
t_prcs_fifo_data_i_7: PROCESS
BEGIN
	fifo_data_i(7) <= '0';
WAIT;
END PROCESS t_prcs_fifo_data_i_7;
-- fifo_data_i[6]
t_prcs_fifo_data_i_6: PROCESS
BEGIN
	fifo_data_i(6) <= '0';
WAIT;
END PROCESS t_prcs_fifo_data_i_6;
-- fifo_data_i[5]
t_prcs_fifo_data_i_5: PROCESS
BEGIN
	fifo_data_i(5) <= '0';
WAIT;
END PROCESS t_prcs_fifo_data_i_5;
-- fifo_data_i[4]
t_prcs_fifo_data_i_4: PROCESS
BEGIN
	fifo_data_i(4) <= '0';
WAIT;
END PROCESS t_prcs_fifo_data_i_4;
-- fifo_data_i[3]
t_prcs_fifo_data_i_3: PROCESS
BEGIN
	fifo_data_i(3) <= '0';
WAIT;
END PROCESS t_prcs_fifo_data_i_3;
-- fifo_data_i[2]
t_prcs_fifo_data_i_2: PROCESS
BEGIN
	fifo_data_i(2) <= '0';
WAIT;
END PROCESS t_prcs_fifo_data_i_2;
-- fifo_data_i[1]
t_prcs_fifo_data_i_1: PROCESS
BEGIN
	fifo_data_i(1) <= '0';
WAIT;
END PROCESS t_prcs_fifo_data_i_1;
-- fifo_data_i[0]
t_prcs_fifo_data_i_0: PROCESS
BEGIN
	fifo_data_i(0) <= '0';
	WAIT FOR 370000 ps;
	fifo_data_i(0) <= '1';
	WAIT FOR 30000 ps;
	fifo_data_i(0) <= '0';
WAIT;
END PROCESS t_prcs_fifo_data_i_0;

-- trigger
t_prcs_trigger: PROCESS
BEGIN
	trigger <= '1';
WAIT;
END PROCESS t_prcs_trigger;

-- enable
t_prcs_enable: PROCESS
BEGIN
	enable <= '1';
WAIT;
END PROCESS t_prcs_enable;
END test_algo_sim_arch;
