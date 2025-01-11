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
-- CREATED		"Fri Nov 15 16:45:59 2024"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY test_sistema_completo IS 
	PORT
	(
		pix_clk_i :  IN  STD_LOGIC;
		line_valid_i :  IN  STD_LOGIC;
		frame_valid_i :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		pin_name1 :  IN  STD_LOGIC;
		pin_name2 :  IN  STD_LOGIC;
		pin_name3 :  IN  STD_LOGIC;
		pin_name4 :  IN  STD_LOGIC;
		pin_name5 :  IN  STD_LOGIC;
		pin_name213 :  IN  STD_LOGIC;
		pin_name212 :  IN  STD_LOGIC;
		pin_name211 :  IN  STD_LOGIC;
		pin_name210 :  IN  STD_LOGIC;
		pin_name29 :  IN  STD_LOGIC;
		pin_name28 :  IN  STD_LOGIC;
		pin_name27 :  IN  STD_LOGIC;
		pin_name26 :  IN  STD_LOGIC;
		pin_name25 :  IN  STD_LOGIC;
		pin_name24 :  IN  STD_LOGIC;
		pin_name23 :  IN  STD_LOGIC;
		pin_name22 :  IN  STD_LOGIC;
		pin_name21 :  IN  STD_LOGIC;
		pin_name20 :  IN  STD_LOGIC;
		pin_name35 :  IN  STD_LOGIC;
		pin_name34 :  IN  STD_LOGIC;
		pin_name33 :  IN  STD_LOGIC;
		pin_name32 :  IN  STD_LOGIC;
		pin_name31 :  IN  STD_LOGIC;
		pin_name30 :  IN  STD_LOGIC;
		pin_name6 :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		pix_data_i :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		pix_clk_o :  OUT  STD_LOGIC;
		frame_valid_o :  OUT  STD_LOGIC;
		line_valid_o :  OUT  STD_LOGIC;
		trigger_o :  OUT  STD_LOGIC;
		data :  OUT  STD_LOGIC_VECTOR(13 DOWNTO 0);
		pix_data_o :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END test_sistema_completo;

ARCHITECTURE bdf_type OF test_sistema_completo IS 

COMPONENT histograma
GENERIC (num_bits : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 escritura_signal : IN STD_LOGIC;
		 data_cant : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 data_ener : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
		 dir_inicio : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 r_w_hist : OUT STD_LOGIC;
		 r_w_cant_ener : OUT STD_LOGIC;
		 fin_signal : OUT STD_LOGIC;
		 cant_ener_addr : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		 hist_addr : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		 hist_data : OUT STD_LOGIC_VECTOR(13 DOWNTO 0)
	);
END COMPONENT;

COMPONENT algo_3_final
GENERIC (ancho : INTEGER;
			pixels : INTEGER;
			umbral : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 trigger : IN STD_LOGIC;
		 data_ram_cantidad_i : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 data_ram_energia_i : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
		 data_ram_i : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 pix_count : IN STD_LOGIC_VECTOR(20 DOWNTO 0);
		 pix_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 we : OUT STD_LOGIC;
		 fin_borrado : OUT STD_LOGIC;
		 fin_signal : OUT STD_LOGIC;
		 addr_ram : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		 addr_ram_energia : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		 data_ram_cantidad_o : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 data_ram_energia_o : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
		 data_ram_o : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

COMPONENT captura_pixeles
	PORT(clk_interno : IN STD_LOGIC;
		 trigger : IN STD_LOGIC;
		 pix_clk : IN STD_LOGIC;
		 line_valid : IN STD_LOGIC;
		 frame_valid : IN STD_LOGIC;
		 pix_data_i : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 pix_count : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
		 pix_data_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
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

SIGNAL	gdfx_temp0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(20 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(13 DOWNTO 0);

SIGNAL	GDFX_TEMP_SIGNAL_0 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	GDFX_TEMP_SIGNAL_1 :  STD_LOGIC_VECTOR(13 DOWNTO 0);

BEGIN 
pix_clk_o <= pix_clk_i;
frame_valid_o <= frame_valid_i;
line_valid_o <= line_valid_i;
trigger_o <= pin_name1;
pix_data_o <= pix_data_i;

GDFX_TEMP_SIGNAL_0 <= (pin_name35 & pin_name34 & pin_name33 & pin_name32 & pin_name31 & pin_name30);
GDFX_TEMP_SIGNAL_1 <= (pin_name213 & pin_name212 & pin_name211 & pin_name210 & pin_name29 & pin_name28 & pin_name27 & pin_name26 & pin_name25 & pin_name24 & pin_name23 & pin_name22 & pin_name21 & pin_name20);


b2v_inst1 : histograma
GENERIC MAP(num_bits => 13
			)
PORT MAP(clk => clk,
		 reset => pin_name3,
		 enable => pin_name4,
		 escritura_signal => pin_name5,
		 data_cant => GDFX_TEMP_SIGNAL_0,
		 data_ener => GDFX_TEMP_SIGNAL_1,
		 dir_inicio => pin_name6,
		 r_w_hist => SYNTHESIZED_WIRE_11,
		 r_w_cant_ener => gdfx_temp0,
		 hist_addr => SYNTHESIZED_WIRE_12,
		 hist_data => SYNTHESIZED_WIRE_13);


b2v_inst2 : algo_3_final
GENERIC MAP(ancho => 97,
			pixels => 7081,
			umbral => 0
			)
PORT MAP(clk => clk,
		 trigger => pin_name1,
		 data_ram_cantidad_i => SYNTHESIZED_WIRE_0,
		 data_ram_energia_i => SYNTHESIZED_WIRE_1,
		 data_ram_i => SYNTHESIZED_WIRE_2,
		 pix_count => SYNTHESIZED_WIRE_3,
		 pix_data => SYNTHESIZED_WIRE_4,
		 we => gdfx_temp0,
		 addr_ram => SYNTHESIZED_WIRE_5,
		 addr_ram_energia => SYNTHESIZED_WIRE_14,
		 data_ram_cantidad_o => SYNTHESIZED_WIRE_10,
		 data_ram_energia_o => SYNTHESIZED_WIRE_8,
		 data_ram_o => SYNTHESIZED_WIRE_6);


b2v_inst3 : captura_pixeles
PORT MAP(clk_interno => clk,
		 trigger => pin_name1,
		 pix_clk => pix_clk_i,
		 line_valid => line_valid_i,
		 frame_valid => frame_valid_i,
		 pix_data_i => pix_data_i,
		 pix_count => SYNTHESIZED_WIRE_3,
		 pix_data_o => SYNTHESIZED_WIRE_4);


b2v_inst4 : ram
GENERIC MAP(addr_width => 11,
			data_width => 11
			)
PORT MAP(write_en => gdfx_temp0,
		 clk => clk,
		 addr => SYNTHESIZED_WIRE_5,
		 din => SYNTHESIZED_WIRE_6,
		 dout => SYNTHESIZED_WIRE_2);


b2v_inst5 : ram
GENERIC MAP(addr_width => 11,
			data_width => 14
			)
PORT MAP(write_en => gdfx_temp0,
		 clk => clk,
		 addr => SYNTHESIZED_WIRE_14,
		 din => SYNTHESIZED_WIRE_8,
		 dout => SYNTHESIZED_WIRE_1);


b2v_inst6 : ram
GENERIC MAP(addr_width => 11,
			data_width => 6
			)
PORT MAP(write_en => gdfx_temp0,
		 clk => clk,
		 addr => SYNTHESIZED_WIRE_14,
		 din => SYNTHESIZED_WIRE_10,
		 dout => SYNTHESIZED_WIRE_0);


b2v_inst7 : ram
GENERIC MAP(addr_width => 10,
			data_width => 14
			)
PORT MAP(write_en => SYNTHESIZED_WIRE_11,
		 clk => clk,
		 addr => SYNTHESIZED_WIRE_12,
		 din => SYNTHESIZED_WIRE_13,
		 dout => data);


END bdf_type;