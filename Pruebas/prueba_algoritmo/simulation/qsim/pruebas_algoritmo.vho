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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 23.1std.0 Build 991 11/28/2023 SC Lite Edition"

-- DATE "09/22/2024 13:14:13"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	test_algo_sim IS
    PORT (
	fifo_rw : OUT std_logic;
	clk : IN std_logic;
	reset : IN std_logic;
	enable : IN std_logic;
	trigger : IN std_logic;
	fifo_data_i : IN std_logic_vector(10 DOWNTO 0);
	hab_byte : IN std_logic;
	byte_entrada : IN std_logic_vector(7 DOWNTO 0);
	estado : OUT std_logic_vector(3 DOWNTO 0);
	fifo_data : OUT std_logic_vector(10 DOWNTO 0);
	fifo_dir : OUT std_logic_vector(10 DOWNTO 0)
	);
END test_algo_sim;

-- Design Ports Information
-- fifo_rw	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- estado[3]	=>  Location: PIN_G26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- estado[2]	=>  Location: PIN_L21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- estado[1]	=>  Location: PIN_J24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- estado[0]	=>  Location: PIN_G25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data[10]	=>  Location: PIN_C21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data[9]	=>  Location: PIN_D24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data[8]	=>  Location: PIN_C24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data[7]	=>  Location: PIN_H23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data[6]	=>  Location: PIN_C22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data[5]	=>  Location: PIN_A21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data[4]	=>  Location: PIN_D21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data[3]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data[2]	=>  Location: PIN_A22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data[1]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data[0]	=>  Location: PIN_B22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_dir[10]	=>  Location: PIN_E28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_dir[9]	=>  Location: PIN_C27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_dir[8]	=>  Location: PIN_D27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_dir[7]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_dir[6]	=>  Location: PIN_H26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_dir[5]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_dir[4]	=>  Location: PIN_H25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_dir[3]	=>  Location: PIN_E27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_dir[2]	=>  Location: PIN_D26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_dir[1]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_dir[0]	=>  Location: PIN_J23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- trigger	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- enable	=>  Location: PIN_H24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hab_byte	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- byte_entrada[0]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- byte_entrada[7]	=>  Location: PIN_F27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- byte_entrada[6]	=>  Location: PIN_D28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- byte_entrada[5]	=>  Location: PIN_F28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- byte_entrada[4]	=>  Location: PIN_F26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- byte_entrada[3]	=>  Location: PIN_K25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- byte_entrada[2]	=>  Location: PIN_E26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- byte_entrada[1]	=>  Location: PIN_K26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data_i[10]	=>  Location: PIN_C23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data_i[9]	=>  Location: PIN_A26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data_i[8]	=>  Location: PIN_A25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data_i[7]	=>  Location: PIN_D25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data_i[6]	=>  Location: PIN_B23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data_i[5]	=>  Location: PIN_B25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data_i[4]	=>  Location: PIN_D23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data_i[3]	=>  Location: PIN_A23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data_i[2]	=>  Location: PIN_C25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data_i[1]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_data_i[0]	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF test_algo_sim IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_fifo_rw : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_enable : std_logic;
SIGNAL ww_trigger : std_logic;
SIGNAL ww_fifo_data_i : std_logic_vector(10 DOWNTO 0);
SIGNAL ww_hab_byte : std_logic;
SIGNAL ww_byte_entrada : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_estado : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_fifo_data : std_logic_vector(10 DOWNTO 0);
SIGNAL ww_fifo_dir : std_logic_vector(10 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \fifo_rw~output_o\ : std_logic;
SIGNAL \estado[3]~output_o\ : std_logic;
SIGNAL \estado[2]~output_o\ : std_logic;
SIGNAL \estado[1]~output_o\ : std_logic;
SIGNAL \estado[0]~output_o\ : std_logic;
SIGNAL \fifo_data[10]~output_o\ : std_logic;
SIGNAL \fifo_data[9]~output_o\ : std_logic;
SIGNAL \fifo_data[8]~output_o\ : std_logic;
SIGNAL \fifo_data[7]~output_o\ : std_logic;
SIGNAL \fifo_data[6]~output_o\ : std_logic;
SIGNAL \fifo_data[5]~output_o\ : std_logic;
SIGNAL \fifo_data[4]~output_o\ : std_logic;
SIGNAL \fifo_data[3]~output_o\ : std_logic;
SIGNAL \fifo_data[2]~output_o\ : std_logic;
SIGNAL \fifo_data[1]~output_o\ : std_logic;
SIGNAL \fifo_data[0]~output_o\ : std_logic;
SIGNAL \fifo_dir[10]~output_o\ : std_logic;
SIGNAL \fifo_dir[9]~output_o\ : std_logic;
SIGNAL \fifo_dir[8]~output_o\ : std_logic;
SIGNAL \fifo_dir[7]~output_o\ : std_logic;
SIGNAL \fifo_dir[6]~output_o\ : std_logic;
SIGNAL \fifo_dir[5]~output_o\ : std_logic;
SIGNAL \fifo_dir[4]~output_o\ : std_logic;
SIGNAL \fifo_dir[3]~output_o\ : std_logic;
SIGNAL \fifo_dir[2]~output_o\ : std_logic;
SIGNAL \fifo_dir[1]~output_o\ : std_logic;
SIGNAL \fifo_dir[0]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \byte_entrada[7]~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \hab_byte~input_o\ : std_logic;
SIGNAL \inst1|state~q\ : std_logic;
SIGNAL \inst1|reg_data[7]~0_combout\ : std_logic;
SIGNAL \byte_entrada[5]~input_o\ : std_logic;
SIGNAL \byte_entrada[6]~input_o\ : std_logic;
SIGNAL \byte_entrada[0]~input_o\ : std_logic;
SIGNAL \inst|LessThan2~0_combout\ : std_logic;
SIGNAL \byte_entrada[1]~input_o\ : std_logic;
SIGNAL \inst1|reg_data[1]~feeder_combout\ : std_logic;
SIGNAL \byte_entrada[4]~input_o\ : std_logic;
SIGNAL \byte_entrada[2]~input_o\ : std_logic;
SIGNAL \byte_entrada[3]~input_o\ : std_logic;
SIGNAL \inst1|reg_data[3]~feeder_combout\ : std_logic;
SIGNAL \inst|LessThan2~1_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[0]~21_combout\ : std_logic;
SIGNAL \inst1|Equal0~5_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[18]~58\ : std_logic;
SIGNAL \inst1|pix_count_int[19]~61_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[19]~62\ : std_logic;
SIGNAL \inst1|pix_count_int[20]~63_combout\ : std_logic;
SIGNAL \inst1|Equal0~0_combout\ : std_logic;
SIGNAL \inst1|Equal0~1_combout\ : std_logic;
SIGNAL \inst1|Equal0~2_combout\ : std_logic;
SIGNAL \inst1|Equal0~3_combout\ : std_logic;
SIGNAL \inst1|Equal0~4_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[18]~59_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[20]~60_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[0]~22\ : std_logic;
SIGNAL \inst1|pix_count_int[1]~23_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[1]~24\ : std_logic;
SIGNAL \inst1|pix_count_int[2]~25_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[2]~26\ : std_logic;
SIGNAL \inst1|pix_count_int[3]~27_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[3]~28\ : std_logic;
SIGNAL \inst1|pix_count_int[4]~29_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[4]~30\ : std_logic;
SIGNAL \inst1|pix_count_int[5]~31_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[5]~32\ : std_logic;
SIGNAL \inst1|pix_count_int[6]~33_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[6]~34\ : std_logic;
SIGNAL \inst1|pix_count_int[7]~35_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[7]~36\ : std_logic;
SIGNAL \inst1|pix_count_int[8]~37_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[8]~38\ : std_logic;
SIGNAL \inst1|pix_count_int[9]~39_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[9]~40\ : std_logic;
SIGNAL \inst1|pix_count_int[10]~41_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[10]~42\ : std_logic;
SIGNAL \inst1|pix_count_int[11]~43_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[11]~44\ : std_logic;
SIGNAL \inst1|pix_count_int[12]~45_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[12]~46\ : std_logic;
SIGNAL \inst1|pix_count_int[13]~47_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[13]~48\ : std_logic;
SIGNAL \inst1|pix_count_int[14]~49_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[14]~50\ : std_logic;
SIGNAL \inst1|pix_count_int[15]~51_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[15]~52\ : std_logic;
SIGNAL \inst1|pix_count_int[16]~53_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[16]~54\ : std_logic;
SIGNAL \inst1|pix_count_int[17]~55_combout\ : std_logic;
SIGNAL \inst1|pix_count_int[17]~56\ : std_logic;
SIGNAL \inst1|pix_count_int[18]~57_combout\ : std_logic;
SIGNAL \inst|Selector6~0_combout\ : std_logic;
SIGNAL \inst|LessThan1~0_combout\ : std_logic;
SIGNAL \trigger~input_o\ : std_logic;
SIGNAL \inst|state.errase~q\ : std_logic;
SIGNAL \enable~input_o\ : std_logic;
SIGNAL \inst|Selector0~0_combout\ : std_logic;
SIGNAL \inst|state.wait_done~q\ : std_logic;
SIGNAL \inst|Selector1~0_combout\ : std_logic;
SIGNAL \inst|Selector1~1_combout\ : std_logic;
SIGNAL \inst|state.trigger_wait~q\ : std_logic;
SIGNAL \inst|state~22_combout\ : std_logic;
SIGNAL \inst|Selector11~0_combout\ : std_logic;
SIGNAL \inst|Selector12~0_combout\ : std_logic;
SIGNAL \inst|Equal0~7_combout\ : std_logic;
SIGNAL \inst|Selector13~0_combout\ : std_logic;
SIGNAL \inst|Selector14~0_combout\ : std_logic;
SIGNAL \inst|Equal0~6_combout\ : std_logic;
SIGNAL \inst|Selector9~0_combout\ : std_logic;
SIGNAL \inst|Selector10~0_combout\ : std_logic;
SIGNAL \inst|Equal0~8_combout\ : std_logic;
SIGNAL \inst|Selector16~0_combout\ : std_logic;
SIGNAL \inst|Selector15~0_combout\ : std_logic;
SIGNAL \inst|Equal0~5_combout\ : std_logic;
SIGNAL \inst|Equal0~9_combout\ : std_logic;
SIGNAL \inst|Selector4~0_combout\ : std_logic;
SIGNAL \inst|Selector8~0_combout\ : std_logic;
SIGNAL \inst|Selector7~0_combout\ : std_logic;
SIGNAL \inst|Equal0~10_combout\ : std_logic;
SIGNAL \inst|Selector5~0_combout\ : std_logic;
SIGNAL \inst|Equal0~11_combout\ : std_logic;
SIGNAL \inst|Equal0~12_combout\ : std_logic;
SIGNAL \inst|Selector22~0_combout\ : std_logic;
SIGNAL \inst|Selector21~0_combout\ : std_logic;
SIGNAL \inst|Equal0~1_combout\ : std_logic;
SIGNAL \inst|Selector18~0_combout\ : std_logic;
SIGNAL \inst|Selector17~0_combout\ : std_logic;
SIGNAL \inst|Equal0~3_combout\ : std_logic;
SIGNAL \inst|Selector20~0_combout\ : std_logic;
SIGNAL \inst|pix_previo[4]~1_combout\ : std_logic;
SIGNAL \inst|Selector19~0_combout\ : std_logic;
SIGNAL \inst|Equal0~2_combout\ : std_logic;
SIGNAL \inst|Selector23~0_combout\ : std_logic;
SIGNAL \inst|Selector24~0_combout\ : std_logic;
SIGNAL \inst|Equal0~0_combout\ : std_logic;
SIGNAL \inst|Equal0~4_combout\ : std_logic;
SIGNAL \inst|Equal0~13_combout\ : std_logic;
SIGNAL \inst|pix_previo[18]~0_combout\ : std_logic;
SIGNAL \inst|LessThan0~0_combout\ : std_logic;
SIGNAL \inst|Selector2~0_combout\ : std_logic;
SIGNAL \inst|Selector2~1_combout\ : std_logic;
SIGNAL \inst|state.nuevo_pix~q\ : std_logic;
SIGNAL \inst|state~23_combout\ : std_logic;
SIGNAL \inst|state~24_combout\ : std_logic;
SIGNAL \inst|state.dir_anterior~q\ : std_logic;
SIGNAL \inst|state.lectura_FIFO_1~q\ : std_logic;
SIGNAL \inst|state.dir_ancho_1~q\ : std_logic;
SIGNAL \inst|state.lectura_ancho_1~q\ : std_logic;
SIGNAL \inst|state.dir_ancho_2~q\ : std_logic;
SIGNAL \inst|state.lectura_ancho_2~q\ : std_logic;
SIGNAL \inst|state.dir_ancho_3~feeder_combout\ : std_logic;
SIGNAL \inst|state.dir_ancho_3~q\ : std_logic;
SIGNAL \inst|state.lectura_ancho_3~q\ : std_logic;
SIGNAL \inst|state.casos~q\ : std_logic;
SIGNAL \inst|Selector3~0_combout\ : std_logic;
SIGNAL \inst|state.escritura~q\ : std_logic;
SIGNAL \inst|state.decremento_indice_FIFO~feeder_combout\ : std_logic;
SIGNAL \inst|state.decremento_indice_FIFO~q\ : std_logic;
SIGNAL \inst|FIFO_RW_o~combout\ : std_logic;
SIGNAL \inst|WideOr8~0_combout\ : std_logic;
SIGNAL \inst|WideOr8~combout\ : std_logic;
SIGNAL \inst|WideOr9~0_combout\ : std_logic;
SIGNAL \inst|WideOr9~combout\ : std_logic;
SIGNAL \inst|WideOr10~0_combout\ : std_logic;
SIGNAL \inst|WideOr10~combout\ : std_logic;
SIGNAL \inst|WideOr11~0_combout\ : std_logic;
SIGNAL \inst|WideOr11~combout\ : std_logic;
SIGNAL \fifo_data_i[10]~input_o\ : std_logic;
SIGNAL \inst|reg_ancho_1[10]~0_combout\ : std_logic;
SIGNAL \inst|reg_FIFO_1[10]~0_combout\ : std_logic;
SIGNAL \fifo_data_i[9]~input_o\ : std_logic;
SIGNAL \fifo_data_i[8]~input_o\ : std_logic;
SIGNAL \fifo_data_i[7]~input_o\ : std_logic;
SIGNAL \fifo_data_i[6]~input_o\ : std_logic;
SIGNAL \fifo_data_i[5]~input_o\ : std_logic;
SIGNAL \fifo_data_i[4]~input_o\ : std_logic;
SIGNAL \fifo_data_i[3]~input_o\ : std_logic;
SIGNAL \inst|reg_FIFO_1[3]~feeder_combout\ : std_logic;
SIGNAL \fifo_data_i[2]~input_o\ : std_logic;
SIGNAL \fifo_data_i[1]~input_o\ : std_logic;
SIGNAL \fifo_data_i[0]~input_o\ : std_logic;
SIGNAL \inst|reg_ancho_1[0]~feeder_combout\ : std_logic;
SIGNAL \inst|LessThan7~1_cout\ : std_logic;
SIGNAL \inst|LessThan7~3_cout\ : std_logic;
SIGNAL \inst|LessThan7~5_cout\ : std_logic;
SIGNAL \inst|LessThan7~7_cout\ : std_logic;
SIGNAL \inst|LessThan7~9_cout\ : std_logic;
SIGNAL \inst|LessThan7~11_cout\ : std_logic;
SIGNAL \inst|LessThan7~13_cout\ : std_logic;
SIGNAL \inst|LessThan7~15_cout\ : std_logic;
SIGNAL \inst|LessThan7~17_cout\ : std_logic;
SIGNAL \inst|LessThan7~19_cout\ : std_logic;
SIGNAL \inst|LessThan7~20_combout\ : std_logic;
SIGNAL \inst|valor_max1~0_combout\ : std_logic;
SIGNAL \inst|reg_ancho_3[10]~0_combout\ : std_logic;
SIGNAL \inst|reg_ancho_3[6]~feeder_combout\ : std_logic;
SIGNAL \inst|reg_ancho_3[4]~feeder_combout\ : std_logic;
SIGNAL \inst|process_0~11_combout\ : std_logic;
SIGNAL \inst|process_0~12_combout\ : std_logic;
SIGNAL \inst|reg_ancho_3[2]~feeder_combout\ : std_logic;
SIGNAL \inst|process_0~13_combout\ : std_logic;
SIGNAL \inst|process_0~5_combout\ : std_logic;
SIGNAL \inst|reg_ancho_2[10]~0_combout\ : std_logic;
SIGNAL \inst|process_0~7_combout\ : std_logic;
SIGNAL \inst|process_0~8_combout\ : std_logic;
SIGNAL \inst|process_0~6_combout\ : std_logic;
SIGNAL \inst|process_0~9_combout\ : std_logic;
SIGNAL \inst|process_0~2_combout\ : std_logic;
SIGNAL \inst|process_0~0_combout\ : std_logic;
SIGNAL \inst|process_0~3_combout\ : std_logic;
SIGNAL \inst|process_0~1_combout\ : std_logic;
SIGNAL \inst|process_0~4_combout\ : std_logic;
SIGNAL \inst|process_0~10_combout\ : std_logic;
SIGNAL \inst|process_0~14_combout\ : std_logic;
SIGNAL \inst|Add10~0_combout\ : std_logic;
SIGNAL \inst|Selector35~0_combout\ : std_logic;
SIGNAL \inst|indice[0]~1_combout\ : std_logic;
SIGNAL \inst|Add10~1\ : std_logic;
SIGNAL \inst|Add10~2_combout\ : std_logic;
SIGNAL \inst|Add10~31_combout\ : std_logic;
SIGNAL \inst|indice[7]~0_combout\ : std_logic;
SIGNAL \inst|Add10~3\ : std_logic;
SIGNAL \inst|Add10~4_combout\ : std_logic;
SIGNAL \inst|Add10~30_combout\ : std_logic;
SIGNAL \inst|Add10~5\ : std_logic;
SIGNAL \inst|Add10~6_combout\ : std_logic;
SIGNAL \inst|Add10~29_combout\ : std_logic;
SIGNAL \inst|Add10~7\ : std_logic;
SIGNAL \inst|Add10~8_combout\ : std_logic;
SIGNAL \inst|Add10~28_combout\ : std_logic;
SIGNAL \inst|Add10~9\ : std_logic;
SIGNAL \inst|Add10~10_combout\ : std_logic;
SIGNAL \inst|Add10~27_combout\ : std_logic;
SIGNAL \inst|Add10~11\ : std_logic;
SIGNAL \inst|Add10~12_combout\ : std_logic;
SIGNAL \inst|Add10~26_combout\ : std_logic;
SIGNAL \inst|Add10~13\ : std_logic;
SIGNAL \inst|Add10~14_combout\ : std_logic;
SIGNAL \inst|Add10~25_combout\ : std_logic;
SIGNAL \inst|Add10~15\ : std_logic;
SIGNAL \inst|Add10~16_combout\ : std_logic;
SIGNAL \inst|Add10~24_combout\ : std_logic;
SIGNAL \inst|Add10~17\ : std_logic;
SIGNAL \inst|Add10~18_combout\ : std_logic;
SIGNAL \inst|Add10~23_combout\ : std_logic;
SIGNAL \inst|Add10~19\ : std_logic;
SIGNAL \inst|Add10~20_combout\ : std_logic;
SIGNAL \inst|Add10~22_combout\ : std_logic;
SIGNAL \inst|Selector36~0_combout\ : std_logic;
SIGNAL \inst|LessThan8~1_cout\ : std_logic;
SIGNAL \inst|LessThan8~3_cout\ : std_logic;
SIGNAL \inst|LessThan8~5_cout\ : std_logic;
SIGNAL \inst|LessThan8~7_cout\ : std_logic;
SIGNAL \inst|LessThan8~9_cout\ : std_logic;
SIGNAL \inst|LessThan8~11_cout\ : std_logic;
SIGNAL \inst|LessThan8~13_cout\ : std_logic;
SIGNAL \inst|LessThan8~15_cout\ : std_logic;
SIGNAL \inst|LessThan8~17_cout\ : std_logic;
SIGNAL \inst|LessThan8~19_cout\ : std_logic;
SIGNAL \inst|LessThan8~20_combout\ : std_logic;
SIGNAL \inst|valor_max2~0_combout\ : std_logic;
SIGNAL \inst|valor_max2~1_combout\ : std_logic;
SIGNAL \inst|valor_max1~1_combout\ : std_logic;
SIGNAL \inst|valor_max1~2_combout\ : std_logic;
SIGNAL \inst|valor_max2~2_combout\ : std_logic;
SIGNAL \inst|valor_max2~3_combout\ : std_logic;
SIGNAL \inst|valor_max1~3_combout\ : std_logic;
SIGNAL \inst|valor_max2~4_combout\ : std_logic;
SIGNAL \inst|valor_max1~4_combout\ : std_logic;
SIGNAL \inst|valor_max2~5_combout\ : std_logic;
SIGNAL \inst|valor_max1~5_combout\ : std_logic;
SIGNAL \inst|valor_max1~6_combout\ : std_logic;
SIGNAL \inst|valor_max2~6_combout\ : std_logic;
SIGNAL \inst|valor_max1~7_combout\ : std_logic;
SIGNAL \inst|valor_max2~7_combout\ : std_logic;
SIGNAL \inst|valor_max1~8_combout\ : std_logic;
SIGNAL \inst|valor_max2~8_combout\ : std_logic;
SIGNAL \inst|valor_max2~9_combout\ : std_logic;
SIGNAL \inst|valor_max1~9_combout\ : std_logic;
SIGNAL \inst|valor_max2~10_combout\ : std_logic;
SIGNAL \inst|valor_max1~10_combout\ : std_logic;
SIGNAL \inst|LessThan9~1_cout\ : std_logic;
SIGNAL \inst|LessThan9~3_cout\ : std_logic;
SIGNAL \inst|LessThan9~5_cout\ : std_logic;
SIGNAL \inst|LessThan9~7_cout\ : std_logic;
SIGNAL \inst|LessThan9~9_cout\ : std_logic;
SIGNAL \inst|LessThan9~11_cout\ : std_logic;
SIGNAL \inst|LessThan9~13_cout\ : std_logic;
SIGNAL \inst|LessThan9~15_cout\ : std_logic;
SIGNAL \inst|LessThan9~17_cout\ : std_logic;
SIGNAL \inst|LessThan9~19_cout\ : std_logic;
SIGNAL \inst|LessThan9~20_combout\ : std_logic;
SIGNAL \inst|Selector36~1_combout\ : std_logic;
SIGNAL \inst|FIFO_0[0]~0_combout\ : std_logic;
SIGNAL \inst|FIFO_0[10]~1_combout\ : std_logic;
SIGNAL \inst|FIFO_data_o[10]~0_combout\ : std_logic;
SIGNAL \inst|Selector37~0_combout\ : std_logic;
SIGNAL \inst|Selector37~1_combout\ : std_logic;
SIGNAL \inst|FIFO_data_o[9]~1_combout\ : std_logic;
SIGNAL \inst|Selector38~0_combout\ : std_logic;
SIGNAL \inst|Selector38~1_combout\ : std_logic;
SIGNAL \inst|FIFO_data_o[8]~2_combout\ : std_logic;
SIGNAL \inst|Selector39~0_combout\ : std_logic;
SIGNAL \inst|Selector39~1_combout\ : std_logic;
SIGNAL \inst|FIFO_data_o[7]~3_combout\ : std_logic;
SIGNAL \inst|Selector40~0_combout\ : std_logic;
SIGNAL \inst|Selector40~1_combout\ : std_logic;
SIGNAL \inst|FIFO_data_o[6]~4_combout\ : std_logic;
SIGNAL \inst|Selector41~0_combout\ : std_logic;
SIGNAL \inst|Selector41~1_combout\ : std_logic;
SIGNAL \inst|FIFO_data_o[5]~5_combout\ : std_logic;
SIGNAL \inst|Selector42~0_combout\ : std_logic;
SIGNAL \inst|Selector42~1_combout\ : std_logic;
SIGNAL \inst|FIFO_data_o[4]~6_combout\ : std_logic;
SIGNAL \inst|Selector43~0_combout\ : std_logic;
SIGNAL \inst|Selector43~1_combout\ : std_logic;
SIGNAL \inst|FIFO_data_o[3]~7_combout\ : std_logic;
SIGNAL \inst|Selector44~0_combout\ : std_logic;
SIGNAL \inst|Selector44~1_combout\ : std_logic;
SIGNAL \inst|FIFO_data_o[2]~8_combout\ : std_logic;
SIGNAL \inst|Selector45~0_combout\ : std_logic;
SIGNAL \inst|Selector45~1_combout\ : std_logic;
SIGNAL \inst|FIFO_data_o[1]~9_combout\ : std_logic;
SIGNAL \inst|Selector46~0_combout\ : std_logic;
SIGNAL \inst|Selector46~1_combout\ : std_logic;
SIGNAL \inst|FIFO_data_o[0]~10_combout\ : std_logic;
SIGNAL \inst|Add8~0_combout\ : std_logic;
SIGNAL \inst|indice_FIFO~10_combout\ : std_logic;
SIGNAL \inst|Add8~1\ : std_logic;
SIGNAL \inst|Add8~3\ : std_logic;
SIGNAL \inst|Add8~4_combout\ : std_logic;
SIGNAL \inst|indice_FIFO~8_combout\ : std_logic;
SIGNAL \inst|Add8~5\ : std_logic;
SIGNAL \inst|Add8~6_combout\ : std_logic;
SIGNAL \inst|indice_FIFO~7_combout\ : std_logic;
SIGNAL \inst|Add8~7\ : std_logic;
SIGNAL \inst|Add8~8_combout\ : std_logic;
SIGNAL \inst|indice_FIFO~6_combout\ : std_logic;
SIGNAL \inst|Add8~9\ : std_logic;
SIGNAL \inst|Add8~10_combout\ : std_logic;
SIGNAL \inst|indice_FIFO~5_combout\ : std_logic;
SIGNAL \inst|Add8~11\ : std_logic;
SIGNAL \inst|Add8~12_combout\ : std_logic;
SIGNAL \inst|indice_FIFO~4_combout\ : std_logic;
SIGNAL \inst|LessThan4~1_combout\ : std_logic;
SIGNAL \inst|Add8~13\ : std_logic;
SIGNAL \inst|Add8~14_combout\ : std_logic;
SIGNAL \inst|indice_FIFO~3_combout\ : std_logic;
SIGNAL \inst|Add8~15\ : std_logic;
SIGNAL \inst|Add8~16_combout\ : std_logic;
SIGNAL \inst|indice_FIFO~2_combout\ : std_logic;
SIGNAL \inst|Add8~17\ : std_logic;
SIGNAL \inst|Add8~18_combout\ : std_logic;
SIGNAL \inst|indice_FIFO~1_combout\ : std_logic;
SIGNAL \inst|LessThan4~0_combout\ : std_logic;
SIGNAL \inst|LessThan4~2_combout\ : std_logic;
SIGNAL \inst|Add8~2_combout\ : std_logic;
SIGNAL \inst|indice_FIFO~9_combout\ : std_logic;
SIGNAL \inst|Add8~19\ : std_logic;
SIGNAL \inst|Add8~20_combout\ : std_logic;
SIGNAL \inst|indice_FIFO~0_combout\ : std_logic;
SIGNAL \inst|Selector47~2_combout\ : std_logic;
SIGNAL \inst|Add3~0_combout\ : std_logic;
SIGNAL \inst|Add2~1\ : std_logic;
SIGNAL \inst|Add2~3\ : std_logic;
SIGNAL \inst|Add2~5\ : std_logic;
SIGNAL \inst|Add2~7\ : std_logic;
SIGNAL \inst|Add2~9\ : std_logic;
SIGNAL \inst|Add2~11\ : std_logic;
SIGNAL \inst|Add2~13\ : std_logic;
SIGNAL \inst|Add2~15\ : std_logic;
SIGNAL \inst|Add2~17\ : std_logic;
SIGNAL \inst|Add2~19\ : std_logic;
SIGNAL \inst|Add2~20_combout\ : std_logic;
SIGNAL \inst|LessThan4~3_combout\ : std_logic;
SIGNAL \inst|Selector47~3_combout\ : std_logic;
SIGNAL \inst|Add6~1\ : std_logic;
SIGNAL \inst|Add6~3\ : std_logic;
SIGNAL \inst|Add6~5\ : std_logic;
SIGNAL \inst|Add6~7\ : std_logic;
SIGNAL \inst|Add6~9\ : std_logic;
SIGNAL \inst|Add6~11\ : std_logic;
SIGNAL \inst|Add6~13\ : std_logic;
SIGNAL \inst|Add6~15\ : std_logic;
SIGNAL \inst|Add6~17\ : std_logic;
SIGNAL \inst|Add6~19\ : std_logic;
SIGNAL \inst|Add6~21\ : std_logic;
SIGNAL \inst|Add6~22_combout\ : std_logic;
SIGNAL \inst|Add6~20_combout\ : std_logic;
SIGNAL \inst|Add6~18_combout\ : std_logic;
SIGNAL \inst|Add6~12_combout\ : std_logic;
SIGNAL \inst|Add6~16_combout\ : std_logic;
SIGNAL \inst|Add6~6_combout\ : std_logic;
SIGNAL \inst|Add6~4_combout\ : std_logic;
SIGNAL \inst|Add6~10_combout\ : std_logic;
SIGNAL \inst|Add6~8_combout\ : std_logic;
SIGNAL \inst|LessThan5~0_combout\ : std_logic;
SIGNAL \inst|Add6~2_combout\ : std_logic;
SIGNAL \inst|Add6~0_combout\ : std_logic;
SIGNAL \inst|Add6~14_combout\ : std_logic;
SIGNAL \inst|LessThan5~1_combout\ : std_logic;
SIGNAL \inst|LessThan5~2_combout\ : std_logic;
SIGNAL \inst|LessThan5~3_combout\ : std_logic;
SIGNAL \inst|Add4~1\ : std_logic;
SIGNAL \inst|Add4~3\ : std_logic;
SIGNAL \inst|Add4~5\ : std_logic;
SIGNAL \inst|Add4~7\ : std_logic;
SIGNAL \inst|Add4~9\ : std_logic;
SIGNAL \inst|Add4~11\ : std_logic;
SIGNAL \inst|Add4~13\ : std_logic;
SIGNAL \inst|Add4~15\ : std_logic;
SIGNAL \inst|Add4~17\ : std_logic;
SIGNAL \inst|Add4~18_combout\ : std_logic;
SIGNAL \inst|Selector47~1_combout\ : std_logic;
SIGNAL \inst|Add1~1\ : std_logic;
SIGNAL \inst|Add1~3\ : std_logic;
SIGNAL \inst|Add1~5\ : std_logic;
SIGNAL \inst|Add1~7\ : std_logic;
SIGNAL \inst|Add1~9\ : std_logic;
SIGNAL \inst|Add1~11\ : std_logic;
SIGNAL \inst|Add1~13\ : std_logic;
SIGNAL \inst|Add1~15\ : std_logic;
SIGNAL \inst|Add1~17\ : std_logic;
SIGNAL \inst|Add1~18_combout\ : std_logic;
SIGNAL \inst|Add1~19\ : std_logic;
SIGNAL \inst|Add1~20_combout\ : std_logic;
SIGNAL \inst|Add1~21\ : std_logic;
SIGNAL \inst|Add1~22_combout\ : std_logic;
SIGNAL \inst|Add1~12_combout\ : std_logic;
SIGNAL \inst|Add1~16_combout\ : std_logic;
SIGNAL \inst|Add1~0_combout\ : std_logic;
SIGNAL \inst|Add1~14_combout\ : std_logic;
SIGNAL \inst|Add1~2_combout\ : std_logic;
SIGNAL \inst|LessThan3~1_combout\ : std_logic;
SIGNAL \inst|Add1~6_combout\ : std_logic;
SIGNAL \inst|Add1~4_combout\ : std_logic;
SIGNAL \inst|Add1~8_combout\ : std_logic;
SIGNAL \inst|Add1~10_combout\ : std_logic;
SIGNAL \inst|LessThan3~0_combout\ : std_logic;
SIGNAL \inst|LessThan3~2_combout\ : std_logic;
SIGNAL \inst|LessThan3~3_combout\ : std_logic;
SIGNAL \inst|Add0~1_cout\ : std_logic;
SIGNAL \inst|Add0~3\ : std_logic;
SIGNAL \inst|Add0~5\ : std_logic;
SIGNAL \inst|Add0~7\ : std_logic;
SIGNAL \inst|Add0~9\ : std_logic;
SIGNAL \inst|Add0~11\ : std_logic;
SIGNAL \inst|Add0~13\ : std_logic;
SIGNAL \inst|Add0~15\ : std_logic;
SIGNAL \inst|Add0~17\ : std_logic;
SIGNAL \inst|Add0~18_combout\ : std_logic;
SIGNAL \inst|Selector47~4_combout\ : std_logic;
SIGNAL \inst|Add9~1\ : std_logic;
SIGNAL \inst|Add9~3\ : std_logic;
SIGNAL \inst|Add9~5\ : std_logic;
SIGNAL \inst|Add9~7\ : std_logic;
SIGNAL \inst|Add9~9\ : std_logic;
SIGNAL \inst|Add9~11\ : std_logic;
SIGNAL \inst|Add9~13\ : std_logic;
SIGNAL \inst|Add9~15\ : std_logic;
SIGNAL \inst|Add9~17\ : std_logic;
SIGNAL \inst|Add9~18_combout\ : std_logic;
SIGNAL \inst|Add9~19\ : std_logic;
SIGNAL \inst|Add9~20_combout\ : std_logic;
SIGNAL \inst|Add9~16_combout\ : std_logic;
SIGNAL \inst|Add9~0_combout\ : std_logic;
SIGNAL \inst|Add9~12_combout\ : std_logic;
SIGNAL \inst|LessThan6~1_combout\ : std_logic;
SIGNAL \inst|Add9~14_combout\ : std_logic;
SIGNAL \inst|Add9~6_combout\ : std_logic;
SIGNAL \inst|Add9~2_combout\ : std_logic;
SIGNAL \inst|Add9~8_combout\ : std_logic;
SIGNAL \inst|Add9~4_combout\ : std_logic;
SIGNAL \inst|LessThan6~0_combout\ : std_logic;
SIGNAL \inst|Add9~10_combout\ : std_logic;
SIGNAL \inst|LessThan6~2_combout\ : std_logic;
SIGNAL \inst|LessThan6~3_combout\ : std_logic;
SIGNAL \inst|Selector47~0_combout\ : std_logic;
SIGNAL \inst|Selector47~5_combout\ : std_logic;
SIGNAL \inst|WideOr7~0_combout\ : std_logic;
SIGNAL \inst|FIFO_dir_o[10]~0_combout\ : std_logic;
SIGNAL \inst|Add2~18_combout\ : std_logic;
SIGNAL \inst|FIFO_dir_o[10]~1_combout\ : std_logic;
SIGNAL \inst|Selector48~2_combout\ : std_logic;
SIGNAL \inst|Add4~16_combout\ : std_logic;
SIGNAL \inst|Selector48~1_combout\ : std_logic;
SIGNAL \inst|Selector48~0_combout\ : std_logic;
SIGNAL \inst|Add0~16_combout\ : std_logic;
SIGNAL \inst|Selector48~3_combout\ : std_logic;
SIGNAL \inst|Selector48~4_combout\ : std_logic;
SIGNAL \inst|Selector49~2_combout\ : std_logic;
SIGNAL \inst|Add2~16_combout\ : std_logic;
SIGNAL \inst|Selector49~3_combout\ : std_logic;
SIGNAL \inst|Selector49~0_combout\ : std_logic;
SIGNAL \inst|Add4~14_combout\ : std_logic;
SIGNAL \inst|Selector49~1_combout\ : std_logic;
SIGNAL \inst|Add0~14_combout\ : std_logic;
SIGNAL \inst|Selector49~4_combout\ : std_logic;
SIGNAL \inst|Selector49~5_combout\ : std_logic;
SIGNAL \inst|Selector50~0_combout\ : std_logic;
SIGNAL \inst|Add4~12_combout\ : std_logic;
SIGNAL \inst|Selector50~1_combout\ : std_logic;
SIGNAL \inst|Add2~14_combout\ : std_logic;
SIGNAL \inst|Selector50~2_combout\ : std_logic;
SIGNAL \inst|Add0~12_combout\ : std_logic;
SIGNAL \inst|Selector50~3_combout\ : std_logic;
SIGNAL \inst|Selector50~4_combout\ : std_logic;
SIGNAL \inst|Selector51~0_combout\ : std_logic;
SIGNAL \inst|Add2~12_combout\ : std_logic;
SIGNAL \inst|Selector51~2_combout\ : std_logic;
SIGNAL \inst|Add4~10_combout\ : std_logic;
SIGNAL \inst|Selector51~1_combout\ : std_logic;
SIGNAL \inst|Add0~10_combout\ : std_logic;
SIGNAL \inst|Selector51~3_combout\ : std_logic;
SIGNAL \inst|Selector51~4_combout\ : std_logic;
SIGNAL \inst|Add2~10_combout\ : std_logic;
SIGNAL \inst|Selector52~2_combout\ : std_logic;
SIGNAL \inst|Add4~8_combout\ : std_logic;
SIGNAL \inst|Selector52~1_combout\ : std_logic;
SIGNAL \inst|Selector52~0_combout\ : std_logic;
SIGNAL \inst|Add0~8_combout\ : std_logic;
SIGNAL \inst|Selector52~3_combout\ : std_logic;
SIGNAL \inst|Selector52~4_combout\ : std_logic;
SIGNAL \inst|Add2~8_combout\ : std_logic;
SIGNAL \inst|Selector53~2_combout\ : std_logic;
SIGNAL \inst|Selector53~0_combout\ : std_logic;
SIGNAL \inst|Add4~6_combout\ : std_logic;
SIGNAL \inst|Selector53~1_combout\ : std_logic;
SIGNAL \inst|Add0~6_combout\ : std_logic;
SIGNAL \inst|Selector53~3_combout\ : std_logic;
SIGNAL \inst|Selector53~4_combout\ : std_logic;
SIGNAL \inst|Selector54~0_combout\ : std_logic;
SIGNAL \inst|Add4~4_combout\ : std_logic;
SIGNAL \inst|Selector54~1_combout\ : std_logic;
SIGNAL \inst|Add2~6_combout\ : std_logic;
SIGNAL \inst|Selector54~2_combout\ : std_logic;
SIGNAL \inst|Add0~4_combout\ : std_logic;
SIGNAL \inst|Selector54~3_combout\ : std_logic;
SIGNAL \inst|Selector54~4_combout\ : std_logic;
SIGNAL \inst|Add2~4_combout\ : std_logic;
SIGNAL \inst|Selector55~2_combout\ : std_logic;
SIGNAL \inst|Add4~2_combout\ : std_logic;
SIGNAL \inst|Selector55~1_combout\ : std_logic;
SIGNAL \inst|Selector55~0_combout\ : std_logic;
SIGNAL \inst|Add0~2_combout\ : std_logic;
SIGNAL \inst|Selector55~3_combout\ : std_logic;
SIGNAL \inst|Selector55~4_combout\ : std_logic;
SIGNAL \inst|Selector56~2_combout\ : std_logic;
SIGNAL \inst|Selector56~1_combout\ : std_logic;
SIGNAL \inst|Selector56~0_combout\ : std_logic;
SIGNAL \inst|Add2~2_combout\ : std_logic;
SIGNAL \inst|Add4~0_combout\ : std_logic;
SIGNAL \inst|Selector56~3_combout\ : std_logic;
SIGNAL \inst|Selector56~4_combout\ : std_logic;
SIGNAL \inst|Selector56~5_combout\ : std_logic;
SIGNAL \inst|Selector57~0_combout\ : std_logic;
SIGNAL \inst|Selector57~5_combout\ : std_logic;
SIGNAL \inst|Add2~0_combout\ : std_logic;
SIGNAL \inst|Selector57~1_combout\ : std_logic;
SIGNAL \inst|Selector57~2_combout\ : std_logic;
SIGNAL \inst|Selector57~3_combout\ : std_logic;
SIGNAL \inst|Selector57~4_combout\ : std_logic;
SIGNAL \inst|Selector57~6_combout\ : std_logic;
SIGNAL \inst|reg_ancho_2\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst1|reg_data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|FIFO_0\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|reg_ancho_1\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst1|pix_count_int\ : std_logic_vector(20 DOWNTO 0);
SIGNAL \inst|FIFO_dir_o\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|pix_previo\ : std_logic_vector(20 DOWNTO 0);
SIGNAL \inst|reg_FIFO_1\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|reg_ancho_3\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|indice\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|indice_FIFO\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \ALT_INV_hab_byte~input_o\ : std_logic;
SIGNAL \inst|ALT_INV_WideOr11~combout\ : std_logic;
SIGNAL \inst|ALT_INV_state.casos~q\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

fifo_rw <= ww_fifo_rw;
ww_clk <= clk;
ww_reset <= reset;
ww_enable <= enable;
ww_trigger <= trigger;
ww_fifo_data_i <= fifo_data_i;
ww_hab_byte <= hab_byte;
ww_byte_entrada <= byte_entrada;
estado <= ww_estado;
fifo_data <= ww_fifo_data;
fifo_dir <= ww_fifo_dir;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_hab_byte~input_o\ <= NOT \hab_byte~input_o\;
\inst|ALT_INV_WideOr11~combout\ <= NOT \inst|WideOr11~combout\;
\inst|ALT_INV_state.casos~q\ <= NOT \inst|state.casos~q\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X107_Y73_N23
\fifo_rw~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_RW_o~combout\,
	devoe => ww_devoe,
	o => \fifo_rw~output_o\);

