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

-- DATE "05/29/2024 19:25:39"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
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
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_101,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


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

ENTITY 	Block1 IS
    PORT (
	DONE : OUT std_logic;
	clk : IN std_logic;
	start : IN std_logic;
	reset : IN std_logic;
	sda : INOUT std_logic;
	sca : OUT std_logic;
	trigg : OUT std_logic;
	clk_out : OUT std_logic;
	reset_camara : OUT std_logic;
	Res_int : OUT std_logic;
	stop_int : OUT std_logic;
	R_W_iknt : OUT std_logic;
	S_T_int : OUT std_logic;
	CLK_int : OUT std_logic;
	Buisy_int : OUT std_logic;
	ERR_int : OUT std_logic;
	Data : OUT std_logic_vector(7 DOWNTO 0)
	);
END Block1;

-- Design Ports Information
-- DONE	=>  Location: PIN_120,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sca	=>  Location: PIN_111,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- trigg	=>  Location: PIN_53,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_out	=>  Location: PIN_30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset_camara	=>  Location: PIN_77,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Res_int	=>  Location: PIN_126,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- stop_int	=>  Location: PIN_105,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R_W_iknt	=>  Location: PIN_113,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S_T_int	=>  Location: PIN_124,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK_int	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Buisy_int	=>  Location: PIN_119,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ERR_int	=>  Location: PIN_129,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[7]	=>  Location: PIN_128,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[6]	=>  Location: PIN_68,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[5]	=>  Location: PIN_125,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[4]	=>  Location: PIN_114,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[3]	=>  Location: PIN_112,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[2]	=>  Location: PIN_115,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[1]	=>  Location: PIN_132,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[0]	=>  Location: PIN_127,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sda	=>  Location: PIN_121,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_110,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start	=>  Location: PIN_133,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Block1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_DONE : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_start : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_sca : std_logic;
SIGNAL ww_trigg : std_logic;
SIGNAL ww_clk_out : std_logic;
SIGNAL ww_reset_camara : std_logic;
SIGNAL ww_Res_int : std_logic;
SIGNAL ww_stop_int : std_logic;
SIGNAL ww_R_W_iknt : std_logic;
SIGNAL ww_S_T_int : std_logic;
SIGNAL ww_CLK_int : std_logic;
SIGNAL ww_Buisy_int : std_logic;
SIGNAL ww_ERR_int : std_logic;
SIGNAL ww_Data : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|clk_int_2~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst|clk_int~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \sca~output_o\ : std_logic;
SIGNAL \sda~output_o\ : std_logic;
SIGNAL \DONE~output_o\ : std_logic;
SIGNAL \trigg~output_o\ : std_logic;
SIGNAL \clk_out~output_o\ : std_logic;
SIGNAL \reset_camara~output_o\ : std_logic;
SIGNAL \Res_int~output_o\ : std_logic;
SIGNAL \stop_int~output_o\ : std_logic;
SIGNAL \R_W_iknt~output_o\ : std_logic;
SIGNAL \S_T_int~output_o\ : std_logic;
SIGNAL \CLK_int~output_o\ : std_logic;
SIGNAL \Buisy_int~output_o\ : std_logic;
SIGNAL \ERR_int~output_o\ : std_logic;
SIGNAL \Data[7]~output_o\ : std_logic;
SIGNAL \Data[6]~output_o\ : std_logic;
SIGNAL \Data[5]~output_o\ : std_logic;
SIGNAL \Data[4]~output_o\ : std_logic;
SIGNAL \Data[3]~output_o\ : std_logic;
SIGNAL \Data[2]~output_o\ : std_logic;
SIGNAL \Data[1]~output_o\ : std_logic;
SIGNAL \Data[0]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst|cuenta_int[1]~1_combout\ : std_logic;
SIGNAL \inst|cuenta_int~2_combout\ : std_logic;
SIGNAL \inst|cuenta_int~0_combout\ : std_logic;
SIGNAL \inst|clk_int~0_combout\ : std_logic;
SIGNAL \inst|clk_int~feeder_combout\ : std_logic;
SIGNAL \inst|clk_int~q\ : std_logic;
SIGNAL \inst|clk_int~clkctrl_outclk\ : std_logic;
SIGNAL \inst|cuenta_int_2~1_combout\ : std_logic;
SIGNAL \inst|cuenta_int_2~0_combout\ : std_logic;
SIGNAL \inst|Add1~0_combout\ : std_logic;
SIGNAL \inst|cuenta_int_2~2_combout\ : std_logic;
SIGNAL \inst|Equal1~0_combout\ : std_logic;
SIGNAL \inst|clk_int_2~0_combout\ : std_logic;
SIGNAL \inst|clk_int_2~feeder_combout\ : std_logic;
SIGNAL \inst|clk_int_2~q\ : std_logic;
SIGNAL \inst|clk_int_2~clkctrl_outclk\ : std_logic;
SIGNAL \start~input_o\ : std_logic;
SIGNAL \inst|state.idle~0_combout\ : std_logic;
SIGNAL \inst|state.idle~feeder_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \inst1|state.ack_2~q\ : std_logic;
SIGNAL \sda~input_o\ : std_logic;
SIGNAL \inst1|state.error~0_combout\ : std_logic;
SIGNAL \inst1|state.error~q\ : std_logic;
SIGNAL \inst|count[0]~1_combout\ : std_logic;
SIGNAL \inst|state.idle~q\ : std_logic;
SIGNAL \inst|count[3]~0_combout\ : std_logic;
SIGNAL \inst|WideOr18~0_combout\ : std_logic;
SIGNAL \inst|WideOr18~1_combout\ : std_logic;
SIGNAL \inst|Add2~0_combout\ : std_logic;
SIGNAL \inst|Selector24~0_combout\ : std_logic;
SIGNAL \inst|count[0]~2_combout\ : std_logic;
SIGNAL \inst|Add2~1\ : std_logic;
SIGNAL \inst|Add2~2_combout\ : std_logic;
SIGNAL \inst|Selector23~0_combout\ : std_logic;
SIGNAL \inst|Add2~3\ : std_logic;
SIGNAL \inst|Add2~4_combout\ : std_logic;
SIGNAL \inst|Selector22~0_combout\ : std_logic;
SIGNAL \inst|Add2~5\ : std_logic;
SIGNAL \inst|Add2~6_combout\ : std_logic;
SIGNAL \inst|Selector21~0_combout\ : std_logic;
SIGNAL \inst|Add2~7\ : std_logic;
SIGNAL \inst|Add2~8_combout\ : std_logic;
SIGNAL \inst|Selector20~0_combout\ : std_logic;
SIGNAL \inst|Add2~9\ : std_logic;
SIGNAL \inst|Add2~10_combout\ : std_logic;
SIGNAL \inst|Selector19~0_combout\ : std_logic;
SIGNAL \inst|Add2~11\ : std_logic;
SIGNAL \inst|Add2~12_combout\ : std_logic;
SIGNAL \inst|Selector18~0_combout\ : std_logic;
SIGNAL \inst|Add2~13\ : std_logic;
SIGNAL \inst|Add2~14_combout\ : std_logic;
SIGNAL \inst|Selector17~0_combout\ : std_logic;
SIGNAL \inst|Add2~15\ : std_logic;
SIGNAL \inst|Add2~16_combout\ : std_logic;
SIGNAL \inst|Selector1~0_combout\ : std_logic;
SIGNAL \inst|state.dp_07~q\ : std_logic;
SIGNAL \inst|Selector2~0_combout\ : std_logic;
SIGNAL \inst|state.dw_07~q\ : std_logic;
SIGNAL \inst|Selector3~0_combout\ : std_logic;
SIGNAL \inst|state.dp_00~q\ : std_logic;
SIGNAL \inst|Selector4~0_combout\ : std_logic;
SIGNAL \inst|state.dw_00~q\ : std_logic;
SIGNAL \inst|Selector5~0_combout\ : std_logic;
SIGNAL \inst|state.dp_02~q\ : std_logic;
SIGNAL \inst|Selector6~0_combout\ : std_logic;
SIGNAL \inst|state.dw_02~q\ : std_logic;
SIGNAL \inst|state.stop_1~q\ : std_logic;
SIGNAL \inst|state.dp_BA_2~q\ : std_logic;
SIGNAL \inst|Selector9~0_combout\ : std_logic;
SIGNAL \inst|state.dp_1E~q\ : std_logic;
SIGNAL \inst|Selector10~0_combout\ : std_logic;
SIGNAL \inst|state.dw_1E~q\ : std_logic;
SIGNAL \inst|Selector11~0_combout\ : std_logic;
SIGNAL \inst|state.dp_81~q\ : std_logic;
SIGNAL \inst|Selector12~0_combout\ : std_logic;
SIGNAL \inst|state.dw_81~q\ : std_logic;
SIGNAL \inst|Selector13~0_combout\ : std_logic;
SIGNAL \inst|state.dp_00_2~q\ : std_logic;
SIGNAL \inst|Selector14~0_combout\ : std_logic;
SIGNAL \inst|state.dw_00_2~q\ : std_logic;
SIGNAL \inst|state.stop_2~feeder_combout\ : std_logic;
SIGNAL \inst|state.stop_2~q\ : std_logic;
SIGNAL \inst|stop~combout\ : std_logic;
SIGNAL \inst1|state~14_combout\ : std_logic;
SIGNAL \inst1|state~15_combout\ : std_logic;
SIGNAL \inst1|Selector3~0_combout\ : std_logic;
SIGNAL \inst1|state.idle_2~q\ : std_logic;
SIGNAL \inst1|buisy~0_combout\ : std_logic;
SIGNAL \inst|Selector0~0_combout\ : std_logic;
SIGNAL \inst|state.dp_BA~q\ : std_logic;
SIGNAL \inst|WideOr18~2_combout\ : std_logic;
SIGNAL \inst1|state~17_combout\ : std_logic;
SIGNAL \inst1|state.stop_1~q\ : std_logic;
SIGNAL \inst1|state.stop_2~q\ : std_logic;
SIGNAL \inst1|Selector0~0_combout\ : std_logic;
SIGNAL \inst1|state.idle~q\ : std_logic;
SIGNAL \inst1|state~18_combout\ : std_logic;
SIGNAL \inst1|state.start~feeder_combout\ : std_logic;
SIGNAL \inst1|state.start~q\ : std_logic;
SIGNAL \inst1|Selector15~0_combout\ : std_logic;
SIGNAL \inst1|count[0]~0_combout\ : std_logic;
SIGNAL \inst1|Selector14~0_combout\ : std_logic;
SIGNAL \inst1|Selector13~0_combout\ : std_logic;
SIGNAL \inst1|Selector1~0_combout\ : std_logic;
SIGNAL \inst1|Selector1~1_combout\ : std_logic;
SIGNAL \inst1|state.b_trans~q\ : std_logic;
SIGNAL \inst1|state.b_write~feeder_combout\ : std_logic;
SIGNAL \inst1|state.b_write~q\ : std_logic;
SIGNAL \inst1|state~16_combout\ : std_logic;
SIGNAL \inst1|state.ack_1~q\ : std_logic;
SIGNAL \inst1|WideOr6~0_combout\ : std_logic;
SIGNAL \inst1|Selector16~0_combout\ : std_logic;
SIGNAL \inst|WideOr22~0_combout\ : std_logic;
SIGNAL \inst1|data[2]~7_combout\ : std_logic;
SIGNAL \inst1|data[7]~2_combout\ : std_logic;
SIGNAL \inst1|data[7]~3_combout\ : std_logic;
SIGNAL \inst|WideOr20~combout\ : std_logic;
SIGNAL \inst|WideOr23~combout\ : std_logic;
SIGNAL \inst1|data[1]~feeder_combout\ : std_logic;
SIGNAL \inst|WideOr24~combout\ : std_logic;
SIGNAL \inst1|Mux0~0_combout\ : std_logic;
SIGNAL \inst1|Mux0~1_combout\ : std_logic;
SIGNAL \inst1|data[5]~4_combout\ : std_logic;
SIGNAL \inst1|data[5]~6_combout\ : std_logic;
SIGNAL \inst1|data[5]~5_combout\ : std_logic;
SIGNAL \inst1|Mux0~2_combout\ : std_logic;
SIGNAL \inst|WideOr19~combout\ : std_logic;
SIGNAL \inst1|Mux0~3_combout\ : std_logic;
SIGNAL \inst1|Mux0~4_combout\ : std_logic;
SIGNAL \inst1|Selector16~1_combout\ : std_logic;
SIGNAL \inst|state.done~0_combout\ : std_logic;
SIGNAL \inst|state.done~q\ : std_logic;
SIGNAL \inst1|count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst|count\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst1|data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|cuenta_int\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst|cuenta_int_2\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst|ALT_INV_count[0]~1_combout\ : std_logic;
SIGNAL \inst|ALT_INV_WideOr22~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_buisy~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_count[3]~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_WideOr18~1_combout\ : std_logic;
SIGNAL \inst|ALT_INV_state.idle~q\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

