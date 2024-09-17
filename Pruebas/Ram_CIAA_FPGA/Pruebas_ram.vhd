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
-- CREATED		"Tue Sep 17 16:34:30 2024"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Pruebas_ram IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		btn :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		led_dir :  OUT  STD_LOGIC_VECTOR(10 DOWNTO 0);
		leds :  OUT  STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END Pruebas_ram;

ARCHITECTURE bdf_type OF Pruebas_ram IS 

COMPONENT ram
GENERIC (addr_width : INTEGER;
			data_width : INTEGER
			);
	PORT(write_en : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 addr : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 din : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 dout : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

COMPONENT escritura_lectura
	PORT(clk : IN STD_LOGIC;
		 btn : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 data_i : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 write_en : OUT STD_LOGIC;
		 data_o : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		 dir_o : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(10 DOWNTO 0);


BEGIN 
led_dir <= SYNTHESIZED_WIRE_1;
leds <= SYNTHESIZED_WIRE_3;



b2v_inst : ram
GENERIC MAP(addr_width => 11,
			data_width => 11
			)
PORT MAP(write_en => SYNTHESIZED_WIRE_0,
		 clk => clk,
		 addr => SYNTHESIZED_WIRE_1,
		 din => SYNTHESIZED_WIRE_2,
		 dout => SYNTHESIZED_WIRE_3);


b2v_inst2 : escritura_lectura
PORT MAP(clk => clk,
		 btn => btn,
		 reset => reset,
		 data_i => SYNTHESIZED_WIRE_3,
		 write_en => SYNTHESIZED_WIRE_0,
		 data_o => SYNTHESIZED_WIRE_2,
		 dir_o => SYNTHESIZED_WIRE_1);


END bdf_type;