-- Location: IOOBUF_X115_Y66_N23
\estado[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr8~combout\,
	devoe => ww_devoe,
	o => \estado[3]~output_o\);

-- Location: IOOBUF_X115_Y62_N9
\estado[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr9~combout\,
	devoe => ww_devoe,
	o => \estado[2]~output_o\);

-- Location: IOOBUF_X115_Y63_N9
\estado[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr10~combout\,
	devoe => ww_devoe,
	o => \estado[1]~output_o\);

-- Location: IOOBUF_X115_Y66_N16
\estado[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_WideOr11~combout\,
	devoe => ww_devoe,
	o => \estado[0]~output_o\);

-- Location: IOOBUF_X91_Y73_N16
\fifo_data[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_data_o[10]~0_combout\,
	devoe => ww_devoe,
	o => \fifo_data[10]~output_o\);

-- Location: IOOBUF_X98_Y73_N23
\fifo_data[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_data_o[9]~1_combout\,
	devoe => ww_devoe,
	o => \fifo_data[9]~output_o\);

-- Location: IOOBUF_X98_Y73_N16
\fifo_data[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_data_o[8]~2_combout\,
	devoe => ww_devoe,
	o => \fifo_data[8]~output_o\);

-- Location: IOOBUF_X115_Y65_N16
\fifo_data[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_data_o[7]~3_combout\,
	devoe => ww_devoe,
	o => \fifo_data[7]~output_o\);

-- Location: IOOBUF_X96_Y73_N16
\fifo_data[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_data_o[6]~4_combout\,
	devoe => ww_devoe,
	o => \fifo_data[6]~output_o\);

-- Location: IOOBUF_X89_Y73_N23
\fifo_data[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_data_o[5]~5_combout\,
	devoe => ww_devoe,
	o => \fifo_data[5]~output_o\);

-- Location: IOOBUF_X96_Y73_N23
\fifo_data[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_data_o[4]~6_combout\,
	devoe => ww_devoe,
	o => \fifo_data[4]~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\fifo_data[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_data_o[3]~7_combout\,
	devoe => ww_devoe,
	o => \fifo_data[3]~output_o\);

-- Location: IOOBUF_X89_Y73_N9
\fifo_data[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_data_o[2]~8_combout\,
	devoe => ww_devoe,
	o => \fifo_data[2]~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\fifo_data[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_data_o[1]~9_combout\,
	devoe => ww_devoe,
	o => \fifo_data[1]~output_o\);

-- Location: IOOBUF_X89_Y73_N16
\fifo_data[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_data_o[0]~10_combout\,
	devoe => ww_devoe,
	o => \fifo_data[0]~output_o\);

-- Location: IOOBUF_X115_Y57_N23
\fifo_dir[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_dir_o\(10),
	devoe => ww_devoe,
	o => \fifo_dir[10]~output_o\);

-- Location: IOOBUF_X115_Y61_N16
\fifo_dir[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_dir_o\(9),
	devoe => ww_devoe,
	o => \fifo_dir[9]~output_o\);

-- Location: IOOBUF_X115_Y61_N23
\fifo_dir[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_dir_o\(8),
	devoe => ww_devoe,
	o => \fifo_dir[8]~output_o\);

-- Location: IOOBUF_X115_Y64_N9
\fifo_dir[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_dir_o\(7),
	devoe => ww_devoe,
	o => \fifo_dir[7]~output_o\);

-- Location: IOOBUF_X115_Y58_N23
\fifo_dir[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_dir_o\(6),
	devoe => ww_devoe,
	o => \fifo_dir[6]~output_o\);

-- Location: IOOBUF_X115_Y64_N2
\fifo_dir[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_dir_o\(5),
	devoe => ww_devoe,
	o => \fifo_dir[5]~output_o\);

-- Location: IOOBUF_X115_Y58_N16
\fifo_dir[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_dir_o\(4),
	devoe => ww_devoe,
	o => \fifo_dir[4]~output_o\);

-- Location: IOOBUF_X115_Y57_N16
\fifo_dir[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_dir_o\(3),
	devoe => ww_devoe,
	o => \fifo_dir[3]~output_o\);

-- Location: IOOBUF_X115_Y62_N23
\fifo_dir[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_dir_o\(2),
	devoe => ww_devoe,
	o => \fifo_dir[2]~output_o\);

-- Location: IOOBUF_X115_Y62_N16
\fifo_dir[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_dir_o\(1),
	devoe => ww_devoe,
	o => \fifo_dir[1]~output_o\);

-- Location: IOOBUF_X115_Y63_N2
\fifo_dir[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|FIFO_dir_o\(0),
	devoe => ww_devoe,
	o => \fifo_dir[0]~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G4
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X115_Y56_N15
\byte_entrada[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_byte_entrada(7),
	o => \byte_entrada[7]~input_o\);

-- Location: IOIBUF_X115_Y40_N8
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: IOIBUF_X115_Y67_N15
\hab_byte~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_hab_byte,
	o => \hab_byte~input_o\);

-- Location: FF_X107_Y63_N31
\inst1|state\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|reg_data[7]~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|state~q\);

-- Location: LCCOMB_X107_Y63_N30
\inst1|reg_data[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|reg_data[7]~0_combout\ = (\hab_byte~input_o\ & !\inst1|state~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \hab_byte~input_o\,
	datac => \inst1|state~q\,
	combout => \inst1|reg_data[7]~0_combout\);

-- Location: FF_X108_Y60_N23
\inst1|reg_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \byte_entrada[7]~input_o\,
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \inst1|reg_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|reg_data\(7));

-- Location: IOIBUF_X115_Y56_N22
\byte_entrada[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_byte_entrada(5),
	o => \byte_entrada[5]~input_o\);

-- Location: FF_X108_Y60_N3
\inst1|reg_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \byte_entrada[5]~input_o\,
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \inst1|reg_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|reg_data\(5));

-- Location: IOIBUF_X115_Y60_N15
\byte_entrada[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_byte_entrada(6),
	o => \byte_entrada[6]~input_o\);

-- Location: FF_X108_Y60_N29
\inst1|reg_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \byte_entrada[6]~input_o\,
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \inst1|reg_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|reg_data\(6));

-- Location: IOIBUF_X115_Y53_N15
\byte_entrada[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_byte_entrada(0),
	o => \byte_entrada[0]~input_o\);

-- Location: FF_X108_Y60_N25
\inst1|reg_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \byte_entrada[0]~input_o\,
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \inst1|reg_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|reg_data\(0));

-- Location: LCCOMB_X108_Y60_N28
\inst|LessThan2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan2~0_combout\ = (\inst1|reg_data\(7)) # ((\inst1|reg_data\(5)) # ((\inst1|reg_data\(6)) # (\inst1|reg_data\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|reg_data\(7),
	datab => \inst1|reg_data\(5),
	datac => \inst1|reg_data\(6),
	datad => \inst1|reg_data\(0),
	combout => \inst|LessThan2~0_combout\);

-- Location: IOIBUF_X115_Y55_N22
\byte_entrada[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_byte_entrada(1),
	o => \byte_entrada[1]~input_o\);

-- Location: LCCOMB_X108_Y60_N26
\inst1|reg_data[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|reg_data[1]~feeder_combout\ = \byte_entrada[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \byte_entrada[1]~input_o\,
	combout => \inst1|reg_data[1]~feeder_combout\);

-- Location: FF_X108_Y60_N27
\inst1|reg_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|reg_data[1]~feeder_combout\,
	clrn => \reset~input_o\,
	ena => \inst1|reg_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|reg_data\(1));

-- Location: IOIBUF_X115_Y59_N15
\byte_entrada[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_byte_entrada(4),
	o => \byte_entrada[4]~input_o\);

-- Location: FF_X108_Y60_N21
\inst1|reg_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \byte_entrada[4]~input_o\,
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \inst1|reg_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|reg_data\(4));

-- Location: IOIBUF_X115_Y59_N22
\byte_entrada[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_byte_entrada(2),
	o => \byte_entrada[2]~input_o\);

-- Location: FF_X108_Y60_N1
\inst1|reg_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \byte_entrada[2]~input_o\,
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \inst1|reg_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|reg_data\(2));

-- Location: IOIBUF_X115_Y55_N15
\byte_entrada[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_byte_entrada(3),
	o => \byte_entrada[3]~input_o\);

-- Location: LCCOMB_X108_Y60_N18
\inst1|reg_data[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|reg_data[3]~feeder_combout\ = \byte_entrada[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \byte_entrada[3]~input_o\,
	combout => \inst1|reg_data[3]~feeder_combout\);

-- Location: FF_X108_Y60_N19
\inst1|reg_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|reg_data[3]~feeder_combout\,
	clrn => \reset~input_o\,
	ena => \inst1|reg_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|reg_data\(3));

-- Location: LCCOMB_X108_Y60_N0
\inst|LessThan2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan2~1_combout\ = (\inst1|reg_data\(1)) # ((\inst1|reg_data\(4)) # ((\inst1|reg_data\(2)) # (\inst1|reg_data\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|reg_data\(1),
	datab => \inst1|reg_data\(4),
	datac => \inst1|reg_data\(2),
	datad => \inst1|reg_data\(3),
	combout => \inst|LessThan2~1_combout\);

-- Location: LCCOMB_X107_Y64_N12
\inst1|pix_count_int[0]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[0]~21_combout\ = \inst1|pix_count_int\(0) $ (VCC)
-- \inst1|pix_count_int[0]~22\ = CARRY(\inst1|pix_count_int\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|pix_count_int\(0),
	datad => VCC,
	combout => \inst1|pix_count_int[0]~21_combout\,
	cout => \inst1|pix_count_int[0]~22\);

-- Location: LCCOMB_X107_Y63_N26
\inst1|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Equal0~5_combout\ = (\inst1|pix_count_int\(16)) # ((\inst1|pix_count_int\(14)) # ((\inst1|pix_count_int\(13)) # (\inst1|pix_count_int\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|pix_count_int\(16),
	datab => \inst1|pix_count_int\(14),
	datac => \inst1|pix_count_int\(13),
	datad => \inst1|pix_count_int\(15),
	combout => \inst1|Equal0~5_combout\);

-- Location: LCCOMB_X107_Y63_N16
\inst1|pix_count_int[18]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[18]~57_combout\ = (\inst1|pix_count_int\(18) & (\inst1|pix_count_int[17]~56\ $ (GND))) # (!\inst1|pix_count_int\(18) & (!\inst1|pix_count_int[17]~56\ & VCC))
-- \inst1|pix_count_int[18]~58\ = CARRY((\inst1|pix_count_int\(18) & !\inst1|pix_count_int[17]~56\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst1|pix_count_int\(18),
	datad => VCC,
	cin => \inst1|pix_count_int[17]~56\,
	combout => \inst1|pix_count_int[18]~57_combout\,
	cout => \inst1|pix_count_int[18]~58\);

-- Location: LCCOMB_X107_Y63_N18
\inst1|pix_count_int[19]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[19]~61_combout\ = (\inst1|pix_count_int\(19) & (!\inst1|pix_count_int[18]~58\)) # (!\inst1|pix_count_int\(19) & ((\inst1|pix_count_int[18]~58\) # (GND)))
-- \inst1|pix_count_int[19]~62\ = CARRY((!\inst1|pix_count_int[18]~58\) # (!\inst1|pix_count_int\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst1|pix_count_int\(19),
	datad => VCC,
	cin => \inst1|pix_count_int[18]~58\,
	combout => \inst1|pix_count_int[19]~61_combout\,
	cout => \inst1|pix_count_int[19]~62\);

-- Location: FF_X107_Y63_N19
\inst1|pix_count_int[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[19]~61_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(19));

-- Location: LCCOMB_X107_Y63_N20
\inst1|pix_count_int[20]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[20]~63_combout\ = \inst1|pix_count_int[19]~62\ $ (!\inst1|pix_count_int\(20))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst1|pix_count_int\(20),
	cin => \inst1|pix_count_int[19]~62\,
	combout => \inst1|pix_count_int[20]~63_combout\);

-- Location: FF_X107_Y63_N21
\inst1|pix_count_int[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[20]~63_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(20));

-- Location: LCCOMB_X107_Y64_N6
\inst1|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Equal0~0_combout\ = (\inst1|pix_count_int\(0)) # (((\inst1|pix_count_int\(19)) # (!\inst1|pix_count_int\(20))) # (!\inst1|pix_count_int\(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|pix_count_int\(0),
	datab => \inst1|pix_count_int\(18),
	datac => \inst1|pix_count_int\(19),
	datad => \inst1|pix_count_int\(20),
	combout => \inst1|Equal0~0_combout\);

-- Location: LCCOMB_X107_Y64_N8
\inst1|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Equal0~1_combout\ = (\inst1|pix_count_int\(4)) # ((\inst1|pix_count_int\(3)) # ((\inst1|pix_count_int\(1)) # (\inst1|pix_count_int\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|pix_count_int\(4),
	datab => \inst1|pix_count_int\(3),
	datac => \inst1|pix_count_int\(1),
	datad => \inst1|pix_count_int\(2),
	combout => \inst1|Equal0~1_combout\);

-- Location: LCCOMB_X107_Y64_N2
\inst1|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Equal0~2_combout\ = (\inst1|pix_count_int\(5)) # ((\inst1|pix_count_int\(8)) # ((\inst1|pix_count_int\(7)) # (\inst1|pix_count_int\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|pix_count_int\(5),
	datab => \inst1|pix_count_int\(8),
	datac => \inst1|pix_count_int\(7),
	datad => \inst1|pix_count_int\(6),
	combout => \inst1|Equal0~2_combout\);

-- Location: LCCOMB_X106_Y63_N18
\inst1|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Equal0~3_combout\ = (\inst1|pix_count_int\(12)) # ((\inst1|pix_count_int\(9)) # ((\inst1|pix_count_int\(10)) # (\inst1|pix_count_int\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|pix_count_int\(12),
	datab => \inst1|pix_count_int\(9),
	datac => \inst1|pix_count_int\(10),
	datad => \inst1|pix_count_int\(11),
	combout => \inst1|Equal0~3_combout\);

-- Location: LCCOMB_X107_Y63_N28
\inst1|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Equal0~4_combout\ = (\inst1|Equal0~0_combout\) # ((\inst1|Equal0~1_combout\) # ((\inst1|Equal0~2_combout\) # (\inst1|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|Equal0~0_combout\,
	datab => \inst1|Equal0~1_combout\,
	datac => \inst1|Equal0~2_combout\,
	datad => \inst1|Equal0~3_combout\,
	combout => \inst1|Equal0~4_combout\);

-- Location: LCCOMB_X107_Y63_N24
\inst1|pix_count_int[18]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[18]~59_combout\ = (!\hab_byte~input_o\ & ((\inst1|Equal0~5_combout\) # ((\inst1|pix_count_int\(17)) # (\inst1|Equal0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|Equal0~5_combout\,
	datab => \hab_byte~input_o\,
	datac => \inst1|pix_count_int\(17),
	datad => \inst1|Equal0~4_combout\,
	combout => \inst1|pix_count_int[18]~59_combout\);

-- Location: LCCOMB_X107_Y63_N22
\inst1|pix_count_int[20]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[20]~60_combout\ = (!\inst1|state~q\ & !\inst1|pix_count_int[18]~59_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst1|state~q\,
	datad => \inst1|pix_count_int[18]~59_combout\,
	combout => \inst1|pix_count_int[20]~60_combout\);

-- Location: FF_X107_Y64_N13
\inst1|pix_count_int[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[0]~21_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(0));

-- Location: LCCOMB_X107_Y64_N14
\inst1|pix_count_int[1]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[1]~23_combout\ = (\inst1|pix_count_int\(1) & (!\inst1|pix_count_int[0]~22\)) # (!\inst1|pix_count_int\(1) & ((\inst1|pix_count_int[0]~22\) # (GND)))
-- \inst1|pix_count_int[1]~24\ = CARRY((!\inst1|pix_count_int[0]~22\) # (!\inst1|pix_count_int\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst1|pix_count_int\(1),
	datad => VCC,
	cin => \inst1|pix_count_int[0]~22\,
	combout => \inst1|pix_count_int[1]~23_combout\,
	cout => \inst1|pix_count_int[1]~24\);

-- Location: FF_X107_Y64_N15
\inst1|pix_count_int[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[1]~23_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(1));

-- Location: LCCOMB_X107_Y64_N16
\inst1|pix_count_int[2]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[2]~25_combout\ = (\inst1|pix_count_int\(2) & (\inst1|pix_count_int[1]~24\ $ (GND))) # (!\inst1|pix_count_int\(2) & (!\inst1|pix_count_int[1]~24\ & VCC))
-- \inst1|pix_count_int[2]~26\ = CARRY((\inst1|pix_count_int\(2) & !\inst1|pix_count_int[1]~24\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst1|pix_count_int\(2),
	datad => VCC,
	cin => \inst1|pix_count_int[1]~24\,
	combout => \inst1|pix_count_int[2]~25_combout\,
	cout => \inst1|pix_count_int[2]~26\);

-- Location: FF_X107_Y64_N17
\inst1|pix_count_int[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[2]~25_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(2));

-- Location: LCCOMB_X107_Y64_N18
\inst1|pix_count_int[3]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[3]~27_combout\ = (\inst1|pix_count_int\(3) & (!\inst1|pix_count_int[2]~26\)) # (!\inst1|pix_count_int\(3) & ((\inst1|pix_count_int[2]~26\) # (GND)))
-- \inst1|pix_count_int[3]~28\ = CARRY((!\inst1|pix_count_int[2]~26\) # (!\inst1|pix_count_int\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst1|pix_count_int\(3),
	datad => VCC,
	cin => \inst1|pix_count_int[2]~26\,
	combout => \inst1|pix_count_int[3]~27_combout\,
	cout => \inst1|pix_count_int[3]~28\);

-- Location: FF_X107_Y64_N19
\inst1|pix_count_int[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[3]~27_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(3));

-- Location: LCCOMB_X107_Y64_N20
\inst1|pix_count_int[4]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[4]~29_combout\ = (\inst1|pix_count_int\(4) & (\inst1|pix_count_int[3]~28\ $ (GND))) # (!\inst1|pix_count_int\(4) & (!\inst1|pix_count_int[3]~28\ & VCC))
-- \inst1|pix_count_int[4]~30\ = CARRY((\inst1|pix_count_int\(4) & !\inst1|pix_count_int[3]~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst1|pix_count_int\(4),
	datad => VCC,
	cin => \inst1|pix_count_int[3]~28\,
	combout => \inst1|pix_count_int[4]~29_combout\,
	cout => \inst1|pix_count_int[4]~30\);

-- Location: FF_X107_Y64_N21
\inst1|pix_count_int[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[4]~29_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(4));

-- Location: LCCOMB_X107_Y64_N22
\inst1|pix_count_int[5]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[5]~31_combout\ = (\inst1|pix_count_int\(5) & (!\inst1|pix_count_int[4]~30\)) # (!\inst1|pix_count_int\(5) & ((\inst1|pix_count_int[4]~30\) # (GND)))
-- \inst1|pix_count_int[5]~32\ = CARRY((!\inst1|pix_count_int[4]~30\) # (!\inst1|pix_count_int\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|pix_count_int\(5),
	datad => VCC,
	cin => \inst1|pix_count_int[4]~30\,
	combout => \inst1|pix_count_int[5]~31_combout\,
	cout => \inst1|pix_count_int[5]~32\);

-- Location: FF_X107_Y64_N23
\inst1|pix_count_int[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[5]~31_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(5));

-- Location: LCCOMB_X107_Y64_N24
\inst1|pix_count_int[6]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[6]~33_combout\ = (\inst1|pix_count_int\(6) & (\inst1|pix_count_int[5]~32\ $ (GND))) # (!\inst1|pix_count_int\(6) & (!\inst1|pix_count_int[5]~32\ & VCC))
-- \inst1|pix_count_int[6]~34\ = CARRY((\inst1|pix_count_int\(6) & !\inst1|pix_count_int[5]~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst1|pix_count_int\(6),
	datad => VCC,
	cin => \inst1|pix_count_int[5]~32\,
	combout => \inst1|pix_count_int[6]~33_combout\,
	cout => \inst1|pix_count_int[6]~34\);

-- Location: FF_X107_Y64_N25
\inst1|pix_count_int[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[6]~33_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(6));

-- Location: LCCOMB_X107_Y64_N26
\inst1|pix_count_int[7]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[7]~35_combout\ = (\inst1|pix_count_int\(7) & (!\inst1|pix_count_int[6]~34\)) # (!\inst1|pix_count_int\(7) & ((\inst1|pix_count_int[6]~34\) # (GND)))
-- \inst1|pix_count_int[7]~36\ = CARRY((!\inst1|pix_count_int[6]~34\) # (!\inst1|pix_count_int\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|pix_count_int\(7),
	datad => VCC,
	cin => \inst1|pix_count_int[6]~34\,
	combout => \inst1|pix_count_int[7]~35_combout\,
	cout => \inst1|pix_count_int[7]~36\);

-- Location: FF_X107_Y64_N27
\inst1|pix_count_int[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[7]~35_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(7));

-- Location: LCCOMB_X107_Y64_N28
\inst1|pix_count_int[8]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[8]~37_combout\ = (\inst1|pix_count_int\(8) & (\inst1|pix_count_int[7]~36\ $ (GND))) # (!\inst1|pix_count_int\(8) & (!\inst1|pix_count_int[7]~36\ & VCC))
-- \inst1|pix_count_int[8]~38\ = CARRY((\inst1|pix_count_int\(8) & !\inst1|pix_count_int[7]~36\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst1|pix_count_int\(8),
	datad => VCC,
	cin => \inst1|pix_count_int[7]~36\,
	combout => \inst1|pix_count_int[8]~37_combout\,
	cout => \inst1|pix_count_int[8]~38\);

-- Location: FF_X107_Y64_N29
\inst1|pix_count_int[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[8]~37_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(8));

-- Location: LCCOMB_X107_Y64_N30
\inst1|pix_count_int[9]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[9]~39_combout\ = (\inst1|pix_count_int\(9) & (!\inst1|pix_count_int[8]~38\)) # (!\inst1|pix_count_int\(9) & ((\inst1|pix_count_int[8]~38\) # (GND)))
-- \inst1|pix_count_int[9]~40\ = CARRY((!\inst1|pix_count_int[8]~38\) # (!\inst1|pix_count_int\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|pix_count_int\(9),
	datad => VCC,
	cin => \inst1|pix_count_int[8]~38\,
	combout => \inst1|pix_count_int[9]~39_combout\,
	cout => \inst1|pix_count_int[9]~40\);

-- Location: FF_X107_Y64_N31
\inst1|pix_count_int[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[9]~39_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(9));

-- Location: LCCOMB_X107_Y63_N0
\inst1|pix_count_int[10]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[10]~41_combout\ = (\inst1|pix_count_int\(10) & (\inst1|pix_count_int[9]~40\ $ (GND))) # (!\inst1|pix_count_int\(10) & (!\inst1|pix_count_int[9]~40\ & VCC))
-- \inst1|pix_count_int[10]~42\ = CARRY((\inst1|pix_count_int\(10) & !\inst1|pix_count_int[9]~40\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst1|pix_count_int\(10),
	datad => VCC,
	cin => \inst1|pix_count_int[9]~40\,
	combout => \inst1|pix_count_int[10]~41_combout\,
	cout => \inst1|pix_count_int[10]~42\);

-- Location: FF_X107_Y63_N1
\inst1|pix_count_int[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[10]~41_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(10));

-- Location: LCCOMB_X107_Y63_N2
\inst1|pix_count_int[11]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[11]~43_combout\ = (\inst1|pix_count_int\(11) & (!\inst1|pix_count_int[10]~42\)) # (!\inst1|pix_count_int\(11) & ((\inst1|pix_count_int[10]~42\) # (GND)))
-- \inst1|pix_count_int[11]~44\ = CARRY((!\inst1|pix_count_int[10]~42\) # (!\inst1|pix_count_int\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst1|pix_count_int\(11),
	datad => VCC,
	cin => \inst1|pix_count_int[10]~42\,
	combout => \inst1|pix_count_int[11]~43_combout\,
	cout => \inst1|pix_count_int[11]~44\);

-- Location: FF_X107_Y63_N3
\inst1|pix_count_int[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[11]~43_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(11));

-- Location: LCCOMB_X107_Y63_N4
\inst1|pix_count_int[12]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[12]~45_combout\ = (\inst1|pix_count_int\(12) & (\inst1|pix_count_int[11]~44\ $ (GND))) # (!\inst1|pix_count_int\(12) & (!\inst1|pix_count_int[11]~44\ & VCC))
-- \inst1|pix_count_int[12]~46\ = CARRY((\inst1|pix_count_int\(12) & !\inst1|pix_count_int[11]~44\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst1|pix_count_int\(12),
	datad => VCC,
	cin => \inst1|pix_count_int[11]~44\,
	combout => \inst1|pix_count_int[12]~45_combout\,
	cout => \inst1|pix_count_int[12]~46\);

-- Location: FF_X107_Y63_N5
\inst1|pix_count_int[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[12]~45_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(12));

-- Location: LCCOMB_X107_Y63_N6
\inst1|pix_count_int[13]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[13]~47_combout\ = (\inst1|pix_count_int\(13) & (!\inst1|pix_count_int[12]~46\)) # (!\inst1|pix_count_int\(13) & ((\inst1|pix_count_int[12]~46\) # (GND)))
-- \inst1|pix_count_int[13]~48\ = CARRY((!\inst1|pix_count_int[12]~46\) # (!\inst1|pix_count_int\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst1|pix_count_int\(13),
	datad => VCC,
	cin => \inst1|pix_count_int[12]~46\,
	combout => \inst1|pix_count_int[13]~47_combout\,
	cout => \inst1|pix_count_int[13]~48\);

-- Location: FF_X107_Y63_N7
\inst1|pix_count_int[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[13]~47_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(13));

-- Location: LCCOMB_X107_Y63_N8
\inst1|pix_count_int[14]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[14]~49_combout\ = (\inst1|pix_count_int\(14) & (\inst1|pix_count_int[13]~48\ $ (GND))) # (!\inst1|pix_count_int\(14) & (!\inst1|pix_count_int[13]~48\ & VCC))
-- \inst1|pix_count_int[14]~50\ = CARRY((\inst1|pix_count_int\(14) & !\inst1|pix_count_int[13]~48\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst1|pix_count_int\(14),
	datad => VCC,
	cin => \inst1|pix_count_int[13]~48\,
	combout => \inst1|pix_count_int[14]~49_combout\,
	cout => \inst1|pix_count_int[14]~50\);

-- Location: FF_X107_Y63_N9
\inst1|pix_count_int[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[14]~49_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(14));

-- Location: LCCOMB_X107_Y63_N10
\inst1|pix_count_int[15]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[15]~51_combout\ = (\inst1|pix_count_int\(15) & (!\inst1|pix_count_int[14]~50\)) # (!\inst1|pix_count_int\(15) & ((\inst1|pix_count_int[14]~50\) # (GND)))
-- \inst1|pix_count_int[15]~52\ = CARRY((!\inst1|pix_count_int[14]~50\) # (!\inst1|pix_count_int\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst1|pix_count_int\(15),
	datad => VCC,
	cin => \inst1|pix_count_int[14]~50\,
	combout => \inst1|pix_count_int[15]~51_combout\,
	cout => \inst1|pix_count_int[15]~52\);

-- Location: FF_X107_Y63_N11
\inst1|pix_count_int[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[15]~51_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(15));

-- Location: LCCOMB_X107_Y63_N12
\inst1|pix_count_int[16]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[16]~53_combout\ = (\inst1|pix_count_int\(16) & (\inst1|pix_count_int[15]~52\ $ (GND))) # (!\inst1|pix_count_int\(16) & (!\inst1|pix_count_int[15]~52\ & VCC))
-- \inst1|pix_count_int[16]~54\ = CARRY((\inst1|pix_count_int\(16) & !\inst1|pix_count_int[15]~52\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|pix_count_int\(16),
	datad => VCC,
	cin => \inst1|pix_count_int[15]~52\,
	combout => \inst1|pix_count_int[16]~53_combout\,
	cout => \inst1|pix_count_int[16]~54\);

-- Location: FF_X107_Y63_N13
\inst1|pix_count_int[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[16]~53_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(16));

-- Location: LCCOMB_X107_Y63_N14
\inst1|pix_count_int[17]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|pix_count_int[17]~55_combout\ = (\inst1|pix_count_int\(17) & (!\inst1|pix_count_int[16]~54\)) # (!\inst1|pix_count_int\(17) & ((\inst1|pix_count_int[16]~54\) # (GND)))
-- \inst1|pix_count_int[17]~56\ = CARRY((!\inst1|pix_count_int[16]~54\) # (!\inst1|pix_count_int\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst1|pix_count_int\(17),
	datad => VCC,
	cin => \inst1|pix_count_int[16]~54\,
	combout => \inst1|pix_count_int[17]~55_combout\,
	cout => \inst1|pix_count_int[17]~56\);

-- Location: FF_X107_Y63_N15
\inst1|pix_count_int[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[17]~55_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(17));

-- Location: FF_X107_Y63_N17
\inst1|pix_count_int[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|pix_count_int[18]~57_combout\,
	clrn => \reset~input_o\,
	sclr => \ALT_INV_hab_byte~input_o\,
	ena => \inst1|pix_count_int[20]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|pix_count_int\(18));

-- Location: LCCOMB_X106_Y65_N12
\inst|Selector6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector6~0_combout\ = (\inst|state.nuevo_pix~q\ & \inst1|pix_count_int\(18))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.nuevo_pix~q\,
	datad => \inst1|pix_count_int\(18),
	combout => \inst|Selector6~0_combout\);

-- Location: LCCOMB_X106_Y65_N6
\inst|LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan1~0_combout\ = ((!\inst1|pix_count_int\(19) & !\inst1|pix_count_int\(18))) # (!\inst1|pix_count_int\(20))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst1|pix_count_int\(19),
	datac => \inst1|pix_count_int\(20),
	datad => \inst1|pix_count_int\(18),
	combout => \inst|LessThan1~0_combout\);

-- Location: IOIBUF_X107_Y73_N15
\trigger~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_trigger,
	o => \trigger~input_o\);

-- Location: FF_X106_Y65_N29
\inst|state.errase\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|state~22_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.errase~q\);

-- Location: IOIBUF_X115_Y65_N22
\enable~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_enable,
	o => \enable~input_o\);

-- Location: LCCOMB_X106_Y65_N4
\inst|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector0~0_combout\ = ((\inst|state.wait_done~q\ & !\enable~input_o\)) # (!\inst|state.errase~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.errase~q\,
	datac => \inst|state.wait_done~q\,
	datad => \enable~input_o\,
	combout => \inst|Selector0~0_combout\);

-- Location: FF_X106_Y65_N5
\inst|state.wait_done\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector0~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.wait_done~q\);

-- Location: LCCOMB_X106_Y65_N22
\inst|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector1~0_combout\ = (\inst|state.wait_done~q\ & ((\enable~input_o\) # ((\inst|state.trigger_wait~q\ & !\trigger~input_o\)))) # (!\inst|state.wait_done~q\ & (\inst|state.trigger_wait~q\ & (!\trigger~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.wait_done~q\,
	datab => \inst|state.trigger_wait~q\,
	datac => \trigger~input_o\,
	datad => \enable~input_o\,
	combout => \inst|Selector1~0_combout\);

-- Location: LCCOMB_X106_Y65_N18
\inst|Selector1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector1~1_combout\ = (\inst|Selector1~0_combout\) # ((\inst|state.nuevo_pix~q\ & !\inst|LessThan1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.nuevo_pix~q\,
	datac => \inst|Selector1~0_combout\,
	datad => \inst|LessThan1~0_combout\,
	combout => \inst|Selector1~1_combout\);

-- Location: FF_X106_Y65_N19
\inst|state.trigger_wait\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector1~1_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.trigger_wait~q\);

-- Location: LCCOMB_X106_Y65_N28
\inst|state~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|state~22_combout\ = ((\inst|LessThan0~0_combout\) # (!\inst|state.trigger_wait~q\)) # (!\trigger~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \trigger~input_o\,
	datac => \inst|LessThan0~0_combout\,
	datad => \inst|state.trigger_wait~q\,
	combout => \inst|state~22_combout\);

-- Location: LCCOMB_X106_Y63_N0
\inst|Selector11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector11~0_combout\ = (\inst1|pix_count_int\(13) & \inst|state.nuevo_pix~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|pix_count_int\(13),
	datac => \inst|state.nuevo_pix~q\,
	combout => \inst|Selector11~0_combout\);

-- Location: FF_X106_Y63_N1
\inst|pix_previo[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector11~0_combout\,
	clrn => \reset~input_o\,
	ena => \inst|pix_previo[18]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(13));

-- Location: LCCOMB_X106_Y63_N26
\inst|Selector12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector12~0_combout\ = (\inst|state.nuevo_pix~q\ & \inst1|pix_count_int\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|state.nuevo_pix~q\,
	datad => \inst1|pix_count_int\(12),
	combout => \inst|Selector12~0_combout\);

-- Location: FF_X106_Y63_N27
\inst|pix_previo[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector12~0_combout\,
	clrn => \reset~input_o\,
	ena => \inst|pix_previo[18]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(12));

-- Location: LCCOMB_X106_Y63_N10
\inst|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal0~7_combout\ = (\inst1|pix_count_int\(13) & (\inst|pix_previo\(13) & (\inst|pix_previo\(12) $ (!\inst1|pix_count_int\(12))))) # (!\inst1|pix_count_int\(13) & (!\inst|pix_previo\(13) & (\inst|pix_previo\(12) $ (!\inst1|pix_count_int\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|pix_count_int\(13),
	datab => \inst|pix_previo\(13),
	datac => \inst|pix_previo\(12),
	datad => \inst1|pix_count_int\(12),
	combout => \inst|Equal0~7_combout\);

