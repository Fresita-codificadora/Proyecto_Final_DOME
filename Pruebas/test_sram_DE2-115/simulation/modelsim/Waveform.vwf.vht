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
-- Generated on "06/30/2024 13:11:42"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          sram
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY sram_vhd_vec_tst IS
END sram_vhd_vec_tst;
ARCHITECTURE sram_arch OF sram_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL ACTION : STD_LOGIC;
SIGNAL ADDR : STD_LOGIC_VECTOR(19 DOWNTO 0);
SIGNAL CLOCK : STD_LOGIC;
SIGNAL DATA_IN : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL DATA_OUT : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL RESET_N : STD_LOGIC;
SIGNAL SRAM_ADDR : STD_LOGIC_VECTOR(19 DOWNTO 0);
SIGNAL SRAM_CE_N : STD_LOGIC;
SIGNAL SRAM_DQ : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL SRAM_LB_N : STD_LOGIC;
SIGNAL SRAM_OE_N : STD_LOGIC;
SIGNAL SRAM_UB_N : STD_LOGIC;
SIGNAL SRAM_WE_N : STD_LOGIC;
COMPONENT sram
	PORT (
	ACTION : IN STD_LOGIC;
	ADDR : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
	CLOCK : IN STD_LOGIC;
	DATA_IN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	DATA_OUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	RESET_N : IN STD_LOGIC;
	SRAM_ADDR : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
	SRAM_CE_N : OUT STD_LOGIC;
	SRAM_DQ : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	SRAM_LB_N : OUT STD_LOGIC;
	SRAM_OE_N : OUT STD_LOGIC;
	SRAM_UB_N : OUT STD_LOGIC;
	SRAM_WE_N : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : sram
	PORT MAP (
-- list connections between master ports and signals
	ACTION => ACTION,
	ADDR => ADDR,
	CLOCK => CLOCK,
	DATA_IN => DATA_IN,
	DATA_OUT => DATA_OUT,
	RESET_N => RESET_N,
	SRAM_ADDR => SRAM_ADDR,
	SRAM_CE_N => SRAM_CE_N,
	SRAM_DQ => SRAM_DQ,
	SRAM_LB_N => SRAM_LB_N,
	SRAM_OE_N => SRAM_OE_N,
	SRAM_UB_N => SRAM_UB_N,
	SRAM_WE_N => SRAM_WE_N
	);

-- CLOCK
t_prcs_CLOCK: PROCESS
BEGIN
LOOP
	CLOCK <= '0';
	WAIT FOR 5000 ps;
	CLOCK <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLOCK;

-- ACTION
t_prcs_ACTION: PROCESS
BEGIN
	ACTION <= '1';
WAIT;
END PROCESS t_prcs_ACTION;

-- RESET_N
t_prcs_RESET_N: PROCESS
BEGIN
	RESET_N <= '0';
	WAIT FOR 60000 ps;
	RESET_N <= '1';
WAIT;
END PROCESS t_prcs_RESET_N;
-- ADDR[19]
t_prcs_ADDR_19: PROCESS
BEGIN
	ADDR(19) <= '1';
WAIT;
END PROCESS t_prcs_ADDR_19;
-- ADDR[18]
t_prcs_ADDR_18: PROCESS
BEGIN
	ADDR(18) <= '1';
WAIT;
END PROCESS t_prcs_ADDR_18;
-- ADDR[17]
t_prcs_ADDR_17: PROCESS
BEGIN
	ADDR(17) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_17;
-- ADDR[16]
t_prcs_ADDR_16: PROCESS
BEGIN
	ADDR(16) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_16;
-- ADDR[15]
t_prcs_ADDR_15: PROCESS
BEGIN
	ADDR(15) <= '1';
WAIT;
END PROCESS t_prcs_ADDR_15;
-- ADDR[14]
t_prcs_ADDR_14: PROCESS
BEGIN
	ADDR(14) <= '1';
WAIT;
END PROCESS t_prcs_ADDR_14;
-- ADDR[13]
t_prcs_ADDR_13: PROCESS
BEGIN
	ADDR(13) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_13;
-- ADDR[12]
t_prcs_ADDR_12: PROCESS
BEGIN
	ADDR(12) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_12;
-- ADDR[11]
t_prcs_ADDR_11: PROCESS
BEGIN
	ADDR(11) <= '1';
WAIT;
END PROCESS t_prcs_ADDR_11;
-- ADDR[10]
t_prcs_ADDR_10: PROCESS
BEGIN
	ADDR(10) <= '1';
WAIT;
END PROCESS t_prcs_ADDR_10;
-- ADDR[9]
t_prcs_ADDR_9: PROCESS
BEGIN
	ADDR(9) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_9;
-- ADDR[8]
t_prcs_ADDR_8: PROCESS
BEGIN
	ADDR(8) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_8;
-- ADDR[7]
t_prcs_ADDR_7: PROCESS
BEGIN
	ADDR(7) <= '1';
WAIT;
END PROCESS t_prcs_ADDR_7;
-- ADDR[6]
t_prcs_ADDR_6: PROCESS
BEGIN
	ADDR(6) <= '1';
WAIT;
END PROCESS t_prcs_ADDR_6;
-- ADDR[5]
t_prcs_ADDR_5: PROCESS
BEGIN
	ADDR(5) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_5;
-- ADDR[4]
t_prcs_ADDR_4: PROCESS
BEGIN
	ADDR(4) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_4;
-- ADDR[3]
t_prcs_ADDR_3: PROCESS
BEGIN
	ADDR(3) <= '1';
WAIT;
END PROCESS t_prcs_ADDR_3;
-- ADDR[2]
t_prcs_ADDR_2: PROCESS
BEGIN
	ADDR(2) <= '1';
WAIT;
END PROCESS t_prcs_ADDR_2;
-- ADDR[1]
t_prcs_ADDR_1: PROCESS
BEGIN
	ADDR(1) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_1;
-- ADDR[0]
t_prcs_ADDR_0: PROCESS
BEGIN
	ADDR(0) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_0;
-- DATA_IN[15]
t_prcs_DATA_IN_15: PROCESS
BEGIN
	DATA_IN(15) <= '0';
	WAIT FOR 50000 ps;
	DATA_IN(15) <= '1';
	WAIT FOR 320000 ps;
	DATA_IN(15) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_15;
-- DATA_IN[14]
t_prcs_DATA_IN_14: PROCESS
BEGIN
	DATA_IN(14) <= '0';
	WAIT FOR 50000 ps;
	DATA_IN(14) <= '1';
	WAIT FOR 320000 ps;
	DATA_IN(14) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_14;
-- DATA_IN[13]
t_prcs_DATA_IN_13: PROCESS
BEGIN
	DATA_IN(13) <= '0';
	WAIT FOR 50000 ps;
	DATA_IN(13) <= '1';
	WAIT FOR 320000 ps;
	DATA_IN(13) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_13;
-- DATA_IN[12]
t_prcs_DATA_IN_12: PROCESS
BEGIN
	DATA_IN(12) <= '0';
	WAIT FOR 50000 ps;
	DATA_IN(12) <= '1';
	WAIT FOR 320000 ps;
	DATA_IN(12) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_12;
-- DATA_IN[11]
t_prcs_DATA_IN_11: PROCESS
BEGIN
	DATA_IN(11) <= '0';
	WAIT FOR 50000 ps;
	DATA_IN(11) <= '1';
	WAIT FOR 320000 ps;
	DATA_IN(11) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_11;
-- DATA_IN[10]
t_prcs_DATA_IN_10: PROCESS
BEGIN
	DATA_IN(10) <= '0';
	WAIT FOR 50000 ps;
	DATA_IN(10) <= '1';
	WAIT FOR 320000 ps;
	DATA_IN(10) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_10;
-- DATA_IN[9]
t_prcs_DATA_IN_9: PROCESS
BEGIN
	DATA_IN(9) <= '0';
	WAIT FOR 50000 ps;
	DATA_IN(9) <= '1';
	WAIT FOR 320000 ps;
	DATA_IN(9) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_9;
-- DATA_IN[8]
t_prcs_DATA_IN_8: PROCESS
BEGIN
	DATA_IN(8) <= '0';
	WAIT FOR 50000 ps;
	DATA_IN(8) <= '1';
	WAIT FOR 320000 ps;
	DATA_IN(8) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_8;
-- DATA_IN[7]
t_prcs_DATA_IN_7: PROCESS
BEGIN
	DATA_IN(7) <= '0';
	WAIT FOR 50000 ps;
	DATA_IN(7) <= '1';
	WAIT FOR 320000 ps;
	DATA_IN(7) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_7;
-- DATA_IN[6]
t_prcs_DATA_IN_6: PROCESS
BEGIN
	DATA_IN(6) <= '0';
	WAIT FOR 50000 ps;
	DATA_IN(6) <= '1';
	WAIT FOR 320000 ps;
	DATA_IN(6) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_6;
-- DATA_IN[5]
t_prcs_DATA_IN_5: PROCESS
BEGIN
	DATA_IN(5) <= '0';
	WAIT FOR 50000 ps;
	DATA_IN(5) <= '1';
	WAIT FOR 320000 ps;
	DATA_IN(5) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_5;
-- DATA_IN[4]
t_prcs_DATA_IN_4: PROCESS
BEGIN
	DATA_IN(4) <= '0';
	WAIT FOR 50000 ps;
	DATA_IN(4) <= '1';
	WAIT FOR 320000 ps;
	DATA_IN(4) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_4;
-- DATA_IN[3]
t_prcs_DATA_IN_3: PROCESS
BEGIN
	DATA_IN(3) <= '0';
	WAIT FOR 50000 ps;
	DATA_IN(3) <= '1';
	WAIT FOR 320000 ps;
	DATA_IN(3) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_3;
-- DATA_IN[2]
t_prcs_DATA_IN_2: PROCESS
BEGIN
	DATA_IN(2) <= '0';
	WAIT FOR 50000 ps;
	DATA_IN(2) <= '1';
	WAIT FOR 320000 ps;
	DATA_IN(2) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_2;
-- DATA_IN[1]
t_prcs_DATA_IN_1: PROCESS
BEGIN
	DATA_IN(1) <= '0';
	WAIT FOR 50000 ps;
	DATA_IN(1) <= '1';
	WAIT FOR 320000 ps;
	DATA_IN(1) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_1;
-- DATA_IN[0]
t_prcs_DATA_IN_0: PROCESS
BEGIN
	DATA_IN(0) <= '0';
	WAIT FOR 50000 ps;
	DATA_IN(0) <= '1';
	WAIT FOR 320000 ps;
	DATA_IN(0) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_0;
-- SRAM_DQ[15]
t_prcs_SRAM_DQ_15: PROCESS
BEGIN
	SRAM_DQ(15) <= 'Z';
WAIT;
END PROCESS t_prcs_SRAM_DQ_15;
-- SRAM_DQ[14]
t_prcs_SRAM_DQ_14: PROCESS
BEGIN
	SRAM_DQ(14) <= 'Z';
WAIT;
END PROCESS t_prcs_SRAM_DQ_14;
-- SRAM_DQ[13]
t_prcs_SRAM_DQ_13: PROCESS
BEGIN
	SRAM_DQ(13) <= 'Z';
WAIT;
END PROCESS t_prcs_SRAM_DQ_13;
-- SRAM_DQ[12]
t_prcs_SRAM_DQ_12: PROCESS
BEGIN
	SRAM_DQ(12) <= 'Z';
WAIT;
END PROCESS t_prcs_SRAM_DQ_12;
-- SRAM_DQ[11]
t_prcs_SRAM_DQ_11: PROCESS
BEGIN
	SRAM_DQ(11) <= 'Z';
WAIT;
END PROCESS t_prcs_SRAM_DQ_11;
-- SRAM_DQ[10]
t_prcs_SRAM_DQ_10: PROCESS
BEGIN
	SRAM_DQ(10) <= 'Z';
WAIT;
END PROCESS t_prcs_SRAM_DQ_10;
-- SRAM_DQ[9]
t_prcs_SRAM_DQ_9: PROCESS
BEGIN
	SRAM_DQ(9) <= 'Z';
WAIT;
END PROCESS t_prcs_SRAM_DQ_9;
-- SRAM_DQ[8]
t_prcs_SRAM_DQ_8: PROCESS
BEGIN
	SRAM_DQ(8) <= 'Z';
WAIT;
END PROCESS t_prcs_SRAM_DQ_8;
-- SRAM_DQ[7]
t_prcs_SRAM_DQ_7: PROCESS
BEGIN
	SRAM_DQ(7) <= 'Z';
WAIT;
END PROCESS t_prcs_SRAM_DQ_7;
-- SRAM_DQ[6]
t_prcs_SRAM_DQ_6: PROCESS
BEGIN
	SRAM_DQ(6) <= 'Z';
WAIT;
END PROCESS t_prcs_SRAM_DQ_6;
-- SRAM_DQ[5]
t_prcs_SRAM_DQ_5: PROCESS
BEGIN
	SRAM_DQ(5) <= 'Z';
WAIT;
END PROCESS t_prcs_SRAM_DQ_5;
-- SRAM_DQ[4]
t_prcs_SRAM_DQ_4: PROCESS
BEGIN
	SRAM_DQ(4) <= 'Z';
WAIT;
END PROCESS t_prcs_SRAM_DQ_4;
-- SRAM_DQ[3]
t_prcs_SRAM_DQ_3: PROCESS
BEGIN
	SRAM_DQ(3) <= 'Z';
WAIT;
END PROCESS t_prcs_SRAM_DQ_3;
-- SRAM_DQ[2]
t_prcs_SRAM_DQ_2: PROCESS
BEGIN
	SRAM_DQ(2) <= 'Z';
WAIT;
END PROCESS t_prcs_SRAM_DQ_2;
-- SRAM_DQ[1]
t_prcs_SRAM_DQ_1: PROCESS
BEGIN
	SRAM_DQ(1) <= 'Z';
WAIT;
END PROCESS t_prcs_SRAM_DQ_1;
-- SRAM_DQ[0]
t_prcs_SRAM_DQ_0: PROCESS
BEGIN
	SRAM_DQ(0) <= 'Z';
WAIT;
END PROCESS t_prcs_SRAM_DQ_0;
END sram_arch;
