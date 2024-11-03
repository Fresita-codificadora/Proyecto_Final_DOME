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
-- CREATED		"Sat Nov  2 10:21:39 2024"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY test_uart IS 
	PORT
	(
		reset :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		Uart_rx_i :  IN  STD_LOGIC;
		Uart_tx_o :  OUT  STD_LOGIC
	);
END test_uart;

ARCHITECTURE bdf_type OF test_uart IS 

COMPONENT uart_rx
GENERIC (g_CLKS_PER_BIT : INTEGER
			);
	PORT(i_Clk : IN STD_LOGIC;
		 i_RX_Serial : IN STD_LOGIC;
		 o_RX_DV : OUT STD_LOGIC;
		 o_RX_Byte : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT uart_process
	PORT(clk : IN STD_LOGIC;
		 resetn : IN STD_LOGIC;
		 rx_data_valid : IN STD_LOGIC;
		 rx_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 tx_en : OUT STD_LOGIC;
		 tx_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT uart_tx
GENERIC (BIT_RATE : INTEGER;
			CLK_HZ : INTEGER;
			PAYLOAD_BITS : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 resetn : IN STD_LOGIC;
		 uart_tx_en : IN STD_LOGIC;
		 uart_tx_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 uart_txd : OUT STD_LOGIC;
		 uart_tx_busy : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_inst : uart_rx
GENERIC MAP(g_CLKS_PER_BIT => 104
			)
PORT MAP(i_Clk => clk,
		 i_RX_Serial => Uart_rx_i,
		 o_RX_DV => SYNTHESIZED_WIRE_0,
		 o_RX_Byte => SYNTHESIZED_WIRE_1);


b2v_inst1 : uart_process
PORT MAP(clk => clk,
		 resetn => reset,
		 rx_data_valid => SYNTHESIZED_WIRE_0,
		 rx_data => SYNTHESIZED_WIRE_1,
		 tx_en => SYNTHESIZED_WIRE_2,
		 tx_data => SYNTHESIZED_WIRE_3);


b2v_inst2 : uart_tx
GENERIC MAP(BIT_RATE => 115200,
			CLK_HZ => 12000000,
			PAYLOAD_BITS => 8
			)
PORT MAP(clk => clk,
		 resetn => reset,
		 uart_tx_en => SYNTHESIZED_WIRE_2,
		 uart_tx_data => SYNTHESIZED_WIRE_3,
		 uart_txd => Uart_tx_o);


END bdf_type;