-- Location: LCCOMB_X106_Y63_N6
\inst|Selector13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector13~0_combout\ = (\inst|state.nuevo_pix~q\ & \inst1|pix_count_int\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|state.nuevo_pix~q\,
	datad => \inst1|pix_count_int\(11),
	combout => \inst|Selector13~0_combout\);

-- Location: FF_X106_Y63_N7
\inst|pix_previo[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector13~0_combout\,
	clrn => \reset~input_o\,
	ena => \inst|pix_previo[18]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(11));

-- Location: LCCOMB_X106_Y63_N4
\inst|Selector14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector14~0_combout\ = (\inst|state.nuevo_pix~q\ & \inst1|pix_count_int\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.nuevo_pix~q\,
	datac => \inst1|pix_count_int\(10),
	combout => \inst|Selector14~0_combout\);

-- Location: FF_X106_Y63_N5
\inst|pix_previo[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector14~0_combout\,
	clrn => \reset~input_o\,
	ena => \inst|pix_previo[18]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(10));

-- Location: LCCOMB_X106_Y63_N20
\inst|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal0~6_combout\ = (\inst|pix_previo\(11) & (\inst1|pix_count_int\(11) & (\inst1|pix_count_int\(10) $ (!\inst|pix_previo\(10))))) # (!\inst|pix_previo\(11) & (!\inst1|pix_count_int\(11) & (\inst1|pix_count_int\(10) $ (!\inst|pix_previo\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|pix_previo\(11),
	datab => \inst1|pix_count_int\(10),
	datac => \inst|pix_previo\(10),
	datad => \inst1|pix_count_int\(11),
	combout => \inst|Equal0~6_combout\);

-- Location: LCCOMB_X106_Y63_N22
\inst|Selector9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector9~0_combout\ = (\inst|state.nuevo_pix~q\ & \inst1|pix_count_int\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.nuevo_pix~q\,
	datac => \inst1|pix_count_int\(15),
	combout => \inst|Selector9~0_combout\);

-- Location: FF_X106_Y63_N23
\inst|pix_previo[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector9~0_combout\,
	clrn => \reset~input_o\,
	ena => \inst|pix_previo[18]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(15));

-- Location: LCCOMB_X106_Y63_N12
\inst|Selector10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector10~0_combout\ = (\inst|state.nuevo_pix~q\ & \inst1|pix_count_int\(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.nuevo_pix~q\,
	datac => \inst1|pix_count_int\(14),
	combout => \inst|Selector10~0_combout\);

-- Location: FF_X106_Y63_N13
\inst|pix_previo[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector10~0_combout\,
	clrn => \reset~input_o\,
	ena => \inst|pix_previo[18]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(14));

-- Location: LCCOMB_X106_Y63_N8
\inst|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal0~8_combout\ = (\inst|pix_previo\(15) & (\inst1|pix_count_int\(15) & (\inst1|pix_count_int\(14) $ (!\inst|pix_previo\(14))))) # (!\inst|pix_previo\(15) & (!\inst1|pix_count_int\(15) & (\inst1|pix_count_int\(14) $ (!\inst|pix_previo\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|pix_previo\(15),
	datab => \inst1|pix_count_int\(15),
	datac => \inst1|pix_count_int\(14),
	datad => \inst|pix_previo\(14),
	combout => \inst|Equal0~8_combout\);

-- Location: LCCOMB_X106_Y63_N30
\inst|Selector16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector16~0_combout\ = (\inst1|pix_count_int\(8) & \inst|state.nuevo_pix~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst1|pix_count_int\(8),
	datac => \inst|state.nuevo_pix~q\,
	combout => \inst|Selector16~0_combout\);

-- Location: FF_X106_Y63_N31
\inst|pix_previo[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector16~0_combout\,
	clrn => \reset~input_o\,
	ena => \inst|pix_previo[18]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(8));

-- Location: LCCOMB_X106_Y63_N28
\inst|Selector15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector15~0_combout\ = (\inst|state.nuevo_pix~q\ & \inst1|pix_count_int\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.nuevo_pix~q\,
	datac => \inst1|pix_count_int\(9),
	combout => \inst|Selector15~0_combout\);

-- Location: FF_X106_Y63_N29
\inst|pix_previo[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector15~0_combout\,
	clrn => \reset~input_o\,
	ena => \inst|pix_previo[18]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(9));

-- Location: LCCOMB_X106_Y63_N2
\inst|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal0~5_combout\ = (\inst|pix_previo\(8) & (\inst1|pix_count_int\(8) & (\inst|pix_previo\(9) $ (!\inst1|pix_count_int\(9))))) # (!\inst|pix_previo\(8) & (!\inst1|pix_count_int\(8) & (\inst|pix_previo\(9) $ (!\inst1|pix_count_int\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|pix_previo\(8),
	datab => \inst|pix_previo\(9),
	datac => \inst1|pix_count_int\(9),
	datad => \inst1|pix_count_int\(8),
	combout => \inst|Equal0~5_combout\);

-- Location: LCCOMB_X106_Y63_N14
\inst|Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal0~9_combout\ = (\inst|Equal0~7_combout\ & (\inst|Equal0~6_combout\ & (\inst|Equal0~8_combout\ & \inst|Equal0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal0~7_combout\,
	datab => \inst|Equal0~6_combout\,
	datac => \inst|Equal0~8_combout\,
	datad => \inst|Equal0~5_combout\,
	combout => \inst|Equal0~9_combout\);

-- Location: LCCOMB_X106_Y65_N30
\inst|Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector4~0_combout\ = (\inst1|pix_count_int\(20) & \inst|state.nuevo_pix~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst1|pix_count_int\(20),
	datad => \inst|state.nuevo_pix~q\,
	combout => \inst|Selector4~0_combout\);

-- Location: FF_X106_Y65_N31
\inst|pix_previo[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector4~0_combout\,
	clrn => \reset~input_o\,
	ena => \inst|pix_previo[18]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(20));

-- Location: LCCOMB_X107_Y65_N4
\inst|Selector8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector8~0_combout\ = (\inst1|pix_count_int\(16) & \inst|state.nuevo_pix~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|pix_count_int\(16),
	datad => \inst|state.nuevo_pix~q\,
	combout => \inst|Selector8~0_combout\);

-- Location: FF_X107_Y65_N5
\inst|pix_previo[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector8~0_combout\,
	clrn => \reset~input_o\,
	ena => \inst|pix_previo[18]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(16));

-- Location: LCCOMB_X107_Y65_N26
\inst|Selector7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector7~0_combout\ = (\inst1|pix_count_int\(17) & \inst|state.nuevo_pix~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|pix_count_int\(17),
	datad => \inst|state.nuevo_pix~q\,
	combout => \inst|Selector7~0_combout\);

-- Location: FF_X107_Y65_N27
\inst|pix_previo[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector7~0_combout\,
	clrn => \reset~input_o\,
	ena => \inst|pix_previo[18]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(17));

-- Location: LCCOMB_X107_Y65_N20
\inst|Equal0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal0~10_combout\ = (\inst1|pix_count_int\(16) & (\inst|pix_previo\(16) & (\inst|pix_previo\(17) $ (!\inst1|pix_count_int\(17))))) # (!\inst1|pix_count_int\(16) & (!\inst|pix_previo\(16) & (\inst|pix_previo\(17) $ (!\inst1|pix_count_int\(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|pix_count_int\(16),
	datab => \inst|pix_previo\(16),
	datac => \inst|pix_previo\(17),
	datad => \inst1|pix_count_int\(17),
	combout => \inst|Equal0~10_combout\);

-- Location: LCCOMB_X107_Y65_N30
\inst|Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector5~0_combout\ = (\inst|state.nuevo_pix~q\ & \inst1|pix_count_int\(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.nuevo_pix~q\,
	datac => \inst1|pix_count_int\(19),
	combout => \inst|Selector5~0_combout\);

-- Location: FF_X106_Y65_N3
\inst|pix_previo[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst|Selector5~0_combout\,
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \inst|pix_previo[18]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(19));

-- Location: LCCOMB_X106_Y65_N0
\inst|Equal0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal0~11_combout\ = (\inst|pix_previo\(18) & (\inst1|pix_count_int\(18) & (\inst|pix_previo\(19) $ (!\inst1|pix_count_int\(19))))) # (!\inst|pix_previo\(18) & (!\inst1|pix_count_int\(18) & (\inst|pix_previo\(19) $ (!\inst1|pix_count_int\(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|pix_previo\(18),
	datab => \inst|pix_previo\(19),
	datac => \inst1|pix_count_int\(19),
	datad => \inst1|pix_count_int\(18),
	combout => \inst|Equal0~11_combout\);

-- Location: LCCOMB_X106_Y65_N14
\inst|Equal0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal0~12_combout\ = (\inst|Equal0~10_combout\ & (\inst|Equal0~11_combout\ & (\inst|pix_previo\(20) $ (!\inst1|pix_count_int\(20)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|pix_previo\(20),
	datab => \inst1|pix_count_int\(20),
	datac => \inst|Equal0~10_combout\,
	datad => \inst|Equal0~11_combout\,
	combout => \inst|Equal0~12_combout\);

-- Location: LCCOMB_X107_Y65_N22
\inst|Selector22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector22~0_combout\ = (\inst|state.nuevo_pix~q\ & \inst1|pix_count_int\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.nuevo_pix~q\,
	datad => \inst1|pix_count_int\(2),
	combout => \inst|Selector22~0_combout\);

-- Location: FF_X107_Y65_N23
\inst|pix_previo[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector22~0_combout\,
	clrn => \reset~input_o\,
	ena => \inst|pix_previo[18]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(2));

-- Location: LCCOMB_X107_Y65_N28
\inst|Selector21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector21~0_combout\ = (\inst|state.nuevo_pix~q\ & \inst1|pix_count_int\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.nuevo_pix~q\,
	datac => \inst1|pix_count_int\(3),
	combout => \inst|Selector21~0_combout\);

-- Location: FF_X107_Y65_N29
\inst|pix_previo[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector21~0_combout\,
	clrn => \reset~input_o\,
	ena => \inst|pix_previo[18]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(3));

-- Location: LCCOMB_X107_Y65_N10
\inst|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal0~1_combout\ = (\inst|pix_previo\(2) & (\inst1|pix_count_int\(2) & (\inst|pix_previo\(3) $ (!\inst1|pix_count_int\(3))))) # (!\inst|pix_previo\(2) & (!\inst1|pix_count_int\(2) & (\inst|pix_previo\(3) $ (!\inst1|pix_count_int\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|pix_previo\(2),
	datab => \inst|pix_previo\(3),
	datac => \inst1|pix_count_int\(3),
	datad => \inst1|pix_count_int\(2),
	combout => \inst|Equal0~1_combout\);

-- Location: LCCOMB_X107_Y64_N4
\inst|Selector18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector18~0_combout\ = (\inst|state.nuevo_pix~q\ & \inst1|pix_count_int\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|state.nuevo_pix~q\,
	datad => \inst1|pix_count_int\(6),
	combout => \inst|Selector18~0_combout\);

-- Location: FF_X107_Y64_N5
\inst|pix_previo[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector18~0_combout\,
	clrn => \reset~input_o\,
	ena => \inst|pix_previo[18]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(6));

-- Location: LCCOMB_X107_Y64_N10
\inst|Selector17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector17~0_combout\ = (\inst|state.nuevo_pix~q\ & \inst1|pix_count_int\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.nuevo_pix~q\,
	datac => \inst1|pix_count_int\(7),
	combout => \inst|Selector17~0_combout\);

-- Location: FF_X107_Y64_N11
\inst|pix_previo[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector17~0_combout\,
	clrn => \reset~input_o\,
	ena => \inst|pix_previo[18]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(7));

-- Location: LCCOMB_X107_Y64_N0
\inst|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal0~3_combout\ = (\inst1|pix_count_int\(7) & (\inst|pix_previo\(7) & (\inst1|pix_count_int\(6) $ (!\inst|pix_previo\(6))))) # (!\inst1|pix_count_int\(7) & (!\inst|pix_previo\(7) & (\inst1|pix_count_int\(6) $ (!\inst|pix_previo\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|pix_count_int\(7),
	datab => \inst1|pix_count_int\(6),
	datac => \inst|pix_previo\(6),
	datad => \inst|pix_previo\(7),
	combout => \inst|Equal0~3_combout\);

-- Location: LCCOMB_X106_Y65_N10
\inst|Selector20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector20~0_combout\ = (\inst|state.nuevo_pix~q\ & (\inst|LessThan1~0_combout\ & ((!\inst|Equal0~13_combout\)))) # (!\inst|state.nuevo_pix~q\ & (((!\inst|state~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001110001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan1~0_combout\,
	datab => \inst|state.nuevo_pix~q\,
	datac => \inst|state~22_combout\,
	datad => \inst|Equal0~13_combout\,
	combout => \inst|Selector20~0_combout\);

-- Location: LCCOMB_X107_Y65_N6
\inst|pix_previo[4]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|pix_previo[4]~1_combout\ = (\inst|Selector20~0_combout\ & (((!\inst1|pix_count_int\(4))) # (!\inst|state.nuevo_pix~q\))) # (!\inst|Selector20~0_combout\ & (((\inst|pix_previo\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector20~0_combout\,
	datab => \inst|state.nuevo_pix~q\,
	datac => \inst|pix_previo\(4),
	datad => \inst1|pix_count_int\(4),
	combout => \inst|pix_previo[4]~1_combout\);

-- Location: FF_X107_Y65_N7
\inst|pix_previo[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|pix_previo[4]~1_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(4));

-- Location: LCCOMB_X107_Y65_N0
\inst|Selector19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector19~0_combout\ = (\inst1|pix_count_int\(5) & \inst|state.nuevo_pix~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst1|pix_count_int\(5),
	datad => \inst|state.nuevo_pix~q\,
	combout => \inst|Selector19~0_combout\);

-- Location: FF_X107_Y65_N1
\inst|pix_previo[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector19~0_combout\,
	clrn => \reset~input_o\,
	ena => \inst|pix_previo[18]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(5));

-- Location: LCCOMB_X107_Y65_N8
\inst|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal0~2_combout\ = (\inst|pix_previo\(4) & (!\inst1|pix_count_int\(4) & (\inst|pix_previo\(5) $ (!\inst1|pix_count_int\(5))))) # (!\inst|pix_previo\(4) & (\inst1|pix_count_int\(4) & (\inst|pix_previo\(5) $ (!\inst1|pix_count_int\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000110000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|pix_previo\(4),
	datab => \inst|pix_previo\(5),
	datac => \inst1|pix_count_int\(5),
	datad => \inst1|pix_count_int\(4),
	combout => \inst|Equal0~2_combout\);

-- Location: LCCOMB_X107_Y65_N2
\inst|Selector23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector23~0_combout\ = (\inst|state.nuevo_pix~q\ & \inst1|pix_count_int\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.nuevo_pix~q\,
	datad => \inst1|pix_count_int\(1),
	combout => \inst|Selector23~0_combout\);

-- Location: FF_X107_Y65_N3
\inst|pix_previo[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector23~0_combout\,
	clrn => \reset~input_o\,
	ena => \inst|pix_previo[18]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(1));

-- Location: LCCOMB_X107_Y65_N24
\inst|Selector24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector24~0_combout\ = (\inst|state.nuevo_pix~q\ & \inst1|pix_count_int\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.nuevo_pix~q\,
	datac => \inst1|pix_count_int\(0),
	combout => \inst|Selector24~0_combout\);

-- Location: FF_X107_Y65_N25
\inst|pix_previo[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector24~0_combout\,
	clrn => \reset~input_o\,
	ena => \inst|pix_previo[18]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(0));

-- Location: LCCOMB_X107_Y65_N12
\inst|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal0~0_combout\ = (\inst1|pix_count_int\(1) & (\inst|pix_previo\(1) & (\inst1|pix_count_int\(0) $ (!\inst|pix_previo\(0))))) # (!\inst1|pix_count_int\(1) & (!\inst|pix_previo\(1) & (\inst1|pix_count_int\(0) $ (!\inst|pix_previo\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|pix_count_int\(1),
	datab => \inst|pix_previo\(1),
	datac => \inst1|pix_count_int\(0),
	datad => \inst|pix_previo\(0),
	combout => \inst|Equal0~0_combout\);

-- Location: LCCOMB_X107_Y65_N18
\inst|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal0~4_combout\ = (\inst|Equal0~1_combout\ & (\inst|Equal0~3_combout\ & (\inst|Equal0~2_combout\ & \inst|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal0~1_combout\,
	datab => \inst|Equal0~3_combout\,
	datac => \inst|Equal0~2_combout\,
	datad => \inst|Equal0~0_combout\,
	combout => \inst|Equal0~4_combout\);

-- Location: LCCOMB_X106_Y65_N16
\inst|Equal0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal0~13_combout\ = (\inst|Equal0~9_combout\ & (\inst|Equal0~12_combout\ & \inst|Equal0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Equal0~9_combout\,
	datac => \inst|Equal0~12_combout\,
	datad => \inst|Equal0~4_combout\,
	combout => \inst|Equal0~13_combout\);

-- Location: LCCOMB_X106_Y65_N20
\inst|pix_previo[18]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|pix_previo[18]~0_combout\ = ((\inst|LessThan1~0_combout\ & (\inst|state.nuevo_pix~q\ & !\inst|Equal0~13_combout\))) # (!\inst|state~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan1~0_combout\,
	datab => \inst|state.nuevo_pix~q\,
	datac => \inst|state~22_combout\,
	datad => \inst|Equal0~13_combout\,
	combout => \inst|pix_previo[18]~0_combout\);

-- Location: FF_X106_Y65_N13
\inst|pix_previo[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector6~0_combout\,
	clrn => \reset~input_o\,
	ena => \inst|pix_previo[18]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pix_previo\(18));

-- Location: LCCOMB_X106_Y65_N8
\inst|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan0~0_combout\ = ((!\inst|pix_previo\(18) & !\inst|pix_previo\(19))) # (!\inst|pix_previo\(20))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|pix_previo\(18),
	datac => \inst|pix_previo\(20),
	datad => \inst|pix_previo\(19),
	combout => \inst|LessThan0~0_combout\);

-- Location: LCCOMB_X106_Y65_N26
\inst|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector2~0_combout\ = (\inst|state.decremento_indice_FIFO~q\) # ((\inst|LessThan0~0_combout\ & (\trigger~input_o\ & \inst|state.trigger_wait~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.decremento_indice_FIFO~q\,
	datab => \inst|LessThan0~0_combout\,
	datac => \trigger~input_o\,
	datad => \inst|state.trigger_wait~q\,
	combout => \inst|Selector2~0_combout\);

-- Location: LCCOMB_X106_Y65_N24
\inst|Selector2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector2~1_combout\ = (\inst|Selector2~0_combout\) # ((\inst|Equal0~13_combout\ & (\inst|state.nuevo_pix~q\ & \inst|LessThan1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector2~0_combout\,
	datab => \inst|Equal0~13_combout\,
	datac => \inst|state.nuevo_pix~q\,
	datad => \inst|LessThan1~0_combout\,
	combout => \inst|Selector2~1_combout\);

-- Location: FF_X106_Y65_N25
\inst|state.nuevo_pix\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector2~1_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.nuevo_pix~q\);

-- Location: LCCOMB_X101_Y65_N28
\inst|state~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|state~23_combout\ = (\inst|state.nuevo_pix~q\ & (\inst|LessThan1~0_combout\ & !\inst|Equal0~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.nuevo_pix~q\,
	datac => \inst|LessThan1~0_combout\,
	datad => \inst|Equal0~13_combout\,
	combout => \inst|state~23_combout\);

-- Location: LCCOMB_X101_Y65_N22
\inst|state~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|state~24_combout\ = (\inst|state~23_combout\ & ((\inst|LessThan2~0_combout\) # (\inst|LessThan2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan2~0_combout\,
	datac => \inst|LessThan2~1_combout\,
	datad => \inst|state~23_combout\,
	combout => \inst|state~24_combout\);

-- Location: FF_X101_Y65_N23
\inst|state.dir_anterior\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|state~24_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dir_anterior~q\);

-- Location: FF_X107_Y62_N27
\inst|state.lectura_FIFO_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst|state.dir_anterior~q\,
	clrn => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.lectura_FIFO_1~q\);

-- Location: FF_X107_Y62_N31
\inst|state.dir_ancho_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst|state.lectura_FIFO_1~q\,
	clrn => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dir_ancho_1~q\);

-- Location: FF_X107_Y62_N3
\inst|state.lectura_ancho_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst|state.dir_ancho_1~q\,
	clrn => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.lectura_ancho_1~q\);

-- Location: FF_X107_Y62_N5
\inst|state.dir_ancho_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst|state.lectura_ancho_1~q\,
	clrn => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dir_ancho_2~q\);

-- Location: FF_X107_Y62_N29
\inst|state.lectura_ancho_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst|state.dir_ancho_2~q\,
	clrn => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.lectura_ancho_2~q\);

-- Location: LCCOMB_X107_Y62_N16
\inst|state.dir_ancho_3~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|state.dir_ancho_3~feeder_combout\ = \inst|state.lectura_ancho_2~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|state.lectura_ancho_2~q\,
	combout => \inst|state.dir_ancho_3~feeder_combout\);

-- Location: FF_X107_Y62_N17
\inst|state.dir_ancho_3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|state.dir_ancho_3~feeder_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dir_ancho_3~q\);

-- Location: FF_X107_Y62_N9
\inst|state.lectura_ancho_3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst|state.dir_ancho_3~q\,
	clrn => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.lectura_ancho_3~q\);

-- Location: FF_X107_Y62_N15
\inst|state.casos\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst|state.lectura_ancho_3~q\,
	clrn => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.casos~q\);

-- Location: LCCOMB_X101_Y65_N4
\inst|Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector3~0_combout\ = (\inst|state.casos~q\) # ((!\inst|LessThan2~0_combout\ & (!\inst|LessThan2~1_combout\ & \inst|state~23_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan2~0_combout\,
	datab => \inst|LessThan2~1_combout\,
	datac => \inst|state.casos~q\,
	datad => \inst|state~23_combout\,
	combout => \inst|Selector3~0_combout\);

-- Location: FF_X101_Y65_N5
\inst|state.escritura\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector3~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.escritura~q\);

-- Location: LCCOMB_X98_Y65_N16
\inst|state.decremento_indice_FIFO~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|state.decremento_indice_FIFO~feeder_combout\ = \inst|state.escritura~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|state.escritura~q\,
	combout => \inst|state.decremento_indice_FIFO~feeder_combout\);

-- Location: FF_X98_Y65_N17
\inst|state.decremento_indice_FIFO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|state.decremento_indice_FIFO~feeder_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.decremento_indice_FIFO~q\);

-- Location: LCCOMB_X106_Y65_N2
\inst|FIFO_RW_o\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|FIFO_RW_o~combout\ = (\inst|state.decremento_indice_FIFO~q\) # (!\inst|state.errase~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.decremento_indice_FIFO~q\,
	datad => \inst|state.errase~q\,
	combout => \inst|FIFO_RW_o~combout\);

-- Location: LCCOMB_X107_Y62_N18
\inst|WideOr8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|WideOr8~0_combout\ = (\inst|state.decremento_indice_FIFO~q\) # ((\inst|state.escritura~q\) # ((\inst|state.dir_ancho_2~q\) # (\inst|state.casos~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.decremento_indice_FIFO~q\,
	datab => \inst|state.escritura~q\,
	datac => \inst|state.dir_ancho_2~q\,
	datad => \inst|state.casos~q\,
	combout => \inst|WideOr8~0_combout\);

-- Location: LCCOMB_X107_Y62_N14
\inst|WideOr8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|WideOr8~combout\ = (\inst|WideOr8~0_combout\) # ((\inst|state.dir_ancho_3~q\) # ((\inst|state.lectura_ancho_3~q\) # (\inst|state.lectura_ancho_2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|WideOr8~0_combout\,
	datab => \inst|state.dir_ancho_3~q\,
	datac => \inst|state.lectura_ancho_3~q\,
	datad => \inst|state.lectura_ancho_2~q\,
	combout => \inst|WideOr8~combout\);

-- Location: LCCOMB_X107_Y62_N10
\inst|WideOr9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|WideOr9~0_combout\ = (\inst|state.decremento_indice_FIFO~q\) # ((\inst|state.dir_anterior~q\) # ((\inst|state.escritura~q\) # (\inst|state.casos~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.decremento_indice_FIFO~q\,
	datab => \inst|state.dir_anterior~q\,
	datac => \inst|state.escritura~q\,
	datad => \inst|state.casos~q\,
	combout => \inst|WideOr9~0_combout\);

-- Location: LCCOMB_X107_Y62_N12
\inst|WideOr9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|WideOr9~combout\ = (\inst|state.dir_ancho_1~q\) # ((\inst|state.lectura_FIFO_1~q\) # ((\inst|state.lectura_ancho_1~q\) # (\inst|WideOr9~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dir_ancho_1~q\,
	datab => \inst|state.lectura_FIFO_1~q\,
	datac => \inst|state.lectura_ancho_1~q\,
	datad => \inst|WideOr9~0_combout\,
	combout => \inst|WideOr9~combout\);

