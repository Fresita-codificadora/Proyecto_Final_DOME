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

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 23.1std.0 Build 991 11/28/2023 SC Lite Edition"
-- CREATED		"Sun Jan 12 17:42:26 2025"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Programador_controlador_block IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		start :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		sda :  INOUT  STD_LOGIC;
		DONE :  OUT  STD_LOGIC;
		sca :  OUT  STD_LOGIC
	);
END Programador_controlador_block;

ARCHITECTURE bdf_type OF Programador_controlador_block IS 

COMPONENT controlador
	PORT(clk : IN STD_LOGIC;
		 start : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 buisy : IN STD_LOGIC;
		 err : IN STD_LOGIC;
		 done_s : OUT STD_LOGIC;
		 clk_o : OUT STD_LOGIC;
		 r_s : OUT STD_LOGIC;
		 s_t : OUT STD_LOGIC;
		 w : OUT STD_LOGIC;
		 stop : OUT STD_LOGIC;
		 data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT programador
	PORT(clk : IN STD_LOGIC;
		 s_t : IN STD_LOGIC;
		 r_w : IN STD_LOGIC;
		 stop : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 sda_o : INOUT STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 sca_o : OUT STD_LOGIC;
		 err : OUT STD_LOGIC;
		 buisy : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_inst : controlador
PORT MAP(clk => clk,
		 start => start,
		 reset => reset,
		 buisy => SYNTHESIZED_WIRE_0,
		 err => SYNTHESIZED_WIRE_1,
		 done_s => DONE,
		 clk_o => SYNTHESIZED_WIRE_2,
		 r_s => SYNTHESIZED_WIRE_6,
		 s_t => SYNTHESIZED_WIRE_3,
		 w => SYNTHESIZED_WIRE_4,
		 stop => SYNTHESIZED_WIRE_5,
		 data => SYNTHESIZED_WIRE_7);


b2v_inst1 : programador
PORT MAP(clk => SYNTHESIZED_WIRE_2,
		 s_t => SYNTHESIZED_WIRE_3,
		 r_w => SYNTHESIZED_WIRE_4,
		 stop => SYNTHESIZED_WIRE_5,
		 reset => SYNTHESIZED_WIRE_6,
		 sda_o => sda,
		 data_in => SYNTHESIZED_WIRE_7,
		 sca_o => sca,
		 err => SYNTHESIZED_WIRE_1,
		 buisy => SYNTHESIZED_WIRE_0);


END bdf_type;