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
-- CREATED		"Thu Jan  9 19:53:53 2025"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY test_sistema_completo_uart_2 IS 
	PORT
	(
		clk_50 :  IN  STD_LOGIC;
		reset_btn :  IN  STD_LOGIC;
		envio_btn :  IN  STD_LOGIC;
		UART_RX_I :  IN  STD_LOGIC;
		trigger_btn :  IN  STD_LOGIC;
		swtches :  IN  STD_LOGIC_VECTOR(10 DOWNTO 0);
		led_sw :  OUT  STD_LOGIC;
		uart_tx_o :  OUT  STD_LOGIC;
		led_energia :  OUT  STD_LOGIC_VECTOR(13 DOWNTO 0)
	);
END test_sistema_completo_uart_2;

ARCHITECTURE bdf_type OF test_sistema_completo_uart_2 IS 

COMPONENT algo_3_final
GENERIC (ancho : INTEGER;
			num_bits : INTEGER;
			pixels : INTEGER;
			umbral : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 trigger : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 pix_valid : IN STD_LOGIC;
		 escritura_hist_signal : IN STD_LOGIC;
		 errase_histograma : IN STD_LOGIC;
		 data_ram_cantidad_i : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 data_ram_energia_i : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
		 data_ram_i : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 dir_escritura_hist : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 pix_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 we : OUT STD_LOGIC;
		 selector_ram_histograma : OUT STD_LOGIC;
		 we_histograma : OUT STD_LOGIC;
		 fin_borrado : OUT STD_LOGIC;
		 fin_histograma : OUT STD_LOGIC;
		 fin_escritura : OUT STD_LOGIC;
		 ack : OUT STD_LOGIC;
		 addr_ram : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		 addr_ram_energia : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		 addr_ram_histograma_o : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		 data_ram_cantidad_o : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 data_ram_energia_o : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
		 data_ram_histograma_o : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
		 data_ram_o : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

COMPONENT access_uart
	PORT(selector : IN STD_LOGIC;
		 tx_en_1 : IN STD_LOGIC;
		 tx_en_2 : IN STD_LOGIC;
		 data_1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data_2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 tx_en_o : OUT STD_LOGIC;
		 data_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT uart_algo_nuevo
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 rx_dv : IN STD_LOGIC;
		 ack : IN STD_LOGIC;
		 rx_byte : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 pix_valid : OUT STD_LOGIC;
		 byte_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
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

COMPONENT ack_sender
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 trigger : IN STD_LOGIC;
		 uart_busy : IN STD_LOGIC;
		 tx_enable : OUT STD_LOGIC;
		 uart_byte : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
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

COMPONENT coordinador_mod_tes
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 fin_programador : IN STD_LOGIC;
		 fin_histograma : IN STD_LOGIC;
		 fin_escritura_histograma : IN STD_LOGIC;
		 fin_borrado_algo : IN STD_LOGIC;
		 uart_tx_busy_i : IN STD_LOGIC;
		 cntrl_envio : IN STD_LOGIC;
		 trigger_externo : IN STD_LOGIC;
		 datos_histograma : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
		 selector_ram_histograma : OUT STD_LOGIC;
		 trigger_intern : OUT STD_LOGIC;
		 trigger_cam_o : OUT STD_LOGIC;
		 start_program : OUT STD_LOGIC;
		 escritura_hist : OUT STD_LOGIC;
		 errase_histograma : OUT STD_LOGIC;
		 reset_decod : OUT STD_LOGIC;
		 uart_tx_en_o : OUT STD_LOGIC;
		 we_histograma : OUT STD_LOGIC;
		 selector_uart : OUT STD_LOGIC;
		 trigger_wait_led : OUT STD_LOGIC;
		 addr_histograma : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		 dir_mem_hist : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		 uart_byte_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	ack_signal :  STD_LOGIC;
SIGNAL	addr_algo :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	addr_controlador :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	addr_hist :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	algo_errase :  STD_LOGIC;
SIGNAL	clk_global :  STD_LOGIC;
SIGNAL	data_cantidad_algo :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	data_energia_algo :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	data_hist :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	dir_inicio_histograma :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	errase_histograma :  STD_LOGIC;
SIGNAL	escritura_histograma :  STD_LOGIC;
SIGNAL	hist_end :  STD_LOGIC;
SIGNAL	hist_escritura_end :  STD_LOGIC;
SIGNAL	r_w_algo :  STD_LOGIC;
SIGNAL	ram_cantidad :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	ram_energia :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	ram_fifo :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	ram_histograma :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	reset_signal :  STD_LOGIC;
SIGNAL	selector_histograma :  STD_LOGIC;
SIGNAL	selector_uart_controlador :  STD_LOGIC;
SIGNAL	swc :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	trigger_maquinas_de_estado :  STD_LOGIC;
SIGNAL	tx_en :  STD_LOGIC;
SIGNAL	tx_en_ack :  STD_LOGIC;
SIGNAL	uart_busy :  STD_LOGIC;
SIGNAL	uart_byte_ack :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	uart_byte_tx :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	we_controlador :  STD_LOGIC;
SIGNAL	we_hist :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_11 <= '1';



b2v_inst : algo_3_final
GENERIC MAP(ancho => 97,
			num_bits => 13,
			pixels => 7081,
			umbral => 0
			)
PORT MAP(clk => clk_global,
		 trigger => trigger_maquinas_de_estado,
		 reset => reset_signal,
		 pix_valid => SYNTHESIZED_WIRE_0,
		 escritura_hist_signal => escritura_histograma,
		 errase_histograma => errase_histograma,
		 data_ram_cantidad_i => ram_cantidad,
		 data_ram_energia_i => ram_energia,
		 data_ram_i => ram_fifo,
		 dir_escritura_hist => dir_inicio_histograma,
		 pix_data => SYNTHESIZED_WIRE_1,
		 we => r_w_algo,
		 we_histograma => we_hist,
		 fin_borrado => algo_errase,
		 fin_histograma => hist_end,
		 fin_escritura => hist_escritura_end,
		 ack => ack_signal,
		 addr_ram => SYNTHESIZED_WIRE_6,
		 addr_ram_energia => addr_algo,
		 addr_ram_histograma_o => addr_hist,
		 data_ram_cantidad_o => data_cantidad_algo,
		 data_ram_energia_o => data_energia_algo,
		 data_ram_histograma_o => data_hist,
		 data_ram_o => SYNTHESIZED_WIRE_7);


b2v_inst1 : access_uart
PORT MAP(selector => selector_uart_controlador,
		 tx_en_1 => tx_en_ack,
		 tx_en_2 => tx_en,
		 data_1 => uart_byte_ack,
		 data_2 => uart_byte_tx,
		 tx_en_o => SYNTHESIZED_WIRE_4,
		 data_o => SYNTHESIZED_WIRE_5);


b2v_inst10 : uart_algo_nuevo
PORT MAP(clk => clk_global,
		 reset => trigger_maquinas_de_estado,
		 rx_dv => SYNTHESIZED_WIRE_2,
		 ack => ack_signal,
		 rx_byte => SYNTHESIZED_WIRE_3,
		 pix_valid => SYNTHESIZED_WIRE_0,
		 byte_o => SYNTHESIZED_WIRE_1);


b2v_inst11 : uart_rx
GENERIC MAP(g_CLKS_PER_BIT => 434
			)
PORT MAP(i_Clk => clk_global,
		 i_RX_Serial => UART_RX_I,
		 o_RX_DV => SYNTHESIZED_WIRE_2,
		 o_RX_Byte => SYNTHESIZED_WIRE_3);


b2v_inst12 : uart_tx
GENERIC MAP(BIT_RATE => 115200,
			CLK_HZ => 50000000,
			PAYLOAD_BITS => 8
			)
PORT MAP(clk => clk_global,
		 resetn => reset_signal,
		 uart_tx_en => SYNTHESIZED_WIRE_4,
		 uart_tx_data => SYNTHESIZED_WIRE_5,
		 uart_txd => uart_tx_o,
		 uart_tx_busy => uart_busy);


b2v_inst14 : ack_sender
PORT MAP(clk => clk_global,
		 reset => reset_signal,
		 trigger => ack_signal,
		 uart_busy => uart_busy,
		 tx_enable => tx_en_ack,
		 uart_byte => uart_byte_ack);


b2v_inst2 : ram
GENERIC MAP(addr_width => 11,
			data_width => 11
			)
PORT MAP(write_en => r_w_algo,
		 clk => clk_global,
		 addr => SYNTHESIZED_WIRE_6,
		 din => SYNTHESIZED_WIRE_7,
		 dout => ram_fifo);


b2v_inst3 : ram
GENERIC MAP(addr_width => 11,
			data_width => 14
			)
PORT MAP(write_en => r_w_algo,
		 clk => clk_global,
		 addr => addr_algo,
		 din => data_energia_algo,
		 dout => ram_energia);


b2v_inst5 : ram
GENERIC MAP(addr_width => 11,
			data_width => 6
			)
PORT MAP(write_en => r_w_algo,
		 clk => clk_global,
		 addr => addr_algo,
		 din => data_cantidad_algo,
		 dout => ram_cantidad);


b2v_inst6 : ram
GENERIC MAP(addr_width => 10,
			data_width => 14
			)
PORT MAP(write_en => SYNTHESIZED_WIRE_8,
		 clk => clk_global,
		 addr => SYNTHESIZED_WIRE_9,
		 din => SYNTHESIZED_WIRE_10,
		 dout => ram_histograma);


b2v_inst7 : access_ram
GENERIC MAP(addr_width => 10,
			data_width => 14
			)
PORT MAP(selector => selector_histograma,
		 r_w_1 => we_hist,
		 r_w_2 => we_controlador,
		 addr_1 => addr_hist,
		 addr_2 => addr_controlador,
		 data_1 => data_hist,
		 r_w_o => SYNTHESIZED_WIRE_8,
		 addr_o => SYNTHESIZED_WIRE_9,
		 data_o => SYNTHESIZED_WIRE_10);


b2v_inst8 : coordinador_mod_tes
PORT MAP(clk => clk_global,
		 reset => reset_signal,
		 fin_programador => SYNTHESIZED_WIRE_11,
		 fin_histograma => hist_end,
		 fin_escritura_histograma => hist_escritura_end,
		 fin_borrado_algo => algo_errase,
		 uart_tx_busy_i => uart_busy,
		 cntrl_envio => envio_btn,
		 trigger_externo => trigger_btn,
		 datos_histograma => ram_histograma,
		 selector_ram_histograma => selector_histograma,
		 trigger_intern => trigger_maquinas_de_estado,
		 escritura_hist => escritura_histograma,
		 errase_histograma => errase_histograma,
		 uart_tx_en_o => tx_en,
		 we_histograma => we_controlador,
		 selector_uart => selector_uart_controlador,
		 trigger_wait_led => led_sw,
		 addr_histograma => addr_controlador,
		 dir_mem_hist => dir_inicio_histograma,
		 uart_byte_o => uart_byte_tx);


clk_global <= clk_50;
reset_signal <= reset_btn;
led_energia <= ram_histograma;

END bdf_type;