-- Location: LCCOMB_X106_Y62_N0
\inst|WideOr10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|WideOr10~0_combout\ = (!\inst|state.dir_ancho_3~q\ & (!\inst|state.decremento_indice_FIFO~q\ & (!\inst|state.dir_ancho_1~q\ & !\inst|state.trigger_wait~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dir_ancho_3~q\,
	datab => \inst|state.decremento_indice_FIFO~q\,
	datac => \inst|state.dir_ancho_1~q\,
	datad => \inst|state.trigger_wait~q\,
	combout => \inst|WideOr10~0_combout\);

-- Location: LCCOMB_X107_Y62_N0
\inst|WideOr10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|WideOr10~combout\ = ((\inst|state.lectura_ancho_3~q\) # ((\inst|state.lectura_ancho_1~q\) # (\inst|state.nuevo_pix~q\))) # (!\inst|WideOr10~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|WideOr10~0_combout\,
	datab => \inst|state.lectura_ancho_3~q\,
	datac => \inst|state.lectura_ancho_1~q\,
	datad => \inst|state.nuevo_pix~q\,
	combout => \inst|WideOr10~combout\);

-- Location: LCCOMB_X107_Y62_N2
\inst|WideOr11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|WideOr11~0_combout\ = (!\inst|state.dir_ancho_2~q\ & !\inst|state.dir_anterior~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.dir_ancho_2~q\,
	datad => \inst|state.dir_anterior~q\,
	combout => \inst|WideOr11~0_combout\);

-- Location: LCCOMB_X107_Y62_N24
\inst|WideOr11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|WideOr11~combout\ = (((\inst|state.casos~q\) # (!\inst|WideOr11~0_combout\)) # (!\inst|state.errase~q\)) # (!\inst|WideOr10~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|WideOr10~0_combout\,
	datab => \inst|state.errase~q\,
	datac => \inst|state.casos~q\,
	datad => \inst|WideOr11~0_combout\,
	combout => \inst|WideOr11~combout\);

-- Location: IOIBUF_X100_Y73_N22
\fifo_data_i[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fifo_data_i(10),
	o => \fifo_data_i[10]~input_o\);

-- Location: LCCOMB_X107_Y65_N16
\inst|reg_ancho_1[10]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg_ancho_1[10]~0_combout\ = (\reset~input_o\ & \inst|state.lectura_ancho_1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datad => \inst|state.lectura_ancho_1~q\,
	combout => \inst|reg_ancho_1[10]~0_combout\);

-- Location: FF_X102_Y65_N31
\inst|reg_ancho_1[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[10]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_1\(10));

-- Location: LCCOMB_X106_Y62_N30
\inst|reg_FIFO_1[10]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg_FIFO_1[10]~0_combout\ = (\reset~input_o\ & \inst|state.lectura_FIFO_1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \inst|state.lectura_FIFO_1~q\,
	combout => \inst|reg_FIFO_1[10]~0_combout\);

-- Location: FF_X103_Y65_N23
\inst|reg_FIFO_1[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[10]~input_o\,
	sload => VCC,
	ena => \inst|reg_FIFO_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_FIFO_1\(10));

-- Location: IOIBUF_X109_Y73_N1
\fifo_data_i[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fifo_data_i(9),
	o => \fifo_data_i[9]~input_o\);

-- Location: FF_X103_Y65_N31
\inst|reg_ancho_1[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[9]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_1\(9));

-- Location: FF_X103_Y65_N25
\inst|reg_FIFO_1[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[9]~input_o\,
	sload => VCC,
	ena => \inst|reg_FIFO_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_FIFO_1\(9));

-- Location: IOIBUF_X109_Y73_N8
\fifo_data_i[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fifo_data_i(8),
	o => \fifo_data_i[8]~input_o\);

-- Location: FF_X103_Y65_N3
\inst|reg_ancho_1[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[8]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_1\(8));

-- Location: FF_X103_Y65_N19
\inst|reg_FIFO_1[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[8]~input_o\,
	sload => VCC,
	ena => \inst|reg_FIFO_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_FIFO_1\(8));

-- Location: IOIBUF_X105_Y73_N1
\fifo_data_i[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fifo_data_i(7),
	o => \fifo_data_i[7]~input_o\);

-- Location: FF_X103_Y65_N5
\inst|reg_FIFO_1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[7]~input_o\,
	sload => VCC,
	ena => \inst|reg_FIFO_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_FIFO_1\(7));

-- Location: FF_X103_Y65_N29
\inst|reg_ancho_1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[7]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_1\(7));

-- Location: IOIBUF_X102_Y73_N8
\fifo_data_i[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fifo_data_i(6),
	o => \fifo_data_i[6]~input_o\);

-- Location: FF_X102_Y65_N17
\inst|reg_ancho_1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[6]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_1\(6));

-- Location: FF_X103_Y65_N15
\inst|reg_FIFO_1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[6]~input_o\,
	sload => VCC,
	ena => \inst|reg_FIFO_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_FIFO_1\(6));

-- Location: IOIBUF_X107_Y73_N1
\fifo_data_i[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fifo_data_i(5),
	o => \fifo_data_i[5]~input_o\);

-- Location: FF_X103_Y65_N13
\inst|reg_ancho_1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[5]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_1\(5));

-- Location: FF_X103_Y65_N17
\inst|reg_FIFO_1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[5]~input_o\,
	sload => VCC,
	ena => \inst|reg_FIFO_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_FIFO_1\(5));

-- Location: IOIBUF_X100_Y73_N15
\fifo_data_i[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fifo_data_i(4),
	o => \fifo_data_i[4]~input_o\);

-- Location: FF_X103_Y65_N11
\inst|reg_FIFO_1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[4]~input_o\,
	sload => VCC,
	ena => \inst|reg_FIFO_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_FIFO_1\(4));

-- Location: FF_X102_Y65_N19
\inst|reg_ancho_1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[4]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_1\(4));

-- Location: IOIBUF_X102_Y73_N1
\fifo_data_i[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fifo_data_i(3),
	o => \fifo_data_i[3]~input_o\);

-- Location: LCCOMB_X102_Y65_N14
\inst|reg_FIFO_1[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg_FIFO_1[3]~feeder_combout\ = \fifo_data_i[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \fifo_data_i[3]~input_o\,
	combout => \inst|reg_FIFO_1[3]~feeder_combout\);

-- Location: FF_X102_Y65_N15
\inst|reg_FIFO_1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|reg_FIFO_1[3]~feeder_combout\,
	ena => \inst|reg_FIFO_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_FIFO_1\(3));

-- Location: FF_X103_Y65_N9
\inst|reg_ancho_1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[3]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_1\(3));

-- Location: IOIBUF_X105_Y73_N8
\fifo_data_i[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fifo_data_i(2),
	o => \fifo_data_i[2]~input_o\);

-- Location: FF_X103_Y65_N7
\inst|reg_FIFO_1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[2]~input_o\,
	sload => VCC,
	ena => \inst|reg_FIFO_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_FIFO_1\(2));

-- Location: FF_X102_Y65_N5
\inst|reg_ancho_1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[2]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_1\(2));

-- Location: IOIBUF_X107_Y73_N8
\fifo_data_i[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fifo_data_i(1),
	o => \fifo_data_i[1]~input_o\);

-- Location: FF_X103_Y65_N27
\inst|reg_ancho_1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[1]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_1\(1));

-- Location: FF_X103_Y65_N1
\inst|reg_FIFO_1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[1]~input_o\,
	sload => VCC,
	ena => \inst|reg_FIFO_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_FIFO_1\(1));

-- Location: IOIBUF_X0_Y36_N8
\fifo_data_i[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fifo_data_i(0),
	o => \fifo_data_i[0]~input_o\);

-- Location: LCCOMB_X102_Y65_N10
\inst|reg_ancho_1[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg_ancho_1[0]~feeder_combout\ = \fifo_data_i[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \fifo_data_i[0]~input_o\,
	combout => \inst|reg_ancho_1[0]~feeder_combout\);

-- Location: FF_X102_Y65_N11
\inst|reg_ancho_1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|reg_ancho_1[0]~feeder_combout\,
	ena => \inst|reg_ancho_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_1\(0));

-- Location: FF_X103_Y65_N21
\inst|reg_FIFO_1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[0]~input_o\,
	sload => VCC,
	ena => \inst|reg_FIFO_1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_FIFO_1\(0));

