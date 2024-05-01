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
-- Generated on "05/01/2024 19:30:33"
                                                             
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
SIGNAL buisy : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL data_in : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL err : STD_LOGIC;
SIGNAL r_w : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL s_t : STD_LOGIC;
SIGNAL sca_o : STD_LOGIC;
SIGNAL sda_o : STD_LOGIC;
SIGNAL stop : STD_LOGIC;
COMPONENT programador
	PORT (
	buisy : OUT STD_LOGIC;
	clk : IN STD_LOGIC;
	data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	err : OUT STD_LOGIC;
	r_w : IN STD_LOGIC;
	reset : IN STD_LOGIC;
	s_t : IN STD_LOGIC;
	sca_o : OUT STD_LOGIC;
	sda_o : INOUT STD_LOGIC;
	stop : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : programador
	PORT MAP (
-- list connections between master ports and signals
	buisy => buisy,
	clk => clk,
	data_in => data_in,
	err => err,
	r_w => r_w,
	reset => reset,
	s_t => s_t,
	sca_o => sca_o,
	sda_o => sda_o,
	stop => stop
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 80000 ps;
	clk <= '1';
	WAIT FOR 80000 ps;
	IF (NOW >= 100000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;
-- data_in[7]
t_prcs_data_in_7: PROCESS
BEGIN
	data_in(7) <= '0';
WAIT;
END PROCESS t_prcs_data_in_7;
-- data_in[6]
t_prcs_data_in_6: PROCESS
BEGIN
	data_in(6) <= '1';
WAIT;
END PROCESS t_prcs_data_in_6;
-- data_in[5]
t_prcs_data_in_5: PROCESS
BEGIN
	data_in(5) <= '0';
WAIT;
END PROCESS t_prcs_data_in_5;
-- data_in[4]
t_prcs_data_in_4: PROCESS
BEGIN
	data_in(4) <= '1';
WAIT;
END PROCESS t_prcs_data_in_4;
-- data_in[3]
t_prcs_data_in_3: PROCESS
BEGIN
	data_in(3) <= '0';
	WAIT FOR 30000000 ps;
	data_in(3) <= '1';
WAIT;
END PROCESS t_prcs_data_in_3;
-- data_in[2]
t_prcs_data_in_2: PROCESS
BEGIN
	data_in(2) <= '1';
	WAIT FOR 30000000 ps;
	data_in(2) <= '0';
	WAIT FOR 40000000 ps;
	data_in(2) <= '1';
WAIT;
END PROCESS t_prcs_data_in_2;
-- data_in[1]
t_prcs_data_in_1: PROCESS
BEGIN
	data_in(1) <= '0';
	WAIT FOR 10000000 ps;
	FOR i IN 1 TO 2
	LOOP
		data_in(1) <= '1';
		WAIT FOR 20000000 ps;
		data_in(1) <= '0';
		WAIT FOR 20000000 ps;
	END LOOP;
	data_in(1) <= '1';
WAIT;
END PROCESS t_prcs_data_in_1;
-- data_in[0]
t_prcs_data_in_0: PROCESS
BEGIN
LOOP
	data_in(0) <= '1';
	WAIT FOR 10000000 ps;
	data_in(0) <= '0';
	WAIT FOR 10000000 ps;
	IF (NOW >= 100000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_data_in_0;

-- r_w
t_prcs_r_w: PROCESS
BEGIN
	r_w <= '1';
WAIT;
END PROCESS t_prcs_r_w;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '1';
	WAIT FOR 240000 ps;
	reset <= '0';
	WAIT FOR 9520000 ps;
	reset <= '1';
	WAIT FOR 320000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;

-- s_t
t_prcs_s_t: PROCESS
BEGIN
	s_t <= '1';
	WAIT FOR 1280000 ps;
	s_t <= '0';
	WAIT FOR 8960000 ps;
	s_t <= '1';
	WAIT FOR 1840000 ps;
	s_t <= '0';
WAIT;
END PROCESS t_prcs_s_t;

-- sda_o
t_prcs_sda_o: PROCESS
BEGIN
	sda_o <= 'Z';
WAIT;
END PROCESS t_prcs_sda_o;

-- stop
t_prcs_stop: PROCESS
BEGIN
	stop <= '0';
	WAIT FOR 6800000 ps;
	stop <= '1';
	WAIT FOR 480000 ps;
	stop <= '0';
WAIT;
END PROCESS t_prcs_stop;
END programador_arch;
