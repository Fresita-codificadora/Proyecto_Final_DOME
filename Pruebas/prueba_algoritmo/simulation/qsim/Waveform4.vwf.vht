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
-- Generated on "09/26/2024 10:18:37"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          maximo_2
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY maximo_2_vhd_vec_tst IS
END maximo_2_vhd_vec_tst;
ARCHITECTURE maximo_2_arch OF maximo_2_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL maximo : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL reg1 : STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL reg2 : STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL reg3 : STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL reg4 : STD_LOGIC_VECTOR(10 DOWNTO 0);
COMPONENT maximo_2
	PORT (
	maximo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	reg1 : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
	reg2 : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
	reg3 : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
	reg4 : IN STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : maximo_2
	PORT MAP (
-- list connections between master ports and signals
	maximo => maximo,
	reg1 => reg1,
	reg2 => reg2,
	reg3 => reg3,
	reg4 => reg4
	);
-- reg1[10]
t_prcs_reg1_10: PROCESS
BEGIN
	reg1(10) <= '0';
WAIT;
END PROCESS t_prcs_reg1_10;
-- reg1[9]
t_prcs_reg1_9: PROCESS
BEGIN
	reg1(9) <= '0';
WAIT;
END PROCESS t_prcs_reg1_9;
-- reg1[8]
t_prcs_reg1_8: PROCESS
BEGIN
	reg1(8) <= '0';
WAIT;
END PROCESS t_prcs_reg1_8;
-- reg1[7]
t_prcs_reg1_7: PROCESS
BEGIN
	reg1(7) <= '0';
WAIT;
END PROCESS t_prcs_reg1_7;
-- reg1[6]
t_prcs_reg1_6: PROCESS
BEGIN
	reg1(6) <= '0';
WAIT;
END PROCESS t_prcs_reg1_6;
-- reg1[5]
t_prcs_reg1_5: PROCESS
BEGIN
	reg1(5) <= '1';
WAIT;
END PROCESS t_prcs_reg1_5;
-- reg1[4]
t_prcs_reg1_4: PROCESS
BEGIN
	reg1(4) <= '1';
WAIT;
END PROCESS t_prcs_reg1_4;
-- reg1[3]
t_prcs_reg1_3: PROCESS
BEGIN
	reg1(3) <= '0';
	WAIT FOR 600000 ps;
	reg1(3) <= '1';
WAIT;
END PROCESS t_prcs_reg1_3;
-- reg1[2]
t_prcs_reg1_2: PROCESS
BEGIN
	reg1(2) <= '0';
	WAIT FOR 200000 ps;
	reg1(2) <= '1';
	WAIT FOR 400000 ps;
	reg1(2) <= '0';
WAIT;
END PROCESS t_prcs_reg1_2;
-- reg1[1]
t_prcs_reg1_1: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		reg1(1) <= '1';
		WAIT FOR 200000 ps;
		reg1(1) <= '0';
		WAIT FOR 200000 ps;
	END LOOP;
	reg1(1) <= '1';
WAIT;
END PROCESS t_prcs_reg1_1;
-- reg1[0]
t_prcs_reg1_0: PROCESS
BEGIN
LOOP
	reg1(0) <= '0';
	WAIT FOR 100000 ps;
	reg1(0) <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_reg1_0;
-- reg2[10]
t_prcs_reg2_10: PROCESS
BEGIN
	reg2(10) <= '0';
WAIT;
END PROCESS t_prcs_reg2_10;
-- reg2[9]
t_prcs_reg2_9: PROCESS
BEGIN
	reg2(9) <= '0';
WAIT;
END PROCESS t_prcs_reg2_9;
-- reg2[8]
t_prcs_reg2_8: PROCESS
BEGIN
	reg2(8) <= '0';
WAIT;
END PROCESS t_prcs_reg2_8;
-- reg2[7]
t_prcs_reg2_7: PROCESS
BEGIN
	reg2(7) <= '0';
WAIT;
END PROCESS t_prcs_reg2_7;
-- reg2[6]
t_prcs_reg2_6: PROCESS
BEGIN
	reg2(6) <= '0';
	WAIT FOR 475000 ps;
	reg2(6) <= '1';
WAIT;
END PROCESS t_prcs_reg2_6;
-- reg2[5]
t_prcs_reg2_5: PROCESS
BEGIN
	reg2(5) <= '1';
	WAIT FOR 475000 ps;
	reg2(5) <= '0';
WAIT;
END PROCESS t_prcs_reg2_5;
-- reg2[4]
t_prcs_reg2_4: PROCESS
BEGIN
	reg2(4) <= '0';
	WAIT FOR 75000 ps;
	reg2(4) <= '1';
	WAIT FOR 400000 ps;
	reg2(4) <= '0';
	WAIT FOR 400000 ps;
	reg2(4) <= '1';
WAIT;
END PROCESS t_prcs_reg2_4;
-- reg2[3]
t_prcs_reg2_3: PROCESS
BEGIN
	reg2(3) <= '1';
	WAIT FOR 75000 ps;
	FOR i IN 1 TO 2
	LOOP
		reg2(3) <= '0';
		WAIT FOR 200000 ps;
		reg2(3) <= '1';
		WAIT FOR 200000 ps;
	END LOOP;
	reg2(3) <= '0';
WAIT;
END PROCESS t_prcs_reg2_3;
-- reg2[2]
t_prcs_reg2_2: PROCESS
BEGIN
	reg2(2) <= '1';
	WAIT FOR 75000 ps;
	FOR i IN 1 TO 4
	LOOP
		reg2(2) <= '0';
		WAIT FOR 100000 ps;
		reg2(2) <= '1';
		WAIT FOR 100000 ps;
	END LOOP;
	reg2(2) <= '0';
	WAIT FOR 100000 ps;
	reg2(2) <= '1';
WAIT;
END PROCESS t_prcs_reg2_2;
-- reg2[1]
t_prcs_reg2_1: PROCESS
BEGIN
	reg2(1) <= '0';
	WAIT FOR 25000 ps;
	FOR i IN 1 TO 9
	LOOP
		reg2(1) <= '1';
		WAIT FOR 50000 ps;
		reg2(1) <= '0';
		WAIT FOR 50000 ps;
	END LOOP;
	reg2(1) <= '1';
	WAIT FOR 50000 ps;
	reg2(1) <= '0';
WAIT;
END PROCESS t_prcs_reg2_1;
-- reg2[0]
t_prcs_reg2_0: PROCESS
BEGIN
LOOP
	reg2(0) <= '1';
	WAIT FOR 25000 ps;
	reg2(0) <= '0';
	WAIT FOR 25000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_reg2_0;
-- reg3[10]
t_prcs_reg3_10: PROCESS
BEGIN
	reg3(10) <= '0';
WAIT;
END PROCESS t_prcs_reg3_10;
-- reg3[9]
t_prcs_reg3_9: PROCESS
BEGIN
	reg3(9) <= '0';
WAIT;
END PROCESS t_prcs_reg3_9;
-- reg3[8]
t_prcs_reg3_8: PROCESS
BEGIN
	reg3(8) <= '0';
WAIT;
END PROCESS t_prcs_reg3_8;
-- reg3[7]
t_prcs_reg3_7: PROCESS
BEGIN
	reg3(7) <= '0';
WAIT;
END PROCESS t_prcs_reg3_7;
-- reg3[6]
t_prcs_reg3_6: PROCESS
BEGIN
	reg3(6) <= '0';
	WAIT FOR 408000 ps;
	reg3(6) <= '1';
WAIT;
END PROCESS t_prcs_reg3_6;
-- reg3[5]
t_prcs_reg3_5: PROCESS
BEGIN
	reg3(5) <= '0';
	WAIT FOR 24000 ps;
	reg3(5) <= '1';
	WAIT FOR 384000 ps;
	reg3(5) <= '0';
	WAIT FOR 384000 ps;
	reg3(5) <= '1';
WAIT;
END PROCESS t_prcs_reg3_5;
-- reg3[4]
t_prcs_reg3_4: PROCESS
BEGIN
	reg3(4) <= '1';
	WAIT FOR 24000 ps;
	FOR i IN 1 TO 2
	LOOP
		reg3(4) <= '0';
		WAIT FOR 192000 ps;
		reg3(4) <= '1';
		WAIT FOR 192000 ps;
	END LOOP;
	reg3(4) <= '0';
	WAIT FOR 192000 ps;
	reg3(4) <= '1';
WAIT;
END PROCESS t_prcs_reg3_4;
-- reg3[3]
t_prcs_reg3_3: PROCESS
BEGIN
	reg3(3) <= '1';
	WAIT FOR 24000 ps;
	FOR i IN 1 TO 5
	LOOP
		reg3(3) <= '0';
		WAIT FOR 96000 ps;
		reg3(3) <= '1';
		WAIT FOR 96000 ps;
	END LOOP;
	reg3(3) <= '0';
WAIT;
END PROCESS t_prcs_reg3_3;
-- reg3[2]
t_prcs_reg3_2: PROCESS
BEGIN
	reg3(2) <= '1';
	WAIT FOR 24000 ps;
	FOR i IN 1 TO 10
	LOOP
		reg3(2) <= '0';
		WAIT FOR 48000 ps;
		reg3(2) <= '1';
		WAIT FOR 48000 ps;
	END LOOP;
	reg3(2) <= '0';
WAIT;
END PROCESS t_prcs_reg3_2;
-- reg3[1]
t_prcs_reg3_1: PROCESS
BEGIN
	FOR i IN 1 TO 20
	LOOP
		reg3(1) <= '1';
		WAIT FOR 24000 ps;
		reg3(1) <= '0';
		WAIT FOR 24000 ps;
	END LOOP;
	reg3(1) <= '1';
	WAIT FOR 24000 ps;
	reg3(1) <= '0';
WAIT;
END PROCESS t_prcs_reg3_1;
-- reg3[0]
t_prcs_reg3_0: PROCESS
BEGIN
	FOR i IN 1 TO 41
	LOOP
		reg3(0) <= '0';
		WAIT FOR 12000 ps;
		reg3(0) <= '1';
		WAIT FOR 12000 ps;
	END LOOP;
	reg3(0) <= '0';
	WAIT FOR 12000 ps;
	reg3(0) <= '1';
WAIT;
END PROCESS t_prcs_reg3_0;
-- reg4[10]
t_prcs_reg4_10: PROCESS
BEGIN
	reg4(10) <= '0';
WAIT;
END PROCESS t_prcs_reg4_10;
-- reg4[9]
t_prcs_reg4_9: PROCESS
BEGIN
	reg4(9) <= '0';
WAIT;
END PROCESS t_prcs_reg4_9;
-- reg4[8]
t_prcs_reg4_8: PROCESS
BEGIN
	reg4(8) <= '0';
WAIT;
END PROCESS t_prcs_reg4_8;
-- reg4[7]
t_prcs_reg4_7: PROCESS
BEGIN
	reg4(7) <= '0';
	WAIT FOR 640000 ps;
	reg4(7) <= '1';
WAIT;
END PROCESS t_prcs_reg4_7;
-- reg4[6]
t_prcs_reg4_6: PROCESS
BEGIN
	reg4(6) <= '0';
	WAIT FOR 320000 ps;
	reg4(6) <= '1';
	WAIT FOR 320000 ps;
	reg4(6) <= '0';
	WAIT FOR 320000 ps;
	reg4(6) <= '1';
WAIT;
END PROCESS t_prcs_reg4_6;
-- reg4[5]
t_prcs_reg4_5: PROCESS
BEGIN
	FOR i IN 1 TO 3
	LOOP
		reg4(5) <= '0';
		WAIT FOR 160000 ps;
		reg4(5) <= '1';
		WAIT FOR 160000 ps;
	END LOOP;
	reg4(5) <= '0';
WAIT;
END PROCESS t_prcs_reg4_5;
-- reg4[4]
t_prcs_reg4_4: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		reg4(4) <= '0';
		WAIT FOR 80000 ps;
		reg4(4) <= '1';
		WAIT FOR 80000 ps;
	END LOOP;
	reg4(4) <= '0';
WAIT;
END PROCESS t_prcs_reg4_4;
-- reg4[3]
t_prcs_reg4_3: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		reg4(3) <= '0';
		WAIT FOR 40000 ps;
		reg4(3) <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	reg4(3) <= '0';
WAIT;
END PROCESS t_prcs_reg4_3;
-- reg4[2]
t_prcs_reg4_2: PROCESS
BEGIN
LOOP
	reg4(2) <= '0';
	WAIT FOR 20000 ps;
	reg4(2) <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_reg4_2;
-- reg4[1]
t_prcs_reg4_1: PROCESS
BEGIN
LOOP
	reg4(1) <= '0';
	WAIT FOR 10000 ps;
	reg4(1) <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_reg4_1;
-- reg4[0]
t_prcs_reg4_0: PROCESS
BEGIN
LOOP
	reg4(0) <= '0';
	WAIT FOR 5000 ps;
	reg4(0) <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_reg4_0;
END maximo_2_arch;