DONE <= ww_DONE;
ww_clk <= clk;
ww_start <= start;
ww_reset <= reset;
sca <= ww_sca;
trigg <= ww_trigg;
clk_out <= ww_clk_out;
reset_camara <= ww_reset_camara;
Res_int <= ww_Res_int;
stop_int <= ww_stop_int;
R_W_iknt <= ww_R_W_iknt;
S_T_int <= ww_S_T_int;
CLK_int <= ww_CLK_int;
Buisy_int <= ww_Buisy_int;
ERR_int <= ww_ERR_int;
Data <= ww_Data;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst|clk_int_2~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inst|clk_int_2~q\);

\inst|clk_int~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inst|clk_int~q\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\inst|ALT_INV_count[0]~1_combout\ <= NOT \inst|count[0]~1_combout\;
\inst|ALT_INV_WideOr22~0_combout\ <= NOT \inst|WideOr22~0_combout\;
\inst1|ALT_INV_buisy~0_combout\ <= NOT \inst1|buisy~0_combout\;
\inst|ALT_INV_count[3]~0_combout\ <= NOT \inst|count[3]~0_combout\;
\inst|ALT_INV_WideOr18~1_combout\ <= NOT \inst|WideOr18~1_combout\;
\inst|ALT_INV_state.idle~q\ <= NOT \inst|state.idle~q\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X30_Y24_N23
\sca~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => \inst1|WideOr6~0_combout\,
	devoe => ww_devoe,
	o => \sca~output_o\);

-- Location: IOOBUF_X23_Y24_N16
\sda~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => \inst1|Selector16~1_combout\,
	oe => VCC,
	devoe => ww_devoe,
	o => \sda~output_o\);

-- Location: IOOBUF_X23_Y24_N9
\DONE~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|state.done~q\,
	devoe => ww_devoe,
	o => \DONE~output_o\);

-- Location: IOOBUF_X16_Y0_N2
\trigg~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \trigg~output_o\);

-- Location: IOOBUF_X0_Y8_N16
\clk_out~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clk~input_o\,
	devoe => ww_devoe,
	o => \clk_out~output_o\);

-- Location: IOOBUF_X34_Y4_N16
\reset_camara~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \reset_camara~output_o\);

-- Location: IOOBUF_X16_Y24_N2
\Res_int~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_state.idle~q\,
	devoe => ww_devoe,
	o => \Res_int~output_o\);

-- Location: IOOBUF_X34_Y19_N16
\stop_int~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|stop~combout\,
	devoe => ww_devoe,
	o => \stop_int~output_o\);

-- Location: IOOBUF_X28_Y24_N9
\R_W_iknt~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_WideOr18~1_combout\,
	devoe => ww_devoe,
	o => \R_W_iknt~output_o\);

-- Location: IOOBUF_X18_Y24_N16
\S_T_int~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_count[3]~0_combout\,
	devoe => ww_devoe,
	o => \S_T_int~output_o\);

-- Location: IOOBUF_X0_Y9_N9
\CLK_int~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|clk_int~q\,
	devoe => ww_devoe,
	o => \CLK_int~output_o\);

-- Location: IOOBUF_X23_Y24_N2
\Buisy_int~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|buisy~0_combout\,
	devoe => ww_devoe,
	o => \Buisy_int~output_o\);

-- Location: IOOBUF_X16_Y24_N23
\ERR_int~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|state.error~q\,
	devoe => ww_devoe,
	o => \ERR_int~output_o\);

-- Location: IOOBUF_X16_Y24_N16
\Data[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr19~combout\,
	devoe => ww_devoe,
	o => \Data[7]~output_o\);

-- Location: IOOBUF_X30_Y0_N9
\Data[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Data[6]~output_o\);

-- Location: IOOBUF_X18_Y24_N23
\Data[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_count[3]~0_combout\,
	devoe => ww_devoe,
	o => \Data[5]~output_o\);

-- Location: IOOBUF_X28_Y24_N16
\Data[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr20~combout\,
	devoe => ww_devoe,
	o => \Data[4]~output_o\);

-- Location: IOOBUF_X28_Y24_N2
\Data[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr20~combout\,
	devoe => ww_devoe,
	o => \Data[3]~output_o\);

-- Location: IOOBUF_X28_Y24_N23
\Data[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_WideOr22~0_combout\,
	devoe => ww_devoe,
	o => \Data[2]~output_o\);

