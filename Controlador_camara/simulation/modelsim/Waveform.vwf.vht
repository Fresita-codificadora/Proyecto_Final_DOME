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
-- Generated on "05/23/2024 18:11:24"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Capture_Input_Controller
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Capture_Input_Controller_vhd_vec_tst IS
END Capture_Input_Controller_vhd_vec_tst;
ARCHITECTURE Capture_Input_Controller_arch OF Capture_Input_Controller_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL D_in : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL D_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL frame_valid : STD_LOGIC;
SIGNAL leer_s : STD_LOGIC;
SIGNAL line_valid : STD_LOGIC;
SIGNAL pclk : STD_LOGIC;
COMPONENT Capture_Input_Controller
	PORT (
	clk : IN STD_LOGIC;
	D_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	D_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	frame_valid : IN STD_LOGIC;
	leer_s : OUT STD_LOGIC;
	line_valid : IN STD_LOGIC;
	pclk : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Capture_Input_Controller
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	D_in => D_in,
	D_out => D_out,
	frame_valid => frame_valid,
	leer_s => leer_s,
	line_valid => line_valid,
	pclk => pclk
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
-- D_in[7]
t_prcs_D_in_7: PROCESS
BEGIN
	D_in(7) <= '0';
WAIT;
END PROCESS t_prcs_D_in_7;
-- D_in[6]
t_prcs_D_in_6: PROCESS
BEGIN
	D_in(6) <= '0';
WAIT;
END PROCESS t_prcs_D_in_6;
-- D_in[5]
t_prcs_D_in_5: PROCESS
BEGIN
	D_in(5) <= '0';
WAIT;
END PROCESS t_prcs_D_in_5;
-- D_in[4]
t_prcs_D_in_4: PROCESS
BEGIN
	D_in(4) <= '0';
WAIT;
END PROCESS t_prcs_D_in_4;
-- D_in[3]
t_prcs_D_in_3: PROCESS
BEGIN
	D_in(3) <= '0';
	WAIT FOR 800000 ps;
	D_in(3) <= '1';
WAIT;
END PROCESS t_prcs_D_in_3;
-- D_in[2]
t_prcs_D_in_2: PROCESS
BEGIN
	D_in(2) <= '0';
	WAIT FOR 400000 ps;
	D_in(2) <= '1';
	WAIT FOR 400000 ps;
	D_in(2) <= '0';
WAIT;
END PROCESS t_prcs_D_in_2;
-- D_in[1]
t_prcs_D_in_1: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		D_in(1) <= '0';
		WAIT FOR 200000 ps;
		D_in(1) <= '1';
		WAIT FOR 200000 ps;
	END LOOP;
	D_in(1) <= '0';
WAIT;
END PROCESS t_prcs_D_in_1;
-- D_in[0]
t_prcs_D_in_0: PROCESS
BEGIN
LOOP
	D_in(0) <= '0';
	WAIT FOR 100000 ps;
	D_in(0) <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_D_in_0;

-- frame_valid
t_prcs_frame_valid: PROCESS
BEGIN
LOOP
	frame_valid <= '0';
	WAIT FOR 250000 ps;
	frame_valid <= '1';
	WAIT FOR 250000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_frame_valid;

-- line_valid
t_prcs_line_valid: PROCESS
BEGIN
	line_valid <= '1';
	WAIT FOR 27000 ps;
	FOR i IN 1 TO 9
	LOOP
		line_valid <= '0';
		WAIT FOR 50000 ps;
		line_valid <= '1';
		WAIT FOR 50000 ps;
	END LOOP;
	line_valid <= '0';
	WAIT FOR 50000 ps;
	line_valid <= '1';
WAIT;
END PROCESS t_prcs_line_valid;

-- pclk
t_prcs_pclk: PROCESS
BEGIN
LOOP
	pclk <= '0';
	WAIT FOR 25000 ps;
	pclk <= '1';
	WAIT FOR 25000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_pclk;
END Capture_Input_Controller_arch;
