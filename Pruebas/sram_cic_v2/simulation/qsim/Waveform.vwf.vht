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
-- Generated on "09/05/2024 17:16:10"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          prueba_1
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY prueba_1_vhd_vec_tst IS
END prueba_1_vhd_vec_tst;
ARCHITECTURE prueba_1_arch OF prueba_1_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk_50 : STD_LOGIC;
SIGNAL trigger_camara : STD_LOGIC;
SIGNAL trigger_i : STD_LOGIC;
SIGNAL trigger_o : STD_LOGIC;
COMPONENT prueba_1
	PORT (
	clk_50 : IN STD_LOGIC;
	trigger_camara : OUT STD_LOGIC;
	trigger_i : IN STD_LOGIC;
	trigger_o : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : prueba_1
	PORT MAP (
-- list connections between master ports and signals
	clk_50 => clk_50,
	trigger_camara => trigger_camara,
	trigger_i => trigger_i,
	trigger_o => trigger_o
	);

-- clk_50
t_prcs_clk_50: PROCESS
BEGIN
LOOP
	clk_50 <= '0';
	WAIT FOR 5000 ps;
	clk_50 <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk_50;

-- trigger_i
t_prcs_trigger_i: PROCESS
BEGIN
	trigger_i <= '1';
	WAIT FOR 60000 ps;
	trigger_i <= '0';
	WAIT FOR 770000 ps;
	trigger_i <= '1';
WAIT;
END PROCESS t_prcs_trigger_i;
END prueba_1_arch;