-- Location: IOOBUF_X13_Y24_N16
\Data[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr23~combout\,
	devoe => ww_devoe,
	o => \Data[1]~output_o\);

-- Location: IOOBUF_X16_Y24_N9
\Data[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr24~combout\,
	devoe => ww_devoe,
	o => \Data[0]~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
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

-- Location: LCCOMB_X2_Y11_N28
\inst|cuenta_int[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|cuenta_int[1]~1_combout\ = \inst|cuenta_int\(1) $ (\inst|cuenta_int\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|cuenta_int\(1),
	datad => \inst|cuenta_int\(0),
	combout => \inst|cuenta_int[1]~1_combout\);

-- Location: FF_X2_Y11_N29
\inst|cuenta_int[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|cuenta_int[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|cuenta_int\(1));

-- Location: LCCOMB_X2_Y11_N22
\inst|cuenta_int~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|cuenta_int~2_combout\ = (\inst|cuenta_int\(1) & (\inst|cuenta_int\(2) $ (\inst|cuenta_int\(0)))) # (!\inst|cuenta_int\(1) & (\inst|cuenta_int\(2) & \inst|cuenta_int\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cuenta_int\(1),
	datac => \inst|cuenta_int\(2),
	datad => \inst|cuenta_int\(0),
	combout => \inst|cuenta_int~2_combout\);

-- Location: FF_X2_Y11_N23
\inst|cuenta_int[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|cuenta_int~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|cuenta_int\(2));

-- Location: LCCOMB_X2_Y11_N24
\inst|cuenta_int~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|cuenta_int~0_combout\ = (!\inst|cuenta_int\(0) & ((\inst|cuenta_int\(1)) # (!\inst|cuenta_int\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cuenta_int\(1),
	datac => \inst|cuenta_int\(0),
	datad => \inst|cuenta_int\(2),
	combout => \inst|cuenta_int~0_combout\);

-- Location: FF_X2_Y11_N25
\inst|cuenta_int[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|cuenta_int~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|cuenta_int\(0));

-- Location: LCCOMB_X2_Y11_N30
\inst|clk_int~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|clk_int~0_combout\ = \inst|clk_int~q\ $ (((!\inst|cuenta_int\(0) & (\inst|cuenta_int\(2) & !\inst|cuenta_int\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|clk_int~q\,
	datab => \inst|cuenta_int\(0),
	datac => \inst|cuenta_int\(2),
	datad => \inst|cuenta_int\(1),
	combout => \inst|clk_int~0_combout\);

-- Location: LCCOMB_X2_Y11_N26
\inst|clk_int~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|clk_int~feeder_combout\ = \inst|clk_int~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|clk_int~0_combout\,
	combout => \inst|clk_int~feeder_combout\);

-- Location: FF_X2_Y11_N27
\inst|clk_int\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|clk_int~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|clk_int~q\);

-- Location: CLKCTRL_G3
\inst|clk_int~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst|clk_int~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst|clk_int~clkctrl_outclk\);

-- Location: LCCOMB_X1_Y11_N30
\inst|cuenta_int_2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|cuenta_int_2~1_combout\ = (\inst|cuenta_int_2\(0) & (((!\inst|cuenta_int_2\(1))))) # (!\inst|cuenta_int_2\(0) & (\inst|cuenta_int_2\(1) & ((\inst|cuenta_int_2\(3)) # (!\inst|cuenta_int_2\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cuenta_int_2\(0),
	datab => \inst|cuenta_int_2\(3),
	datac => \inst|cuenta_int_2\(1),
	datad => \inst|cuenta_int_2\(2),
	combout => \inst|cuenta_int_2~1_combout\);

-- Location: FF_X1_Y11_N31
\inst|cuenta_int_2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|cuenta_int_2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|cuenta_int_2\(1));

-- Location: LCCOMB_X1_Y11_N24
\inst|cuenta_int_2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|cuenta_int_2~0_combout\ = (\inst|cuenta_int_2\(0) & ((\inst|cuenta_int_2\(2) $ (\inst|cuenta_int_2\(1))))) # (!\inst|cuenta_int_2\(0) & (\inst|cuenta_int_2\(2) & ((\inst|cuenta_int_2\(3)) # (!\inst|cuenta_int_2\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cuenta_int_2\(0),
	datab => \inst|cuenta_int_2\(3),
	datac => \inst|cuenta_int_2\(2),
	datad => \inst|cuenta_int_2\(1),
	combout => \inst|cuenta_int_2~0_combout\);

-- Location: FF_X1_Y11_N25
\inst|cuenta_int_2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|cuenta_int_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|cuenta_int_2\(2));

-- Location: LCCOMB_X1_Y11_N16
\inst|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~0_combout\ = \inst|cuenta_int_2\(3) $ (((\inst|cuenta_int_2\(0) & (\inst|cuenta_int_2\(2) & \inst|cuenta_int_2\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cuenta_int_2\(0),
	datab => \inst|cuenta_int_2\(2),
	datac => \inst|cuenta_int_2\(3),
	datad => \inst|cuenta_int_2\(1),
	combout => \inst|Add1~0_combout\);

-- Location: FF_X1_Y11_N17
\inst|cuenta_int_2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Add1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|cuenta_int_2\(3));

-- Location: LCCOMB_X1_Y11_N22
\inst|cuenta_int_2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|cuenta_int_2~2_combout\ = (!\inst|cuenta_int_2\(0) & ((\inst|cuenta_int_2\(3)) # ((!\inst|cuenta_int_2\(2)) # (!\inst|cuenta_int_2\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cuenta_int_2\(3),
	datab => \inst|cuenta_int_2\(1),
	datac => \inst|cuenta_int_2\(0),
	datad => \inst|cuenta_int_2\(2),
	combout => \inst|cuenta_int_2~2_combout\);

-- Location: FF_X1_Y11_N23
\inst|cuenta_int_2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|cuenta_int_2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|cuenta_int_2\(0));

-- Location: LCCOMB_X1_Y11_N6
\inst|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal1~0_combout\ = (!\inst|cuenta_int_2\(0) & (\inst|cuenta_int_2\(2) & (\inst|cuenta_int_2\(1) & !\inst|cuenta_int_2\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cuenta_int_2\(0),
	datab => \inst|cuenta_int_2\(2),
	datac => \inst|cuenta_int_2\(1),
	datad => \inst|cuenta_int_2\(3),
	combout => \inst|Equal1~0_combout\);

-- Location: LCCOMB_X1_Y11_N20
\inst|clk_int_2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|clk_int_2~0_combout\ = \inst|clk_int_2~q\ $ (\inst|Equal1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|clk_int_2~q\,
	datad => \inst|Equal1~0_combout\,
	combout => \inst|clk_int_2~0_combout\);

-- Location: LCCOMB_X1_Y11_N8
\inst|clk_int_2~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|clk_int_2~feeder_combout\ = \inst|clk_int_2~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|clk_int_2~0_combout\,
	combout => \inst|clk_int_2~feeder_combout\);

-- Location: FF_X1_Y11_N9
\inst|clk_int_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|clk_int_2~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|clk_int_2~q\);

-- Location: CLKCTRL_G1
\inst|clk_int_2~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst|clk_int_2~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst|clk_int_2~clkctrl_outclk\);

-- Location: IOIBUF_X13_Y24_N22
\start~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

-- Location: LCCOMB_X23_Y22_N16
\inst|state.idle~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|state.idle~0_combout\ = (\inst|state.idle~q\) # (!\start~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|state.idle~q\,
	datad => \start~input_o\,
	combout => \inst|state.idle~0_combout\);

-- Location: LCCOMB_X23_Y22_N30
\inst|state.idle~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|state.idle~feeder_combout\ = \inst|state.idle~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|state.idle~0_combout\,
	combout => \inst|state.idle~feeder_combout\);

-- Location: IOIBUF_X30_Y24_N1
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X23_Y22_N19
\inst1|state.ack_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int~clkctrl_outclk\,
	asdata => \inst1|state.ack_1~q\,
	clrn => \inst|state.idle~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|state.ack_2~q\);

-- Location: IOIBUF_X23_Y24_N15
\sda~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => sda,
	o => \sda~input_o\);

-- Location: LCCOMB_X23_Y22_N10
\inst1|state.error~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|state.error~0_combout\ = (\inst1|state.error~q\) # ((\inst1|state.ack_2~q\ & \sda~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|state.ack_2~q\,
	datab => \sda~input_o\,
	datac => \inst1|state.error~q\,
	combout => \inst1|state.error~0_combout\);

-- Location: FF_X23_Y22_N11
\inst1|state.error\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int~clkctrl_outclk\,
	d => \inst1|state.error~0_combout\,
	clrn => \inst|state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|state.error~q\);

