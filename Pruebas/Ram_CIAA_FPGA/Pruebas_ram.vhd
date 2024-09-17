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
-- CREATED		"Tue Sep 17 14:52:55 2024"

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
		led_estado :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		leds :  OUT  STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END Pruebas_ram;

ARCHITECTURE bdf_type OF Pruebas_ram IS 

COMPONENT ram_grande_rtl
GENERIC (ADDRWIDTH : INTEGER;
			DATAWIDTH : INTEGER;
			ENABLE_OUTPUT_REG_PORTA : INTEGER;
			ENABLE_OUTPUT_REG_PORTB : INTEGER;
			ENABLE_WR_PORTA : INTEGER;
			ENABLE_WR_PORTB : INTEGER;
			READ_MODE_A : INTEGER;
			READ_MODE_B : INTEGER;
			READ_WRITE_A : INTEGER;
			READ_WRITE_B : INTEGER;
			REGISTER_OUTPUT_PORTA : INTEGER;
			REGISTER_OUTPUT_PORTB : INTEGER;
			REGISTER_RD_ADDR_PORTA : INTEGER;
			REGISTER_RD_ADDR_PORTB : INTEGER;
			RESET_OUTPUT_REG_PORTA : INTEGER;
			RESET_OUTPUT_REG_PORTB : INTEGER;
			SPRAM : INTEGER
			);
	PORT(PortAClk : IN STD_LOGIC;
		 PortAWriteEnable : IN STD_LOGIC;
		 PortAAddr : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 PortADataIn : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 PortADataOut : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

COMPONENT escritura_lectura
	PORT(clk : IN STD_LOGIC;
		 btn : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 data_i : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 write_en : OUT STD_LOGIC;
		 data_o : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		 dir_o : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		 estado : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 led_salida : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(10 DOWNTO 0);


BEGIN 
led_dir <= SYNTHESIZED_WIRE_1;
leds <= SYNTHESIZED_WIRE_3;



b2v_inst1 : ram_grande_rtl
GENERIC MAP(ADDRWIDTH => 11,
			DATAWIDTH => 11,
			ENABLE_OUTPUT_REG_PORTA => 0,
			ENABLE_OUTPUT_REG_PORTB => 0,
			ENABLE_WR_PORTA => 1,
			ENABLE_WR_PORTB => 0,
			READ_MODE_A => 1,
			READ_MODE_B => 1,
			READ_WRITE_A => 1,
			READ_WRITE_B => 1,
			REGISTER_OUTPUT_PORTA => 1,
			REGISTER_OUTPUT_PORTB => 0,
			REGISTER_RD_ADDR_PORTA => 0,
			REGISTER_RD_ADDR_PORTB => 0,
			RESET_OUTPUT_REG_PORTA => 0,
			RESET_OUTPUT_REG_PORTB => 0,
			SPRAM => 1
			)
PORT MAP(PortAClk => clk,
		 PortAWriteEnable => SYNTHESIZED_WIRE_0,
		 PortAAddr => SYNTHESIZED_WIRE_1,
		 PortADataIn => SYNTHESIZED_WIRE_2,
		 PortADataOut => SYNTHESIZED_WIRE_3);


b2v_inst2 : escritura_lectura
PORT MAP(clk => clk,
		 btn => btn,
		 reset => reset,
		 data_i => SYNTHESIZED_WIRE_3,
		 write_en => SYNTHESIZED_WIRE_0,
		 data_o => SYNTHESIZED_WIRE_2,
		 dir_o => SYNTHESIZED_WIRE_1,
		 estado => led_estado);


END bdf_type;