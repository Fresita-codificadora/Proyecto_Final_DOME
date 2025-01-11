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
-- CREATED		"Sat Nov 16 09:46:54 2024"

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
		Uart_rx_i :  IN  STD_LOGIC;
		trigger_btn :  IN  STD_LOGIC;
		sda_o :  INOUT  STD_LOGIC;
		pix_data_i :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		sca_o :  OUT  STD_LOGIC;
		Uart_tx_o :  OUT  STD_LOGIC;
		trigger_cam_out :  OUT  STD_LOGIC;
		pix_clk_o :  OUT  STD_LOGIC;
		frame_valid_o :  OUT  STD_LOGIC;
		line_valid_o :  OUT  STD_LOGIC;
		trigger_o :  OUT  STD_LOGIC;
		clk_cam_o :  OUT  STD_LOGIC;
		pix_data_o :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END test_sistema_completo;

ARCHITECTURE bdf_type OF test_sistema_completo IS 

COMPONENT decod_control
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 rx_dv_i : IN STD_LOGIC;
		 rx_byte : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 cntrl_reset : OUT STD_LOGIC;
		 cntrl_envio : OUT STD_LOGIC
	);
END COMPONENT;

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

COMPONENT programador_controlador_block
	PORT(clk : IN STD_LOGIC;
		 start : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 sda : INOUT STD_LOGIC;
		 DONE : OUT STD_LOGIC;
		 sca : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT access_ram
GENERIC (addr_width : INTEGER;
			data_width : INTEGER
			);
	PORT(selector : IN STD_LOGIC;
		 r_w_1 : IN STD_LOGIC;
		 r_w_2 : IN STD_LOGIC;
		 addr_1 : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 addr_2 : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 data_1 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
		 r_w_o : OUT STD_LOGIC;
		 addr_o : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		 data_o : OUT STD_LOGIC_VECTOR(13 DOWNTO 0)
	);
END COMPONENT;

COMPONENT divisor
	PORT(clk_in : IN STD_LOGIC;
		 clk_out : OUT STD_LOGIC
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

COMPONENT pll_50
	PORT(REFERENCECLK : IN STD_LOGIC;
		 RESET : IN STD_LOGIC;
		 PLLOUTCORE : OUT STD_LOGIC;
		 PLLOUTGLOBAL : OUT STD_LOGIC
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

COMPONENT coordinador_mod_tes
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 fin_programador : IN STD_LOGIC;
		 fin_algoritmo : IN STD_LOGIC;
		 fin_borrado_algo : IN STD_LOGIC;
		 fin_histograma : IN STD_LOGIC;
		 uart_tx_busy_i : IN STD_LOGIC;
		 cntrl_envio : IN STD_LOGIC;
		 trigger_externo : IN STD_LOGIC;
		 datos_histograma : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
		 selector_ram_energia_cantidad : OUT STD_LOGIC;
		 selector_ram_histograma : OUT STD_LOGIC;
		 trigger_intern : OUT STD_LOGIC;
		 trigger_cam_o : OUT STD_LOGIC;
		 start_program : OUT STD_LOGIC;
		 reset_histogram : OUT STD_LOGIC;
		 enable_hits : OUT STD_LOGIC;
		 escritura_hist : OUT STD_LOGIC;
		 reset_decod : OUT STD_LOGIC;
		 uart_tx_en_o : OUT STD_LOGIC;
		 r_w_histograma : OUT STD_LOGIC;
		 addr_histograma : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		 dir_mem_hist : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		 uart_byte_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
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

SIGNAL	SYNTHESIZED_WIRE_75 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_76 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_77 :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_78 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_79 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_80 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_81 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_82 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_83 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_30 :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_35 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_36 :  STD_LOGIC_VECTOR(20 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_37 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_43 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_45 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_51 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_52 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_53 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_55 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_56 :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_57 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_59 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_60 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_61 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_63 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_64 :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_66 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_67 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_68 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_69 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_70 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_71 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_72 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_73 :  STD_LOGIC_VECTOR(13 DOWNTO 0);


BEGIN 
pix_clk_o <= pix_clk_i;
frame_valid_o <= frame_valid_i;
line_valid_o <= line_valid_i;
pix_data_o <= pix_data_i;
trigger_o <= SYNTHESIZED_WIRE_78;
clk_cam_o <= SYNTHESIZED_WIRE_15;



b2v_inst : decod_control
PORT MAP(clk => SYNTHESIZED_WIRE_75,
		 reset => SYNTHESIZED_WIRE_1,
		 rx_dv_i => SYNTHESIZED_WIRE_2,
		 rx_byte => SYNTHESIZED_WIRE_3,
		 cntrl_reset => SYNTHESIZED_WIRE_66,
		 cntrl_envio => SYNTHESIZED_WIRE_72);


b2v_inst1 : histograma
GENERIC MAP(num_bits => 13
			)
PORT MAP(clk => SYNTHESIZED_WIRE_75,
		 reset => SYNTHESIZED_WIRE_5,
		 enable => SYNTHESIZED_WIRE_6,
		 escritura_signal => SYNTHESIZED_WIRE_7,
		 data_cant => SYNTHESIZED_WIRE_76,
		 data_ener => SYNTHESIZED_WIRE_77,
		 dir_inicio => SYNTHESIZED_WIRE_10,
		 r_w_hist => SYNTHESIZED_WIRE_19,
		 r_w_cant_ener => SYNTHESIZED_WIRE_81,
		 fin_signal => SYNTHESIZED_WIRE_70,
		 cant_ener_addr => SYNTHESIZED_WIRE_83,
		 hist_addr => SYNTHESIZED_WIRE_21,
		 hist_data => SYNTHESIZED_WIRE_23);


b2v_inst10 : uart_tx
GENERIC MAP(BIT_RATE => 115200,
			CLK_HZ => 50000000,
			PAYLOAD_BITS => 8
			)
PORT MAP(clk => SYNTHESIZED_WIRE_75,
		 resetn => SYNTHESIZED_WIRE_12,
		 uart_tx_en => SYNTHESIZED_WIRE_13,
		 uart_tx_data => SYNTHESIZED_WIRE_14,
		 uart_txd => Uart_tx_o,
		 uart_tx_busy => SYNTHESIZED_WIRE_71);


b2v_inst11 : programador_controlador_block
PORT MAP(clk => SYNTHESIZED_WIRE_15,
		 start => SYNTHESIZED_WIRE_16,
		 reset => SYNTHESIZED_WIRE_78,
		 sda => sda_o,
		 DONE => SYNTHESIZED_WIRE_67,
		 sca => sca_o);


b2v_inst13 : access_ram
GENERIC MAP(addr_width => 10,
			data_width => 14
			)
PORT MAP(selector => SYNTHESIZED_WIRE_18,
		 r_w_1 => SYNTHESIZED_WIRE_19,
		 r_w_2 => SYNTHESIZED_WIRE_20,
		 addr_1 => SYNTHESIZED_WIRE_21,
		 addr_2 => SYNTHESIZED_WIRE_22,
		 data_1 => SYNTHESIZED_WIRE_23,
		 r_w_o => SYNTHESIZED_WIRE_61,
		 addr_o => SYNTHESIZED_WIRE_63,
		 data_o => SYNTHESIZED_WIRE_64);


b2v_inst14 : divisor
PORT MAP(clk_in => SYNTHESIZED_WIRE_75,
		 clk_out => SYNTHESIZED_WIRE_15);


b2v_inst18 : access_ram
GENERIC MAP(addr_width => 11,
			data_width => 14
			)
PORT MAP(selector => SYNTHESIZED_WIRE_79,
		 r_w_1 => SYNTHESIZED_WIRE_80,
		 r_w_2 => SYNTHESIZED_WIRE_81,
		 addr_1 => SYNTHESIZED_WIRE_82,
		 addr_2 => SYNTHESIZED_WIRE_83,
		 data_1 => SYNTHESIZED_WIRE_30,
		 r_w_o => SYNTHESIZED_WIRE_53,
		 addr_o => SYNTHESIZED_WIRE_55,
		 data_o => SYNTHESIZED_WIRE_56);


b2v_inst2 : algo_3_final
GENERIC MAP(ancho => 97,
			pixels => 7081,
			umbral => 0
			)
PORT MAP(clk => SYNTHESIZED_WIRE_75,
		 trigger => SYNTHESIZED_WIRE_78,
		 data_ram_cantidad_i => SYNTHESIZED_WIRE_76,
		 data_ram_energia_i => SYNTHESIZED_WIRE_77,
		 data_ram_i => SYNTHESIZED_WIRE_35,
		 pix_count => SYNTHESIZED_WIRE_36,
		 pix_data => SYNTHESIZED_WIRE_37,
		 we => SYNTHESIZED_WIRE_80,
		 fin_borrado => SYNTHESIZED_WIRE_69,
		 fin_signal => SYNTHESIZED_WIRE_68,
		 addr_ram => SYNTHESIZED_WIRE_51,
		 addr_ram_energia => SYNTHESIZED_WIRE_82,
		 data_ram_cantidad_o => SYNTHESIZED_WIRE_43,
		 data_ram_energia_o => SYNTHESIZED_WIRE_30,
		 data_ram_o => SYNTHESIZED_WIRE_52);


b2v_inst20 : access_ram
GENERIC MAP(addr_width => 11,
			data_width => 6
			)
PORT MAP(selector => SYNTHESIZED_WIRE_79,
		 r_w_1 => SYNTHESIZED_WIRE_80,
		 r_w_2 => SYNTHESIZED_WIRE_81,
		 addr_1 => SYNTHESIZED_WIRE_82,
		 addr_2 => SYNTHESIZED_WIRE_83,
		 data_1 => SYNTHESIZED_WIRE_43,
		 r_w_o => SYNTHESIZED_WIRE_57,
		 addr_o => SYNTHESIZED_WIRE_59,
		 data_o => SYNTHESIZED_WIRE_60);


SYNTHESIZED_WIRE_12 <= NOT(SYNTHESIZED_WIRE_78);



b2v_inst22 : pll_50
PORT MAP(REFERENCECLK => clk,
		 RESET => SYNTHESIZED_WIRE_45,
		 PLLOUTGLOBAL => SYNTHESIZED_WIRE_75);


SYNTHESIZED_WIRE_45 <= NOT(SYNTHESIZED_WIRE_78);



b2v_inst3 : captura_pixeles
PORT MAP(clk_interno => SYNTHESIZED_WIRE_75,
		 trigger => SYNTHESIZED_WIRE_78,
		 pix_clk => pix_clk_i,
		 line_valid => line_valid_i,
		 frame_valid => frame_valid_i,
		 pix_data_i => pix_data_i,
		 pix_count => SYNTHESIZED_WIRE_36,
		 pix_data_o => SYNTHESIZED_WIRE_37);


b2v_inst4 : ram
GENERIC MAP(addr_width => 11,
			data_width => 11
			)
PORT MAP(write_en => SYNTHESIZED_WIRE_80,
		 clk => SYNTHESIZED_WIRE_75,
		 addr => SYNTHESIZED_WIRE_51,
		 din => SYNTHESIZED_WIRE_52,
		 dout => SYNTHESIZED_WIRE_35);


b2v_inst5 : ram
GENERIC MAP(addr_width => 11,
			data_width => 14
			)
PORT MAP(write_en => SYNTHESIZED_WIRE_53,
		 clk => SYNTHESIZED_WIRE_75,
		 addr => SYNTHESIZED_WIRE_55,
		 din => SYNTHESIZED_WIRE_56,
		 dout => SYNTHESIZED_WIRE_77);


b2v_inst6 : ram
GENERIC MAP(addr_width => 11,
			data_width => 6
			)
PORT MAP(write_en => SYNTHESIZED_WIRE_57,
		 clk => SYNTHESIZED_WIRE_75,
		 addr => SYNTHESIZED_WIRE_59,
		 din => SYNTHESIZED_WIRE_60,
		 dout => SYNTHESIZED_WIRE_76);


b2v_inst7 : ram
GENERIC MAP(addr_width => 10,
			data_width => 14
			)
PORT MAP(write_en => SYNTHESIZED_WIRE_61,
		 clk => SYNTHESIZED_WIRE_75,
		 addr => SYNTHESIZED_WIRE_63,
		 din => SYNTHESIZED_WIRE_64,
		 dout => SYNTHESIZED_WIRE_73);


b2v_inst8 : coordinador_mod_tes
PORT MAP(clk => SYNTHESIZED_WIRE_75,
		 reset => SYNTHESIZED_WIRE_66,
		 fin_programador => SYNTHESIZED_WIRE_67,
		 fin_algoritmo => SYNTHESIZED_WIRE_68,
		 fin_borrado_algo => SYNTHESIZED_WIRE_69,
		 fin_histograma => SYNTHESIZED_WIRE_70,
		 uart_tx_busy_i => SYNTHESIZED_WIRE_71,
		 cntrl_envio => SYNTHESIZED_WIRE_72,
		 trigger_externo => trigger_btn,
		 datos_histograma => SYNTHESIZED_WIRE_73,
		 selector_ram_energia_cantidad => SYNTHESIZED_WIRE_79,
		 selector_ram_histograma => SYNTHESIZED_WIRE_18,
		 trigger_intern => SYNTHESIZED_WIRE_78,
		 trigger_cam_o => trigger_cam_out,
		 start_program => SYNTHESIZED_WIRE_16,
		 reset_histogram => SYNTHESIZED_WIRE_5,
		 enable_hits => SYNTHESIZED_WIRE_6,
		 escritura_hist => SYNTHESIZED_WIRE_7,
		 reset_decod => SYNTHESIZED_WIRE_1,
		 uart_tx_en_o => SYNTHESIZED_WIRE_13,
		 r_w_histograma => SYNTHESIZED_WIRE_20,
		 addr_histograma => SYNTHESIZED_WIRE_22,
		 dir_mem_hist => SYNTHESIZED_WIRE_10,
		 uart_byte_o => SYNTHESIZED_WIRE_14);


b2v_inst9 : uart_rx
GENERIC MAP(g_CLKS_PER_BIT => 104
			)
PORT MAP(i_Clk => SYNTHESIZED_WIRE_75,
		 i_RX_Serial => Uart_rx_i,
		 o_RX_DV => SYNTHESIZED_WIRE_2,
		 o_RX_Byte => SYNTHESIZED_WIRE_3);


END bdf_type;