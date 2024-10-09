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
-- CREATED		"Sun Sep 22 20:24:44 2024"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY top_2 IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		rx_uart :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		tx_uart :  OUT  STD_LOGIC;
		fifo_led :  OUT  STD_LOGIC_VECTOR(10 DOWNTO 0);
		led_estado :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END top_2;

ARCHITECTURE bdf_type OF top_2 IS 

COMPONENT algoritmo_2
GENERIC (		umbral 				: integer ;
				offset				: integer ;
				cantidad_eventos 	: integer ;
				ancho 				: integer ;
				pixels 				: integer 
			);
	PORT(clk_i : IN STD_LOGIC;
		 reset_i : IN STD_LOGIC;
		 enable_done : IN STD_LOGIC;
		 trigger : IN STD_LOGIC;
		 FIFO_data_i : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 pix_cnt_i : IN STD_LOGIC_VECTOR(20 DOWNTO 0);
		 pix_data_i : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 FIFO_RW_o : OUT STD_LOGIC;
		 estado : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 FIFO_data_o : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		 FIFO_dir_o : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		 uart_tx_busy : in STD_LOGIC
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

COMPONENT uart_rx
GENERIC (g_CLKS_PER_BIT : INTEGER
			);
	PORT(i_Clk : IN STD_LOGIC;
		 i_RX_Serial : IN STD_LOGIC;
		 o_RX_DV : OUT STD_LOGIC;
		 o_RX_Byte : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT uart_tx
GENERIC (BIT_RATE : INTEGER;
			CLK_HZ : INTEGER;
			PAYLOAD_BITS : INTEGER;
			STOP_BITS : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 resetn : IN STD_LOGIC;
		 uart_tx_en : IN STD_LOGIC;
		 uart_tx_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 uart_txd : OUT STD_LOGIC;
		 uart_tx_busy : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT uart_algo
GENERIC (	pixels : INTEGER);
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 rx_dv : IN STD_LOGIC;
		 rx_byte : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 byte_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 pix_count : OUT STD_LOGIC_VECTOR(20 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	data_tx :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	FIFO_data :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(20 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
signal wire_uart_a_algo : STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_9 <= '1';



b2v_inst : algoritmo_2
GENERIC MAP(
			umbral 				=>0,
			offset				=>-2,--cambia este numero hasta que no funcione
			cantidad_eventos 	=>2048,
			ancho 				=>97,
			pixels 				=>7081	
			)
PORT MAP(clk_i => clk,
		 reset_i => reset,
		 enable_done => SYNTHESIZED_WIRE_9,
		 trigger => SYNTHESIZED_WIRE_9,
		 FIFO_data_i => FIFO_data,
		 pix_cnt_i => SYNTHESIZED_WIRE_2,
		 pix_data_i => SYNTHESIZED_WIRE_3,
		 FIFO_RW_o => SYNTHESIZED_WIRE_10,
		 estado => led_estado,
		 FIFO_data_o => data_tx,
		 FIFO_dir_o => SYNTHESIZED_WIRE_5,
		 uart_tx_busy => wire_uart_a_algo);


b2v_inst1 : ram
GENERIC MAP(addr_width => 11,
			data_width => 11
			)
PORT MAP(write_en => SYNTHESIZED_WIRE_10,
		 clk => clk,
		 addr => SYNTHESIZED_WIRE_5,
		 din => data_tx,
		 dout => FIFO_data);



b2v_inst4 : uart_rx
GENERIC MAP(g_CLKS_PER_BIT => 104
			)
PORT MAP(i_Clk => clk,
		 i_RX_Serial => rx_uart,
		 o_RX_DV => SYNTHESIZED_WIRE_7,
		 o_RX_Byte => SYNTHESIZED_WIRE_8);


b2v_inst5 : uart_tx
GENERIC MAP(BIT_RATE => 115200,
			CLK_HZ => 12000000,
			PAYLOAD_BITS => 8,
			STOP_BITS => 1
			)
PORT MAP(clk => clk,
		 resetn => reset,
		 uart_tx_en => SYNTHESIZED_WIRE_10,
		 uart_tx_data => data_tx(7 DOWNTO 0),
		 uart_txd => tx_uart,
		 uart_tx_busy => wire_uart_a_algo );


b2v_inst8 : uart_algo
GENERIC MAP(  pixels => 7081 )
PORT MAP(clk => clk,
		 reset => reset,
		 rx_dv => SYNTHESIZED_WIRE_7,
		 rx_byte => SYNTHESIZED_WIRE_8,
		 byte_o => SYNTHESIZED_WIRE_3,
		 pix_count => SYNTHESIZED_WIRE_2);

fifo_led <= FIFO_data;

END bdf_type;