-- Location: LCCOMB_X23_Y22_N18
\inst|count[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|count[0]~1_combout\ = (\inst1|state.error~q\) # (!\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datad => \inst1|state.error~q\,
	combout => \inst|count[0]~1_combout\);

-- Location: FF_X23_Y22_N31
\inst|state.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|state.idle~feeder_combout\,
	clrn => \inst|ALT_INV_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.idle~q\);

-- Location: LCCOMB_X22_Y22_N2
\inst|count[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|count[3]~0_combout\ = (!\inst|state.dp_BA_2~q\ & !\inst|state.dp_BA~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|state.dp_BA_2~q\,
	datad => \inst|state.dp_BA~q\,
	combout => \inst|count[3]~0_combout\);

-- Location: LCCOMB_X24_Y22_N28
\inst|WideOr18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|WideOr18~0_combout\ = (!\inst|state.dp_00~q\ & (!\inst|state.dp_07~q\ & (!\inst|state.dp_1E~q\ & !\inst|state.dp_02~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dp_00~q\,
	datab => \inst|state.dp_07~q\,
	datac => \inst|state.dp_1E~q\,
	datad => \inst|state.dp_02~q\,
	combout => \inst|WideOr18~0_combout\);

-- Location: LCCOMB_X24_Y22_N14
\inst|WideOr18~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|WideOr18~1_combout\ = (!\inst|state.dp_81~q\ & (!\inst|state.dp_00_2~q\ & \inst|WideOr18~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dp_81~q\,
	datac => \inst|state.dp_00_2~q\,
	datad => \inst|WideOr18~0_combout\,
	combout => \inst|WideOr18~1_combout\);

-- Location: LCCOMB_X25_Y22_N10
\inst|Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add2~0_combout\ = \inst|count\(0) $ (VCC)
-- \inst|Add2~1\ = CARRY(\inst|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|count\(0),
	datad => VCC,
	combout => \inst|Add2~0_combout\,
	cout => \inst|Add2~1\);

-- Location: LCCOMB_X25_Y22_N0
\inst|Selector24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector24~0_combout\ = (\inst|Add2~0_combout\) # (((\inst|WideOr18~1_combout\) # (!\inst|Add2~16_combout\)) # (!\inst|count[3]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add2~0_combout\,
	datab => \inst|count[3]~0_combout\,
	datac => \inst|Add2~16_combout\,
	datad => \inst|WideOr18~1_combout\,
	combout => \inst|Selector24~0_combout\);

-- Location: LCCOMB_X25_Y22_N2
\inst|count[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|count[0]~2_combout\ = (!\inst|count[0]~1_combout\ & ((\inst|count[3]~0_combout\ & ((!\inst|WideOr18~1_combout\))) # (!\inst|count[3]~0_combout\ & (!\inst1|buisy~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000101000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count[0]~1_combout\,
	datab => \inst|count[3]~0_combout\,
	datac => \inst1|buisy~0_combout\,
	datad => \inst|WideOr18~1_combout\,
	combout => \inst|count[0]~2_combout\);

-- Location: FF_X25_Y22_N1
\inst|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector24~0_combout\,
	ena => \inst|count[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(0));

-- Location: LCCOMB_X25_Y22_N12
\inst|Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add2~2_combout\ = (\inst|count\(1) & (\inst|Add2~1\ & VCC)) # (!\inst|count\(1) & (!\inst|Add2~1\))
-- \inst|Add2~3\ = CARRY((!\inst|count\(1) & !\inst|Add2~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|count\(1),
	datad => VCC,
	cin => \inst|Add2~1\,
	combout => \inst|Add2~2_combout\,
	cout => \inst|Add2~3\);

-- Location: LCCOMB_X25_Y22_N8
\inst|Selector23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector23~0_combout\ = (\inst|WideOr18~1_combout\) # (((\inst|Add2~2_combout\) # (!\inst|Add2~16_combout\)) # (!\inst|count[3]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|WideOr18~1_combout\,
	datab => \inst|count[3]~0_combout\,
	datac => \inst|Add2~16_combout\,
	datad => \inst|Add2~2_combout\,
	combout => \inst|Selector23~0_combout\);

-- Location: FF_X25_Y22_N9
\inst|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector23~0_combout\,
	ena => \inst|count[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(1));

-- Location: LCCOMB_X25_Y22_N14
\inst|Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add2~4_combout\ = (\inst|count\(2) & ((GND) # (!\inst|Add2~3\))) # (!\inst|count\(2) & (\inst|Add2~3\ $ (GND)))
-- \inst|Add2~5\ = CARRY((\inst|count\(2)) # (!\inst|Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count\(2),
	datad => VCC,
	cin => \inst|Add2~3\,
	combout => \inst|Add2~4_combout\,
	cout => \inst|Add2~5\);

-- Location: LCCOMB_X25_Y22_N6
\inst|Selector22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector22~0_combout\ = (\inst|count[3]~0_combout\ & (\inst|Add2~4_combout\ & (\inst|Add2~16_combout\ & !\inst|WideOr18~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count[3]~0_combout\,
	datab => \inst|Add2~4_combout\,
	datac => \inst|Add2~16_combout\,
	datad => \inst|WideOr18~1_combout\,
	combout => \inst|Selector22~0_combout\);

-- Location: FF_X25_Y22_N7
\inst|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector22~0_combout\,
	ena => \inst|count[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(2));

-- Location: LCCOMB_X25_Y22_N16
\inst|Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add2~6_combout\ = (\inst|count\(3) & (\inst|Add2~5\ & VCC)) # (!\inst|count\(3) & (!\inst|Add2~5\))
-- \inst|Add2~7\ = CARRY((!\inst|count\(3) & !\inst|Add2~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|count\(3),
	datad => VCC,
	cin => \inst|Add2~5\,
	combout => \inst|Add2~6_combout\,
	cout => \inst|Add2~7\);

-- Location: LCCOMB_X25_Y22_N4
\inst|Selector21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector21~0_combout\ = (!\inst|WideOr18~1_combout\ & (\inst|count[3]~0_combout\ & (\inst|Add2~16_combout\ & \inst|Add2~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|WideOr18~1_combout\,
	datab => \inst|count[3]~0_combout\,
	datac => \inst|Add2~16_combout\,
	datad => \inst|Add2~6_combout\,
	combout => \inst|Selector21~0_combout\);

-- Location: FF_X25_Y22_N5
\inst|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector21~0_combout\,
	ena => \inst|count[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(3));

-- Location: LCCOMB_X25_Y22_N18
\inst|Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add2~8_combout\ = (\inst|count\(4) & ((GND) # (!\inst|Add2~7\))) # (!\inst|count\(4) & (\inst|Add2~7\ $ (GND)))
-- \inst|Add2~9\ = CARRY((\inst|count\(4)) # (!\inst|Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count\(4),
	datad => VCC,
	cin => \inst|Add2~7\,
	combout => \inst|Add2~8_combout\,
	cout => \inst|Add2~9\);

-- Location: LCCOMB_X25_Y22_N30
\inst|Selector20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector20~0_combout\ = (!\inst|WideOr18~1_combout\ & (\inst|count[3]~0_combout\ & (\inst|Add2~16_combout\ & \inst|Add2~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|WideOr18~1_combout\,
	datab => \inst|count[3]~0_combout\,
	datac => \inst|Add2~16_combout\,
	datad => \inst|Add2~8_combout\,
	combout => \inst|Selector20~0_combout\);

-- Location: FF_X25_Y22_N31
\inst|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector20~0_combout\,
	ena => \inst|count[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(4));

-- Location: LCCOMB_X25_Y22_N20
\inst|Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add2~10_combout\ = (\inst|count\(5) & (\inst|Add2~9\ & VCC)) # (!\inst|count\(5) & (!\inst|Add2~9\))
-- \inst|Add2~11\ = CARRY((!\inst|count\(5) & !\inst|Add2~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count\(5),
	datad => VCC,
	cin => \inst|Add2~9\,
	combout => \inst|Add2~10_combout\,
	cout => \inst|Add2~11\);

-- Location: LCCOMB_X24_Y22_N0
\inst|Selector19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector19~0_combout\ = (\inst|count[3]~0_combout\ & (!\inst|WideOr18~1_combout\ & (\inst|Add2~10_combout\ & \inst|Add2~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count[3]~0_combout\,
	datab => \inst|WideOr18~1_combout\,
	datac => \inst|Add2~10_combout\,
	datad => \inst|Add2~16_combout\,
	combout => \inst|Selector19~0_combout\);

-- Location: FF_X24_Y22_N1
\inst|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector19~0_combout\,
	ena => \inst|count[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(5));

-- Location: LCCOMB_X25_Y22_N22
\inst|Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add2~12_combout\ = (\inst|count\(6) & ((GND) # (!\inst|Add2~11\))) # (!\inst|count\(6) & (\inst|Add2~11\ $ (GND)))
-- \inst|Add2~13\ = CARRY((\inst|count\(6)) # (!\inst|Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|count\(6),
	datad => VCC,
	cin => \inst|Add2~11\,
	combout => \inst|Add2~12_combout\,
	cout => \inst|Add2~13\);

-- Location: LCCOMB_X25_Y22_N28
\inst|Selector18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector18~0_combout\ = (\inst|Add2~12_combout\ & (\inst|count[3]~0_combout\ & (\inst|Add2~16_combout\ & !\inst|WideOr18~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add2~12_combout\,
	datab => \inst|count[3]~0_combout\,
	datac => \inst|Add2~16_combout\,
	datad => \inst|WideOr18~1_combout\,
	combout => \inst|Selector18~0_combout\);

-- Location: FF_X25_Y22_N29
\inst|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector18~0_combout\,
	ena => \inst|count[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(6));

-- Location: LCCOMB_X25_Y22_N24
\inst|Add2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add2~14_combout\ = (\inst|count\(7) & (\inst|Add2~13\ & VCC)) # (!\inst|count\(7) & (!\inst|Add2~13\))
-- \inst|Add2~15\ = CARRY((!\inst|count\(7) & !\inst|Add2~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|count\(7),
	datad => VCC,
	cin => \inst|Add2~13\,
	combout => \inst|Add2~14_combout\,
	cout => \inst|Add2~15\);

-- Location: LCCOMB_X24_Y22_N30
\inst|Selector17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector17~0_combout\ = (\inst|count[3]~0_combout\ & (!\inst|WideOr18~1_combout\ & (\inst|Add2~14_combout\ & \inst|Add2~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count[3]~0_combout\,
	datab => \inst|WideOr18~1_combout\,
	datac => \inst|Add2~14_combout\,
	datad => \inst|Add2~16_combout\,
	combout => \inst|Selector17~0_combout\);

-- Location: FF_X24_Y22_N31
\inst|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector17~0_combout\,
	ena => \inst|count[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(7));

-- Location: LCCOMB_X25_Y22_N26
\inst|Add2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add2~16_combout\ = !\inst|Add2~15\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst|Add2~15\,
	combout => \inst|Add2~16_combout\);

-- Location: LCCOMB_X24_Y22_N8
\inst|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector1~0_combout\ = (\inst1|buisy~0_combout\ & (((\inst|state.dp_07~q\ & \inst|Add2~16_combout\)))) # (!\inst1|buisy~0_combout\ & ((\inst|state.dp_BA~q\) # ((\inst|state.dp_07~q\ & \inst|Add2~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|buisy~0_combout\,
	datab => \inst|state.dp_BA~q\,
	datac => \inst|state.dp_07~q\,
	datad => \inst|Add2~16_combout\,
	combout => \inst|Selector1~0_combout\);

-- Location: FF_X24_Y22_N9
\inst|state.dp_07\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector1~0_combout\,
	clrn => \inst|ALT_INV_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dp_07~q\);

-- Location: LCCOMB_X24_Y22_N20
\inst|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector2~0_combout\ = (\inst|state.dp_07~q\ & (((\inst1|buisy~0_combout\ & \inst|state.dw_07~q\)) # (!\inst|Add2~16_combout\))) # (!\inst|state.dp_07~q\ & (\inst1|buisy~0_combout\ & (\inst|state.dw_07~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dp_07~q\,
	datab => \inst1|buisy~0_combout\,
	datac => \inst|state.dw_07~q\,
	datad => \inst|Add2~16_combout\,
	combout => \inst|Selector2~0_combout\);

-- Location: FF_X24_Y22_N21
\inst|state.dw_07\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector2~0_combout\,
	clrn => \inst|ALT_INV_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dw_07~q\);

-- Location: LCCOMB_X24_Y22_N6
\inst|Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector3~0_combout\ = (\inst1|buisy~0_combout\ & (((\inst|state.dp_00~q\ & \inst|Add2~16_combout\)))) # (!\inst1|buisy~0_combout\ & ((\inst|state.dw_07~q\) # ((\inst|state.dp_00~q\ & \inst|Add2~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|buisy~0_combout\,
	datab => \inst|state.dw_07~q\,
	datac => \inst|state.dp_00~q\,
	datad => \inst|Add2~16_combout\,
	combout => \inst|Selector3~0_combout\);

-- Location: FF_X24_Y22_N7
\inst|state.dp_00\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector3~0_combout\,
	clrn => \inst|ALT_INV_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dp_00~q\);

-- Location: LCCOMB_X24_Y22_N10
\inst|Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector4~0_combout\ = (\inst1|buisy~0_combout\ & ((\inst|state.dw_00~q\) # ((\inst|state.dp_00~q\ & !\inst|Add2~16_combout\)))) # (!\inst1|buisy~0_combout\ & (\inst|state.dp_00~q\ & ((!\inst|Add2~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|buisy~0_combout\,
	datab => \inst|state.dp_00~q\,
	datac => \inst|state.dw_00~q\,
	datad => \inst|Add2~16_combout\,
	combout => \inst|Selector4~0_combout\);

-- Location: FF_X24_Y22_N11
\inst|state.dw_00\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector4~0_combout\,
	clrn => \inst|ALT_INV_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dw_00~q\);

-- Location: LCCOMB_X23_Y22_N20
\inst|Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector5~0_combout\ = (\inst1|buisy~0_combout\ & (((\inst|state.dp_02~q\ & \inst|Add2~16_combout\)))) # (!\inst1|buisy~0_combout\ & ((\inst|state.dw_00~q\) # ((\inst|state.dp_02~q\ & \inst|Add2~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|buisy~0_combout\,
	datab => \inst|state.dw_00~q\,
	datac => \inst|state.dp_02~q\,
	datad => \inst|Add2~16_combout\,
	combout => \inst|Selector5~0_combout\);

-- Location: FF_X23_Y22_N21
\inst|state.dp_02\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector5~0_combout\,
	clrn => \inst|ALT_INV_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dp_02~q\);

-- Location: LCCOMB_X23_Y22_N24
\inst|Selector6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector6~0_combout\ = (\inst|state.dp_02~q\ & (((\inst1|buisy~0_combout\ & \inst|state.dw_02~q\)) # (!\inst|Add2~16_combout\))) # (!\inst|state.dp_02~q\ & (\inst1|buisy~0_combout\ & (\inst|state.dw_02~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dp_02~q\,
	datab => \inst1|buisy~0_combout\,
	datac => \inst|state.dw_02~q\,
	datad => \inst|Add2~16_combout\,
	combout => \inst|Selector6~0_combout\);

-- Location: FF_X23_Y22_N25
\inst|state.dw_02\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector6~0_combout\,
	clrn => \inst|ALT_INV_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dw_02~q\);

-- Location: FF_X22_Y22_N29
\inst|state.stop_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	asdata => \inst|state.dw_02~q\,
	clrn => \inst|ALT_INV_count[0]~1_combout\,
	sload => VCC,
	ena => \inst1|ALT_INV_buisy~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.stop_1~q\);

-- Location: FF_X22_Y22_N9
\inst|state.dp_BA_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	asdata => \inst|state.stop_1~q\,
	clrn => \inst|ALT_INV_count[0]~1_combout\,
	sload => VCC,
	ena => \inst1|ALT_INV_buisy~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dp_BA_2~q\);

-- Location: LCCOMB_X23_Y22_N6
\inst|Selector9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector9~0_combout\ = (\inst|state.dp_BA_2~q\ & (((\inst|state.dp_1E~q\ & \inst|Add2~16_combout\)) # (!\inst1|buisy~0_combout\))) # (!\inst|state.dp_BA_2~q\ & (((\inst|state.dp_1E~q\ & \inst|Add2~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dp_BA_2~q\,
	datab => \inst1|buisy~0_combout\,
	datac => \inst|state.dp_1E~q\,
	datad => \inst|Add2~16_combout\,
	combout => \inst|Selector9~0_combout\);

-- Location: FF_X23_Y22_N7
\inst|state.dp_1E\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector9~0_combout\,
	clrn => \inst|ALT_INV_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dp_1E~q\);

-- Location: LCCOMB_X24_Y22_N26
\inst|Selector10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector10~0_combout\ = (\inst|state.dp_1E~q\ & (((\inst1|buisy~0_combout\ & \inst|state.dw_1E~q\)) # (!\inst|Add2~16_combout\))) # (!\inst|state.dp_1E~q\ & (\inst1|buisy~0_combout\ & (\inst|state.dw_1E~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dp_1E~q\,
	datab => \inst1|buisy~0_combout\,
	datac => \inst|state.dw_1E~q\,
	datad => \inst|Add2~16_combout\,
	combout => \inst|Selector10~0_combout\);

-- Location: FF_X24_Y22_N27
\inst|state.dw_1E\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector10~0_combout\,
	clrn => \inst|ALT_INV_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dw_1E~q\);

-- Location: LCCOMB_X24_Y22_N18
\inst|Selector11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector11~0_combout\ = (\inst|state.dw_1E~q\ & (((\inst|state.dp_81~q\ & \inst|Add2~16_combout\)) # (!\inst1|buisy~0_combout\))) # (!\inst|state.dw_1E~q\ & (((\inst|state.dp_81~q\ & \inst|Add2~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dw_1E~q\,
	datab => \inst1|buisy~0_combout\,
	datac => \inst|state.dp_81~q\,
	datad => \inst|Add2~16_combout\,
	combout => \inst|Selector11~0_combout\);

-- Location: FF_X24_Y22_N19
\inst|state.dp_81\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector11~0_combout\,
	clrn => \inst|ALT_INV_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dp_81~q\);

-- Location: LCCOMB_X24_Y22_N24
\inst|Selector12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector12~0_combout\ = (\inst|state.dp_81~q\ & (((\inst1|buisy~0_combout\ & \inst|state.dw_81~q\)) # (!\inst|Add2~16_combout\))) # (!\inst|state.dp_81~q\ & (\inst1|buisy~0_combout\ & (\inst|state.dw_81~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dp_81~q\,
	datab => \inst1|buisy~0_combout\,
	datac => \inst|state.dw_81~q\,
	datad => \inst|Add2~16_combout\,
	combout => \inst|Selector12~0_combout\);

-- Location: FF_X24_Y22_N25
\inst|state.dw_81\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector12~0_combout\,
	clrn => \inst|ALT_INV_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dw_81~q\);

-- Location: LCCOMB_X24_Y22_N4
\inst|Selector13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector13~0_combout\ = (\inst1|buisy~0_combout\ & (((\inst|state.dp_00_2~q\ & \inst|Add2~16_combout\)))) # (!\inst1|buisy~0_combout\ & ((\inst|state.dw_81~q\) # ((\inst|state.dp_00_2~q\ & \inst|Add2~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|buisy~0_combout\,
	datab => \inst|state.dw_81~q\,
	datac => \inst|state.dp_00_2~q\,
	datad => \inst|Add2~16_combout\,
	combout => \inst|Selector13~0_combout\);

-- Location: FF_X24_Y22_N5
\inst|state.dp_00_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector13~0_combout\,
	clrn => \inst|ALT_INV_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dp_00_2~q\);

-- Location: LCCOMB_X23_Y22_N2
\inst|Selector14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector14~0_combout\ = (\inst1|buisy~0_combout\ & ((\inst|state.dw_00_2~q\) # ((\inst|state.dp_00_2~q\ & !\inst|Add2~16_combout\)))) # (!\inst1|buisy~0_combout\ & (\inst|state.dp_00_2~q\ & ((!\inst|Add2~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|buisy~0_combout\,
	datab => \inst|state.dp_00_2~q\,
	datac => \inst|state.dw_00_2~q\,
	datad => \inst|Add2~16_combout\,
	combout => \inst|Selector14~0_combout\);

-- Location: FF_X23_Y22_N3
\inst|state.dw_00_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector14~0_combout\,
	clrn => \inst|ALT_INV_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dw_00_2~q\);

-- Location: LCCOMB_X22_Y22_N12
\inst|state.stop_2~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|state.stop_2~feeder_combout\ = \inst|state.dw_00_2~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|state.dw_00_2~q\,
	combout => \inst|state.stop_2~feeder_combout\);

-- Location: FF_X22_Y22_N13
\inst|state.stop_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|state.stop_2~feeder_combout\,
	clrn => \inst|ALT_INV_count[0]~1_combout\,
	ena => \inst1|ALT_INV_buisy~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.stop_2~q\);

-- Location: LCCOMB_X22_Y22_N8
\inst|stop\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|stop~combout\ = (\inst|state.stop_2~q\) # (\inst|state.stop_1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.stop_2~q\,
	datab => \inst|state.stop_1~q\,
	combout => \inst|stop~combout\);

-- Location: LCCOMB_X24_Y22_N16
\inst1|state~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|state~14_combout\ = (!\inst|state.dp_00~q\ & (!\inst|state.dp_00_2~q\ & (!\inst|state.dp_07~q\ & !\inst|state.dp_81~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dp_00~q\,
	datab => \inst|state.dp_00_2~q\,
	datac => \inst|state.dp_07~q\,
	datad => \inst|state.dp_81~q\,
	combout => \inst1|state~14_combout\);

-- Location: LCCOMB_X22_Y22_N16
\inst1|state~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|state~15_combout\ = (\inst1|state.idle_2~q\ & (!\inst|state.dp_02~q\ & (!\inst|state.dp_1E~q\ & \inst1|state~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|state.idle_2~q\,
	datab => \inst|state.dp_02~q\,
	datac => \inst|state.dp_1E~q\,
	datad => \inst1|state~14_combout\,
	combout => \inst1|state~15_combout\);

-- Location: LCCOMB_X22_Y22_N10
\inst1|Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Selector3~0_combout\ = (\inst|stop~combout\ & (!\sda~input_o\ & (\inst1|state.ack_2~q\))) # (!\inst|stop~combout\ & ((\inst1|state~15_combout\) # ((!\sda~input_o\ & \inst1|state.ack_2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|stop~combout\,
	datab => \sda~input_o\,
	datac => \inst1|state.ack_2~q\,
	datad => \inst1|state~15_combout\,
	combout => \inst1|Selector3~0_combout\);

-- Location: FF_X22_Y22_N11
\inst1|state.idle_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int~clkctrl_outclk\,
	d => \inst1|Selector3~0_combout\,
	clrn => \inst|state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|state.idle_2~q\);

-- Location: LCCOMB_X22_Y22_N28
\inst1|buisy~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|buisy~0_combout\ = (\inst1|state.idle~q\ & !\inst1|state.idle_2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|state.idle~q\,
	datad => \inst1|state.idle_2~q\,
	combout => \inst1|buisy~0_combout\);

-- Location: LCCOMB_X23_Y22_N4
\inst|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector0~0_combout\ = (\inst|state.idle~q\ & (\inst1|buisy~0_combout\ & (\inst|state.dp_BA~q\))) # (!\inst|state.idle~q\ & (((\inst1|buisy~0_combout\ & \inst|state.dp_BA~q\)) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.idle~q\,
	datab => \inst1|buisy~0_combout\,
	datac => \inst|state.dp_BA~q\,
	datad => \start~input_o\,
	combout => \inst|Selector0~0_combout\);

-- Location: FF_X23_Y22_N5
\inst|state.dp_BA\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|Selector0~0_combout\,
	clrn => \inst|ALT_INV_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dp_BA~q\);

-- Location: LCCOMB_X23_Y22_N8
\inst|WideOr18~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|WideOr18~2_combout\ = (!\inst|state.dp_81~q\ & !\inst|state.dp_00_2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|state.dp_81~q\,
	datad => \inst|state.dp_00_2~q\,
	combout => \inst|WideOr18~2_combout\);

-- Location: LCCOMB_X22_Y22_N24
\inst1|state~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|state~17_combout\ = (\inst1|state.idle_2~q\ & (\inst|WideOr18~2_combout\ & (\inst|WideOr18~0_combout\ & \inst|stop~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|state.idle_2~q\,
	datab => \inst|WideOr18~2_combout\,
	datac => \inst|WideOr18~0_combout\,
	datad => \inst|stop~combout\,
	combout => \inst1|state~17_combout\);

-- Location: FF_X22_Y22_N25
\inst1|state.stop_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int~clkctrl_outclk\,
	d => \inst1|state~17_combout\,
	clrn => \inst|state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|state.stop_1~q\);

-- Location: FF_X22_Y22_N21
\inst1|state.stop_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int~clkctrl_outclk\,
	asdata => \inst1|state.stop_1~q\,
	clrn => \inst|state.idle~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|state.stop_2~q\);

-- Location: LCCOMB_X22_Y22_N30
\inst1|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Selector0~0_combout\ = (!\inst1|state.stop_2~q\ & ((\inst|state.dp_BA~q\) # ((\inst|state.dp_BA_2~q\) # (\inst1|state.idle~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dp_BA~q\,
	datab => \inst|state.dp_BA_2~q\,
	datac => \inst1|state.idle~q\,
	datad => \inst1|state.stop_2~q\,
	combout => \inst1|Selector0~0_combout\);

-- Location: FF_X22_Y22_N31
\inst1|state.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int~clkctrl_outclk\,
	d => \inst1|Selector0~0_combout\,
	clrn => \inst|state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|state.idle~q\);

-- Location: LCCOMB_X22_Y22_N20
\inst1|state~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|state~18_combout\ = (!\inst1|state.idle~q\ & ((\inst|state.dp_BA_2~q\) # (\inst|state.dp_BA~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|state.idle~q\,
	datab => \inst|state.dp_BA_2~q\,
	datad => \inst|state.dp_BA~q\,
	combout => \inst1|state~18_combout\);

-- Location: LCCOMB_X22_Y21_N12
\inst1|state.start~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|state.start~feeder_combout\ = \inst1|state~18_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst1|state~18_combout\,
	combout => \inst1|state.start~feeder_combout\);

-- Location: FF_X22_Y21_N13
\inst1|state.start\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int~clkctrl_outclk\,
	d => \inst1|state.start~feeder_combout\,
	clrn => \inst|state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|state.start~q\);

-- Location: LCCOMB_X22_Y21_N20
\inst1|Selector15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Selector15~0_combout\ = (!\inst1|state.b_write~q\) # (!\inst1|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst1|count\(0),
	datad => \inst1|state.b_write~q\,
	combout => \inst1|Selector15~0_combout\);

-- Location: LCCOMB_X22_Y21_N16
\inst1|count[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|count[0]~0_combout\ = (\inst|state.idle~q\ & ((\inst1|state.start~q\) # (\inst1|state.b_write~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|state.start~q\,
	datac => \inst|state.idle~q\,
	datad => \inst1|state.b_write~q\,
	combout => \inst1|count[0]~0_combout\);

-- Location: FF_X22_Y21_N21
\inst1|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int~clkctrl_outclk\,
	d => \inst1|Selector15~0_combout\,
	ena => \inst1|count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|count\(0));

-- Location: LCCOMB_X22_Y21_N22
\inst1|Selector14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Selector14~0_combout\ = (\inst1|count\(0) $ (!\inst1|count\(1))) # (!\inst1|state.b_write~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst1|count\(0),
	datac => \inst1|count\(1),
	datad => \inst1|state.b_write~q\,
	combout => \inst1|Selector14~0_combout\);

-- Location: FF_X22_Y21_N23
\inst1|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int~clkctrl_outclk\,
	d => \inst1|Selector14~0_combout\,
	ena => \inst1|count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|count\(1));

-- Location: LCCOMB_X22_Y21_N4
\inst1|Selector13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Selector13~0_combout\ = (\inst1|count\(2) $ (((!\inst1|count\(1) & !\inst1|count\(0))))) # (!\inst1|state.b_write~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|count\(1),
	datab => \inst1|state.b_write~q\,
	datac => \inst1|count\(2),
	datad => \inst1|count\(0),
	combout => \inst1|Selector13~0_combout\);

-- Location: FF_X22_Y21_N5
\inst1|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int~clkctrl_outclk\,
	d => \inst1|Selector13~0_combout\,
	ena => \inst1|count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|count\(2));

-- Location: LCCOMB_X22_Y21_N30
\inst1|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Selector1~0_combout\ = (\inst1|state.b_write~q\ & ((\inst1|count\(1)) # ((\inst1|count\(0)) # (\inst1|count\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|count\(1),
	datab => \inst1|count\(0),
	datac => \inst1|count\(2),
	datad => \inst1|state.b_write~q\,
	combout => \inst1|Selector1~0_combout\);

-- Location: LCCOMB_X22_Y22_N6
\inst1|Selector1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Selector1~1_combout\ = (\inst1|state.start~q\) # ((\inst1|Selector1~0_combout\) # ((\inst1|state.idle_2~q\ & !\inst|WideOr18~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|state.start~q\,
	datab => \inst1|state.idle_2~q\,
	datac => \inst1|Selector1~0_combout\,
	datad => \inst|WideOr18~1_combout\,
	combout => \inst1|Selector1~1_combout\);

-- Location: FF_X22_Y22_N7
\inst1|state.b_trans\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int~clkctrl_outclk\,
	d => \inst1|Selector1~1_combout\,
	clrn => \inst|state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|state.b_trans~q\);

-- Location: LCCOMB_X22_Y21_N18
\inst1|state.b_write~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|state.b_write~feeder_combout\ = \inst1|state.b_trans~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst1|state.b_trans~q\,
	combout => \inst1|state.b_write~feeder_combout\);

-- Location: FF_X22_Y21_N19
\inst1|state.b_write\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int~clkctrl_outclk\,
	d => \inst1|state.b_write~feeder_combout\,
	clrn => \inst|state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|state.b_write~q\);

-- Location: LCCOMB_X22_Y22_N0
\inst1|state~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|state~16_combout\ = (\inst1|state.b_write~q\ & (!\inst1|count\(0) & (!\inst1|count\(2) & !\inst1|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|state.b_write~q\,
	datab => \inst1|count\(0),
	datac => \inst1|count\(2),
	datad => \inst1|count\(1),
	combout => \inst1|state~16_combout\);

-- Location: FF_X22_Y22_N1
\inst1|state.ack_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int~clkctrl_outclk\,
	d => \inst1|state~16_combout\,
	clrn => \inst|state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|state.ack_1~q\);

-- Location: LCCOMB_X22_Y22_N14
\inst1|WideOr6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|WideOr6~0_combout\ = (!\inst1|state.ack_1~q\ & (!\inst1|state.b_trans~q\ & !\inst1|state.stop_1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|state.ack_1~q\,
	datab => \inst1|state.b_trans~q\,
	datac => \inst1|state.stop_1~q\,
	combout => \inst1|WideOr6~0_combout\);

-- Location: LCCOMB_X22_Y22_N22
\inst1|Selector16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Selector16~0_combout\ = ((\inst1|state.ack_1~q\) # ((\inst1|state.ack_2~q\) # (\inst1|state.error~q\))) # (!\inst1|buisy~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|buisy~0_combout\,
	datab => \inst1|state.ack_1~q\,
	datac => \inst1|state.ack_2~q\,
	datad => \inst1|state.error~q\,
	combout => \inst1|Selector16~0_combout\);

-- Location: LCCOMB_X24_Y22_N22
\inst|WideOr22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|WideOr22~0_combout\ = (!\inst|state.dp_07~q\ & (!\inst|state.dp_1E~q\ & (!\inst|state.dw_1E~q\ & !\inst|state.dw_07~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dp_07~q\,
	datab => \inst|state.dp_1E~q\,
	datac => \inst|state.dw_1E~q\,
	datad => \inst|state.dw_07~q\,
	combout => \inst|WideOr22~0_combout\);

-- Location: LCCOMB_X21_Y22_N18
\inst1|data[2]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|data[2]~7_combout\ = !\inst|WideOr22~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|WideOr22~0_combout\,
	combout => \inst1|data[2]~7_combout\);

-- Location: LCCOMB_X22_Y22_N26
\inst1|data[7]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|data[7]~2_combout\ = (!\inst1|state.idle_2~q\ & ((\inst1|state.idle~q\) # ((!\inst|state.dp_BA~q\ & !\inst|state.dp_BA_2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dp_BA~q\,
	datab => \inst|state.dp_BA_2~q\,
	datac => \inst1|state.idle~q\,
	datad => \inst1|state.idle_2~q\,
	combout => \inst1|data[7]~2_combout\);

-- Location: LCCOMB_X22_Y22_N18
\inst1|data[7]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|data[7]~3_combout\ = (\inst|state.idle~q\ & (!\inst1|data[7]~2_combout\ & !\inst1|state~15_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.idle~q\,
	datac => \inst1|data[7]~2_combout\,
	datad => \inst1|state~15_combout\,
	combout => \inst1|data[7]~3_combout\);

-- Location: FF_X21_Y22_N19
\inst1|data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int~clkctrl_outclk\,
	d => \inst1|data[2]~7_combout\,
	ena => \inst1|data[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|data\(2));

-- Location: LCCOMB_X23_Y22_N22
\inst|WideOr20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|WideOr20~combout\ = (\inst|state.dp_BA_2~q\) # ((\inst|state.dp_BA~q\) # ((\inst|state.dp_1E~q\) # (\inst|state.dw_1E~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dp_BA_2~q\,
	datab => \inst|state.dp_BA~q\,
	datac => \inst|state.dp_1E~q\,
	datad => \inst|state.dw_1E~q\,
	combout => \inst|WideOr20~combout\);

-- Location: FF_X21_Y22_N29
\inst1|data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int~clkctrl_outclk\,
	asdata => \inst|WideOr20~combout\,
	sload => VCC,
	ena => \inst1|data[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|data\(3));

-- Location: LCCOMB_X21_Y22_N20
\inst|WideOr23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|WideOr23~combout\ = ((\inst|state.dp_02~q\) # ((\inst|state.dw_02~q\) # (!\inst|WideOr22~0_combout\))) # (!\inst|count[3]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count[3]~0_combout\,
	datab => \inst|state.dp_02~q\,
	datac => \inst|state.dw_02~q\,
	datad => \inst|WideOr22~0_combout\,
	combout => \inst|WideOr23~combout\);

-- Location: LCCOMB_X21_Y22_N12
\inst1|data[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|data[1]~feeder_combout\ = \inst|WideOr23~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|WideOr23~combout\,
	combout => \inst1|data[1]~feeder_combout\);

-- Location: FF_X21_Y22_N13
\inst1|data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int~clkctrl_outclk\,
	d => \inst1|data[1]~feeder_combout\,
	ena => \inst1|data[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|data\(1));

-- Location: LCCOMB_X24_Y22_N12
\inst|WideOr24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|WideOr24~combout\ = (\inst|state.dp_81~q\) # ((\inst|state.dw_07~q\) # ((\inst|state.dp_07~q\) # (\inst|state.dw_81~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dp_81~q\,
	datab => \inst|state.dw_07~q\,
	datac => \inst|state.dp_07~q\,
	datad => \inst|state.dw_81~q\,
	combout => \inst|WideOr24~combout\);

-- Location: FF_X21_Y22_N23
\inst1|data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int~clkctrl_outclk\,
	asdata => \inst|WideOr24~combout\,
	sload => VCC,
	ena => \inst1|data[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|data\(0));

-- Location: LCCOMB_X21_Y22_N22
\inst1|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Mux0~0_combout\ = (\inst1|count\(0) & ((\inst1|data\(1)) # ((\inst1|count\(1))))) # (!\inst1|count\(0) & (((\inst1|data\(0) & !\inst1|count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|data\(1),
	datab => \inst1|count\(0),
	datac => \inst1|data\(0),
	datad => \inst1|count\(1),
	combout => \inst1|Mux0~0_combout\);

-- Location: LCCOMB_X21_Y22_N30
\inst1|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Mux0~1_combout\ = (\inst1|Mux0~0_combout\ & (((\inst1|data\(3)) # (!\inst1|count\(1))))) # (!\inst1|Mux0~0_combout\ & (\inst1|data\(2) & ((\inst1|count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|data\(2),
	datab => \inst1|data\(3),
	datac => \inst1|Mux0~0_combout\,
	datad => \inst1|count\(1),
	combout => \inst1|Mux0~1_combout\);

-- Location: LCCOMB_X19_Y22_N18
\inst1|data[5]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|data[5]~4_combout\ = (\inst|state.idle~q\ & (\inst1|data\(5) $ (((\inst|state.dp_BA_2~q\) # (\inst|state.dp_BA~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.idle~q\,
	datab => \inst|state.dp_BA_2~q\,
	datac => \inst|state.dp_BA~q\,
	datad => \inst1|data\(5),
	combout => \inst1|data[5]~4_combout\);

-- Location: LCCOMB_X19_Y22_N28
\inst1|data[5]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|data[5]~6_combout\ = (\inst1|state.idle_2~q\ & ((\inst|state.dp_00_2~q\) # ((\inst|state.dp_81~q\) # (!\inst|WideOr18~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dp_00_2~q\,
	datab => \inst1|state.idle_2~q\,
	datac => \inst|state.dp_81~q\,
	datad => \inst|WideOr18~0_combout\,
	combout => \inst1|data[5]~6_combout\);

-- Location: LCCOMB_X19_Y22_N16
\inst1|data[5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|data[5]~5_combout\ = (\inst1|data[5]~4_combout\ & ((\inst1|data\(5) $ (\inst1|data[5]~6_combout\)) # (!\inst1|state.idle~q\))) # (!\inst1|data[5]~4_combout\ & (((\inst1|data\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111110011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|state.idle~q\,
	datab => \inst1|data[5]~4_combout\,
	datac => \inst1|data\(5),
	datad => \inst1|data[5]~6_combout\,
	combout => \inst1|data[5]~5_combout\);

-- Location: FF_X19_Y22_N17
\inst1|data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int~clkctrl_outclk\,
	d => \inst1|data[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|data\(5));

-- Location: LCCOMB_X21_Y22_N28
\inst1|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Mux0~2_combout\ = (!\inst1|count\(1) & ((\inst1|count\(0) & (\inst1|data\(5))) # (!\inst1|count\(0) & ((\inst1|data\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|data\(5),
	datab => \inst1|count\(0),
	datac => \inst1|data\(3),
	datad => \inst1|count\(1),
	combout => \inst1|Mux0~2_combout\);

-- Location: LCCOMB_X23_Y22_N12
\inst|WideOr19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|WideOr19~combout\ = (\inst|state.dp_81~q\) # ((\inst|state.dp_BA~q\) # ((\inst|state.dw_81~q\) # (\inst|state.dp_BA_2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dp_81~q\,
	datab => \inst|state.dp_BA~q\,
	datac => \inst|state.dw_81~q\,
	datad => \inst|state.dp_BA_2~q\,
	combout => \inst|WideOr19~combout\);

-- Location: FF_X21_Y22_N25
\inst1|data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int~clkctrl_outclk\,
	asdata => \inst|WideOr19~combout\,
	sload => VCC,
	ena => \inst1|data[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|data\(7));

-- Location: LCCOMB_X21_Y22_N24
\inst1|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Mux0~3_combout\ = (\inst1|count\(0) & (\inst1|data\(7) & \inst1|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst1|count\(0),
	datac => \inst1|data\(7),
	datad => \inst1|count\(1),
	combout => \inst1|Mux0~3_combout\);

-- Location: LCCOMB_X21_Y22_N14
\inst1|Mux0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Mux0~4_combout\ = (\inst1|count\(2) & (((\inst1|Mux0~2_combout\) # (\inst1|Mux0~3_combout\)))) # (!\inst1|count\(2) & (\inst1|Mux0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|Mux0~1_combout\,
	datab => \inst1|Mux0~2_combout\,
	datac => \inst1|count\(2),
	datad => \inst1|Mux0~3_combout\,
	combout => \inst1|Mux0~4_combout\);

-- Location: LCCOMB_X22_Y22_N4
\inst1|Selector16~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Selector16~1_combout\ = (\inst1|Selector16~0_combout\) # ((\inst1|Mux0~4_combout\ & ((\inst1|state.b_write~q\) # (\inst1|state.b_trans~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|state.b_write~q\,
	datab => \inst1|state.b_trans~q\,
	datac => \inst1|Selector16~0_combout\,
	datad => \inst1|Mux0~4_combout\,
	combout => \inst1|Selector16~1_combout\);

-- Location: LCCOMB_X23_Y22_N28
\inst|state.done~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|state.done~0_combout\ = (\inst|state.done~q\) # ((\inst|state.stop_2~q\ & ((\inst1|state.idle_2~q\) # (!\inst1|state.idle~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|state.idle~q\,
	datab => \inst|state.stop_2~q\,
	datac => \inst|state.done~q\,
	datad => \inst1|state.idle_2~q\,
	combout => \inst|state.done~0_combout\);

-- Location: FF_X23_Y22_N29
\inst|state.done\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|clk_int_2~clkctrl_outclk\,
	d => \inst|state.done~0_combout\,
	clrn => \inst|ALT_INV_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.done~q\);

ww_DONE <= \DONE~output_o\;

ww_sca <= \sca~output_o\;

ww_trigg <= \trigg~output_o\;

ww_clk_out <= \clk_out~output_o\;

ww_reset_camara <= \reset_camara~output_o\;

ww_Res_int <= \Res_int~output_o\;

ww_stop_int <= \stop_int~output_o\;

ww_R_W_iknt <= \R_W_iknt~output_o\;

ww_S_T_int <= \S_T_int~output_o\;

ww_CLK_int <= \CLK_int~output_o\;

ww_Buisy_int <= \Buisy_int~output_o\;

ww_ERR_int <= \ERR_int~output_o\;

ww_Data(7) <= \Data[7]~output_o\;

ww_Data(6) <= \Data[6]~output_o\;

ww_Data(5) <= \Data[5]~output_o\;

ww_Data(4) <= \Data[4]~output_o\;

ww_Data(3) <= \Data[3]~output_o\;

ww_Data(2) <= \Data[2]~output_o\;

ww_Data(1) <= \Data[1]~output_o\;

ww_Data(0) <= \Data[0]~output_o\;

sda <= \sda~output_o\;
END structure;


