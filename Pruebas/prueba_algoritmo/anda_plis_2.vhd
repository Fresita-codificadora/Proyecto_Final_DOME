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
-- CREATED		"Wed Oct 16 21:42:39 2024"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY anda_plis_2 IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		uart_rx_i :  IN  STD_LOGIC;
		swit :  IN  STD_LOGIC_VECTOR(10 DOWNTO 0);
		uart_tx_o :  OUT  STD_LOGIC;
		leds :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END anda_plis_2;

ARCHITECTURE bdf_type OF anda_plis_2 IS 

COMPONENT algo_3_final
GENERIC (ancho : INTEGER;
			pixels : INTEGER;
			umbral : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 uart_sending : IN STD_LOGIC;
		 data_ram_cantidad_i : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data_ram_energia_i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 data_ram_i : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 pix_count : IN STD_LOGIC_VECTOR(20 DOWNTO 0);
		 pix_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 sw : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 we : OUT STD_LOGIC;
		 enable_uart : OUT STD_LOGIC;
		 addr_ram : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		 addr_ram_cantidad : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		 addr_ram_energia : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		 data_ram_cantidad_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data_ram_energia_o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 data_ram_o : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		 data_uart : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
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

COMPONENT uart_algo
GENERIC (pixels : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 rx_dv : IN STD_LOGIC;
		 rx_byte : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 byte_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
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

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(20 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 
leds <= SYNTHESIZED_WIRE_2;



b2v_inst : algo_3_final
GENERIC MAP(ancho => 863,
			pixels => 596333,
			umbral => 80
			)
PORT MAP(clk => clk,
		 reset => reset,
		 uart_sending => SYNTHESIZED_WIRE_0,
		 data_ram_cantidad_i => SYNTHESIZED_WIRE_1,
		 data_ram_energia_i => SYNTHESIZED_WIRE_2,
		 data_ram_i => SYNTHESIZED_WIRE_3,
		 pix_count => SYNTHESIZED_WIRE_4,
		 pix_data => SYNTHESIZED_WIRE_5,
		 sw => swit,
		 we => SYNTHESIZED_WIRE_19,
		 enable_uart => SYNTHESIZED_WIRE_17,
		 addr_ram => SYNTHESIZED_WIRE_7,
		 addr_ram_cantidad => SYNTHESIZED_WIRE_15,
		 addr_ram_energia => SYNTHESIZED_WIRE_12,
		 data_ram_cantidad_o => SYNTHESIZED_WIRE_16,
		 data_ram_energia_o => SYNTHESIZED_WIRE_13,
		 data_ram_o => SYNTHESIZED_WIRE_8,
		 data_uart => SYNTHESIZED_WIRE_18);


b2v_inst1 : uart_rx
GENERIC MAP(g_CLKS_PER_BIT => 25
			)
PORT MAP(i_Clk => clk,
		 i_RX_Serial => uart_rx_i,
		 o_RX_DV => SYNTHESIZED_WIRE_9,
		 o_RX_Byte => SYNTHESIZED_WIRE_10);


b2v_inst2 : ram
GENERIC MAP(addr_width => 11,
			data_width => 11
			)
PORT MAP(write_en => SYNTHESIZED_WIRE_19,
		 clk => clk,
		 addr => SYNTHESIZED_WIRE_7,
		 din => SYNTHESIZED_WIRE_8,
		 dout => SYNTHESIZED_WIRE_3);


b2v_inst4 : uart_algo
GENERIC MAP(pixels => 596333
			)
PORT MAP(clk => clk,
		 reset => reset,
		 rx_dv => SYNTHESIZED_WIRE_9,
		 rx_byte => SYNTHESIZED_WIRE_10,
		 byte_o => SYNTHESIZED_WIRE_5,
		 pix_count => SYNTHESIZED_WIRE_4);


b2v_inst7 : ram
GENERIC MAP(addr_width => 11,
			data_width => 16
			)
PORT MAP(write_en => SYNTHESIZED_WIRE_19,
		 clk => clk,
		 addr => SYNTHESIZED_WIRE_12,
		 din => SYNTHESIZED_WIRE_13,
		 dout => SYNTHESIZED_WIRE_2);


b2v_inst8 : ram
GENERIC MAP(addr_width => 11,
			data_width => 8
			)
PORT MAP(write_en => SYNTHESIZED_WIRE_19,
		 clk => clk,
		 addr => SYNTHESIZED_WIRE_15,
		 din => SYNTHESIZED_WIRE_16,
		 dout => SYNTHESIZED_WIRE_1);


b2v_inst9 : uart_tx
GENERIC MAP(BIT_RATE => 2000000,
			CLK_HZ => 50000000,
			PAYLOAD_BITS => 8
			)
PORT MAP(clk => clk,
		 resetn => reset,
		 uart_tx_en => SYNTHESIZED_WIRE_17,
		 uart_tx_data => SYNTHESIZED_WIRE_18,
		 uart_txd => uart_tx_o,
		 uart_tx_busy => SYNTHESIZED_WIRE_0);


END bdf_type;