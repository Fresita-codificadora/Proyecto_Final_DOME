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
-- CREATED		"Sat Nov  2 22:41:51 2024"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Block2 IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		uart_rx_i :  IN  STD_LOGIC;
		Uart_tx_o :  OUT  STD_LOGIC
	);
END Block2;

ARCHITECTURE bdf_type OF Block2 IS 

COMPONENT histograma_2
GENERIC (num_bits : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 uart_sending : IN STD_LOGIC;
		 data_count : IN STD_LOGIC_VECTOR(20 DOWNTO 0);
		 data_ener : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
		 r_w_hist : OUT STD_LOGIC;
		 data_uart : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT uart_algo
GENERIC (pixels : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 rx_dv : IN STD_LOGIC;
		 rx_byte : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 byte_o : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
		 pix_count : OUT STD_LOGIC_VECTOR(20 DOWNTO 0)
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

COMPONENT uart_rx
GENERIC (g_CLKS_PER_BIT : INTEGER
			);
	PORT(i_Clk : IN STD_LOGIC;
		 i_RX_Serial : IN STD_LOGIC;
		 o_RX_DV : OUT STD_LOGIC;
		 o_RX_Byte : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(20 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_inst : histograma_2
GENERIC MAP(num_bits => 10
			)
PORT MAP(clk => clk,
		 reset => reset,
		 uart_sending => SYNTHESIZED_WIRE_0,
		 data_count => SYNTHESIZED_WIRE_1,
		 data_ener => SYNTHESIZED_WIRE_2,
		 r_w_hist => SYNTHESIZED_WIRE_5,
		 data_uart => SYNTHESIZED_WIRE_6);


b2v_inst1 : uart_algo
GENERIC MAP(pixels => 2047
			)
PORT MAP(clk => clk,
		 reset => reset,
		 rx_dv => SYNTHESIZED_WIRE_3,
		 rx_byte => SYNTHESIZED_WIRE_4,
		 byte_o => SYNTHESIZED_WIRE_2,
		 pix_count => SYNTHESIZED_WIRE_1);


b2v_inst2 : uart_tx
GENERIC MAP(BIT_RATE => 115200,
			CLK_HZ => 12000000,
			PAYLOAD_BITS => 8
			)
PORT MAP(clk => clk,
		 resetn => reset,
		 uart_tx_en => SYNTHESIZED_WIRE_5,
		 uart_tx_data => SYNTHESIZED_WIRE_6,
		 uart_txd => Uart_tx_o,
		 uart_tx_busy => SYNTHESIZED_WIRE_0);


b2v_inst3 : uart_rx
GENERIC MAP(g_CLKS_PER_BIT => 104
			)
PORT MAP(i_Clk => clk,
		 i_RX_Serial => uart_rx_i,
		 o_RX_DV => SYNTHESIZED_WIRE_3,
		 o_RX_Byte => SYNTHESIZED_WIRE_4);


END bdf_type;