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
-- CREATED		"Wed Feb 26 17:38:02 2025"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Parte_CIAA IS 
	PORT
	(
		clk_50 :  IN  STD_LOGIC;
		reset_btn :  IN  STD_LOGIC;
		UART_RX_I :  IN  STD_LOGIC;
		pix_clk_i :  IN  STD_LOGIC;
		line_valid_i :  IN  STD_LOGIC;
		frame_valid_i :  IN  STD_LOGIC;
		trigger_btn :  IN  STD_LOGIC;
		sda_cam :  INOUT  STD_LOGIC;
		pix_data :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		uart_tx_o :  OUT  STD_LOGIC;
		Trigger_camara :  OUT  STD_LOGIC;
		CLK_CAM :  OUT  STD_LOGIC;
		sca_cam :  OUT  STD_LOGIC;
		error_led :  OUT  STD_LOGIC;
		led_trigger_wait :  OUT  STD_LOGIC;
		led_programador :  OUT  STD_LOGIC
	);
END Parte_CIAA;

ARCHITECTURE bdf_type OF Parte_CIAA IS 

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

COMPONENT programador_controlador_block
	PORT(clk : IN STD_LOGIC;
		 start : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 sda : INOUT STD_LOGIC;
		 DONE : OUT STD_LOGIC;
		 sca : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT captura_pixeles_2
	PORT(trigger : IN STD_LOGIC;
		 pix_clk : IN STD_LOGIC;
		 line_valid : IN STD_LOGIC;
		 frame_valid : IN STD_LOGIC;
		 ack : IN STD_LOGIC;
		 pix_data_i : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 pix_valid : OUT STD_LOGIC;
		 error : OUT STD_LOGIC;
		 pix_data_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
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

COMPONENT divisor
	PORT(clk_in : IN STD_LOGIC;
		 clk_out : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT testigo_error
	PORT(clk : IN STD_LOGIC;
		 error_signal : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 error_led : OUT STD_LOGIC
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

COMPONENT decod_control
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 rx_dv_i : IN STD_LOGIC;
		 rx_byte : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 cntrl_reset : OUT STD_LOGIC;
		 cntrl_envio : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT pll_50
	PORT(REFERENCECLK : IN STD_LOGIC;
		 RESET : IN STD_LOGIC;
		 PLLOUTCORE : OUT STD_LOGIC;
		 PLLOUTGLOBAL : OUT STD_LOGIC
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
SIGNAL	frame_valid_int :  STD_LOGIC;
SIGNAL	hist_end :  STD_LOGIC;
SIGNAL	hist_escritura_end :  STD_LOGIC;
SIGNAL	line_valid_int :  STD_LOGIC;
SIGNAL	pix_clk_int :  STD_LOGIC;
SIGNAL	pix_dat_2 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	pix_data_int :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	pix_valid :  STD_LOGIC;
SIGNAL	programador_end :  STD_LOGIC;
SIGNAL	r_w_algo :  STD_LOGIC;
SIGNAL	ram_cantidad :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	ram_energia :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	ram_fifo :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	ram_histograma :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	reset_decod_control :  STD_LOGIC;
SIGNAL	reset_signal :  STD_LOGIC;
SIGNAL	selector_histograma :  STD_LOGIC;
SIGNAL	selector_uart_controlador :  STD_LOGIC;
SIGNAL	trigger_maquinas_de_estado :  STD_LOGIC;
SIGNAL	tx_en :  STD_LOGIC;
SIGNAL	uart_busy :  STD_LOGIC;
SIGNAL	uart_byte_tx :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	we_controlador :  STD_LOGIC;
SIGNAL	we_hist :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;


BEGIN 
CLK_CAM <= SYNTHESIZED_WIRE_0;
SYNTHESIZED_WIRE_10 <= '1';



b2v_inst : algo_3_final
GENERIC MAP(ancho => 1280,
			num_bits => 13,
			pixels => 1310720,
			umbral => 80
			)
PORT MAP(clk => clk_global,
		 trigger => trigger_maquinas_de_estado,
		 reset => reset_signal,
		 pix_valid => pix_valid,
		 escritura_hist_signal => escritura_histograma,
		 errase_histograma => errase_histograma,
		 data_ram_cantidad_i => ram_cantidad,
		 data_ram_energia_i => ram_energia,
		 data_ram_i => ram_fifo,
		 dir_escritura_hist => dir_inicio_histograma,
		 pix_data => pix_dat_2,
		 we => r_w_algo,
		 we_histograma => we_hist,
		 fin_borrado => algo_errase,
		 fin_histograma => hist_end,
		 fin_escritura => hist_escritura_end,
		 ack => ack_signal,
		 addr_ram => SYNTHESIZED_WIRE_3,
		 addr_ram_energia => addr_algo,
		 addr_ram_histograma_o => addr_hist,
		 data_ram_cantidad_o => data_cantidad_algo,
		 data_ram_energia_o => data_energia_algo,
		 data_ram_histograma_o => data_hist,
		 data_ram_o => SYNTHESIZED_WIRE_4);


b2v_inst1 : programador_controlador_block
PORT MAP(clk => SYNTHESIZED_WIRE_0,
		 start => SYNTHESIZED_WIRE_1,
		 reset => reset_signal,
		 sda => sda_cam,
		 DONE => programador_end,
		 sca => sca_cam);


b2v_inst10 : captura_pixeles_2
PORT MAP(trigger => trigger_maquinas_de_estado,
		 pix_clk => pix_clk_int,
		 line_valid => line_valid_int,
		 frame_valid => frame_valid_int,
		 ack => ack_signal,
		 pix_data_i => pix_data_int,
		 pix_valid => pix_valid,
		 error => SYNTHESIZED_WIRE_2,
		 pix_data_o => pix_dat_2);


b2v_inst11 : uart_rx
GENERIC MAP(g_CLKS_PER_BIT => 416
			)
PORT MAP(i_Clk => clk_global,
		 i_RX_Serial => UART_RX_I,
		 o_RX_DV => SYNTHESIZED_WIRE_5,
		 o_RX_Byte => SYNTHESIZED_WIRE_6);


b2v_inst12 : uart_tx
GENERIC MAP(BIT_RATE => 115200,
			CLK_HZ => 48000000,
			PAYLOAD_BITS => 8
			)
PORT MAP(clk => clk_global,
		 resetn => reset_signal,
		 uart_tx_en => tx_en,
		 uart_tx_data => uart_byte_tx,
		 uart_txd => uart_tx_o,
		 uart_tx_busy => uart_busy);


b2v_inst13 : divisor
PORT MAP(clk_in => clk_global,
		 clk_out => SYNTHESIZED_WIRE_0);


b2v_inst14 : testigo_error
PORT MAP(clk => clk_global,
		 error_signal => SYNTHESIZED_WIRE_2,
		 reset => reset_signal,
		 error_led => error_led);


b2v_inst2 : ram
GENERIC MAP(addr_width => 11,
			data_width => 11
			)
PORT MAP(write_en => r_w_algo,
		 clk => clk_global,
		 addr => SYNTHESIZED_WIRE_3,
		 din => SYNTHESIZED_WIRE_4,
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


b2v_inst4 : decod_control
PORT MAP(clk => clk_global,
		 reset => reset_decod_control,
		 rx_dv_i => SYNTHESIZED_WIRE_5,
		 rx_byte => SYNTHESIZED_WIRE_6,
		 cntrl_envio => SYNTHESIZED_WIRE_11);


b2v_inst40 : pll_50
PORT MAP(REFERENCECLK => clk_50,
		 RESET => reset_signal,
		 PLLOUTGLOBAL => clk_global);


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
PORT MAP(write_en => SYNTHESIZED_WIRE_7,
		 clk => clk_global,
		 addr => SYNTHESIZED_WIRE_8,
		 din => SYNTHESIZED_WIRE_9,
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
		 r_w_o => SYNTHESIZED_WIRE_7,
		 addr_o => SYNTHESIZED_WIRE_8,
		 data_o => SYNTHESIZED_WIRE_9);


b2v_inst8 : coordinador_mod_tes
PORT MAP(clk => clk_global,
		 reset => reset_signal,
		 fin_programador => SYNTHESIZED_WIRE_10,
		 fin_histograma => hist_end,
		 fin_escritura_histograma => hist_escritura_end,
		 fin_borrado_algo => algo_errase,
		 uart_tx_busy_i => uart_busy,
		 cntrl_envio => SYNTHESIZED_WIRE_11,
		 trigger_externo => trigger_btn,
		 datos_histograma => ram_histograma,
		 selector_ram_histograma => selector_histograma,
		 trigger_intern => trigger_maquinas_de_estado,
		 trigger_cam_o => Trigger_camara,
		 start_program => SYNTHESIZED_WIRE_1,
		 escritura_hist => escritura_histograma,
		 errase_histograma => errase_histograma,
		 reset_decod => reset_decod_control,
		 uart_tx_en_o => tx_en,
		 we_histograma => we_controlador,
		 trigger_wait_led => led_trigger_wait,
		 addr_histograma => addr_controlador,
		 dir_mem_hist => dir_inicio_histograma,
		 uart_byte_o => uart_byte_tx);


reset_signal <= reset_btn;
pix_clk_int <= pix_clk_i;
line_valid_int <= line_valid_i;
frame_valid_int <= frame_valid_i;
pix_data_int <= pix_data;
led_programador <= programador_end;

END bdf_type;