-- Location: LCCOMB_X103_Y65_N2
\inst|LessThan7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan7~1_cout\ = CARRY((\inst|reg_ancho_1\(0) & !\inst|reg_FIFO_1\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_1\(0),
	datab => \inst|reg_FIFO_1\(0),
	datad => VCC,
	cout => \inst|LessThan7~1_cout\);

-- Location: LCCOMB_X103_Y65_N4
\inst|LessThan7~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan7~3_cout\ = CARRY((\inst|reg_ancho_1\(1) & (\inst|reg_FIFO_1\(1) & !\inst|LessThan7~1_cout\)) # (!\inst|reg_ancho_1\(1) & ((\inst|reg_FIFO_1\(1)) # (!\inst|LessThan7~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_1\(1),
	datab => \inst|reg_FIFO_1\(1),
	datad => VCC,
	cin => \inst|LessThan7~1_cout\,
	cout => \inst|LessThan7~3_cout\);

-- Location: LCCOMB_X103_Y65_N6
\inst|LessThan7~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan7~5_cout\ = CARRY((\inst|reg_FIFO_1\(2) & (\inst|reg_ancho_1\(2) & !\inst|LessThan7~3_cout\)) # (!\inst|reg_FIFO_1\(2) & ((\inst|reg_ancho_1\(2)) # (!\inst|LessThan7~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_FIFO_1\(2),
	datab => \inst|reg_ancho_1\(2),
	datad => VCC,
	cin => \inst|LessThan7~3_cout\,
	cout => \inst|LessThan7~5_cout\);

-- Location: LCCOMB_X103_Y65_N8
\inst|LessThan7~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan7~7_cout\ = CARRY((\inst|reg_FIFO_1\(3) & ((!\inst|LessThan7~5_cout\) # (!\inst|reg_ancho_1\(3)))) # (!\inst|reg_FIFO_1\(3) & (!\inst|reg_ancho_1\(3) & !\inst|LessThan7~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_FIFO_1\(3),
	datab => \inst|reg_ancho_1\(3),
	datad => VCC,
	cin => \inst|LessThan7~5_cout\,
	cout => \inst|LessThan7~7_cout\);

-- Location: LCCOMB_X103_Y65_N10
\inst|LessThan7~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan7~9_cout\ = CARRY((\inst|reg_FIFO_1\(4) & (\inst|reg_ancho_1\(4) & !\inst|LessThan7~7_cout\)) # (!\inst|reg_FIFO_1\(4) & ((\inst|reg_ancho_1\(4)) # (!\inst|LessThan7~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_FIFO_1\(4),
	datab => \inst|reg_ancho_1\(4),
	datad => VCC,
	cin => \inst|LessThan7~7_cout\,
	cout => \inst|LessThan7~9_cout\);

-- Location: LCCOMB_X103_Y65_N12
\inst|LessThan7~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan7~11_cout\ = CARRY((\inst|reg_ancho_1\(5) & (\inst|reg_FIFO_1\(5) & !\inst|LessThan7~9_cout\)) # (!\inst|reg_ancho_1\(5) & ((\inst|reg_FIFO_1\(5)) # (!\inst|LessThan7~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_1\(5),
	datab => \inst|reg_FIFO_1\(5),
	datad => VCC,
	cin => \inst|LessThan7~9_cout\,
	cout => \inst|LessThan7~11_cout\);

-- Location: LCCOMB_X103_Y65_N14
\inst|LessThan7~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan7~13_cout\ = CARRY((\inst|reg_ancho_1\(6) & ((!\inst|LessThan7~11_cout\) # (!\inst|reg_FIFO_1\(6)))) # (!\inst|reg_ancho_1\(6) & (!\inst|reg_FIFO_1\(6) & !\inst|LessThan7~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_1\(6),
	datab => \inst|reg_FIFO_1\(6),
	datad => VCC,
	cin => \inst|LessThan7~11_cout\,
	cout => \inst|LessThan7~13_cout\);

-- Location: LCCOMB_X103_Y65_N16
\inst|LessThan7~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan7~15_cout\ = CARRY((\inst|reg_FIFO_1\(7) & ((!\inst|LessThan7~13_cout\) # (!\inst|reg_ancho_1\(7)))) # (!\inst|reg_FIFO_1\(7) & (!\inst|reg_ancho_1\(7) & !\inst|LessThan7~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_FIFO_1\(7),
	datab => \inst|reg_ancho_1\(7),
	datad => VCC,
	cin => \inst|LessThan7~13_cout\,
	cout => \inst|LessThan7~15_cout\);

-- Location: LCCOMB_X103_Y65_N18
\inst|LessThan7~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan7~17_cout\ = CARRY((\inst|reg_ancho_1\(8) & ((!\inst|LessThan7~15_cout\) # (!\inst|reg_FIFO_1\(8)))) # (!\inst|reg_ancho_1\(8) & (!\inst|reg_FIFO_1\(8) & !\inst|LessThan7~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_1\(8),
	datab => \inst|reg_FIFO_1\(8),
	datad => VCC,
	cin => \inst|LessThan7~15_cout\,
	cout => \inst|LessThan7~17_cout\);

-- Location: LCCOMB_X103_Y65_N20
\inst|LessThan7~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan7~19_cout\ = CARRY((\inst|reg_ancho_1\(9) & (\inst|reg_FIFO_1\(9) & !\inst|LessThan7~17_cout\)) # (!\inst|reg_ancho_1\(9) & ((\inst|reg_FIFO_1\(9)) # (!\inst|LessThan7~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_1\(9),
	datab => \inst|reg_FIFO_1\(9),
	datad => VCC,
	cin => \inst|LessThan7~17_cout\,
	cout => \inst|LessThan7~19_cout\);

-- Location: LCCOMB_X103_Y65_N22
\inst|LessThan7~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan7~20_combout\ = (\inst|reg_FIFO_1\(10) & (!\inst|LessThan7~19_cout\ & \inst|reg_ancho_1\(10))) # (!\inst|reg_FIFO_1\(10) & ((\inst|reg_ancho_1\(10)) # (!\inst|LessThan7~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_FIFO_1\(10),
	datad => \inst|reg_ancho_1\(10),
	cin => \inst|LessThan7~19_cout\,
	combout => \inst|LessThan7~20_combout\);

-- Location: LCCOMB_X102_Y65_N18
\inst|valor_max1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max1~0_combout\ = (\inst|LessThan7~20_combout\ & (\inst|reg_ancho_1\(10))) # (!\inst|LessThan7~20_combout\ & ((\inst|reg_FIFO_1\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_1\(10),
	datab => \inst|reg_FIFO_1\(10),
	datad => \inst|LessThan7~20_combout\,
	combout => \inst|valor_max1~0_combout\);

-- Location: LCCOMB_X107_Y62_N8
\inst|reg_ancho_3[10]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg_ancho_3[10]~0_combout\ = (\reset~input_o\ & \inst|state.lectura_ancho_3~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => \inst|state.lectura_ancho_3~q\,
	combout => \inst|reg_ancho_3[10]~0_combout\);

-- Location: FF_X101_Y66_N17
\inst|reg_ancho_3[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[3]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_3[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_3\(3));

-- Location: FF_X101_Y66_N3
\inst|reg_ancho_3[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[7]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_3[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_3\(7));

-- Location: LCCOMB_X100_Y66_N24
\inst|reg_ancho_3[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg_ancho_3[6]~feeder_combout\ = \fifo_data_i[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \fifo_data_i[6]~input_o\,
	combout => \inst|reg_ancho_3[6]~feeder_combout\);

-- Location: FF_X100_Y66_N25
\inst|reg_ancho_3[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|reg_ancho_3[6]~feeder_combout\,
	ena => \inst|reg_ancho_3[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_3\(6));

-- Location: FF_X101_Y66_N21
\inst|reg_ancho_3[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[5]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_3[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_3\(5));

-- Location: LCCOMB_X100_Y66_N10
\inst|reg_ancho_3[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg_ancho_3[4]~feeder_combout\ = \fifo_data_i[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \fifo_data_i[4]~input_o\,
	combout => \inst|reg_ancho_3[4]~feeder_combout\);

-- Location: FF_X100_Y66_N11
\inst|reg_ancho_3[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|reg_ancho_3[4]~feeder_combout\,
	ena => \inst|reg_ancho_3[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_3\(4));

-- Location: LCCOMB_X100_Y66_N4
\inst|process_0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~11_combout\ = (!\inst|reg_ancho_3\(7) & (!\inst|reg_ancho_3\(6) & (!\inst|reg_ancho_3\(5) & !\inst|reg_ancho_3\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_3\(7),
	datab => \inst|reg_ancho_3\(6),
	datac => \inst|reg_ancho_3\(5),
	datad => \inst|reg_ancho_3\(4),
	combout => \inst|process_0~11_combout\);

-- Location: FF_X101_Y66_N5
\inst|reg_ancho_3[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[1]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_3[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_3\(1));

-- Location: FF_X101_Y66_N25
\inst|reg_ancho_3[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[0]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_3[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_3\(0));

-- Location: LCCOMB_X100_Y66_N22
\inst|process_0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~12_combout\ = (!\inst|reg_ancho_3\(1) & !\inst|reg_ancho_3\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|reg_ancho_3\(1),
	datac => \inst|reg_ancho_3\(0),
	combout => \inst|process_0~12_combout\);

-- Location: LCCOMB_X100_Y66_N12
\inst|reg_ancho_3[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg_ancho_3[2]~feeder_combout\ = \fifo_data_i[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \fifo_data_i[2]~input_o\,
	combout => \inst|reg_ancho_3[2]~feeder_combout\);

-- Location: FF_X100_Y66_N13
\inst|reg_ancho_3[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|reg_ancho_3[2]~feeder_combout\,
	ena => \inst|reg_ancho_3[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_3\(2));

-- Location: LCCOMB_X100_Y66_N26
\inst|process_0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~13_combout\ = (!\inst|reg_ancho_3\(3) & (\inst|process_0~11_combout\ & (\inst|process_0~12_combout\ & !\inst|reg_ancho_3\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_3\(3),
	datab => \inst|process_0~11_combout\,
	datac => \inst|process_0~12_combout\,
	datad => \inst|reg_ancho_3\(2),
	combout => \inst|process_0~13_combout\);

-- Location: LCCOMB_X102_Y65_N4
\inst|process_0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~5_combout\ = (!\inst|reg_ancho_1\(5) & (!\inst|reg_ancho_1\(3) & (!\inst|reg_ancho_1\(2) & !\inst|reg_ancho_1\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_1\(5),
	datab => \inst|reg_ancho_1\(3),
	datac => \inst|reg_ancho_1\(2),
	datad => \inst|reg_ancho_1\(4),
	combout => \inst|process_0~5_combout\);

-- Location: LCCOMB_X107_Y62_N30
\inst|reg_ancho_2[10]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg_ancho_2[10]~0_combout\ = (\reset~input_o\ & \inst|state.lectura_ancho_2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datad => \inst|state.lectura_ancho_2~q\,
	combout => \inst|reg_ancho_2[10]~0_combout\);

-- Location: FF_X101_Y66_N23
\inst|reg_ancho_2[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[6]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_2\(6));

-- Location: FF_X101_Y66_N29
\inst|reg_ancho_2[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[7]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_2\(7));

-- Location: FF_X101_Y66_N13
\inst|reg_ancho_2[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[5]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_2\(5));

-- Location: FF_X101_Y66_N27
\inst|reg_ancho_2[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[8]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_2\(8));

-- Location: LCCOMB_X100_Y66_N20
\inst|process_0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~7_combout\ = (!\inst|reg_ancho_2\(6) & (!\inst|reg_ancho_2\(7) & (!\inst|reg_ancho_2\(5) & !\inst|reg_ancho_2\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_2\(6),
	datab => \inst|reg_ancho_2\(7),
	datac => \inst|reg_ancho_2\(5),
	datad => \inst|reg_ancho_2\(8),
	combout => \inst|process_0~7_combout\);

-- Location: FF_X101_Y66_N15
\inst|reg_ancho_2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[2]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_2\(2));

-- Location: FF_X101_Y66_N19
\inst|reg_ancho_2[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[4]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_2\(4));

-- Location: FF_X100_Y66_N15
\inst|reg_ancho_2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[3]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_2\(3));

-- Location: FF_X100_Y66_N17
\inst|reg_ancho_2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[1]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_2\(1));

-- Location: LCCOMB_X100_Y66_N14
\inst|process_0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~8_combout\ = (!\inst|reg_ancho_2\(2) & (!\inst|reg_ancho_2\(4) & (!\inst|reg_ancho_2\(3) & !\inst|reg_ancho_2\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_2\(2),
	datab => \inst|reg_ancho_2\(4),
	datac => \inst|reg_ancho_2\(3),
	datad => \inst|reg_ancho_2\(1),
	combout => \inst|process_0~8_combout\);

-- Location: FF_X101_Y66_N9
\inst|reg_ancho_2[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[9]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_2\(9));

-- Location: FF_X101_Y66_N31
\inst|reg_ancho_2[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[10]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_2\(10));

-- Location: LCCOMB_X102_Y65_N24
\inst|process_0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~6_combout\ = (!\inst|reg_ancho_1\(0) & (!\inst|reg_ancho_2\(9) & (!\inst|reg_ancho_2\(10) & !\inst|reg_ancho_1\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_1\(0),
	datab => \inst|reg_ancho_2\(9),
	datac => \inst|reg_ancho_2\(10),
	datad => \inst|reg_ancho_1\(1),
	combout => \inst|process_0~6_combout\);

-- Location: LCCOMB_X101_Y65_N14
\inst|process_0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~9_combout\ = (\inst|process_0~5_combout\ & (\inst|process_0~7_combout\ & (\inst|process_0~8_combout\ & \inst|process_0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~5_combout\,
	datab => \inst|process_0~7_combout\,
	datac => \inst|process_0~8_combout\,
	datad => \inst|process_0~6_combout\,
	combout => \inst|process_0~9_combout\);

-- Location: LCCOMB_X102_Y65_N30
\inst|process_0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~2_combout\ = (!\inst|reg_FIFO_1\(0) & (!\inst|reg_FIFO_1\(1) & (!\inst|reg_ancho_1\(10) & !\inst|reg_FIFO_1\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_FIFO_1\(0),
	datab => \inst|reg_FIFO_1\(1),
	datac => \inst|reg_ancho_1\(10),
	datad => \inst|reg_FIFO_1\(2),
	combout => \inst|process_0~2_combout\);

-- Location: LCCOMB_X102_Y65_N0
\inst|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~0_combout\ = (!\inst|reg_FIFO_1\(7) & (!\inst|reg_FIFO_1\(8) & (!\inst|reg_FIFO_1\(9) & !\inst|reg_FIFO_1\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_FIFO_1\(7),
	datab => \inst|reg_FIFO_1\(8),
	datac => \inst|reg_FIFO_1\(9),
	datad => \inst|reg_FIFO_1\(10),
	combout => \inst|process_0~0_combout\);

-- Location: LCCOMB_X102_Y65_N22
\inst|process_0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~3_combout\ = (!\inst|reg_ancho_1\(8) & (!\inst|reg_ancho_1\(7) & (!\inst|reg_ancho_1\(9) & !\inst|reg_ancho_1\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_1\(8),
	datab => \inst|reg_ancho_1\(7),
	datac => \inst|reg_ancho_1\(9),
	datad => \inst|reg_ancho_1\(6),
	combout => \inst|process_0~3_combout\);

-- Location: LCCOMB_X102_Y65_N28
\inst|process_0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~1_combout\ = (!\inst|reg_FIFO_1\(3) & (!\inst|reg_FIFO_1\(4) & (!\inst|reg_FIFO_1\(6) & !\inst|reg_FIFO_1\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_FIFO_1\(3),
	datab => \inst|reg_FIFO_1\(4),
	datac => \inst|reg_FIFO_1\(6),
	datad => \inst|reg_FIFO_1\(5),
	combout => \inst|process_0~1_combout\);

-- Location: LCCOMB_X102_Y65_N20
\inst|process_0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~4_combout\ = (\inst|process_0~2_combout\ & (\inst|process_0~0_combout\ & (\inst|process_0~3_combout\ & \inst|process_0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~2_combout\,
	datab => \inst|process_0~0_combout\,
	datac => \inst|process_0~3_combout\,
	datad => \inst|process_0~1_combout\,
	combout => \inst|process_0~4_combout\);

-- Location: FF_X101_Y66_N7
\inst|reg_ancho_2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[0]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_2\(0));

-- Location: FF_X101_Y66_N11
\inst|reg_ancho_3[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[8]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_3[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_3\(8));

-- Location: FF_X100_Y66_N3
\inst|reg_ancho_3[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[10]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_3[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_3\(10));

-- Location: FF_X101_Y66_N1
\inst|reg_ancho_3[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fifo_data_i[9]~input_o\,
	sload => VCC,
	ena => \inst|reg_ancho_3[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg_ancho_3\(9));

-- Location: LCCOMB_X100_Y66_N2
\inst|process_0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~10_combout\ = (!\inst|reg_ancho_2\(0) & (!\inst|reg_ancho_3\(8) & (!\inst|reg_ancho_3\(10) & !\inst|reg_ancho_3\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_2\(0),
	datab => \inst|reg_ancho_3\(8),
	datac => \inst|reg_ancho_3\(10),
	datad => \inst|reg_ancho_3\(9),
	combout => \inst|process_0~10_combout\);

-- Location: LCCOMB_X101_Y65_N16
\inst|process_0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~14_combout\ = (\inst|process_0~13_combout\ & (\inst|process_0~9_combout\ & (\inst|process_0~4_combout\ & \inst|process_0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~13_combout\,
	datab => \inst|process_0~9_combout\,
	datac => \inst|process_0~4_combout\,
	datad => \inst|process_0~10_combout\,
	combout => \inst|process_0~14_combout\);

-- Location: LCCOMB_X98_Y64_N0
\inst|Add10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~0_combout\ = \inst|indice\(0) $ (GND)
-- \inst|Add10~1\ = CARRY(!\inst|indice\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice\(0),
	datad => VCC,
	combout => \inst|Add10~0_combout\,
	cout => \inst|Add10~1\);

-- Location: LCCOMB_X98_Y65_N24
\inst|Selector35~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector35~0_combout\ = (\inst|state.casos~q\ & ((\inst|process_0~14_combout\))) # (!\inst|state.casos~q\ & (!\inst|state~22_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state~22_combout\,
	datac => \inst|process_0~14_combout\,
	datad => \inst|state.casos~q\,
	combout => \inst|Selector35~0_combout\);

-- Location: LCCOMB_X98_Y65_N20
\inst|indice[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|indice[0]~1_combout\ = (\inst|Selector35~0_combout\ & (\inst|state.casos~q\ & (!\inst|Add10~0_combout\))) # (!\inst|Selector35~0_combout\ & (((\inst|indice\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.casos~q\,
	datab => \inst|Add10~0_combout\,
	datac => \inst|indice\(0),
	datad => \inst|Selector35~0_combout\,
	combout => \inst|indice[0]~1_combout\);

-- Location: FF_X98_Y65_N21
\inst|indice[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|indice[0]~1_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice\(0));

-- Location: LCCOMB_X98_Y64_N2
\inst|Add10~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~2_combout\ = (\inst|indice\(1) & (!\inst|Add10~1\)) # (!\inst|indice\(1) & ((\inst|Add10~1\) # (GND)))
-- \inst|Add10~3\ = CARRY((!\inst|Add10~1\) # (!\inst|indice\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice\(1),
	datad => VCC,
	cin => \inst|Add10~1\,
	combout => \inst|Add10~2_combout\,
	cout => \inst|Add10~3\);

-- Location: LCCOMB_X98_Y65_N30
\inst|Add10~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~31_combout\ = (\inst|Add10~2_combout\ & \inst|state.casos~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|Add10~2_combout\,
	datad => \inst|state.casos~q\,
	combout => \inst|Add10~31_combout\);

-- Location: LCCOMB_X98_Y65_N18
\inst|indice[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|indice[7]~0_combout\ = ((\inst|process_0~14_combout\ & \inst|state.casos~q\)) # (!\inst|state~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~14_combout\,
	datac => \inst|state~22_combout\,
	datad => \inst|state.casos~q\,
	combout => \inst|indice[7]~0_combout\);

-- Location: FF_X98_Y65_N31
\inst|indice[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Add10~31_combout\,
	clrn => \reset~input_o\,
	ena => \inst|indice[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice\(1));

-- Location: LCCOMB_X98_Y64_N4
\inst|Add10~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~4_combout\ = (\inst|indice\(2) & (\inst|Add10~3\ $ (GND))) # (!\inst|indice\(2) & (!\inst|Add10~3\ & VCC))
-- \inst|Add10~5\ = CARRY((\inst|indice\(2) & !\inst|Add10~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice\(2),
	datad => VCC,
	cin => \inst|Add10~3\,
	combout => \inst|Add10~4_combout\,
	cout => \inst|Add10~5\);

-- Location: LCCOMB_X98_Y65_N28
\inst|Add10~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~30_combout\ = (\inst|Add10~4_combout\ & \inst|state.casos~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|Add10~4_combout\,
	datad => \inst|state.casos~q\,
	combout => \inst|Add10~30_combout\);

-- Location: FF_X98_Y65_N29
\inst|indice[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Add10~30_combout\,
	clrn => \reset~input_o\,
	ena => \inst|indice[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice\(2));

-- Location: LCCOMB_X98_Y64_N6
\inst|Add10~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~6_combout\ = (\inst|indice\(3) & (!\inst|Add10~5\)) # (!\inst|indice\(3) & ((\inst|Add10~5\) # (GND)))
-- \inst|Add10~7\ = CARRY((!\inst|Add10~5\) # (!\inst|indice\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice\(3),
	datad => VCC,
	cin => \inst|Add10~5\,
	combout => \inst|Add10~6_combout\,
	cout => \inst|Add10~7\);

-- Location: LCCOMB_X98_Y64_N22
\inst|Add10~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~29_combout\ = (\inst|state.casos~q\ & \inst|Add10~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|state.casos~q\,
	datad => \inst|Add10~6_combout\,
	combout => \inst|Add10~29_combout\);

-- Location: FF_X98_Y64_N23
\inst|indice[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Add10~29_combout\,
	clrn => \reset~input_o\,
	ena => \inst|indice[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice\(3));

-- Location: LCCOMB_X98_Y64_N8
\inst|Add10~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~8_combout\ = (\inst|indice\(4) & (\inst|Add10~7\ $ (GND))) # (!\inst|indice\(4) & (!\inst|Add10~7\ & VCC))
-- \inst|Add10~9\ = CARRY((\inst|indice\(4) & !\inst|Add10~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice\(4),
	datad => VCC,
	cin => \inst|Add10~7\,
	combout => \inst|Add10~8_combout\,
	cout => \inst|Add10~9\);

-- Location: LCCOMB_X98_Y65_N14
\inst|Add10~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~28_combout\ = (\inst|Add10~8_combout\ & \inst|state.casos~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|Add10~8_combout\,
	datad => \inst|state.casos~q\,
	combout => \inst|Add10~28_combout\);

-- Location: FF_X98_Y65_N15
\inst|indice[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Add10~28_combout\,
	clrn => \reset~input_o\,
	ena => \inst|indice[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice\(4));

-- Location: LCCOMB_X98_Y64_N10
\inst|Add10~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~10_combout\ = (\inst|indice\(5) & (!\inst|Add10~9\)) # (!\inst|indice\(5) & ((\inst|Add10~9\) # (GND)))
-- \inst|Add10~11\ = CARRY((!\inst|Add10~9\) # (!\inst|indice\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice\(5),
	datad => VCC,
	cin => \inst|Add10~9\,
	combout => \inst|Add10~10_combout\,
	cout => \inst|Add10~11\);

-- Location: LCCOMB_X98_Y65_N4
\inst|Add10~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~27_combout\ = (\inst|state.casos~q\ & \inst|Add10~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.casos~q\,
	datad => \inst|Add10~10_combout\,
	combout => \inst|Add10~27_combout\);

-- Location: FF_X98_Y65_N5
\inst|indice[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Add10~27_combout\,
	clrn => \reset~input_o\,
	ena => \inst|indice[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice\(5));

-- Location: LCCOMB_X98_Y64_N12
\inst|Add10~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~12_combout\ = (\inst|indice\(6) & (\inst|Add10~11\ $ (GND))) # (!\inst|indice\(6) & (!\inst|Add10~11\ & VCC))
-- \inst|Add10~13\ = CARRY((\inst|indice\(6) & !\inst|Add10~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice\(6),
	datad => VCC,
	cin => \inst|Add10~11\,
	combout => \inst|Add10~12_combout\,
	cout => \inst|Add10~13\);

-- Location: LCCOMB_X98_Y64_N28
\inst|Add10~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~26_combout\ = (\inst|state.casos~q\ & \inst|Add10~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|state.casos~q\,
	datad => \inst|Add10~12_combout\,
	combout => \inst|Add10~26_combout\);

-- Location: FF_X98_Y64_N29
\inst|indice[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Add10~26_combout\,
	clrn => \reset~input_o\,
	ena => \inst|indice[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice\(6));

-- Location: LCCOMB_X98_Y64_N14
\inst|Add10~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~14_combout\ = (\inst|indice\(7) & (!\inst|Add10~13\)) # (!\inst|indice\(7) & ((\inst|Add10~13\) # (GND)))
-- \inst|Add10~15\ = CARRY((!\inst|Add10~13\) # (!\inst|indice\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice\(7),
	datad => VCC,
	cin => \inst|Add10~13\,
	combout => \inst|Add10~14_combout\,
	cout => \inst|Add10~15\);

-- Location: LCCOMB_X98_Y64_N26
\inst|Add10~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~25_combout\ = (\inst|state.casos~q\ & \inst|Add10~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.casos~q\,
	datac => \inst|Add10~14_combout\,
	combout => \inst|Add10~25_combout\);

-- Location: FF_X98_Y64_N27
\inst|indice[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Add10~25_combout\,
	clrn => \reset~input_o\,
	ena => \inst|indice[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice\(7));

-- Location: LCCOMB_X98_Y64_N16
\inst|Add10~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~16_combout\ = (\inst|indice\(8) & (\inst|Add10~15\ $ (GND))) # (!\inst|indice\(8) & (!\inst|Add10~15\ & VCC))
-- \inst|Add10~17\ = CARRY((\inst|indice\(8) & !\inst|Add10~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice\(8),
	datad => VCC,
	cin => \inst|Add10~15\,
	combout => \inst|Add10~16_combout\,
	cout => \inst|Add10~17\);

-- Location: LCCOMB_X98_Y65_N22
\inst|Add10~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~24_combout\ = (\inst|state.casos~q\ & \inst|Add10~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.casos~q\,
	datad => \inst|Add10~16_combout\,
	combout => \inst|Add10~24_combout\);

-- Location: FF_X98_Y65_N23
\inst|indice[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Add10~24_combout\,
	clrn => \reset~input_o\,
	ena => \inst|indice[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice\(8));

-- Location: LCCOMB_X98_Y64_N18
\inst|Add10~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~18_combout\ = (\inst|indice\(9) & (!\inst|Add10~17\)) # (!\inst|indice\(9) & ((\inst|Add10~17\) # (GND)))
-- \inst|Add10~19\ = CARRY((!\inst|Add10~17\) # (!\inst|indice\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice\(9),
	datad => VCC,
	cin => \inst|Add10~17\,
	combout => \inst|Add10~18_combout\,
	cout => \inst|Add10~19\);

-- Location: LCCOMB_X98_Y64_N24
\inst|Add10~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~23_combout\ = (\inst|state.casos~q\ & \inst|Add10~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|state.casos~q\,
	datad => \inst|Add10~18_combout\,
	combout => \inst|Add10~23_combout\);

-- Location: FF_X98_Y64_N25
\inst|indice[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Add10~23_combout\,
	clrn => \reset~input_o\,
	ena => \inst|indice[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice\(9));

-- Location: LCCOMB_X98_Y64_N20
\inst|Add10~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~20_combout\ = \inst|indice\(10) $ (!\inst|Add10~19\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice\(10),
	cin => \inst|Add10~19\,
	combout => \inst|Add10~20_combout\);

-- Location: LCCOMB_X98_Y64_N30
\inst|Add10~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add10~22_combout\ = (\inst|state.casos~q\ & \inst|Add10~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|state.casos~q\,
	datad => \inst|Add10~20_combout\,
	combout => \inst|Add10~22_combout\);

-- Location: FF_X98_Y64_N31
\inst|indice[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Add10~22_combout\,
	clrn => \reset~input_o\,
	ena => \inst|indice[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice\(10));

-- Location: LCCOMB_X99_Y65_N22
\inst|Selector36~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector36~0_combout\ = (\inst|process_0~14_combout\ & ((\inst|indice\(10)))) # (!\inst|process_0~14_combout\ & (\inst|valor_max1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|valor_max1~0_combout\,
	datab => \inst|process_0~14_combout\,
	datad => \inst|indice\(10),
	combout => \inst|Selector36~0_combout\);

-- Location: LCCOMB_X101_Y66_N10
\inst|LessThan8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan8~1_cout\ = CARRY((!\inst|reg_ancho_2\(0) & \inst|reg_ancho_3\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_2\(0),
	datab => \inst|reg_ancho_3\(0),
	datad => VCC,
	cout => \inst|LessThan8~1_cout\);

-- Location: LCCOMB_X101_Y66_N12
\inst|LessThan8~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan8~3_cout\ = CARRY((\inst|reg_ancho_2\(1) & ((!\inst|LessThan8~1_cout\) # (!\inst|reg_ancho_3\(1)))) # (!\inst|reg_ancho_2\(1) & (!\inst|reg_ancho_3\(1) & !\inst|LessThan8~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_2\(1),
	datab => \inst|reg_ancho_3\(1),
	datad => VCC,
	cin => \inst|LessThan8~1_cout\,
	cout => \inst|LessThan8~3_cout\);

-- Location: LCCOMB_X101_Y66_N14
\inst|LessThan8~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan8~5_cout\ = CARRY((\inst|reg_ancho_3\(2) & ((!\inst|LessThan8~3_cout\) # (!\inst|reg_ancho_2\(2)))) # (!\inst|reg_ancho_3\(2) & (!\inst|reg_ancho_2\(2) & !\inst|LessThan8~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_3\(2),
	datab => \inst|reg_ancho_2\(2),
	datad => VCC,
	cin => \inst|LessThan8~3_cout\,
	cout => \inst|LessThan8~5_cout\);

-- Location: LCCOMB_X101_Y66_N16
\inst|LessThan8~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan8~7_cout\ = CARRY((\inst|reg_ancho_2\(3) & ((!\inst|LessThan8~5_cout\) # (!\inst|reg_ancho_3\(3)))) # (!\inst|reg_ancho_2\(3) & (!\inst|reg_ancho_3\(3) & !\inst|LessThan8~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_2\(3),
	datab => \inst|reg_ancho_3\(3),
	datad => VCC,
	cin => \inst|LessThan8~5_cout\,
	cout => \inst|LessThan8~7_cout\);

-- Location: LCCOMB_X101_Y66_N18
\inst|LessThan8~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan8~9_cout\ = CARRY((\inst|reg_ancho_3\(4) & ((!\inst|LessThan8~7_cout\) # (!\inst|reg_ancho_2\(4)))) # (!\inst|reg_ancho_3\(4) & (!\inst|reg_ancho_2\(4) & !\inst|LessThan8~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_3\(4),
	datab => \inst|reg_ancho_2\(4),
	datad => VCC,
	cin => \inst|LessThan8~7_cout\,
	cout => \inst|LessThan8~9_cout\);

-- Location: LCCOMB_X101_Y66_N20
\inst|LessThan8~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan8~11_cout\ = CARRY((\inst|reg_ancho_2\(5) & ((!\inst|LessThan8~9_cout\) # (!\inst|reg_ancho_3\(5)))) # (!\inst|reg_ancho_2\(5) & (!\inst|reg_ancho_3\(5) & !\inst|LessThan8~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_2\(5),
	datab => \inst|reg_ancho_3\(5),
	datad => VCC,
	cin => \inst|LessThan8~9_cout\,
	cout => \inst|LessThan8~11_cout\);

-- Location: LCCOMB_X101_Y66_N22
\inst|LessThan8~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan8~13_cout\ = CARRY((\inst|reg_ancho_2\(6) & (\inst|reg_ancho_3\(6) & !\inst|LessThan8~11_cout\)) # (!\inst|reg_ancho_2\(6) & ((\inst|reg_ancho_3\(6)) # (!\inst|LessThan8~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_2\(6),
	datab => \inst|reg_ancho_3\(6),
	datad => VCC,
	cin => \inst|LessThan8~11_cout\,
	cout => \inst|LessThan8~13_cout\);

-- Location: LCCOMB_X101_Y66_N24
\inst|LessThan8~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan8~15_cout\ = CARRY((\inst|reg_ancho_2\(7) & ((!\inst|LessThan8~13_cout\) # (!\inst|reg_ancho_3\(7)))) # (!\inst|reg_ancho_2\(7) & (!\inst|reg_ancho_3\(7) & !\inst|LessThan8~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_2\(7),
	datab => \inst|reg_ancho_3\(7),
	datad => VCC,
	cin => \inst|LessThan8~13_cout\,
	cout => \inst|LessThan8~15_cout\);

-- Location: LCCOMB_X101_Y66_N26
\inst|LessThan8~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan8~17_cout\ = CARRY((\inst|reg_ancho_2\(8) & (\inst|reg_ancho_3\(8) & !\inst|LessThan8~15_cout\)) # (!\inst|reg_ancho_2\(8) & ((\inst|reg_ancho_3\(8)) # (!\inst|LessThan8~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_2\(8),
	datab => \inst|reg_ancho_3\(8),
	datad => VCC,
	cin => \inst|LessThan8~15_cout\,
	cout => \inst|LessThan8~17_cout\);

-- Location: LCCOMB_X101_Y66_N28
\inst|LessThan8~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan8~19_cout\ = CARRY((\inst|reg_ancho_2\(9) & ((!\inst|LessThan8~17_cout\) # (!\inst|reg_ancho_3\(9)))) # (!\inst|reg_ancho_2\(9) & (!\inst|reg_ancho_3\(9) & !\inst|LessThan8~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_2\(9),
	datab => \inst|reg_ancho_3\(9),
	datad => VCC,
	cin => \inst|LessThan8~17_cout\,
	cout => \inst|LessThan8~19_cout\);

-- Location: LCCOMB_X101_Y66_N30
\inst|LessThan8~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan8~20_combout\ = (\inst|reg_ancho_3\(10) & ((!\inst|reg_ancho_2\(10)) # (!\inst|LessThan8~19_cout\))) # (!\inst|reg_ancho_3\(10) & (!\inst|LessThan8~19_cout\ & !\inst|reg_ancho_2\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_3\(10),
	datad => \inst|reg_ancho_2\(10),
	cin => \inst|LessThan8~19_cout\,
	combout => \inst|LessThan8~20_combout\);

-- Location: LCCOMB_X100_Y66_N0
\inst|valor_max2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max2~0_combout\ = (\inst|LessThan8~20_combout\ & (\inst|reg_ancho_3\(10))) # (!\inst|LessThan8~20_combout\ & ((\inst|reg_ancho_2\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|reg_ancho_3\(10),
	datac => \inst|LessThan8~20_combout\,
	datad => \inst|reg_ancho_2\(10),
	combout => \inst|valor_max2~0_combout\);

-- Location: LCCOMB_X101_Y66_N2
\inst|valor_max2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max2~1_combout\ = (\inst|LessThan8~20_combout\ & ((\inst|reg_ancho_3\(9)))) # (!\inst|LessThan8~20_combout\ & (\inst|reg_ancho_2\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_2\(9),
	datab => \inst|reg_ancho_3\(9),
	datad => \inst|LessThan8~20_combout\,
	combout => \inst|valor_max2~1_combout\);

-- Location: LCCOMB_X103_Y65_N28
\inst|valor_max1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max1~1_combout\ = (\inst|LessThan7~20_combout\ & (\inst|reg_ancho_1\(9))) # (!\inst|LessThan7~20_combout\ & ((\inst|reg_FIFO_1\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_1\(9),
	datab => \inst|reg_FIFO_1\(9),
	datad => \inst|LessThan7~20_combout\,
	combout => \inst|valor_max1~1_combout\);

-- Location: LCCOMB_X103_Y65_N24
\inst|valor_max1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max1~2_combout\ = (\inst|LessThan7~20_combout\ & (\inst|reg_ancho_1\(8))) # (!\inst|LessThan7~20_combout\ & ((\inst|reg_FIFO_1\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_1\(8),
	datab => \inst|reg_FIFO_1\(8),
	datad => \inst|LessThan7~20_combout\,
	combout => \inst|valor_max1~2_combout\);

-- Location: LCCOMB_X101_Y66_N8
\inst|valor_max2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max2~2_combout\ = (\inst|LessThan8~20_combout\ & ((\inst|reg_ancho_3\(8)))) # (!\inst|LessThan8~20_combout\ & (\inst|reg_ancho_2\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_2\(8),
	datab => \inst|reg_ancho_3\(8),
	datad => \inst|LessThan8~20_combout\,
	combout => \inst|valor_max2~2_combout\);

-- Location: LCCOMB_X101_Y66_N4
\inst|valor_max2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max2~3_combout\ = (\inst|LessThan8~20_combout\ & (\inst|reg_ancho_3\(7))) # (!\inst|LessThan8~20_combout\ & ((\inst|reg_ancho_2\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_3\(7),
	datab => \inst|reg_ancho_2\(7),
	datad => \inst|LessThan8~20_combout\,
	combout => \inst|valor_max2~3_combout\);

-- Location: LCCOMB_X103_Y65_N0
\inst|valor_max1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max1~3_combout\ = (\inst|LessThan7~20_combout\ & (\inst|reg_ancho_1\(7))) # (!\inst|LessThan7~20_combout\ & ((\inst|reg_FIFO_1\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_1\(7),
	datab => \inst|reg_FIFO_1\(7),
	datad => \inst|LessThan7~20_combout\,
	combout => \inst|valor_max1~3_combout\);

-- Location: LCCOMB_X100_Y66_N6
\inst|valor_max2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max2~4_combout\ = (\inst|LessThan8~20_combout\ & ((\inst|reg_ancho_3\(6)))) # (!\inst|LessThan8~20_combout\ & (\inst|reg_ancho_2\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_2\(6),
	datab => \inst|reg_ancho_3\(6),
	datac => \inst|LessThan8~20_combout\,
	combout => \inst|valor_max2~4_combout\);

-- Location: LCCOMB_X102_Y65_N2
\inst|valor_max1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max1~4_combout\ = (\inst|LessThan7~20_combout\ & (\inst|reg_ancho_1\(6))) # (!\inst|LessThan7~20_combout\ & ((\inst|reg_FIFO_1\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|reg_ancho_1\(6),
	datac => \inst|reg_FIFO_1\(6),
	datad => \inst|LessThan7~20_combout\,
	combout => \inst|valor_max1~4_combout\);

-- Location: LCCOMB_X101_Y66_N0
\inst|valor_max2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max2~5_combout\ = (\inst|LessThan8~20_combout\ & ((\inst|reg_ancho_3\(5)))) # (!\inst|LessThan8~20_combout\ & (\inst|reg_ancho_2\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_2\(5),
	datab => \inst|reg_ancho_3\(5),
	datad => \inst|LessThan8~20_combout\,
	combout => \inst|valor_max2~5_combout\);

-- Location: LCCOMB_X103_Y65_N30
\inst|valor_max1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max1~5_combout\ = (\inst|LessThan7~20_combout\ & (\inst|reg_ancho_1\(5))) # (!\inst|LessThan7~20_combout\ & ((\inst|reg_FIFO_1\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_1\(5),
	datab => \inst|reg_FIFO_1\(5),
	datad => \inst|LessThan7~20_combout\,
	combout => \inst|valor_max1~5_combout\);

-- Location: LCCOMB_X102_Y65_N12
\inst|valor_max1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max1~6_combout\ = (\inst|LessThan7~20_combout\ & (\inst|reg_ancho_1\(4))) # (!\inst|LessThan7~20_combout\ & ((\inst|reg_FIFO_1\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|reg_ancho_1\(4),
	datac => \inst|reg_FIFO_1\(4),
	datad => \inst|LessThan7~20_combout\,
	combout => \inst|valor_max1~6_combout\);

-- Location: LCCOMB_X100_Y66_N8
\inst|valor_max2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max2~6_combout\ = (\inst|LessThan8~20_combout\ & (\inst|reg_ancho_3\(4))) # (!\inst|LessThan8~20_combout\ & ((\inst|reg_ancho_2\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_3\(4),
	datac => \inst|LessThan8~20_combout\,
	datad => \inst|reg_ancho_2\(4),
	combout => \inst|valor_max2~6_combout\);

-- Location: LCCOMB_X102_Y65_N6
\inst|valor_max1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max1~7_combout\ = (\inst|LessThan7~20_combout\ & ((\inst|reg_ancho_1\(3)))) # (!\inst|LessThan7~20_combout\ & (\inst|reg_FIFO_1\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|reg_FIFO_1\(3),
	datac => \inst|reg_ancho_1\(3),
	datad => \inst|LessThan7~20_combout\,
	combout => \inst|valor_max1~7_combout\);

-- Location: LCCOMB_X100_Y66_N18
\inst|valor_max2~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max2~7_combout\ = (\inst|LessThan8~20_combout\ & (\inst|reg_ancho_3\(3))) # (!\inst|LessThan8~20_combout\ & ((\inst|reg_ancho_2\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_3\(3),
	datab => \inst|reg_ancho_2\(3),
	datac => \inst|LessThan8~20_combout\,
	combout => \inst|valor_max2~7_combout\);

-- Location: LCCOMB_X102_Y65_N8
\inst|valor_max1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max1~8_combout\ = (\inst|LessThan7~20_combout\ & ((\inst|reg_ancho_1\(2)))) # (!\inst|LessThan7~20_combout\ & (\inst|reg_FIFO_1\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_FIFO_1\(2),
	datac => \inst|reg_ancho_1\(2),
	datad => \inst|LessThan7~20_combout\,
	combout => \inst|valor_max1~8_combout\);

-- Location: LCCOMB_X100_Y66_N28
\inst|valor_max2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max2~8_combout\ = (\inst|LessThan8~20_combout\ & (\inst|reg_ancho_3\(2))) # (!\inst|LessThan8~20_combout\ & ((\inst|reg_ancho_2\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_3\(2),
	datac => \inst|LessThan8~20_combout\,
	datad => \inst|reg_ancho_2\(2),
	combout => \inst|valor_max2~8_combout\);

-- Location: LCCOMB_X100_Y66_N30
\inst|valor_max2~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max2~9_combout\ = (\inst|LessThan8~20_combout\ & (\inst|reg_ancho_3\(1))) # (!\inst|LessThan8~20_combout\ & ((\inst|reg_ancho_2\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|reg_ancho_3\(1),
	datac => \inst|LessThan8~20_combout\,
	datad => \inst|reg_ancho_2\(1),
	combout => \inst|valor_max2~9_combout\);

-- Location: LCCOMB_X103_Y65_N26
\inst|valor_max1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max1~9_combout\ = (\inst|LessThan7~20_combout\ & ((\inst|reg_ancho_1\(1)))) # (!\inst|LessThan7~20_combout\ & (\inst|reg_FIFO_1\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|reg_FIFO_1\(1),
	datac => \inst|reg_ancho_1\(1),
	datad => \inst|LessThan7~20_combout\,
	combout => \inst|valor_max1~9_combout\);

-- Location: LCCOMB_X101_Y66_N6
\inst|valor_max2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max2~10_combout\ = (\inst|LessThan8~20_combout\ & (\inst|reg_ancho_3\(0))) # (!\inst|LessThan8~20_combout\ & ((\inst|reg_ancho_2\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_3\(0),
	datac => \inst|reg_ancho_2\(0),
	datad => \inst|LessThan8~20_combout\,
	combout => \inst|valor_max2~10_combout\);

-- Location: LCCOMB_X102_Y65_N26
\inst|valor_max1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|valor_max1~10_combout\ = (\inst|LessThan7~20_combout\ & (\inst|reg_ancho_1\(0))) # (!\inst|LessThan7~20_combout\ & ((\inst|reg_FIFO_1\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg_ancho_1\(0),
	datac => \inst|reg_FIFO_1\(0),
	datad => \inst|LessThan7~20_combout\,
	combout => \inst|valor_max1~10_combout\);

-- Location: LCCOMB_X100_Y65_N4
\inst|LessThan9~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan9~1_cout\ = CARRY((!\inst|valor_max2~10_combout\ & \inst|valor_max1~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|valor_max2~10_combout\,
	datab => \inst|valor_max1~10_combout\,
	datad => VCC,
	cout => \inst|LessThan9~1_cout\);

-- Location: LCCOMB_X100_Y65_N6
\inst|LessThan9~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan9~3_cout\ = CARRY((\inst|valor_max2~9_combout\ & ((!\inst|LessThan9~1_cout\) # (!\inst|valor_max1~9_combout\))) # (!\inst|valor_max2~9_combout\ & (!\inst|valor_max1~9_combout\ & !\inst|LessThan9~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|valor_max2~9_combout\,
	datab => \inst|valor_max1~9_combout\,
	datad => VCC,
	cin => \inst|LessThan9~1_cout\,
	cout => \inst|LessThan9~3_cout\);

-- Location: LCCOMB_X100_Y65_N8
\inst|LessThan9~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan9~5_cout\ = CARRY((\inst|valor_max1~8_combout\ & ((!\inst|LessThan9~3_cout\) # (!\inst|valor_max2~8_combout\))) # (!\inst|valor_max1~8_combout\ & (!\inst|valor_max2~8_combout\ & !\inst|LessThan9~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|valor_max1~8_combout\,
	datab => \inst|valor_max2~8_combout\,
	datad => VCC,
	cin => \inst|LessThan9~3_cout\,
	cout => \inst|LessThan9~5_cout\);

-- Location: LCCOMB_X100_Y65_N10
\inst|LessThan9~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan9~7_cout\ = CARRY((\inst|valor_max1~7_combout\ & (\inst|valor_max2~7_combout\ & !\inst|LessThan9~5_cout\)) # (!\inst|valor_max1~7_combout\ & ((\inst|valor_max2~7_combout\) # (!\inst|LessThan9~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|valor_max1~7_combout\,
	datab => \inst|valor_max2~7_combout\,
	datad => VCC,
	cin => \inst|LessThan9~5_cout\,
	cout => \inst|LessThan9~7_cout\);

-- Location: LCCOMB_X100_Y65_N12
\inst|LessThan9~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan9~9_cout\ = CARRY((\inst|valor_max1~6_combout\ & ((!\inst|LessThan9~7_cout\) # (!\inst|valor_max2~6_combout\))) # (!\inst|valor_max1~6_combout\ & (!\inst|valor_max2~6_combout\ & !\inst|LessThan9~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|valor_max1~6_combout\,
	datab => \inst|valor_max2~6_combout\,
	datad => VCC,
	cin => \inst|LessThan9~7_cout\,
	cout => \inst|LessThan9~9_cout\);

-- Location: LCCOMB_X100_Y65_N14
\inst|LessThan9~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan9~11_cout\ = CARRY((\inst|valor_max2~5_combout\ & ((!\inst|LessThan9~9_cout\) # (!\inst|valor_max1~5_combout\))) # (!\inst|valor_max2~5_combout\ & (!\inst|valor_max1~5_combout\ & !\inst|LessThan9~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|valor_max2~5_combout\,
	datab => \inst|valor_max1~5_combout\,
	datad => VCC,
	cin => \inst|LessThan9~9_cout\,
	cout => \inst|LessThan9~11_cout\);

-- Location: LCCOMB_X100_Y65_N16
\inst|LessThan9~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan9~13_cout\ = CARRY((\inst|valor_max2~4_combout\ & (\inst|valor_max1~4_combout\ & !\inst|LessThan9~11_cout\)) # (!\inst|valor_max2~4_combout\ & ((\inst|valor_max1~4_combout\) # (!\inst|LessThan9~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|valor_max2~4_combout\,
	datab => \inst|valor_max1~4_combout\,
	datad => VCC,
	cin => \inst|LessThan9~11_cout\,
	cout => \inst|LessThan9~13_cout\);

-- Location: LCCOMB_X100_Y65_N18
\inst|LessThan9~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan9~15_cout\ = CARRY((\inst|valor_max2~3_combout\ & ((!\inst|LessThan9~13_cout\) # (!\inst|valor_max1~3_combout\))) # (!\inst|valor_max2~3_combout\ & (!\inst|valor_max1~3_combout\ & !\inst|LessThan9~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|valor_max2~3_combout\,
	datab => \inst|valor_max1~3_combout\,
	datad => VCC,
	cin => \inst|LessThan9~13_cout\,
	cout => \inst|LessThan9~15_cout\);

-- Location: LCCOMB_X100_Y65_N20
\inst|LessThan9~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan9~17_cout\ = CARRY((\inst|valor_max1~2_combout\ & ((!\inst|LessThan9~15_cout\) # (!\inst|valor_max2~2_combout\))) # (!\inst|valor_max1~2_combout\ & (!\inst|valor_max2~2_combout\ & !\inst|LessThan9~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|valor_max1~2_combout\,
	datab => \inst|valor_max2~2_combout\,
	datad => VCC,
	cin => \inst|LessThan9~15_cout\,
	cout => \inst|LessThan9~17_cout\);

-- Location: LCCOMB_X100_Y65_N22
\inst|LessThan9~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan9~19_cout\ = CARRY((\inst|valor_max2~1_combout\ & ((!\inst|LessThan9~17_cout\) # (!\inst|valor_max1~1_combout\))) # (!\inst|valor_max2~1_combout\ & (!\inst|valor_max1~1_combout\ & !\inst|LessThan9~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|valor_max2~1_combout\,
	datab => \inst|valor_max1~1_combout\,
	datad => VCC,
	cin => \inst|LessThan9~17_cout\,
	cout => \inst|LessThan9~19_cout\);

-- Location: LCCOMB_X100_Y65_N24
\inst|LessThan9~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan9~20_combout\ = (\inst|valor_max1~0_combout\ & ((!\inst|valor_max2~0_combout\) # (!\inst|LessThan9~19_cout\))) # (!\inst|valor_max1~0_combout\ & (!\inst|LessThan9~19_cout\ & !\inst|valor_max2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|valor_max1~0_combout\,
	datad => \inst|valor_max2~0_combout\,
	cin => \inst|LessThan9~19_cout\,
	combout => \inst|LessThan9~20_combout\);

-- Location: LCCOMB_X99_Y65_N28
\inst|Selector36~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector36~1_combout\ = (\inst|process_0~14_combout\ & (\inst|Selector36~0_combout\)) # (!\inst|process_0~14_combout\ & ((\inst|LessThan9~20_combout\ & (\inst|Selector36~0_combout\)) # (!\inst|LessThan9~20_combout\ & 
-- ((\inst|valor_max2~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector36~0_combout\,
	datab => \inst|process_0~14_combout\,
	datac => \inst|valor_max2~0_combout\,
	datad => \inst|LessThan9~20_combout\,
	combout => \inst|Selector36~1_combout\);

-- Location: LCCOMB_X101_Y65_N2
\inst|FIFO_0[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|FIFO_0[0]~0_combout\ = (!\inst|LessThan2~0_combout\ & (!\inst|LessThan2~1_combout\ & (\inst|LessThan1~0_combout\ & !\inst|Equal0~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan2~0_combout\,
	datab => \inst|LessThan2~1_combout\,
	datac => \inst|LessThan1~0_combout\,
	datad => \inst|Equal0~13_combout\,
	combout => \inst|FIFO_0[0]~0_combout\);

-- Location: LCCOMB_X101_Y65_N12
\inst|FIFO_0[10]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|FIFO_0[10]~1_combout\ = (\reset~input_o\ & ((\inst|state.nuevo_pix~q\ & ((\inst|FIFO_0[0]~0_combout\))) # (!\inst|state.nuevo_pix~q\ & (\inst|state.casos~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \inst|state.nuevo_pix~q\,
	datac => \inst|state.casos~q\,
	datad => \inst|FIFO_0[0]~0_combout\,
	combout => \inst|FIFO_0[10]~1_combout\);

-- Location: FF_X99_Y65_N29
\inst|FIFO_0[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector36~1_combout\,
	sclr => \inst|ALT_INV_state.casos~q\,
	ena => \inst|FIFO_0[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_0\(10));

-- Location: LCCOMB_X98_Y65_N10
\inst|FIFO_data_o[10]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|FIFO_data_o[10]~0_combout\ = (\inst|FIFO_0\(10) & ((\inst|state.decremento_indice_FIFO~q\) # (\inst|state.escritura~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.decremento_indice_FIFO~q\,
	datac => \inst|state.escritura~q\,
	datad => \inst|FIFO_0\(10),
	combout => \inst|FIFO_data_o[10]~0_combout\);

-- Location: LCCOMB_X100_Y65_N2
\inst|Selector37~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector37~0_combout\ = (!\inst|process_0~14_combout\ & ((\inst|LessThan9~20_combout\ & (\inst|valor_max1~1_combout\)) # (!\inst|LessThan9~20_combout\ & ((\inst|valor_max2~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~14_combout\,
	datab => \inst|valor_max1~1_combout\,
	datac => \inst|valor_max2~1_combout\,
	datad => \inst|LessThan9~20_combout\,
	combout => \inst|Selector37~0_combout\);

-- Location: LCCOMB_X101_Y65_N20
\inst|Selector37~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector37~1_combout\ = (\inst|Selector37~0_combout\) # ((\inst|process_0~14_combout\ & \inst|indice\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|process_0~14_combout\,
	datac => \inst|indice\(9),
	datad => \inst|Selector37~0_combout\,
	combout => \inst|Selector37~1_combout\);

-- Location: FF_X101_Y65_N21
\inst|FIFO_0[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector37~1_combout\,
	sclr => \inst|ALT_INV_state.casos~q\,
	ena => \inst|FIFO_0[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_0\(9));

-- Location: LCCOMB_X101_Y65_N8
\inst|FIFO_data_o[9]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|FIFO_data_o[9]~1_combout\ = (\inst|FIFO_0\(9) & ((\inst|state.decremento_indice_FIFO~q\) # (\inst|state.escritura~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.decremento_indice_FIFO~q\,
	datac => \inst|state.escritura~q\,
	datad => \inst|FIFO_0\(9),
	combout => \inst|FIFO_data_o[9]~1_combout\);

-- Location: LCCOMB_X99_Y65_N12
\inst|Selector38~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector38~0_combout\ = (!\inst|process_0~14_combout\ & ((\inst|LessThan9~20_combout\ & (\inst|valor_max1~2_combout\)) # (!\inst|LessThan9~20_combout\ & ((\inst|valor_max2~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|valor_max1~2_combout\,
	datab => \inst|process_0~14_combout\,
	datac => \inst|valor_max2~2_combout\,
	datad => \inst|LessThan9~20_combout\,
	combout => \inst|Selector38~0_combout\);

-- Location: LCCOMB_X99_Y65_N14
\inst|Selector38~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector38~1_combout\ = (\inst|Selector38~0_combout\) # ((\inst|indice\(8) & \inst|process_0~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice\(8),
	datab => \inst|process_0~14_combout\,
	datad => \inst|Selector38~0_combout\,
	combout => \inst|Selector38~1_combout\);

-- Location: FF_X99_Y65_N15
\inst|FIFO_0[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector38~1_combout\,
	sclr => \inst|ALT_INV_state.casos~q\,
	ena => \inst|FIFO_0[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_0\(8));

-- Location: LCCOMB_X99_Y65_N0
\inst|FIFO_data_o[8]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|FIFO_data_o[8]~2_combout\ = (\inst|FIFO_0\(8) & ((\inst|state.decremento_indice_FIFO~q\) # (\inst|state.escritura~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|FIFO_0\(8),
	datac => \inst|state.decremento_indice_FIFO~q\,
	datad => \inst|state.escritura~q\,
	combout => \inst|FIFO_data_o[8]~2_combout\);

-- Location: LCCOMB_X100_Y65_N30
\inst|Selector39~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector39~0_combout\ = (!\inst|process_0~14_combout\ & ((\inst|LessThan9~20_combout\ & (\inst|valor_max1~3_combout\)) # (!\inst|LessThan9~20_combout\ & ((\inst|valor_max2~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~14_combout\,
	datab => \inst|valor_max1~3_combout\,
	datac => \inst|valor_max2~3_combout\,
	datad => \inst|LessThan9~20_combout\,
	combout => \inst|Selector39~0_combout\);

-- Location: LCCOMB_X101_Y65_N30
\inst|Selector39~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector39~1_combout\ = (\inst|Selector39~0_combout\) # ((\inst|process_0~14_combout\ & \inst|indice\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|process_0~14_combout\,
	datac => \inst|indice\(7),
	datad => \inst|Selector39~0_combout\,
	combout => \inst|Selector39~1_combout\);

-- Location: FF_X101_Y65_N31
\inst|FIFO_0[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector39~1_combout\,
	sclr => \inst|ALT_INV_state.casos~q\,
	ena => \inst|FIFO_0[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_0\(7));

-- Location: LCCOMB_X101_Y65_N10
\inst|FIFO_data_o[7]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|FIFO_data_o[7]~3_combout\ = (\inst|FIFO_0\(7) & ((\inst|state.escritura~q\) # (\inst|state.decremento_indice_FIFO~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|FIFO_0\(7),
	datac => \inst|state.escritura~q\,
	datad => \inst|state.decremento_indice_FIFO~q\,
	combout => \inst|FIFO_data_o[7]~3_combout\);

-- Location: LCCOMB_X100_Y65_N28
\inst|Selector40~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector40~0_combout\ = (!\inst|process_0~14_combout\ & ((\inst|LessThan9~20_combout\ & ((\inst|valor_max1~4_combout\))) # (!\inst|LessThan9~20_combout\ & (\inst|valor_max2~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|valor_max2~4_combout\,
	datab => \inst|process_0~14_combout\,
	datac => \inst|valor_max1~4_combout\,
	datad => \inst|LessThan9~20_combout\,
	combout => \inst|Selector40~0_combout\);

-- Location: LCCOMB_X101_Y65_N24
\inst|Selector40~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector40~1_combout\ = (\inst|Selector40~0_combout\) # ((\inst|indice\(6) & \inst|process_0~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice\(6),
	datab => \inst|process_0~14_combout\,
	datad => \inst|Selector40~0_combout\,
	combout => \inst|Selector40~1_combout\);

-- Location: FF_X101_Y65_N25
\inst|FIFO_0[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector40~1_combout\,
	sclr => \inst|ALT_INV_state.casos~q\,
	ena => \inst|FIFO_0[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_0\(6));

-- Location: LCCOMB_X101_Y65_N0
\inst|FIFO_data_o[6]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|FIFO_data_o[6]~4_combout\ = (\inst|FIFO_0\(6) & ((\inst|state.decremento_indice_FIFO~q\) # (\inst|state.escritura~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.decremento_indice_FIFO~q\,
	datac => \inst|state.escritura~q\,
	datad => \inst|FIFO_0\(6),
	combout => \inst|FIFO_data_o[6]~4_combout\);

-- Location: LCCOMB_X99_Y65_N10
\inst|Selector41~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector41~0_combout\ = (!\inst|process_0~14_combout\ & ((\inst|LessThan9~20_combout\ & (\inst|valor_max1~5_combout\)) # (!\inst|LessThan9~20_combout\ & ((\inst|valor_max2~5_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|valor_max1~5_combout\,
	datab => \inst|process_0~14_combout\,
	datac => \inst|valor_max2~5_combout\,
	datad => \inst|LessThan9~20_combout\,
	combout => \inst|Selector41~0_combout\);

-- Location: LCCOMB_X99_Y65_N24
\inst|Selector41~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector41~1_combout\ = (\inst|Selector41~0_combout\) # ((\inst|process_0~14_combout\ & \inst|indice\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|process_0~14_combout\,
	datac => \inst|indice\(5),
	datad => \inst|Selector41~0_combout\,
	combout => \inst|Selector41~1_combout\);

-- Location: FF_X99_Y65_N25
\inst|FIFO_0[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector41~1_combout\,
	sclr => \inst|ALT_INV_state.casos~q\,
	ena => \inst|FIFO_0[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_0\(5));

-- Location: LCCOMB_X98_Y65_N12
\inst|FIFO_data_o[5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|FIFO_data_o[5]~5_combout\ = (\inst|FIFO_0\(5) & ((\inst|state.decremento_indice_FIFO~q\) # (\inst|state.escritura~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.decremento_indice_FIFO~q\,
	datac => \inst|state.escritura~q\,
	datad => \inst|FIFO_0\(5),
	combout => \inst|FIFO_data_o[5]~5_combout\);

-- Location: LCCOMB_X100_Y65_N26
\inst|Selector42~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector42~0_combout\ = (!\inst|process_0~14_combout\ & ((\inst|LessThan9~20_combout\ & ((\inst|valor_max1~6_combout\))) # (!\inst|LessThan9~20_combout\ & (\inst|valor_max2~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~14_combout\,
	datab => \inst|valor_max2~6_combout\,
	datac => \inst|valor_max1~6_combout\,
	datad => \inst|LessThan9~20_combout\,
	combout => \inst|Selector42~0_combout\);

-- Location: LCCOMB_X100_Y65_N0
\inst|Selector42~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector42~1_combout\ = (\inst|Selector42~0_combout\) # ((\inst|process_0~14_combout\ & \inst|indice\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|process_0~14_combout\,
	datac => \inst|Selector42~0_combout\,
	datad => \inst|indice\(4),
	combout => \inst|Selector42~1_combout\);

-- Location: FF_X100_Y65_N1
\inst|FIFO_0[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector42~1_combout\,
	sclr => \inst|ALT_INV_state.casos~q\,
	ena => \inst|FIFO_0[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_0\(4));

-- Location: LCCOMB_X101_Y65_N26
\inst|FIFO_data_o[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|FIFO_data_o[4]~6_combout\ = (\inst|FIFO_0\(4) & ((\inst|state.escritura~q\) # (\inst|state.decremento_indice_FIFO~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|FIFO_0\(4),
	datab => \inst|state.escritura~q\,
	datad => \inst|state.decremento_indice_FIFO~q\,
	combout => \inst|FIFO_data_o[4]~6_combout\);

-- Location: LCCOMB_X99_Y65_N16
\inst|Selector43~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector43~0_combout\ = (!\inst|process_0~14_combout\ & ((\inst|LessThan9~20_combout\ & (\inst|valor_max1~7_combout\)) # (!\inst|LessThan9~20_combout\ & ((\inst|valor_max2~7_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|valor_max1~7_combout\,
	datab => \inst|process_0~14_combout\,
	datac => \inst|valor_max2~7_combout\,
	datad => \inst|LessThan9~20_combout\,
	combout => \inst|Selector43~0_combout\);

-- Location: LCCOMB_X99_Y65_N30
\inst|Selector43~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector43~1_combout\ = (\inst|Selector43~0_combout\) # ((\inst|process_0~14_combout\ & \inst|indice\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|process_0~14_combout\,
	datac => \inst|indice\(3),
	datad => \inst|Selector43~0_combout\,
	combout => \inst|Selector43~1_combout\);

-- Location: FF_X99_Y65_N31
\inst|FIFO_0[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector43~1_combout\,
	sclr => \inst|ALT_INV_state.casos~q\,
	ena => \inst|FIFO_0[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_0\(3));

-- Location: LCCOMB_X99_Y65_N18
\inst|FIFO_data_o[3]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|FIFO_data_o[3]~7_combout\ = (\inst|FIFO_0\(3) & ((\inst|state.decremento_indice_FIFO~q\) # (\inst|state.escritura~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|FIFO_0\(3),
	datac => \inst|state.decremento_indice_FIFO~q\,
	datad => \inst|state.escritura~q\,
	combout => \inst|FIFO_data_o[3]~7_combout\);

-- Location: LCCOMB_X99_Y65_N6
\inst|Selector44~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector44~0_combout\ = (!\inst|process_0~14_combout\ & ((\inst|LessThan9~20_combout\ & (\inst|valor_max1~8_combout\)) # (!\inst|LessThan9~20_combout\ & ((\inst|valor_max2~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|valor_max1~8_combout\,
	datab => \inst|process_0~14_combout\,
	datac => \inst|valor_max2~8_combout\,
	datad => \inst|LessThan9~20_combout\,
	combout => \inst|Selector44~0_combout\);

-- Location: LCCOMB_X99_Y65_N4
\inst|Selector44~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector44~1_combout\ = (\inst|Selector44~0_combout\) # ((\inst|process_0~14_combout\ & \inst|indice\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|process_0~14_combout\,
	datac => \inst|indice\(2),
	datad => \inst|Selector44~0_combout\,
	combout => \inst|Selector44~1_combout\);

-- Location: FF_X99_Y65_N5
\inst|FIFO_0[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector44~1_combout\,
	sclr => \inst|ALT_INV_state.casos~q\,
	ena => \inst|FIFO_0[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_0\(2));

-- Location: LCCOMB_X98_Y65_N26
\inst|FIFO_data_o[2]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|FIFO_data_o[2]~8_combout\ = (\inst|FIFO_0\(2) & ((\inst|state.escritura~q\) # (\inst|state.decremento_indice_FIFO~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|FIFO_0\(2),
	datac => \inst|state.escritura~q\,
	datad => \inst|state.decremento_indice_FIFO~q\,
	combout => \inst|FIFO_data_o[2]~8_combout\);

-- Location: LCCOMB_X99_Y65_N20
\inst|Selector45~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector45~0_combout\ = (!\inst|process_0~14_combout\ & ((\inst|LessThan9~20_combout\ & ((\inst|valor_max1~9_combout\))) # (!\inst|LessThan9~20_combout\ & (\inst|valor_max2~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|valor_max2~9_combout\,
	datab => \inst|process_0~14_combout\,
	datac => \inst|valor_max1~9_combout\,
	datad => \inst|LessThan9~20_combout\,
	combout => \inst|Selector45~0_combout\);

-- Location: LCCOMB_X99_Y65_N26
\inst|Selector45~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector45~1_combout\ = (\inst|Selector45~0_combout\) # ((\inst|process_0~14_combout\ & \inst|indice\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|process_0~14_combout\,
	datac => \inst|indice\(1),
	datad => \inst|Selector45~0_combout\,
	combout => \inst|Selector45~1_combout\);

-- Location: FF_X99_Y65_N27
\inst|FIFO_0[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector45~1_combout\,
	sclr => \inst|ALT_INV_state.casos~q\,
	ena => \inst|FIFO_0[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_0\(1));

-- Location: LCCOMB_X99_Y65_N8
\inst|FIFO_data_o[1]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|FIFO_data_o[1]~9_combout\ = (\inst|FIFO_0\(1) & ((\inst|state.decremento_indice_FIFO~q\) # (\inst|state.escritura~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|FIFO_0\(1),
	datab => \inst|state.decremento_indice_FIFO~q\,
	datad => \inst|state.escritura~q\,
	combout => \inst|FIFO_data_o[1]~9_combout\);

-- Location: LCCOMB_X101_Y65_N18
\inst|Selector46~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector46~0_combout\ = (!\inst|process_0~14_combout\ & ((\inst|LessThan9~20_combout\ & (\inst|valor_max1~10_combout\)) # (!\inst|LessThan9~20_combout\ & ((\inst|valor_max2~10_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|valor_max1~10_combout\,
	datab => \inst|process_0~14_combout\,
	datac => \inst|valor_max2~10_combout\,
	datad => \inst|LessThan9~20_combout\,
	combout => \inst|Selector46~0_combout\);

-- Location: LCCOMB_X101_Y65_N6
\inst|Selector46~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector46~1_combout\ = (\inst|Selector46~0_combout\) # ((\inst|process_0~14_combout\ & !\inst|indice\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|process_0~14_combout\,
	datac => \inst|indice\(0),
	datad => \inst|Selector46~0_combout\,
	combout => \inst|Selector46~1_combout\);

-- Location: FF_X101_Y65_N7
\inst|FIFO_0[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector46~1_combout\,
	sclr => \inst|ALT_INV_state.casos~q\,
	ena => \inst|FIFO_0[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_0\(0));

-- Location: LCCOMB_X98_Y65_N8
\inst|FIFO_data_o[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|FIFO_data_o[0]~10_combout\ = (\inst|FIFO_0\(0) & ((\inst|state.decremento_indice_FIFO~q\) # (\inst|state.escritura~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.decremento_indice_FIFO~q\,
	datac => \inst|state.escritura~q\,
	datad => \inst|FIFO_0\(0),
	combout => \inst|FIFO_data_o[0]~10_combout\);

-- Location: LCCOMB_X108_Y61_N4
\inst|Add8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add8~0_combout\ = \inst|indice_FIFO\(0) $ (VCC)
-- \inst|Add8~1\ = CARRY(\inst|indice_FIFO\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(0),
	datad => VCC,
	combout => \inst|Add8~0_combout\,
	cout => \inst|Add8~1\);

-- Location: LCCOMB_X108_Y60_N8
\inst|indice_FIFO~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|indice_FIFO~10_combout\ = (\inst|Add8~0_combout\ & (((\inst|indice_FIFO\(0)) # (!\inst|LessThan4~2_combout\)) # (!\inst|indice_FIFO\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(1),
	datab => \inst|LessThan4~2_combout\,
	datac => \inst|indice_FIFO\(0),
	datad => \inst|Add8~0_combout\,
	combout => \inst|indice_FIFO~10_combout\);

-- Location: FF_X107_Y60_N1
\inst|indice_FIFO[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst|indice_FIFO~10_combout\,
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \inst|state.decremento_indice_FIFO~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice_FIFO\(0));

-- Location: LCCOMB_X108_Y61_N6
\inst|Add8~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add8~2_combout\ = (\inst|indice_FIFO\(1) & (!\inst|Add8~1\)) # (!\inst|indice_FIFO\(1) & (\inst|Add8~1\ & VCC))
-- \inst|Add8~3\ = CARRY((\inst|indice_FIFO\(1) & !\inst|Add8~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(1),
	datad => VCC,
	cin => \inst|Add8~1\,
	combout => \inst|Add8~2_combout\,
	cout => \inst|Add8~3\);

-- Location: LCCOMB_X108_Y61_N8
\inst|Add8~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add8~4_combout\ = (\inst|indice_FIFO\(2) & ((GND) # (!\inst|Add8~3\))) # (!\inst|indice_FIFO\(2) & (\inst|Add8~3\ $ (GND)))
-- \inst|Add8~5\ = CARRY((\inst|indice_FIFO\(2)) # (!\inst|Add8~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(2),
	datad => VCC,
	cin => \inst|Add8~3\,
	combout => \inst|Add8~4_combout\,
	cout => \inst|Add8~5\);

-- Location: LCCOMB_X108_Y60_N10
\inst|indice_FIFO~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|indice_FIFO~8_combout\ = (\inst|Add8~4_combout\ & (((\inst|indice_FIFO\(0)) # (!\inst|LessThan4~2_combout\)) # (!\inst|indice_FIFO\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(1),
	datab => \inst|LessThan4~2_combout\,
	datac => \inst|indice_FIFO\(0),
	datad => \inst|Add8~4_combout\,
	combout => \inst|indice_FIFO~8_combout\);

-- Location: FF_X107_Y60_N11
\inst|indice_FIFO[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst|indice_FIFO~8_combout\,
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \inst|state.decremento_indice_FIFO~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice_FIFO\(2));

-- Location: LCCOMB_X108_Y61_N10
\inst|Add8~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add8~6_combout\ = (\inst|indice_FIFO\(3) & (\inst|Add8~5\ & VCC)) # (!\inst|indice_FIFO\(3) & (!\inst|Add8~5\))
-- \inst|Add8~7\ = CARRY((!\inst|indice_FIFO\(3) & !\inst|Add8~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(3),
	datad => VCC,
	cin => \inst|Add8~5\,
	combout => \inst|Add8~6_combout\,
	cout => \inst|Add8~7\);

-- Location: LCCOMB_X107_Y61_N30
\inst|indice_FIFO~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|indice_FIFO~7_combout\ = (\inst|Add8~6_combout\ & (((\inst|indice_FIFO\(0)) # (!\inst|LessThan4~2_combout\)) # (!\inst|indice_FIFO\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(1),
	datab => \inst|Add8~6_combout\,
	datac => \inst|LessThan4~2_combout\,
	datad => \inst|indice_FIFO\(0),
	combout => \inst|indice_FIFO~7_combout\);

-- Location: FF_X107_Y61_N31
\inst|indice_FIFO[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|indice_FIFO~7_combout\,
	clrn => \reset~input_o\,
	ena => \inst|state.decremento_indice_FIFO~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice_FIFO\(3));

-- Location: LCCOMB_X108_Y61_N12
\inst|Add8~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add8~8_combout\ = (\inst|indice_FIFO\(4) & ((GND) # (!\inst|Add8~7\))) # (!\inst|indice_FIFO\(4) & (\inst|Add8~7\ $ (GND)))
-- \inst|Add8~9\ = CARRY((\inst|indice_FIFO\(4)) # (!\inst|Add8~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(4),
	datad => VCC,
	cin => \inst|Add8~7\,
	combout => \inst|Add8~8_combout\,
	cout => \inst|Add8~9\);

-- Location: LCCOMB_X107_Y61_N0
\inst|indice_FIFO~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|indice_FIFO~6_combout\ = (\inst|Add8~8_combout\ & (((\inst|indice_FIFO\(0)) # (!\inst|LessThan4~2_combout\)) # (!\inst|indice_FIFO\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(1),
	datab => \inst|Add8~8_combout\,
	datac => \inst|LessThan4~2_combout\,
	datad => \inst|indice_FIFO\(0),
	combout => \inst|indice_FIFO~6_combout\);

-- Location: FF_X107_Y61_N1
\inst|indice_FIFO[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|indice_FIFO~6_combout\,
	clrn => \reset~input_o\,
	ena => \inst|state.decremento_indice_FIFO~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice_FIFO\(4));

-- Location: LCCOMB_X108_Y61_N14
\inst|Add8~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add8~10_combout\ = (\inst|indice_FIFO\(5) & (\inst|Add8~9\ & VCC)) # (!\inst|indice_FIFO\(5) & (!\inst|Add8~9\))
-- \inst|Add8~11\ = CARRY((!\inst|indice_FIFO\(5) & !\inst|Add8~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(5),
	datad => VCC,
	cin => \inst|Add8~9\,
	combout => \inst|Add8~10_combout\,
	cout => \inst|Add8~11\);

-- Location: LCCOMB_X108_Y60_N12
\inst|indice_FIFO~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|indice_FIFO~5_combout\ = (\inst|Add8~10_combout\ & (((\inst|indice_FIFO\(0)) # (!\inst|LessThan4~2_combout\)) # (!\inst|indice_FIFO\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(1),
	datab => \inst|LessThan4~2_combout\,
	datac => \inst|Add8~10_combout\,
	datad => \inst|indice_FIFO\(0),
	combout => \inst|indice_FIFO~5_combout\);

-- Location: FF_X107_Y60_N21
\inst|indice_FIFO[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst|indice_FIFO~5_combout\,
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \inst|state.decremento_indice_FIFO~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice_FIFO\(5));

-- Location: LCCOMB_X108_Y61_N16
\inst|Add8~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add8~12_combout\ = (\inst|indice_FIFO\(6) & ((GND) # (!\inst|Add8~11\))) # (!\inst|indice_FIFO\(6) & (\inst|Add8~11\ $ (GND)))
-- \inst|Add8~13\ = CARRY((\inst|indice_FIFO\(6)) # (!\inst|Add8~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(6),
	datad => VCC,
	cin => \inst|Add8~11\,
	combout => \inst|Add8~12_combout\,
	cout => \inst|Add8~13\);

-- Location: LCCOMB_X108_Y61_N30
\inst|indice_FIFO~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|indice_FIFO~4_combout\ = (\inst|Add8~12_combout\ & (((\inst|indice_FIFO\(0)) # (!\inst|indice_FIFO\(1))) # (!\inst|LessThan4~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan4~2_combout\,
	datab => \inst|indice_FIFO\(1),
	datac => \inst|indice_FIFO\(0),
	datad => \inst|Add8~12_combout\,
	combout => \inst|indice_FIFO~4_combout\);

-- Location: FF_X107_Y60_N27
\inst|indice_FIFO[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst|indice_FIFO~4_combout\,
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \inst|state.decremento_indice_FIFO~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice_FIFO\(6));

-- Location: LCCOMB_X106_Y60_N8
\inst|LessThan4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan4~1_combout\ = (!\inst|indice_FIFO\(5) & (!\inst|indice_FIFO\(3) & (!\inst|indice_FIFO\(6) & !\inst|indice_FIFO\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(5),
	datab => \inst|indice_FIFO\(3),
	datac => \inst|indice_FIFO\(6),
	datad => \inst|indice_FIFO\(4),
	combout => \inst|LessThan4~1_combout\);

-- Location: LCCOMB_X108_Y61_N18
\inst|Add8~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add8~14_combout\ = (\inst|indice_FIFO\(7) & (\inst|Add8~13\ & VCC)) # (!\inst|indice_FIFO\(7) & (!\inst|Add8~13\))
-- \inst|Add8~15\ = CARRY((!\inst|indice_FIFO\(7) & !\inst|Add8~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(7),
	datad => VCC,
	cin => \inst|Add8~13\,
	combout => \inst|Add8~14_combout\,
	cout => \inst|Add8~15\);

-- Location: LCCOMB_X108_Y61_N0
\inst|indice_FIFO~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|indice_FIFO~3_combout\ = (\inst|Add8~14_combout\ & (((\inst|indice_FIFO\(0)) # (!\inst|indice_FIFO\(1))) # (!\inst|LessThan4~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan4~2_combout\,
	datab => \inst|indice_FIFO\(0),
	datac => \inst|indice_FIFO\(1),
	datad => \inst|Add8~14_combout\,
	combout => \inst|indice_FIFO~3_combout\);

-- Location: FF_X108_Y61_N1
\inst|indice_FIFO[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|indice_FIFO~3_combout\,
	clrn => \reset~input_o\,
	ena => \inst|state.decremento_indice_FIFO~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice_FIFO\(7));

-- Location: LCCOMB_X108_Y61_N20
\inst|Add8~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add8~16_combout\ = (\inst|indice_FIFO\(8) & (\inst|Add8~15\ $ (GND))) # (!\inst|indice_FIFO\(8) & ((GND) # (!\inst|Add8~15\)))
-- \inst|Add8~17\ = CARRY((!\inst|Add8~15\) # (!\inst|indice_FIFO\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(8),
	datad => VCC,
	cin => \inst|Add8~15\,
	combout => \inst|Add8~16_combout\,
	cout => \inst|Add8~17\);

-- Location: LCCOMB_X108_Y61_N2
\inst|indice_FIFO~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|indice_FIFO~2_combout\ = (!\inst|Add8~16_combout\ & (((\inst|indice_FIFO\(0)) # (!\inst|indice_FIFO\(1))) # (!\inst|LessThan4~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan4~2_combout\,
	datab => \inst|indice_FIFO\(0),
	datac => \inst|indice_FIFO\(1),
	datad => \inst|Add8~16_combout\,
	combout => \inst|indice_FIFO~2_combout\);

-- Location: FF_X108_Y61_N3
\inst|indice_FIFO[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|indice_FIFO~2_combout\,
	clrn => \reset~input_o\,
	ena => \inst|state.decremento_indice_FIFO~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice_FIFO\(8));

-- Location: LCCOMB_X108_Y61_N22
\inst|Add8~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add8~18_combout\ = (\inst|indice_FIFO\(9) & (\inst|Add8~17\ & VCC)) # (!\inst|indice_FIFO\(9) & (!\inst|Add8~17\))
-- \inst|Add8~19\ = CARRY((!\inst|indice_FIFO\(9) & !\inst|Add8~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(9),
	datad => VCC,
	cin => \inst|Add8~17\,
	combout => \inst|Add8~18_combout\,
	cout => \inst|Add8~19\);

-- Location: LCCOMB_X108_Y61_N28
\inst|indice_FIFO~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|indice_FIFO~1_combout\ = (\inst|Add8~18_combout\ & (((\inst|indice_FIFO\(0)) # (!\inst|LessThan4~2_combout\)) # (!\inst|indice_FIFO\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(1),
	datab => \inst|indice_FIFO\(0),
	datac => \inst|Add8~18_combout\,
	datad => \inst|LessThan4~2_combout\,
	combout => \inst|indice_FIFO~1_combout\);

-- Location: FF_X108_Y61_N29
\inst|indice_FIFO[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|indice_FIFO~1_combout\,
	clrn => \reset~input_o\,
	ena => \inst|state.decremento_indice_FIFO~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice_FIFO\(9));

-- Location: LCCOMB_X106_Y60_N2
\inst|LessThan4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan4~0_combout\ = (\inst|indice_FIFO\(10) & (!\inst|indice_FIFO\(9) & (!\inst|indice_FIFO\(7) & \inst|indice_FIFO\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(10),
	datab => \inst|indice_FIFO\(9),
	datac => \inst|indice_FIFO\(7),
	datad => \inst|indice_FIFO\(8),
	combout => \inst|LessThan4~0_combout\);

-- Location: LCCOMB_X106_Y60_N6
\inst|LessThan4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan4~2_combout\ = (!\inst|indice_FIFO\(2) & (\inst|LessThan4~1_combout\ & \inst|LessThan4~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(2),
	datac => \inst|LessThan4~1_combout\,
	datad => \inst|LessThan4~0_combout\,
	combout => \inst|LessThan4~2_combout\);

-- Location: LCCOMB_X106_Y62_N8
\inst|indice_FIFO~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|indice_FIFO~9_combout\ = (!\inst|Add8~2_combout\ & (((\inst|indice_FIFO\(0)) # (!\inst|indice_FIFO\(1))) # (!\inst|LessThan4~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan4~2_combout\,
	datab => \inst|indice_FIFO\(0),
	datac => \inst|indice_FIFO\(1),
	datad => \inst|Add8~2_combout\,
	combout => \inst|indice_FIFO~9_combout\);

-- Location: FF_X106_Y62_N9
\inst|indice_FIFO[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|indice_FIFO~9_combout\,
	clrn => \reset~input_o\,
	ena => \inst|state.decremento_indice_FIFO~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice_FIFO\(1));

-- Location: LCCOMB_X108_Y61_N24
\inst|Add8~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add8~20_combout\ = \inst|Add8~19\ $ (!\inst|indice_FIFO\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst|indice_FIFO\(10),
	cin => \inst|Add8~19\,
	combout => \inst|Add8~20_combout\);

-- Location: LCCOMB_X107_Y61_N2
\inst|indice_FIFO~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|indice_FIFO~0_combout\ = (!\inst|Add8~20_combout\ & (((\inst|indice_FIFO\(0)) # (!\inst|LessThan4~2_combout\)) # (!\inst|indice_FIFO\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(1),
	datab => \inst|indice_FIFO\(0),
	datac => \inst|LessThan4~2_combout\,
	datad => \inst|Add8~20_combout\,
	combout => \inst|indice_FIFO~0_combout\);

-- Location: FF_X107_Y61_N3
\inst|indice_FIFO[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|indice_FIFO~0_combout\,
	clrn => \reset~input_o\,
	ena => \inst|state.decremento_indice_FIFO~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|indice_FIFO\(10));

-- Location: LCCOMB_X105_Y62_N4
\inst|Selector47~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector47~2_combout\ = (\inst|state.escritura~q\ & !\inst|indice_FIFO\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|state.escritura~q\,
	datad => \inst|indice_FIFO\(10),
	combout => \inst|Selector47~2_combout\);

-- Location: LCCOMB_X108_Y61_N26
\inst|Add3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add3~0_combout\ = (\inst|indice_FIFO\(9) & !\inst|indice_FIFO\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(9),
	datad => \inst|indice_FIFO\(8),
	combout => \inst|Add3~0_combout\);

-- Location: LCCOMB_X105_Y62_N10
\inst|Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add2~0_combout\ = \inst|indice_FIFO\(0) $ (VCC)
-- \inst|Add2~1\ = CARRY(\inst|indice_FIFO\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(0),
	datad => VCC,
	combout => \inst|Add2~0_combout\,
	cout => \inst|Add2~1\);

-- Location: LCCOMB_X105_Y62_N12
\inst|Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add2~2_combout\ = (\inst|indice_FIFO\(1) & ((\inst|Add2~1\) # (GND))) # (!\inst|indice_FIFO\(1) & (!\inst|Add2~1\))
-- \inst|Add2~3\ = CARRY((\inst|indice_FIFO\(1)) # (!\inst|Add2~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(1),
	datad => VCC,
	cin => \inst|Add2~1\,
	combout => \inst|Add2~2_combout\,
	cout => \inst|Add2~3\);

-- Location: LCCOMB_X105_Y62_N14
\inst|Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add2~4_combout\ = (\inst|indice_FIFO\(2) & ((GND) # (!\inst|Add2~3\))) # (!\inst|indice_FIFO\(2) & (\inst|Add2~3\ $ (GND)))
-- \inst|Add2~5\ = CARRY((\inst|indice_FIFO\(2)) # (!\inst|Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(2),
	datad => VCC,
	cin => \inst|Add2~3\,
	combout => \inst|Add2~4_combout\,
	cout => \inst|Add2~5\);

-- Location: LCCOMB_X105_Y62_N16
\inst|Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add2~6_combout\ = (\inst|indice_FIFO\(3) & (\inst|Add2~5\ & VCC)) # (!\inst|indice_FIFO\(3) & (!\inst|Add2~5\))
-- \inst|Add2~7\ = CARRY((!\inst|indice_FIFO\(3) & !\inst|Add2~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(3),
	datad => VCC,
	cin => \inst|Add2~5\,
	combout => \inst|Add2~6_combout\,
	cout => \inst|Add2~7\);

-- Location: LCCOMB_X105_Y62_N18
\inst|Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add2~8_combout\ = (\inst|indice_FIFO\(4) & ((GND) # (!\inst|Add2~7\))) # (!\inst|indice_FIFO\(4) & (\inst|Add2~7\ $ (GND)))
-- \inst|Add2~9\ = CARRY((\inst|indice_FIFO\(4)) # (!\inst|Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(4),
	datad => VCC,
	cin => \inst|Add2~7\,
	combout => \inst|Add2~8_combout\,
	cout => \inst|Add2~9\);

-- Location: LCCOMB_X105_Y62_N20
\inst|Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add2~10_combout\ = (\inst|indice_FIFO\(5) & (\inst|Add2~9\ & VCC)) # (!\inst|indice_FIFO\(5) & (!\inst|Add2~9\))
-- \inst|Add2~11\ = CARRY((!\inst|indice_FIFO\(5) & !\inst|Add2~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(5),
	datad => VCC,
	cin => \inst|Add2~9\,
	combout => \inst|Add2~10_combout\,
	cout => \inst|Add2~11\);

-- Location: LCCOMB_X105_Y62_N22
\inst|Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add2~12_combout\ = (\inst|indice_FIFO\(6) & ((GND) # (!\inst|Add2~11\))) # (!\inst|indice_FIFO\(6) & (\inst|Add2~11\ $ (GND)))
-- \inst|Add2~13\ = CARRY((\inst|indice_FIFO\(6)) # (!\inst|Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(6),
	datad => VCC,
	cin => \inst|Add2~11\,
	combout => \inst|Add2~12_combout\,
	cout => \inst|Add2~13\);

-- Location: LCCOMB_X105_Y62_N24
\inst|Add2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add2~14_combout\ = (\inst|indice_FIFO\(7) & (\inst|Add2~13\ & VCC)) # (!\inst|indice_FIFO\(7) & (!\inst|Add2~13\))
-- \inst|Add2~15\ = CARRY((!\inst|indice_FIFO\(7) & !\inst|Add2~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(7),
	datad => VCC,
	cin => \inst|Add2~13\,
	combout => \inst|Add2~14_combout\,
	cout => \inst|Add2~15\);

-- Location: LCCOMB_X105_Y62_N26
\inst|Add2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add2~16_combout\ = (\inst|indice_FIFO\(8) & (\inst|Add2~15\ $ (GND))) # (!\inst|indice_FIFO\(8) & (!\inst|Add2~15\ & VCC))
-- \inst|Add2~17\ = CARRY((\inst|indice_FIFO\(8) & !\inst|Add2~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(8),
	datad => VCC,
	cin => \inst|Add2~15\,
	combout => \inst|Add2~16_combout\,
	cout => \inst|Add2~17\);

-- Location: LCCOMB_X105_Y62_N28
\inst|Add2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add2~18_combout\ = (\inst|Add2~17\ & ((\inst|indice_FIFO\(8) $ (!\inst|indice_FIFO\(9))))) # (!\inst|Add2~17\ & (\inst|indice_FIFO\(8) $ ((\inst|indice_FIFO\(9)))))
-- \inst|Add2~19\ = CARRY((!\inst|Add2~17\ & (\inst|indice_FIFO\(8) $ (\inst|indice_FIFO\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000000110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(8),
	datab => \inst|indice_FIFO\(9),
	datad => VCC,
	cin => \inst|Add2~17\,
	combout => \inst|Add2~18_combout\,
	cout => \inst|Add2~19\);

-- Location: LCCOMB_X105_Y62_N30
\inst|Add2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add2~20_combout\ = \inst|Add3~0_combout\ $ (\inst|Add2~19\ $ (!\inst|indice_FIFO\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add3~0_combout\,
	datad => \inst|indice_FIFO\(10),
	cin => \inst|Add2~19\,
	combout => \inst|Add2~20_combout\);

-- Location: LCCOMB_X106_Y62_N18
\inst|LessThan4~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan4~3_combout\ = (\inst|LessThan4~2_combout\ & ((\inst|indice_FIFO\(1)) # (!\inst|indice_FIFO\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(0),
	datac => \inst|indice_FIFO\(1),
	datad => \inst|LessThan4~2_combout\,
	combout => \inst|LessThan4~3_combout\);

-- Location: LCCOMB_X105_Y62_N6
\inst|Selector47~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector47~3_combout\ = (\inst|Selector47~2_combout\) # ((\inst|state.dir_ancho_1~q\ & ((\inst|Add2~20_combout\) # (\inst|LessThan4~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dir_ancho_1~q\,
	datab => \inst|Selector47~2_combout\,
	datac => \inst|Add2~20_combout\,
	datad => \inst|LessThan4~3_combout\,
	combout => \inst|Selector47~3_combout\);

-- Location: LCCOMB_X107_Y60_N4
\inst|Add6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add6~0_combout\ = \inst|indice_FIFO\(0) $ (VCC)
-- \inst|Add6~1\ = CARRY(\inst|indice_FIFO\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(0),
	datad => VCC,
	combout => \inst|Add6~0_combout\,
	cout => \inst|Add6~1\);

-- Location: LCCOMB_X107_Y60_N6
\inst|Add6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add6~2_combout\ = (\inst|indice_FIFO\(1) & ((\inst|Add6~1\) # (GND))) # (!\inst|indice_FIFO\(1) & (!\inst|Add6~1\))
-- \inst|Add6~3\ = CARRY((\inst|indice_FIFO\(1)) # (!\inst|Add6~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(1),
	datad => VCC,
	cin => \inst|Add6~1\,
	combout => \inst|Add6~2_combout\,
	cout => \inst|Add6~3\);

-- Location: LCCOMB_X107_Y60_N8
\inst|Add6~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add6~4_combout\ = (\inst|indice_FIFO\(2) & (\inst|Add6~3\ $ (GND))) # (!\inst|indice_FIFO\(2) & (!\inst|Add6~3\ & VCC))
-- \inst|Add6~5\ = CARRY((\inst|indice_FIFO\(2) & !\inst|Add6~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(2),
	datad => VCC,
	cin => \inst|Add6~3\,
	combout => \inst|Add6~4_combout\,
	cout => \inst|Add6~5\);

-- Location: LCCOMB_X107_Y60_N10
\inst|Add6~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add6~6_combout\ = (\inst|indice_FIFO\(3) & (!\inst|Add6~5\)) # (!\inst|indice_FIFO\(3) & ((\inst|Add6~5\) # (GND)))
-- \inst|Add6~7\ = CARRY((!\inst|Add6~5\) # (!\inst|indice_FIFO\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(3),
	datad => VCC,
	cin => \inst|Add6~5\,
	combout => \inst|Add6~6_combout\,
	cout => \inst|Add6~7\);

-- Location: LCCOMB_X107_Y60_N12
\inst|Add6~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add6~8_combout\ = (\inst|indice_FIFO\(4) & (\inst|Add6~7\ $ (GND))) # (!\inst|indice_FIFO\(4) & (!\inst|Add6~7\ & VCC))
-- \inst|Add6~9\ = CARRY((\inst|indice_FIFO\(4) & !\inst|Add6~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(4),
	datad => VCC,
	cin => \inst|Add6~7\,
	combout => \inst|Add6~8_combout\,
	cout => \inst|Add6~9\);

-- Location: LCCOMB_X107_Y60_N14
\inst|Add6~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add6~10_combout\ = (\inst|indice_FIFO\(5) & (!\inst|Add6~9\)) # (!\inst|indice_FIFO\(5) & ((\inst|Add6~9\) # (GND)))
-- \inst|Add6~11\ = CARRY((!\inst|Add6~9\) # (!\inst|indice_FIFO\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(5),
	datad => VCC,
	cin => \inst|Add6~9\,
	combout => \inst|Add6~10_combout\,
	cout => \inst|Add6~11\);

-- Location: LCCOMB_X107_Y60_N16
\inst|Add6~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add6~12_combout\ = (\inst|indice_FIFO\(6) & (\inst|Add6~11\ $ (GND))) # (!\inst|indice_FIFO\(6) & (!\inst|Add6~11\ & VCC))
-- \inst|Add6~13\ = CARRY((\inst|indice_FIFO\(6) & !\inst|Add6~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(6),
	datad => VCC,
	cin => \inst|Add6~11\,
	combout => \inst|Add6~12_combout\,
	cout => \inst|Add6~13\);

-- Location: LCCOMB_X107_Y60_N18
\inst|Add6~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add6~14_combout\ = (\inst|indice_FIFO\(7) & (!\inst|Add6~13\)) # (!\inst|indice_FIFO\(7) & ((\inst|Add6~13\) # (GND)))
-- \inst|Add6~15\ = CARRY((!\inst|Add6~13\) # (!\inst|indice_FIFO\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(7),
	datad => VCC,
	cin => \inst|Add6~13\,
	combout => \inst|Add6~14_combout\,
	cout => \inst|Add6~15\);

-- Location: LCCOMB_X107_Y60_N20
\inst|Add6~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add6~16_combout\ = (\inst|indice_FIFO\(8) & (\inst|Add6~15\ $ (GND))) # (!\inst|indice_FIFO\(8) & (!\inst|Add6~15\ & VCC))
-- \inst|Add6~17\ = CARRY((\inst|indice_FIFO\(8) & !\inst|Add6~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(8),
	datad => VCC,
	cin => \inst|Add6~15\,
	combout => \inst|Add6~16_combout\,
	cout => \inst|Add6~17\);

-- Location: LCCOMB_X107_Y60_N22
\inst|Add6~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add6~18_combout\ = (\inst|Add6~17\ & (\inst|indice_FIFO\(9) $ ((\inst|indice_FIFO\(8))))) # (!\inst|Add6~17\ & ((\inst|indice_FIFO\(9) $ (!\inst|indice_FIFO\(8))) # (GND)))
-- \inst|Add6~19\ = CARRY((\inst|indice_FIFO\(9) $ (\inst|indice_FIFO\(8))) # (!\inst|Add6~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(9),
	datab => \inst|indice_FIFO\(8),
	datad => VCC,
	cin => \inst|Add6~17\,
	combout => \inst|Add6~18_combout\,
	cout => \inst|Add6~19\);

-- Location: LCCOMB_X107_Y60_N24
\inst|Add6~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add6~20_combout\ = (\inst|Add6~19\ & ((\inst|indice_FIFO\(10) $ (\inst|Add3~0_combout\)))) # (!\inst|Add6~19\ & (\inst|indice_FIFO\(10) $ (\inst|Add3~0_combout\ $ (VCC))))
-- \inst|Add6~21\ = CARRY((!\inst|Add6~19\ & (\inst|indice_FIFO\(10) $ (\inst|Add3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100000110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(10),
	datab => \inst|Add3~0_combout\,
	datad => VCC,
	cin => \inst|Add6~19\,
	combout => \inst|Add6~20_combout\,
	cout => \inst|Add6~21\);

-- Location: LCCOMB_X107_Y60_N26
\inst|Add6~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add6~22_combout\ = \inst|Add6~21\ $ (((\inst|Add3~0_combout\) # (!\inst|indice_FIFO\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110100101101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(10),
	datab => \inst|Add3~0_combout\,
	cin => \inst|Add6~21\,
	combout => \inst|Add6~22_combout\);

-- Location: LCCOMB_X107_Y60_N30
\inst|LessThan5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan5~0_combout\ = (!\inst|Add6~6_combout\ & (!\inst|Add6~4_combout\ & (!\inst|Add6~10_combout\ & !\inst|Add6~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add6~6_combout\,
	datab => \inst|Add6~4_combout\,
	datac => \inst|Add6~10_combout\,
	datad => \inst|Add6~8_combout\,
	combout => \inst|LessThan5~0_combout\);

-- Location: LCCOMB_X107_Y60_N0
\inst|LessThan5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan5~1_combout\ = (\inst|Add6~14_combout\) # ((\inst|Add6~2_combout\ & \inst|Add6~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add6~2_combout\,
	datab => \inst|Add6~0_combout\,
	datad => \inst|Add6~14_combout\,
	combout => \inst|LessThan5~1_combout\);

-- Location: LCCOMB_X107_Y60_N28
\inst|LessThan5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan5~2_combout\ = (\inst|Add6~16_combout\ & ((\inst|Add6~12_combout\) # ((\inst|LessThan5~1_combout\) # (!\inst|LessThan5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add6~12_combout\,
	datab => \inst|Add6~16_combout\,
	datac => \inst|LessThan5~0_combout\,
	datad => \inst|LessThan5~1_combout\,
	combout => \inst|LessThan5~2_combout\);

-- Location: LCCOMB_X107_Y60_N2
\inst|LessThan5~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan5~3_combout\ = (!\inst|Add6~22_combout\ & (((!\inst|Add6~18_combout\ & !\inst|LessThan5~2_combout\)) # (!\inst|Add6~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add6~22_combout\,
	datab => \inst|Add6~20_combout\,
	datac => \inst|Add6~18_combout\,
	datad => \inst|LessThan5~2_combout\,
	combout => \inst|LessThan5~3_combout\);

-- Location: LCCOMB_X106_Y60_N10
\inst|Add4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add4~0_combout\ = \inst|indice_FIFO\(1) $ (GND)
-- \inst|Add4~1\ = CARRY(!\inst|indice_FIFO\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(1),
	datad => VCC,
	combout => \inst|Add4~0_combout\,
	cout => \inst|Add4~1\);

-- Location: LCCOMB_X106_Y60_N12
\inst|Add4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add4~2_combout\ = (\inst|indice_FIFO\(2) & (\inst|Add4~1\ & VCC)) # (!\inst|indice_FIFO\(2) & (!\inst|Add4~1\))
-- \inst|Add4~3\ = CARRY((!\inst|indice_FIFO\(2) & !\inst|Add4~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(2),
	datad => VCC,
	cin => \inst|Add4~1\,
	combout => \inst|Add4~2_combout\,
	cout => \inst|Add4~3\);

-- Location: LCCOMB_X106_Y60_N14
\inst|Add4~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add4~4_combout\ = (\inst|indice_FIFO\(3) & ((GND) # (!\inst|Add4~3\))) # (!\inst|indice_FIFO\(3) & (\inst|Add4~3\ $ (GND)))
-- \inst|Add4~5\ = CARRY((\inst|indice_FIFO\(3)) # (!\inst|Add4~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(3),
	datad => VCC,
	cin => \inst|Add4~3\,
	combout => \inst|Add4~4_combout\,
	cout => \inst|Add4~5\);

-- Location: LCCOMB_X106_Y60_N16
\inst|Add4~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add4~6_combout\ = (\inst|indice_FIFO\(4) & (\inst|Add4~5\ & VCC)) # (!\inst|indice_FIFO\(4) & (!\inst|Add4~5\))
-- \inst|Add4~7\ = CARRY((!\inst|indice_FIFO\(4) & !\inst|Add4~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(4),
	datad => VCC,
	cin => \inst|Add4~5\,
	combout => \inst|Add4~6_combout\,
	cout => \inst|Add4~7\);

-- Location: LCCOMB_X106_Y60_N18
\inst|Add4~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add4~8_combout\ = (\inst|indice_FIFO\(5) & ((GND) # (!\inst|Add4~7\))) # (!\inst|indice_FIFO\(5) & (\inst|Add4~7\ $ (GND)))
-- \inst|Add4~9\ = CARRY((\inst|indice_FIFO\(5)) # (!\inst|Add4~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(5),
	datad => VCC,
	cin => \inst|Add4~7\,
	combout => \inst|Add4~8_combout\,
	cout => \inst|Add4~9\);

-- Location: LCCOMB_X106_Y60_N20
\inst|Add4~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add4~10_combout\ = (\inst|indice_FIFO\(6) & (\inst|Add4~9\ & VCC)) # (!\inst|indice_FIFO\(6) & (!\inst|Add4~9\))
-- \inst|Add4~11\ = CARRY((!\inst|indice_FIFO\(6) & !\inst|Add4~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(6),
	datad => VCC,
	cin => \inst|Add4~9\,
	combout => \inst|Add4~10_combout\,
	cout => \inst|Add4~11\);

-- Location: LCCOMB_X106_Y60_N22
\inst|Add4~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add4~12_combout\ = (\inst|indice_FIFO\(7) & ((GND) # (!\inst|Add4~11\))) # (!\inst|indice_FIFO\(7) & (\inst|Add4~11\ $ (GND)))
-- \inst|Add4~13\ = CARRY((\inst|indice_FIFO\(7)) # (!\inst|Add4~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(7),
	datad => VCC,
	cin => \inst|Add4~11\,
	combout => \inst|Add4~12_combout\,
	cout => \inst|Add4~13\);

-- Location: LCCOMB_X106_Y60_N24
\inst|Add4~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add4~14_combout\ = (\inst|indice_FIFO\(8) & (!\inst|Add4~13\)) # (!\inst|indice_FIFO\(8) & (\inst|Add4~13\ & VCC))
-- \inst|Add4~15\ = CARRY((\inst|indice_FIFO\(8) & !\inst|Add4~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(8),
	datad => VCC,
	cin => \inst|Add4~13\,
	combout => \inst|Add4~14_combout\,
	cout => \inst|Add4~15\);

-- Location: LCCOMB_X106_Y60_N26
\inst|Add4~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add4~16_combout\ = (\inst|indice_FIFO\(9) & ((GND) # (!\inst|Add4~15\))) # (!\inst|indice_FIFO\(9) & (\inst|Add4~15\ $ (GND)))
-- \inst|Add4~17\ = CARRY((\inst|indice_FIFO\(9)) # (!\inst|Add4~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(9),
	datad => VCC,
	cin => \inst|Add4~15\,
	combout => \inst|Add4~16_combout\,
	cout => \inst|Add4~17\);

-- Location: LCCOMB_X106_Y60_N28
\inst|Add4~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add4~18_combout\ = \inst|indice_FIFO\(10) $ (\inst|Add4~17\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(10),
	cin => \inst|Add4~17\,
	combout => \inst|Add4~18_combout\);

-- Location: LCCOMB_X106_Y60_N0
\inst|Selector47~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector47~1_combout\ = (\inst|state.dir_ancho_2~q\ & ((\inst|LessThan5~3_combout\ & (\inst|Add6~20_combout\)) # (!\inst|LessThan5~3_combout\ & ((\inst|Add4~18_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan5~3_combout\,
	datab => \inst|state.dir_ancho_2~q\,
	datac => \inst|Add6~20_combout\,
	datad => \inst|Add4~18_combout\,
	combout => \inst|Selector47~1_combout\);

-- Location: LCCOMB_X105_Y61_N0
\inst|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~0_combout\ = \inst|indice_FIFO\(0) $ (VCC)
-- \inst|Add1~1\ = CARRY(\inst|indice_FIFO\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(0),
	datad => VCC,
	combout => \inst|Add1~0_combout\,
	cout => \inst|Add1~1\);

-- Location: LCCOMB_X105_Y61_N2
\inst|Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~2_combout\ = (\inst|indice_FIFO\(1) & ((\inst|Add1~1\) # (GND))) # (!\inst|indice_FIFO\(1) & (!\inst|Add1~1\))
-- \inst|Add1~3\ = CARRY((\inst|indice_FIFO\(1)) # (!\inst|Add1~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(1),
	datad => VCC,
	cin => \inst|Add1~1\,
	combout => \inst|Add1~2_combout\,
	cout => \inst|Add1~3\);

-- Location: LCCOMB_X105_Y61_N4
\inst|Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~4_combout\ = (\inst|indice_FIFO\(2) & (\inst|Add1~3\ $ (GND))) # (!\inst|indice_FIFO\(2) & (!\inst|Add1~3\ & VCC))
-- \inst|Add1~5\ = CARRY((\inst|indice_FIFO\(2) & !\inst|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(2),
	datad => VCC,
	cin => \inst|Add1~3\,
	combout => \inst|Add1~4_combout\,
	cout => \inst|Add1~5\);

-- Location: LCCOMB_X105_Y61_N6
\inst|Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~6_combout\ = (\inst|indice_FIFO\(3) & (!\inst|Add1~5\)) # (!\inst|indice_FIFO\(3) & ((\inst|Add1~5\) # (GND)))
-- \inst|Add1~7\ = CARRY((!\inst|Add1~5\) # (!\inst|indice_FIFO\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(3),
	datad => VCC,
	cin => \inst|Add1~5\,
	combout => \inst|Add1~6_combout\,
	cout => \inst|Add1~7\);

-- Location: LCCOMB_X105_Y61_N8
\inst|Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~8_combout\ = (\inst|indice_FIFO\(4) & (\inst|Add1~7\ $ (GND))) # (!\inst|indice_FIFO\(4) & (!\inst|Add1~7\ & VCC))
-- \inst|Add1~9\ = CARRY((\inst|indice_FIFO\(4) & !\inst|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(4),
	datad => VCC,
	cin => \inst|Add1~7\,
	combout => \inst|Add1~8_combout\,
	cout => \inst|Add1~9\);

-- Location: LCCOMB_X105_Y61_N10
\inst|Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~10_combout\ = (\inst|indice_FIFO\(5) & (!\inst|Add1~9\)) # (!\inst|indice_FIFO\(5) & ((\inst|Add1~9\) # (GND)))
-- \inst|Add1~11\ = CARRY((!\inst|Add1~9\) # (!\inst|indice_FIFO\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(5),
	datad => VCC,
	cin => \inst|Add1~9\,
	combout => \inst|Add1~10_combout\,
	cout => \inst|Add1~11\);

-- Location: LCCOMB_X105_Y61_N12
\inst|Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~12_combout\ = (\inst|indice_FIFO\(6) & (\inst|Add1~11\ $ (GND))) # (!\inst|indice_FIFO\(6) & (!\inst|Add1~11\ & VCC))
-- \inst|Add1~13\ = CARRY((\inst|indice_FIFO\(6) & !\inst|Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(6),
	datad => VCC,
	cin => \inst|Add1~11\,
	combout => \inst|Add1~12_combout\,
	cout => \inst|Add1~13\);

-- Location: LCCOMB_X105_Y61_N14
\inst|Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~14_combout\ = (\inst|indice_FIFO\(7) & (!\inst|Add1~13\)) # (!\inst|indice_FIFO\(7) & ((\inst|Add1~13\) # (GND)))
-- \inst|Add1~15\ = CARRY((!\inst|Add1~13\) # (!\inst|indice_FIFO\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(7),
	datad => VCC,
	cin => \inst|Add1~13\,
	combout => \inst|Add1~14_combout\,
	cout => \inst|Add1~15\);

-- Location: LCCOMB_X105_Y61_N16
\inst|Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~16_combout\ = (\inst|indice_FIFO\(8) & (!\inst|Add1~15\ & VCC)) # (!\inst|indice_FIFO\(8) & (\inst|Add1~15\ $ (GND)))
-- \inst|Add1~17\ = CARRY((!\inst|indice_FIFO\(8) & !\inst|Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(8),
	datad => VCC,
	cin => \inst|Add1~15\,
	combout => \inst|Add1~16_combout\,
	cout => \inst|Add1~17\);

-- Location: LCCOMB_X105_Y61_N18
\inst|Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~18_combout\ = (\inst|indice_FIFO\(9) & (!\inst|Add1~17\)) # (!\inst|indice_FIFO\(9) & ((\inst|Add1~17\) # (GND)))
-- \inst|Add1~19\ = CARRY((!\inst|Add1~17\) # (!\inst|indice_FIFO\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(9),
	datad => VCC,
	cin => \inst|Add1~17\,
	combout => \inst|Add1~18_combout\,
	cout => \inst|Add1~19\);

-- Location: LCCOMB_X105_Y61_N20
\inst|Add1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~20_combout\ = (\inst|indice_FIFO\(10) & (!\inst|Add1~19\ & VCC)) # (!\inst|indice_FIFO\(10) & (\inst|Add1~19\ $ (GND)))
-- \inst|Add1~21\ = CARRY((!\inst|indice_FIFO\(10) & !\inst|Add1~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(10),
	datad => VCC,
	cin => \inst|Add1~19\,
	combout => \inst|Add1~20_combout\,
	cout => \inst|Add1~21\);

-- Location: LCCOMB_X105_Y61_N22
\inst|Add1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~22_combout\ = \inst|Add1~21\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst|Add1~21\,
	combout => \inst|Add1~22_combout\);

-- Location: LCCOMB_X105_Y61_N30
\inst|LessThan3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan3~1_combout\ = (\inst|Add1~14_combout\) # ((\inst|Add1~0_combout\ & \inst|Add1~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Add1~0_combout\,
	datac => \inst|Add1~14_combout\,
	datad => \inst|Add1~2_combout\,
	combout => \inst|LessThan3~1_combout\);

-- Location: LCCOMB_X105_Y61_N28
\inst|LessThan3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan3~0_combout\ = (!\inst|Add1~6_combout\ & (!\inst|Add1~4_combout\ & (!\inst|Add1~8_combout\ & !\inst|Add1~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add1~6_combout\,
	datab => \inst|Add1~4_combout\,
	datac => \inst|Add1~8_combout\,
	datad => \inst|Add1~10_combout\,
	combout => \inst|LessThan3~0_combout\);

-- Location: LCCOMB_X105_Y61_N24
\inst|LessThan3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan3~2_combout\ = (\inst|Add1~16_combout\ & ((\inst|Add1~12_combout\) # ((\inst|LessThan3~1_combout\) # (!\inst|LessThan3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add1~12_combout\,
	datab => \inst|Add1~16_combout\,
	datac => \inst|LessThan3~1_combout\,
	datad => \inst|LessThan3~0_combout\,
	combout => \inst|LessThan3~2_combout\);

-- Location: LCCOMB_X105_Y61_N26
\inst|LessThan3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan3~3_combout\ = (!\inst|Add1~22_combout\ & (((!\inst|Add1~18_combout\ & !\inst|LessThan3~2_combout\)) # (!\inst|Add1~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add1~18_combout\,
	datab => \inst|Add1~20_combout\,
	datac => \inst|Add1~22_combout\,
	datad => \inst|LessThan3~2_combout\,
	combout => \inst|LessThan3~3_combout\);

-- Location: LCCOMB_X106_Y61_N12
\inst|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~1_cout\ = CARRY((\inst|Add1~2_combout\ & \inst|Add1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add1~2_combout\,
	datab => \inst|Add1~0_combout\,
	datad => VCC,
	cout => \inst|Add0~1_cout\);

-- Location: LCCOMB_X106_Y61_N14
\inst|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~2_combout\ = (\inst|Add1~4_combout\ & (\inst|Add0~1_cout\ & VCC)) # (!\inst|Add1~4_combout\ & (!\inst|Add0~1_cout\))
-- \inst|Add0~3\ = CARRY((!\inst|Add1~4_combout\ & !\inst|Add0~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|Add1~4_combout\,
	datad => VCC,
	cin => \inst|Add0~1_cout\,
	combout => \inst|Add0~2_combout\,
	cout => \inst|Add0~3\);

-- Location: LCCOMB_X106_Y61_N16
\inst|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~4_combout\ = (\inst|Add1~6_combout\ & ((GND) # (!\inst|Add0~3\))) # (!\inst|Add1~6_combout\ & (\inst|Add0~3\ $ (GND)))
-- \inst|Add0~5\ = CARRY((\inst|Add1~6_combout\) # (!\inst|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|Add1~6_combout\,
	datad => VCC,
	cin => \inst|Add0~3\,
	combout => \inst|Add0~4_combout\,
	cout => \inst|Add0~5\);

-- Location: LCCOMB_X106_Y61_N18
\inst|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~6_combout\ = (\inst|Add1~8_combout\ & (\inst|Add0~5\ & VCC)) # (!\inst|Add1~8_combout\ & (!\inst|Add0~5\))
-- \inst|Add0~7\ = CARRY((!\inst|Add1~8_combout\ & !\inst|Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add1~8_combout\,
	datad => VCC,
	cin => \inst|Add0~5\,
	combout => \inst|Add0~6_combout\,
	cout => \inst|Add0~7\);

-- Location: LCCOMB_X106_Y61_N20
\inst|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~8_combout\ = (\inst|Add1~10_combout\ & ((GND) # (!\inst|Add0~7\))) # (!\inst|Add1~10_combout\ & (\inst|Add0~7\ $ (GND)))
-- \inst|Add0~9\ = CARRY((\inst|Add1~10_combout\) # (!\inst|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add1~10_combout\,
	datad => VCC,
	cin => \inst|Add0~7\,
	combout => \inst|Add0~8_combout\,
	cout => \inst|Add0~9\);

-- Location: LCCOMB_X106_Y61_N22
\inst|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~10_combout\ = (\inst|Add1~12_combout\ & (\inst|Add0~9\ & VCC)) # (!\inst|Add1~12_combout\ & (!\inst|Add0~9\))
-- \inst|Add0~11\ = CARRY((!\inst|Add1~12_combout\ & !\inst|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add1~12_combout\,
	datad => VCC,
	cin => \inst|Add0~9\,
	combout => \inst|Add0~10_combout\,
	cout => \inst|Add0~11\);

-- Location: LCCOMB_X106_Y61_N24
\inst|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~12_combout\ = (\inst|Add1~14_combout\ & ((GND) # (!\inst|Add0~11\))) # (!\inst|Add1~14_combout\ & (\inst|Add0~11\ $ (GND)))
-- \inst|Add0~13\ = CARRY((\inst|Add1~14_combout\) # (!\inst|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add1~14_combout\,
	datad => VCC,
	cin => \inst|Add0~11\,
	combout => \inst|Add0~12_combout\,
	cout => \inst|Add0~13\);

-- Location: LCCOMB_X106_Y61_N26
\inst|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~14_combout\ = (\inst|Add1~16_combout\ & (!\inst|Add0~13\)) # (!\inst|Add1~16_combout\ & ((\inst|Add0~13\) # (GND)))
-- \inst|Add0~15\ = CARRY((!\inst|Add0~13\) # (!\inst|Add1~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add1~16_combout\,
	datad => VCC,
	cin => \inst|Add0~13\,
	combout => \inst|Add0~14_combout\,
	cout => \inst|Add0~15\);

-- Location: LCCOMB_X106_Y61_N28
\inst|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~16_combout\ = (\inst|Add1~18_combout\ & ((GND) # (!\inst|Add0~15\))) # (!\inst|Add1~18_combout\ & (\inst|Add0~15\ $ (GND)))
-- \inst|Add0~17\ = CARRY((\inst|Add1~18_combout\) # (!\inst|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|Add1~18_combout\,
	datad => VCC,
	cin => \inst|Add0~15\,
	combout => \inst|Add0~16_combout\,
	cout => \inst|Add0~17\);

-- Location: LCCOMB_X106_Y61_N30
\inst|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~18_combout\ = \inst|Add0~17\ $ (\inst|Add1~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst|Add1~20_combout\,
	cin => \inst|Add0~17\,
	combout => \inst|Add0~18_combout\);

-- Location: LCCOMB_X106_Y61_N8
\inst|Selector47~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector47~4_combout\ = (\inst|state.dir_anterior~q\ & ((\inst|LessThan3~3_combout\ & ((\inst|Add1~20_combout\))) # (!\inst|LessThan3~3_combout\ & (\inst|Add0~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan3~3_combout\,
	datab => \inst|state.dir_anterior~q\,
	datac => \inst|Add0~18_combout\,
	datad => \inst|Add1~20_combout\,
	combout => \inst|Selector47~4_combout\);

-- Location: LCCOMB_X108_Y62_N6
\inst|Add9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add9~0_combout\ = \inst|indice_FIFO\(1) $ (GND)
-- \inst|Add9~1\ = CARRY(!\inst|indice_FIFO\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(1),
	datad => VCC,
	combout => \inst|Add9~0_combout\,
	cout => \inst|Add9~1\);

-- Location: LCCOMB_X108_Y62_N8
\inst|Add9~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add9~2_combout\ = (\inst|indice_FIFO\(2) & (!\inst|Add9~1\)) # (!\inst|indice_FIFO\(2) & ((\inst|Add9~1\) # (GND)))
-- \inst|Add9~3\ = CARRY((!\inst|Add9~1\) # (!\inst|indice_FIFO\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(2),
	datad => VCC,
	cin => \inst|Add9~1\,
	combout => \inst|Add9~2_combout\,
	cout => \inst|Add9~3\);

-- Location: LCCOMB_X108_Y62_N10
\inst|Add9~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add9~4_combout\ = (\inst|indice_FIFO\(3) & (\inst|Add9~3\ $ (GND))) # (!\inst|indice_FIFO\(3) & (!\inst|Add9~3\ & VCC))
-- \inst|Add9~5\ = CARRY((\inst|indice_FIFO\(3) & !\inst|Add9~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(3),
	datad => VCC,
	cin => \inst|Add9~3\,
	combout => \inst|Add9~4_combout\,
	cout => \inst|Add9~5\);

-- Location: LCCOMB_X108_Y62_N12
\inst|Add9~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add9~6_combout\ = (\inst|indice_FIFO\(4) & (!\inst|Add9~5\)) # (!\inst|indice_FIFO\(4) & ((\inst|Add9~5\) # (GND)))
-- \inst|Add9~7\ = CARRY((!\inst|Add9~5\) # (!\inst|indice_FIFO\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(4),
	datad => VCC,
	cin => \inst|Add9~5\,
	combout => \inst|Add9~6_combout\,
	cout => \inst|Add9~7\);

-- Location: LCCOMB_X108_Y62_N14
\inst|Add9~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add9~8_combout\ = (\inst|indice_FIFO\(5) & (\inst|Add9~7\ $ (GND))) # (!\inst|indice_FIFO\(5) & (!\inst|Add9~7\ & VCC))
-- \inst|Add9~9\ = CARRY((\inst|indice_FIFO\(5) & !\inst|Add9~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(5),
	datad => VCC,
	cin => \inst|Add9~7\,
	combout => \inst|Add9~8_combout\,
	cout => \inst|Add9~9\);

-- Location: LCCOMB_X108_Y62_N16
\inst|Add9~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add9~10_combout\ = (\inst|indice_FIFO\(6) & (!\inst|Add9~9\)) # (!\inst|indice_FIFO\(6) & ((\inst|Add9~9\) # (GND)))
-- \inst|Add9~11\ = CARRY((!\inst|Add9~9\) # (!\inst|indice_FIFO\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(6),
	datad => VCC,
	cin => \inst|Add9~9\,
	combout => \inst|Add9~10_combout\,
	cout => \inst|Add9~11\);

-- Location: LCCOMB_X108_Y62_N18
\inst|Add9~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add9~12_combout\ = (\inst|indice_FIFO\(7) & (\inst|Add9~11\ $ (GND))) # (!\inst|indice_FIFO\(7) & (!\inst|Add9~11\ & VCC))
-- \inst|Add9~13\ = CARRY((\inst|indice_FIFO\(7) & !\inst|Add9~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(7),
	datad => VCC,
	cin => \inst|Add9~11\,
	combout => \inst|Add9~12_combout\,
	cout => \inst|Add9~13\);

-- Location: LCCOMB_X108_Y62_N20
\inst|Add9~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add9~14_combout\ = (\inst|indice_FIFO\(8) & (!\inst|Add9~13\)) # (!\inst|indice_FIFO\(8) & ((\inst|Add9~13\) # (GND)))
-- \inst|Add9~15\ = CARRY((!\inst|Add9~13\) # (!\inst|indice_FIFO\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(8),
	datad => VCC,
	cin => \inst|Add9~13\,
	combout => \inst|Add9~14_combout\,
	cout => \inst|Add9~15\);

-- Location: LCCOMB_X108_Y62_N22
\inst|Add9~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add9~16_combout\ = (\inst|Add9~15\ & ((\inst|indice_FIFO\(9) $ (!\inst|indice_FIFO\(8))))) # (!\inst|Add9~15\ & (\inst|indice_FIFO\(9) $ (\inst|indice_FIFO\(8) $ (GND))))
-- \inst|Add9~17\ = CARRY((!\inst|Add9~15\ & (\inst|indice_FIFO\(9) $ (!\inst|indice_FIFO\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(9),
	datab => \inst|indice_FIFO\(8),
	datad => VCC,
	cin => \inst|Add9~15\,
	combout => \inst|Add9~16_combout\,
	cout => \inst|Add9~17\);

-- Location: LCCOMB_X108_Y62_N24
\inst|Add9~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add9~18_combout\ = (\inst|Add9~17\ & (\inst|Add3~0_combout\ $ ((!\inst|indice_FIFO\(10))))) # (!\inst|Add9~17\ & ((\inst|Add3~0_combout\ $ (\inst|indice_FIFO\(10))) # (GND)))
-- \inst|Add9~19\ = CARRY((\inst|Add3~0_combout\ $ (!\inst|indice_FIFO\(10))) # (!\inst|Add9~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add3~0_combout\,
	datab => \inst|indice_FIFO\(10),
	datad => VCC,
	cin => \inst|Add9~17\,
	combout => \inst|Add9~18_combout\,
	cout => \inst|Add9~19\);

-- Location: LCCOMB_X108_Y62_N26
\inst|Add9~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add9~20_combout\ = \inst|Add9~19\ $ (((\inst|indice_FIFO\(10) & !\inst|Add3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|indice_FIFO\(10),
	datad => \inst|Add3~0_combout\,
	cin => \inst|Add9~19\,
	combout => \inst|Add9~20_combout\);

-- Location: LCCOMB_X108_Y62_N30
\inst|LessThan6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan6~1_combout\ = (\inst|Add9~12_combout\) # ((\inst|Add9~0_combout\ & \inst|indice_FIFO\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add9~0_combout\,
	datac => \inst|indice_FIFO\(0),
	datad => \inst|Add9~12_combout\,
	combout => \inst|LessThan6~1_combout\);

-- Location: LCCOMB_X108_Y62_N4
\inst|LessThan6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan6~0_combout\ = (!\inst|Add9~6_combout\ & (!\inst|Add9~2_combout\ & (!\inst|Add9~8_combout\ & !\inst|Add9~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add9~6_combout\,
	datab => \inst|Add9~2_combout\,
	datac => \inst|Add9~8_combout\,
	datad => \inst|Add9~4_combout\,
	combout => \inst|LessThan6~0_combout\);

-- Location: LCCOMB_X108_Y62_N0
\inst|LessThan6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan6~2_combout\ = (\inst|Add9~14_combout\ & ((\inst|LessThan6~1_combout\) # ((\inst|Add9~10_combout\) # (!\inst|LessThan6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan6~1_combout\,
	datab => \inst|Add9~14_combout\,
	datac => \inst|LessThan6~0_combout\,
	datad => \inst|Add9~10_combout\,
	combout => \inst|LessThan6~2_combout\);

-- Location: LCCOMB_X108_Y62_N28
\inst|LessThan6~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan6~3_combout\ = (!\inst|Add9~20_combout\ & (((!\inst|Add9~16_combout\ & !\inst|LessThan6~2_combout\)) # (!\inst|Add9~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add9~20_combout\,
	datab => \inst|Add9~18_combout\,
	datac => \inst|Add9~16_combout\,
	datad => \inst|LessThan6~2_combout\,
	combout => \inst|LessThan6~3_combout\);

-- Location: LCCOMB_X107_Y61_N24
\inst|Selector47~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector47~0_combout\ = (\inst|state.dir_ancho_3~q\ & ((\inst|LessThan6~3_combout\ & ((\inst|Add9~18_combout\))) # (!\inst|LessThan6~3_combout\ & (\inst|Add8~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dir_ancho_3~q\,
	datab => \inst|Add8~20_combout\,
	datac => \inst|Add9~18_combout\,
	datad => \inst|LessThan6~3_combout\,
	combout => \inst|Selector47~0_combout\);

-- Location: LCCOMB_X106_Y61_N4
\inst|Selector47~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector47~5_combout\ = (\inst|Selector47~3_combout\) # ((\inst|Selector47~1_combout\) # ((\inst|Selector47~4_combout\) # (\inst|Selector47~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector47~3_combout\,
	datab => \inst|Selector47~1_combout\,
	datac => \inst|Selector47~4_combout\,
	datad => \inst|Selector47~0_combout\,
	combout => \inst|Selector47~5_combout\);

-- Location: LCCOMB_X107_Y62_N6
\inst|WideOr7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|WideOr7~0_combout\ = (\inst|state.escritura~q\) # ((\inst|state.dir_ancho_3~q\) # ((\inst|state.dir_ancho_1~q\) # (!\inst|WideOr11~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.escritura~q\,
	datab => \inst|state.dir_ancho_3~q\,
	datac => \inst|state.dir_ancho_1~q\,
	datad => \inst|WideOr11~0_combout\,
	combout => \inst|WideOr7~0_combout\);

-- Location: LCCOMB_X107_Y62_N26
\inst|FIFO_dir_o[10]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|FIFO_dir_o[10]~0_combout\ = (\reset~input_o\ & \inst|WideOr7~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datad => \inst|WideOr7~0_combout\,
	combout => \inst|FIFO_dir_o[10]~0_combout\);

-- Location: FF_X106_Y61_N5
\inst|FIFO_dir_o[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector47~5_combout\,
	ena => \inst|FIFO_dir_o[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_dir_o\(10));

-- Location: LCCOMB_X106_Y62_N12
\inst|FIFO_dir_o[10]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|FIFO_dir_o[10]~1_combout\ = ((\inst|LessThan4~2_combout\ & ((\inst|indice_FIFO\(1)) # (!\inst|indice_FIFO\(0))))) # (!\inst|state.dir_ancho_1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan4~2_combout\,
	datab => \inst|indice_FIFO\(1),
	datac => \inst|state.dir_ancho_1~q\,
	datad => \inst|indice_FIFO\(0),
	combout => \inst|FIFO_dir_o[10]~1_combout\);

-- Location: LCCOMB_X106_Y62_N14
\inst|Selector48~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector48~2_combout\ = (\inst|indice_FIFO\(9) & ((\inst|state.escritura~q\) # ((\inst|Add2~18_combout\ & !\inst|FIFO_dir_o[10]~1_combout\)))) # (!\inst|indice_FIFO\(9) & (\inst|Add2~18_combout\ & ((!\inst|FIFO_dir_o[10]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(9),
	datab => \inst|Add2~18_combout\,
	datac => \inst|state.escritura~q\,
	datad => \inst|FIFO_dir_o[10]~1_combout\,
	combout => \inst|Selector48~2_combout\);

-- Location: LCCOMB_X107_Y61_N8
\inst|Selector48~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector48~1_combout\ = (\inst|state.dir_ancho_2~q\ & ((\inst|LessThan5~3_combout\ & ((\inst|Add6~18_combout\))) # (!\inst|LessThan5~3_combout\ & (\inst|Add4~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dir_ancho_2~q\,
	datab => \inst|Add4~16_combout\,
	datac => \inst|LessThan5~3_combout\,
	datad => \inst|Add6~18_combout\,
	combout => \inst|Selector48~1_combout\);

-- Location: LCCOMB_X107_Y61_N14
\inst|Selector48~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector48~0_combout\ = (\inst|state.dir_ancho_3~q\ & ((\inst|LessThan6~3_combout\ & (\inst|Add9~16_combout\)) # (!\inst|LessThan6~3_combout\ & ((\inst|Add8~18_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add9~16_combout\,
	datab => \inst|Add8~18_combout\,
	datac => \inst|state.dir_ancho_3~q\,
	datad => \inst|LessThan6~3_combout\,
	combout => \inst|Selector48~0_combout\);

-- Location: LCCOMB_X106_Y61_N2
\inst|Selector48~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector48~3_combout\ = (\inst|state.dir_anterior~q\ & ((\inst|LessThan3~3_combout\ & (\inst|Add1~18_combout\)) # (!\inst|LessThan3~3_combout\ & ((\inst|Add0~16_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dir_anterior~q\,
	datab => \inst|Add1~18_combout\,
	datac => \inst|LessThan3~3_combout\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector48~3_combout\);

-- Location: LCCOMB_X107_Y61_N4
\inst|Selector48~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector48~4_combout\ = (\inst|Selector48~2_combout\) # ((\inst|Selector48~1_combout\) # ((\inst|Selector48~0_combout\) # (\inst|Selector48~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector48~2_combout\,
	datab => \inst|Selector48~1_combout\,
	datac => \inst|Selector48~0_combout\,
	datad => \inst|Selector48~3_combout\,
	combout => \inst|Selector48~4_combout\);

-- Location: FF_X107_Y61_N5
\inst|FIFO_dir_o[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector48~4_combout\,
	ena => \inst|FIFO_dir_o[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_dir_o\(9));

-- Location: LCCOMB_X105_Y62_N8
\inst|Selector49~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector49~2_combout\ = (!\inst|indice_FIFO\(8) & \inst|state.escritura~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(8),
	datac => \inst|state.escritura~q\,
	combout => \inst|Selector49~2_combout\);

-- Location: LCCOMB_X105_Y62_N2
\inst|Selector49~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector49~3_combout\ = (\inst|Selector49~2_combout\) # ((\inst|state.dir_ancho_1~q\ & ((\inst|Add2~16_combout\) # (\inst|LessThan4~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dir_ancho_1~q\,
	datab => \inst|Selector49~2_combout\,
	datac => \inst|Add2~16_combout\,
	datad => \inst|LessThan4~3_combout\,
	combout => \inst|Selector49~3_combout\);

-- Location: LCCOMB_X107_Y61_N10
\inst|Selector49~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector49~0_combout\ = (\inst|state.dir_ancho_3~q\ & ((\inst|LessThan6~3_combout\ & (\inst|Add9~14_combout\)) # (!\inst|LessThan6~3_combout\ & ((\inst|Add8~16_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add9~14_combout\,
	datab => \inst|state.dir_ancho_3~q\,
	datac => \inst|Add8~16_combout\,
	datad => \inst|LessThan6~3_combout\,
	combout => \inst|Selector49~0_combout\);

-- Location: LCCOMB_X106_Y60_N4
\inst|Selector49~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector49~1_combout\ = (\inst|state.dir_ancho_2~q\ & ((\inst|LessThan5~3_combout\ & ((\inst|Add6~16_combout\))) # (!\inst|LessThan5~3_combout\ & (\inst|Add4~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add4~14_combout\,
	datab => \inst|state.dir_ancho_2~q\,
	datac => \inst|Add6~16_combout\,
	datad => \inst|LessThan5~3_combout\,
	combout => \inst|Selector49~1_combout\);

-- Location: LCCOMB_X106_Y61_N0
\inst|Selector49~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector49~4_combout\ = (\inst|state.dir_anterior~q\ & ((\inst|LessThan3~3_combout\ & (\inst|Add1~16_combout\)) # (!\inst|LessThan3~3_combout\ & ((\inst|Add0~14_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add1~16_combout\,
	datab => \inst|state.dir_anterior~q\,
	datac => \inst|LessThan3~3_combout\,
	datad => \inst|Add0~14_combout\,
	combout => \inst|Selector49~4_combout\);

-- Location: LCCOMB_X106_Y61_N10
\inst|Selector49~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector49~5_combout\ = (\inst|Selector49~3_combout\) # ((\inst|Selector49~0_combout\) # ((\inst|Selector49~1_combout\) # (\inst|Selector49~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector49~3_combout\,
	datab => \inst|Selector49~0_combout\,
	datac => \inst|Selector49~1_combout\,
	datad => \inst|Selector49~4_combout\,
	combout => \inst|Selector49~5_combout\);

-- Location: FF_X106_Y61_N11
\inst|FIFO_dir_o[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector49~5_combout\,
	ena => \inst|FIFO_dir_o[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_dir_o\(8));

-- Location: LCCOMB_X109_Y61_N10
\inst|Selector50~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector50~0_combout\ = (\inst|state.dir_ancho_3~q\ & ((\inst|LessThan6~3_combout\ & (\inst|Add9~12_combout\)) # (!\inst|LessThan6~3_combout\ & ((\inst|Add8~14_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add9~12_combout\,
	datab => \inst|state.dir_ancho_3~q\,
	datac => \inst|LessThan6~3_combout\,
	datad => \inst|Add8~14_combout\,
	combout => \inst|Selector50~0_combout\);

-- Location: LCCOMB_X109_Y61_N24
\inst|Selector50~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector50~1_combout\ = (\inst|state.dir_ancho_2~q\ & ((\inst|LessThan5~3_combout\ & (\inst|Add6~14_combout\)) # (!\inst|LessThan5~3_combout\ & ((\inst|Add4~12_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add6~14_combout\,
	datab => \inst|state.dir_ancho_2~q\,
	datac => \inst|Add4~12_combout\,
	datad => \inst|LessThan5~3_combout\,
	combout => \inst|Selector50~1_combout\);

-- Location: LCCOMB_X109_Y61_N14
\inst|Selector50~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector50~2_combout\ = (\inst|indice_FIFO\(7) & ((\inst|state.escritura~q\) # ((!\inst|FIFO_dir_o[10]~1_combout\ & \inst|Add2~14_combout\)))) # (!\inst|indice_FIFO\(7) & (!\inst|FIFO_dir_o[10]~1_combout\ & ((\inst|Add2~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(7),
	datab => \inst|FIFO_dir_o[10]~1_combout\,
	datac => \inst|state.escritura~q\,
	datad => \inst|Add2~14_combout\,
	combout => \inst|Selector50~2_combout\);

-- Location: LCCOMB_X109_Y61_N16
\inst|Selector50~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector50~3_combout\ = (\inst|state.dir_anterior~q\ & ((\inst|LessThan3~3_combout\ & (\inst|Add1~14_combout\)) # (!\inst|LessThan3~3_combout\ & ((\inst|Add0~12_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add1~14_combout\,
	datab => \inst|state.dir_anterior~q\,
	datac => \inst|Add0~12_combout\,
	datad => \inst|LessThan3~3_combout\,
	combout => \inst|Selector50~3_combout\);

-- Location: LCCOMB_X109_Y61_N28
\inst|Selector50~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector50~4_combout\ = (\inst|Selector50~0_combout\) # ((\inst|Selector50~1_combout\) # ((\inst|Selector50~2_combout\) # (\inst|Selector50~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector50~0_combout\,
	datab => \inst|Selector50~1_combout\,
	datac => \inst|Selector50~2_combout\,
	datad => \inst|Selector50~3_combout\,
	combout => \inst|Selector50~4_combout\);

-- Location: FF_X109_Y61_N29
\inst|FIFO_dir_o[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector50~4_combout\,
	ena => \inst|FIFO_dir_o[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_dir_o\(7));

-- Location: LCCOMB_X109_Y61_N30
\inst|Selector51~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector51~0_combout\ = (\inst|state.dir_ancho_3~q\ & ((\inst|LessThan6~3_combout\ & ((\inst|Add9~10_combout\))) # (!\inst|LessThan6~3_combout\ & (\inst|Add8~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add8~12_combout\,
	datab => \inst|Add9~10_combout\,
	datac => \inst|LessThan6~3_combout\,
	datad => \inst|state.dir_ancho_3~q\,
	combout => \inst|Selector51~0_combout\);

-- Location: LCCOMB_X109_Y61_N2
\inst|Selector51~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector51~2_combout\ = (\inst|state.escritura~q\ & ((\inst|indice_FIFO\(6)) # ((\inst|Add2~12_combout\ & !\inst|FIFO_dir_o[10]~1_combout\)))) # (!\inst|state.escritura~q\ & (((\inst|Add2~12_combout\ & !\inst|FIFO_dir_o[10]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.escritura~q\,
	datab => \inst|indice_FIFO\(6),
	datac => \inst|Add2~12_combout\,
	datad => \inst|FIFO_dir_o[10]~1_combout\,
	combout => \inst|Selector51~2_combout\);

-- Location: LCCOMB_X109_Y61_N4
\inst|Selector51~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector51~1_combout\ = (\inst|state.dir_ancho_2~q\ & ((\inst|LessThan5~3_combout\ & ((\inst|Add6~12_combout\))) # (!\inst|LessThan5~3_combout\ & (\inst|Add4~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add4~10_combout\,
	datab => \inst|state.dir_ancho_2~q\,
	datac => \inst|Add6~12_combout\,
	datad => \inst|LessThan5~3_combout\,
	combout => \inst|Selector51~1_combout\);

-- Location: LCCOMB_X109_Y61_N12
\inst|Selector51~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector51~3_combout\ = (\inst|state.dir_anterior~q\ & ((\inst|LessThan3~3_combout\ & (\inst|Add1~12_combout\)) # (!\inst|LessThan3~3_combout\ & ((\inst|Add0~10_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add1~12_combout\,
	datab => \inst|state.dir_anterior~q\,
	datac => \inst|Add0~10_combout\,
	datad => \inst|LessThan3~3_combout\,
	combout => \inst|Selector51~3_combout\);

-- Location: LCCOMB_X109_Y61_N26
\inst|Selector51~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector51~4_combout\ = (\inst|Selector51~0_combout\) # ((\inst|Selector51~2_combout\) # ((\inst|Selector51~1_combout\) # (\inst|Selector51~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector51~0_combout\,
	datab => \inst|Selector51~2_combout\,
	datac => \inst|Selector51~1_combout\,
	datad => \inst|Selector51~3_combout\,
	combout => \inst|Selector51~4_combout\);

-- Location: FF_X109_Y61_N27
\inst|FIFO_dir_o[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector51~4_combout\,
	ena => \inst|FIFO_dir_o[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_dir_o\(6));

-- Location: LCCOMB_X109_Y61_N6
\inst|Selector52~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector52~2_combout\ = (\inst|state.escritura~q\ & ((\inst|indice_FIFO\(5)) # ((!\inst|FIFO_dir_o[10]~1_combout\ & \inst|Add2~10_combout\)))) # (!\inst|state.escritura~q\ & (!\inst|FIFO_dir_o[10]~1_combout\ & ((\inst|Add2~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.escritura~q\,
	datab => \inst|FIFO_dir_o[10]~1_combout\,
	datac => \inst|indice_FIFO\(5),
	datad => \inst|Add2~10_combout\,
	combout => \inst|Selector52~2_combout\);

-- Location: LCCOMB_X109_Y61_N0
\inst|Selector52~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector52~1_combout\ = (\inst|state.dir_ancho_2~q\ & ((\inst|LessThan5~3_combout\ & ((\inst|Add6~10_combout\))) # (!\inst|LessThan5~3_combout\ & (\inst|Add4~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add4~8_combout\,
	datab => \inst|state.dir_ancho_2~q\,
	datac => \inst|Add6~10_combout\,
	datad => \inst|LessThan5~3_combout\,
	combout => \inst|Selector52~1_combout\);

-- Location: LCCOMB_X109_Y61_N22
\inst|Selector52~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector52~0_combout\ = (\inst|state.dir_ancho_3~q\ & ((\inst|LessThan6~3_combout\ & (\inst|Add9~8_combout\)) # (!\inst|LessThan6~3_combout\ & ((\inst|Add8~10_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add9~8_combout\,
	datab => \inst|state.dir_ancho_3~q\,
	datac => \inst|LessThan6~3_combout\,
	datad => \inst|Add8~10_combout\,
	combout => \inst|Selector52~0_combout\);

-- Location: LCCOMB_X109_Y61_N20
\inst|Selector52~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector52~3_combout\ = (\inst|state.dir_anterior~q\ & ((\inst|LessThan3~3_combout\ & (\inst|Add1~10_combout\)) # (!\inst|LessThan3~3_combout\ & ((\inst|Add0~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add1~10_combout\,
	datab => \inst|state.dir_anterior~q\,
	datac => \inst|Add0~8_combout\,
	datad => \inst|LessThan3~3_combout\,
	combout => \inst|Selector52~3_combout\);

-- Location: LCCOMB_X109_Y61_N8
\inst|Selector52~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector52~4_combout\ = (\inst|Selector52~2_combout\) # ((\inst|Selector52~1_combout\) # ((\inst|Selector52~0_combout\) # (\inst|Selector52~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector52~2_combout\,
	datab => \inst|Selector52~1_combout\,
	datac => \inst|Selector52~0_combout\,
	datad => \inst|Selector52~3_combout\,
	combout => \inst|Selector52~4_combout\);

-- Location: FF_X109_Y61_N9
\inst|FIFO_dir_o[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector52~4_combout\,
	ena => \inst|FIFO_dir_o[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_dir_o\(5));

-- Location: LCCOMB_X106_Y62_N28
\inst|Selector53~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector53~2_combout\ = (\inst|FIFO_dir_o[10]~1_combout\ & (\inst|indice_FIFO\(4) & (\inst|state.escritura~q\))) # (!\inst|FIFO_dir_o[10]~1_combout\ & ((\inst|Add2~8_combout\) # ((\inst|indice_FIFO\(4) & \inst|state.escritura~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|FIFO_dir_o[10]~1_combout\,
	datab => \inst|indice_FIFO\(4),
	datac => \inst|state.escritura~q\,
	datad => \inst|Add2~8_combout\,
	combout => \inst|Selector53~2_combout\);

-- Location: LCCOMB_X107_Y61_N20
\inst|Selector53~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector53~0_combout\ = (\inst|state.dir_ancho_3~q\ & ((\inst|LessThan6~3_combout\ & (\inst|Add9~6_combout\)) # (!\inst|LessThan6~3_combout\ & ((\inst|Add8~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add9~6_combout\,
	datab => \inst|Add8~8_combout\,
	datac => \inst|state.dir_ancho_3~q\,
	datad => \inst|LessThan6~3_combout\,
	combout => \inst|Selector53~0_combout\);

-- Location: LCCOMB_X107_Y61_N22
\inst|Selector53~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector53~1_combout\ = (\inst|state.dir_ancho_2~q\ & ((\inst|LessThan5~3_combout\ & (\inst|Add6~8_combout\)) # (!\inst|LessThan5~3_combout\ & ((\inst|Add4~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add6~8_combout\,
	datab => \inst|LessThan5~3_combout\,
	datac => \inst|state.dir_ancho_2~q\,
	datad => \inst|Add4~6_combout\,
	combout => \inst|Selector53~1_combout\);

-- Location: LCCOMB_X107_Y61_N16
\inst|Selector53~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector53~3_combout\ = (\inst|state.dir_anterior~q\ & ((\inst|LessThan3~3_combout\ & (\inst|Add1~8_combout\)) # (!\inst|LessThan3~3_combout\ & ((\inst|Add0~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dir_anterior~q\,
	datab => \inst|LessThan3~3_combout\,
	datac => \inst|Add1~8_combout\,
	datad => \inst|Add0~6_combout\,
	combout => \inst|Selector53~3_combout\);

-- Location: LCCOMB_X107_Y61_N26
\inst|Selector53~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector53~4_combout\ = (\inst|Selector53~2_combout\) # ((\inst|Selector53~0_combout\) # ((\inst|Selector53~1_combout\) # (\inst|Selector53~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector53~2_combout\,
	datab => \inst|Selector53~0_combout\,
	datac => \inst|Selector53~1_combout\,
	datad => \inst|Selector53~3_combout\,
	combout => \inst|Selector53~4_combout\);

-- Location: FF_X107_Y61_N27
\inst|FIFO_dir_o[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector53~4_combout\,
	ena => \inst|FIFO_dir_o[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_dir_o\(4));

-- Location: LCCOMB_X107_Y61_N6
\inst|Selector54~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector54~0_combout\ = (\inst|state.dir_ancho_3~q\ & ((\inst|LessThan6~3_combout\ & (\inst|Add9~4_combout\)) # (!\inst|LessThan6~3_combout\ & ((\inst|Add8~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add9~4_combout\,
	datab => \inst|Add8~6_combout\,
	datac => \inst|state.dir_ancho_3~q\,
	datad => \inst|LessThan6~3_combout\,
	combout => \inst|Selector54~0_combout\);

-- Location: LCCOMB_X107_Y61_N28
\inst|Selector54~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector54~1_combout\ = (\inst|state.dir_ancho_2~q\ & ((\inst|LessThan5~3_combout\ & (\inst|Add6~6_combout\)) # (!\inst|LessThan5~3_combout\ & ((\inst|Add4~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dir_ancho_2~q\,
	datab => \inst|Add6~6_combout\,
	datac => \inst|LessThan5~3_combout\,
	datad => \inst|Add4~4_combout\,
	combout => \inst|Selector54~1_combout\);

-- Location: LCCOMB_X106_Y62_N26
\inst|Selector54~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector54~2_combout\ = (\inst|indice_FIFO\(3) & ((\inst|state.escritura~q\) # ((\inst|Add2~6_combout\ & !\inst|FIFO_dir_o[10]~1_combout\)))) # (!\inst|indice_FIFO\(3) & (((\inst|Add2~6_combout\ & !\inst|FIFO_dir_o[10]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(3),
	datab => \inst|state.escritura~q\,
	datac => \inst|Add2~6_combout\,
	datad => \inst|FIFO_dir_o[10]~1_combout\,
	combout => \inst|Selector54~2_combout\);

-- Location: LCCOMB_X107_Y61_N18
\inst|Selector54~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector54~3_combout\ = (\inst|state.dir_anterior~q\ & ((\inst|LessThan3~3_combout\ & (\inst|Add1~6_combout\)) # (!\inst|LessThan3~3_combout\ & ((\inst|Add0~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dir_anterior~q\,
	datab => \inst|Add1~6_combout\,
	datac => \inst|Add0~4_combout\,
	datad => \inst|LessThan3~3_combout\,
	combout => \inst|Selector54~3_combout\);

-- Location: LCCOMB_X107_Y61_N12
\inst|Selector54~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector54~4_combout\ = (\inst|Selector54~0_combout\) # ((\inst|Selector54~1_combout\) # ((\inst|Selector54~2_combout\) # (\inst|Selector54~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector54~0_combout\,
	datab => \inst|Selector54~1_combout\,
	datac => \inst|Selector54~2_combout\,
	datad => \inst|Selector54~3_combout\,
	combout => \inst|Selector54~4_combout\);

-- Location: FF_X107_Y61_N13
\inst|FIFO_dir_o[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector54~4_combout\,
	ena => \inst|FIFO_dir_o[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_dir_o\(3));

-- Location: LCCOMB_X106_Y62_N16
\inst|Selector55~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector55~2_combout\ = (\inst|Add2~4_combout\ & (((\inst|state.escritura~q\ & \inst|indice_FIFO\(2))) # (!\inst|FIFO_dir_o[10]~1_combout\))) # (!\inst|Add2~4_combout\ & (\inst|state.escritura~q\ & (\inst|indice_FIFO\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add2~4_combout\,
	datab => \inst|state.escritura~q\,
	datac => \inst|indice_FIFO\(2),
	datad => \inst|FIFO_dir_o[10]~1_combout\,
	combout => \inst|Selector55~2_combout\);

-- Location: LCCOMB_X107_Y62_N4
\inst|Selector55~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector55~1_combout\ = (\inst|state.dir_ancho_2~q\ & ((\inst|LessThan5~3_combout\ & ((\inst|Add6~4_combout\))) # (!\inst|LessThan5~3_combout\ & (\inst|Add4~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add4~2_combout\,
	datab => \inst|Add6~4_combout\,
	datac => \inst|state.dir_ancho_2~q\,
	datad => \inst|LessThan5~3_combout\,
	combout => \inst|Selector55~1_combout\);

-- Location: LCCOMB_X107_Y62_N22
\inst|Selector55~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector55~0_combout\ = (\inst|state.dir_ancho_3~q\ & ((\inst|LessThan6~3_combout\ & ((\inst|Add9~2_combout\))) # (!\inst|LessThan6~3_combout\ & (\inst|Add8~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add8~4_combout\,
	datab => \inst|state.dir_ancho_3~q\,
	datac => \inst|Add9~2_combout\,
	datad => \inst|LessThan6~3_combout\,
	combout => \inst|Selector55~0_combout\);

-- Location: LCCOMB_X106_Y61_N6
\inst|Selector55~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector55~3_combout\ = (\inst|state.dir_anterior~q\ & ((\inst|LessThan3~3_combout\ & ((\inst|Add1~4_combout\))) # (!\inst|LessThan3~3_combout\ & (\inst|Add0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dir_anterior~q\,
	datab => \inst|Add0~2_combout\,
	datac => \inst|LessThan3~3_combout\,
	datad => \inst|Add1~4_combout\,
	combout => \inst|Selector55~3_combout\);

-- Location: LCCOMB_X107_Y62_N20
\inst|Selector55~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector55~4_combout\ = (\inst|Selector55~2_combout\) # ((\inst|Selector55~1_combout\) # ((\inst|Selector55~0_combout\) # (\inst|Selector55~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector55~2_combout\,
	datab => \inst|Selector55~1_combout\,
	datac => \inst|Selector55~0_combout\,
	datad => \inst|Selector55~3_combout\,
	combout => \inst|Selector55~4_combout\);

-- Location: FF_X107_Y62_N21
\inst|FIFO_dir_o[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector55~4_combout\,
	ena => \inst|FIFO_dir_o[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_dir_o\(2));

-- Location: LCCOMB_X106_Y62_N10
\inst|Selector56~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector56~2_combout\ = (\inst|state.dir_ancho_3~q\ & ((\inst|LessThan6~3_combout\ & (\inst|Add9~0_combout\)) # (!\inst|LessThan6~3_combout\ & ((\inst|Add8~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dir_ancho_3~q\,
	datab => \inst|Add9~0_combout\,
	datac => \inst|LessThan6~3_combout\,
	datad => \inst|Add8~2_combout\,
	combout => \inst|Selector56~2_combout\);

-- Location: LCCOMB_X106_Y62_N4
\inst|Selector56~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector56~1_combout\ = (!\inst|indice_FIFO\(1) & ((\inst|state.escritura~q\) # ((\inst|state.dir_ancho_1~q\ & \inst|LessThan4~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dir_ancho_1~q\,
	datab => \inst|state.escritura~q\,
	datac => \inst|indice_FIFO\(1),
	datad => \inst|LessThan4~3_combout\,
	combout => \inst|Selector56~1_combout\);

-- Location: LCCOMB_X106_Y62_N22
\inst|Selector56~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector56~0_combout\ = (\inst|state.dir_anterior~q\ & ((\inst|LessThan3~3_combout\ & (\inst|Add1~2_combout\)) # (!\inst|LessThan3~3_combout\ & ((\inst|indice_FIFO\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add1~2_combout\,
	datab => \inst|state.dir_anterior~q\,
	datac => \inst|indice_FIFO\(1),
	datad => \inst|LessThan3~3_combout\,
	combout => \inst|Selector56~0_combout\);

-- Location: LCCOMB_X106_Y62_N24
\inst|Selector56~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector56~3_combout\ = (\inst|state.dir_ancho_2~q\ & ((\inst|LessThan5~3_combout\ & ((\inst|Add6~2_combout\))) # (!\inst|LessThan5~3_combout\ & (\inst|Add4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add4~0_combout\,
	datab => \inst|state.dir_ancho_2~q\,
	datac => \inst|LessThan5~3_combout\,
	datad => \inst|Add6~2_combout\,
	combout => \inst|Selector56~3_combout\);

-- Location: LCCOMB_X106_Y62_N2
\inst|Selector56~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector56~4_combout\ = (\inst|Selector56~3_combout\) # ((!\inst|FIFO_dir_o[10]~1_combout\ & \inst|Add2~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|FIFO_dir_o[10]~1_combout\,
	datac => \inst|Add2~2_combout\,
	datad => \inst|Selector56~3_combout\,
	combout => \inst|Selector56~4_combout\);

-- Location: LCCOMB_X106_Y62_N6
\inst|Selector56~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector56~5_combout\ = (\inst|Selector56~2_combout\) # ((\inst|Selector56~1_combout\) # ((\inst|Selector56~0_combout\) # (\inst|Selector56~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector56~2_combout\,
	datab => \inst|Selector56~1_combout\,
	datac => \inst|Selector56~0_combout\,
	datad => \inst|Selector56~4_combout\,
	combout => \inst|Selector56~5_combout\);

-- Location: FF_X106_Y62_N7
\inst|FIFO_dir_o[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector56~5_combout\,
	ena => \inst|FIFO_dir_o[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_dir_o\(1));

-- Location: LCCOMB_X105_Y63_N24
\inst|Selector57~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector57~0_combout\ = (\inst|state.escritura~q\ & ((\inst|indice_FIFO\(0)) # ((\inst|FIFO_dir_o\(0) & !\inst|WideOr7~0_combout\)))) # (!\inst|state.escritura~q\ & (\inst|FIFO_dir_o\(0) & ((!\inst|WideOr7~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.escritura~q\,
	datab => \inst|FIFO_dir_o\(0),
	datac => \inst|indice_FIFO\(0),
	datad => \inst|WideOr7~0_combout\,
	combout => \inst|Selector57~0_combout\);

-- Location: LCCOMB_X106_Y63_N16
\inst|Selector57~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector57~5_combout\ = (\inst|state.dir_anterior~q\ & ((\inst|LessThan3~3_combout\ & (\inst|Add1~0_combout\)) # (!\inst|LessThan3~3_combout\ & ((\inst|indice_FIFO\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dir_anterior~q\,
	datab => \inst|Add1~0_combout\,
	datac => \inst|indice_FIFO\(0),
	datad => \inst|LessThan3~3_combout\,
	combout => \inst|Selector57~5_combout\);

-- Location: LCCOMB_X106_Y62_N20
\inst|Selector57~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector57~1_combout\ = (\inst|state.dir_ancho_1~q\ & ((\inst|LessThan4~3_combout\ & ((\inst|indice_FIFO\(0)))) # (!\inst|LessThan4~3_combout\ & (\inst|Add2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add2~0_combout\,
	datab => \inst|indice_FIFO\(0),
	datac => \inst|state.dir_ancho_1~q\,
	datad => \inst|LessThan4~3_combout\,
	combout => \inst|Selector57~1_combout\);

-- Location: LCCOMB_X108_Y62_N2
\inst|Selector57~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector57~2_combout\ = (\inst|state.dir_ancho_3~q\ & ((\inst|LessThan6~3_combout\ & (\inst|indice_FIFO\(0))) # (!\inst|LessThan6~3_combout\ & ((\inst|Add8~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dir_ancho_3~q\,
	datab => \inst|indice_FIFO\(0),
	datac => \inst|Add8~0_combout\,
	datad => \inst|LessThan6~3_combout\,
	combout => \inst|Selector57~2_combout\);

-- Location: LCCOMB_X107_Y62_N28
\inst|Selector57~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector57~3_combout\ = (\inst|Selector57~1_combout\) # (\inst|Selector57~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Selector57~1_combout\,
	datad => \inst|Selector57~2_combout\,
	combout => \inst|Selector57~3_combout\);

-- Location: LCCOMB_X106_Y60_N30
\inst|Selector57~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector57~4_combout\ = (\inst|state.dir_ancho_2~q\ & ((\inst|LessThan5~3_combout\ & ((\inst|Add6~0_combout\))) # (!\inst|LessThan5~3_combout\ & (\inst|indice_FIFO\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|indice_FIFO\(0),
	datab => \inst|state.dir_ancho_2~q\,
	datac => \inst|Add6~0_combout\,
	datad => \inst|LessThan5~3_combout\,
	combout => \inst|Selector57~4_combout\);

-- Location: LCCOMB_X106_Y63_N24
\inst|Selector57~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector57~6_combout\ = (\inst|Selector57~0_combout\) # ((\inst|Selector57~5_combout\) # ((\inst|Selector57~3_combout\) # (\inst|Selector57~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector57~0_combout\,
	datab => \inst|Selector57~5_combout\,
	datac => \inst|Selector57~3_combout\,
	datad => \inst|Selector57~4_combout\,
	combout => \inst|Selector57~6_combout\);

-- Location: FF_X106_Y63_N25
\inst|FIFO_dir_o[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector57~6_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|FIFO_dir_o\(0));

ww_fifo_rw <= \fifo_rw~output_o\;

ww_estado(3) <= \estado[3]~output_o\;

ww_estado(2) <= \estado[2]~output_o\;

ww_estado(1) <= \estado[1]~output_o\;

ww_estado(0) <= \estado[0]~output_o\;

ww_fifo_data(10) <= \fifo_data[10]~output_o\;

ww_fifo_data(9) <= \fifo_data[9]~output_o\;

ww_fifo_data(8) <= \fifo_data[8]~output_o\;

ww_fifo_data(7) <= \fifo_data[7]~output_o\;

ww_fifo_data(6) <= \fifo_data[6]~output_o\;

ww_fifo_data(5) <= \fifo_data[5]~output_o\;

ww_fifo_data(4) <= \fifo_data[4]~output_o\;

ww_fifo_data(3) <= \fifo_data[3]~output_o\;

ww_fifo_data(2) <= \fifo_data[2]~output_o\;

ww_fifo_data(1) <= \fifo_data[1]~output_o\;

ww_fifo_data(0) <= \fifo_data[0]~output_o\;

ww_fifo_dir(10) <= \fifo_dir[10]~output_o\;

ww_fifo_dir(9) <= \fifo_dir[9]~output_o\;

ww_fifo_dir(8) <= \fifo_dir[8]~output_o\;

ww_fifo_dir(7) <= \fifo_dir[7]~output_o\;

ww_fifo_dir(6) <= \fifo_dir[6]~output_o\;

ww_fifo_dir(5) <= \fifo_dir[5]~output_o\;

ww_fifo_dir(4) <= \fifo_dir[4]~output_o\;

ww_fifo_dir(3) <= \fifo_dir[3]~output_o\;

ww_fifo_dir(2) <= \fifo_dir[2]~output_o\;

ww_fifo_dir(1) <= \fifo_dir[1]~output_o\;

ww_fifo_dir(0) <= \fifo_dir[0]~output_o\;
END structure;


