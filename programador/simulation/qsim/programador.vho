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

-- DATE "05/08/2024 11:40:20"

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

ENTITY 	controlador IS
    PORT (
	clk : IN std_logic;
	start : IN std_logic;
	reset : IN std_logic;
	buisy : IN std_logic;
	err : IN std_logic;
	done_s : OUT std_logic;
	clk_o : OUT std_logic;
	r_s : OUT std_logic;
	s_t : OUT std_logic;
	w : OUT std_logic;
	stop : OUT std_logic;
	data : OUT std_logic_vector(7 DOWNTO 0)
	);
END controlador;

-- Design Ports Information
-- done_s	=>  Location: PIN_42,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_o	=>  Location: PIN_60,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_s	=>  Location: PIN_34,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_t	=>  Location: PIN_43,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- w	=>  Location: PIN_30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- stop	=>  Location: PIN_31,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[0]	=>  Location: PIN_38,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[1]	=>  Location: PIN_32,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[2]	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[3]	=>  Location: PIN_11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[4]	=>  Location: PIN_10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[5]	=>  Location: PIN_44,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[6]	=>  Location: PIN_124,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[7]	=>  Location: PIN_33,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buisy	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- err	=>  Location: PIN_7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start	=>  Location: PIN_39,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF controlador IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_start : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_buisy : std_logic;
SIGNAL ww_err : std_logic;
SIGNAL ww_done_s : std_logic;
SIGNAL ww_clk_o : std_logic;
SIGNAL ww_r_s : std_logic;
SIGNAL ww_s_t : std_logic;
SIGNAL ww_w : std_logic;
SIGNAL ww_stop : std_logic;
SIGNAL ww_data : std_logic_vector(7 DOWNTO 0);
SIGNAL \state.idle~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \done_s~output_o\ : std_logic;
SIGNAL \clk_o~output_o\ : std_logic;
SIGNAL \r_s~output_o\ : std_logic;
SIGNAL \s_t~output_o\ : std_logic;
SIGNAL \w~output_o\ : std_logic;
SIGNAL \stop~output_o\ : std_logic;
SIGNAL \data[0]~output_o\ : std_logic;
SIGNAL \data[1]~output_o\ : std_logic;
SIGNAL \data[2]~output_o\ : std_logic;
SIGNAL \data[3]~output_o\ : std_logic;
SIGNAL \data[4]~output_o\ : std_logic;
SIGNAL \data[5]~output_o\ : std_logic;
SIGNAL \data[6]~output_o\ : std_logic;
SIGNAL \data[7]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \buisy~input_o\ : std_logic;
SIGNAL \start~input_o\ : std_logic;
SIGNAL \state.idle~1_combout\ : std_logic;
SIGNAL \err~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \state.idle~0_combout\ : std_logic;
SIGNAL \state.idle~0clkctrl_outclk\ : std_logic;
SIGNAL \state.idle~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \state.dp_BA~q\ : std_logic;
SIGNAL \WideOr18~0_combout\ : std_logic;
SIGNAL \WideOr18~1_combout\ : std_logic;
SIGNAL \count[0]~0_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Selector24~0_combout\ : std_logic;
SIGNAL \count[0]~1_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Selector23~0_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Selector22~0_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Selector21~0_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Selector20~0_combout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Selector19~0_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \Selector18~0_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Selector17~0_combout\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \state.dp_07~q\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \state.dw_07~q\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \state.dp_00~q\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \state.dw_00~q\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \state.dp_02~q\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \state.dw_02~q\ : std_logic;
SIGNAL \state.stop_1~q\ : std_logic;
SIGNAL \state.dp_BA_2~feeder_combout\ : std_logic;
SIGNAL \state.dp_BA_2~q\ : std_logic;
SIGNAL \Selector9~0_combout\ : std_logic;
SIGNAL \state.dp_1E~q\ : std_logic;
SIGNAL \Selector10~0_combout\ : std_logic;
SIGNAL \state.dw_1E~q\ : std_logic;
SIGNAL \Selector11~0_combout\ : std_logic;
SIGNAL \state.dp_81~q\ : std_logic;
SIGNAL \Selector12~0_combout\ : std_logic;
SIGNAL \state.dw_81~q\ : std_logic;
SIGNAL \Selector13~0_combout\ : std_logic;
SIGNAL \state.dp_00_2~q\ : std_logic;
SIGNAL \Selector14~0_combout\ : std_logic;
SIGNAL \state.dw_00_2~q\ : std_logic;
SIGNAL \state.stop_2~q\ : std_logic;
SIGNAL \state.done~0_combout\ : std_logic;
SIGNAL \state.done~q\ : std_logic;
SIGNAL \clk_int2~0_combout\ : std_logic;
SIGNAL \clk_int2~q\ : std_logic;
SIGNAL \clk_int4~0_combout\ : std_logic;
SIGNAL \clk_int4~q\ : std_logic;
SIGNAL \stop~0_combout\ : std_logic;
SIGNAL \WideOr24~combout\ : std_logic;
SIGNAL \WideOr22~0_combout\ : std_logic;
SIGNAL \WideOr23~combout\ : std_logic;
SIGNAL \WideOr21~combout\ : std_logic;
SIGNAL \WideOr19~combout\ : std_logic;
SIGNAL count : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_WideOr22~0_combout\ : std_logic;
SIGNAL \ALT_INV_WideOr18~1_combout\ : std_logic;
SIGNAL \ALT_INV_count[0]~0_combout\ : std_logic;
SIGNAL \ALT_INV_state.idle~q\ : std_logic;
SIGNAL \ALT_INV_state.idle~0clkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_buisy~input_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_start <= start;
ww_reset <= reset;
ww_buisy <= buisy;
ww_err <= err;
done_s <= ww_done_s;
clk_o <= ww_clk_o;
r_s <= ww_r_s;
s_t <= ww_s_t;
w <= ww_w;
stop <= ww_stop;
data <= ww_data;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\state.idle~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \state.idle~0_combout\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_WideOr22~0_combout\ <= NOT \WideOr22~0_combout\;
\ALT_INV_WideOr18~1_combout\ <= NOT \WideOr18~1_combout\;
\ALT_INV_count[0]~0_combout\ <= NOT \count[0]~0_combout\;
\ALT_INV_state.idle~q\ <= NOT \state.idle~q\;
\ALT_INV_state.idle~0clkctrl_outclk\ <= NOT \state.idle~0clkctrl_outclk\;
\ALT_INV_buisy~input_o\ <= NOT \buisy~input_o\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X3_Y0_N2
\done_s~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \state.done~q\,
	devoe => ww_devoe,
	o => \done_s~output_o\);

-- Location: IOOBUF_X23_Y0_N9
\clk_o~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clk_int4~q\,
	devoe => ww_devoe,
	o => \clk_o~output_o\);

-- Location: IOOBUF_X0_Y5_N16
\r_s~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_state.idle~q\,
	devoe => ww_devoe,
	o => \r_s~output_o\);

-- Location: IOOBUF_X5_Y0_N23
\s_t~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_count[0]~0_combout\,
	devoe => ww_devoe,
	o => \s_t~output_o\);

-- Location: IOOBUF_X0_Y8_N16
\w~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr18~1_combout\,
	devoe => ww_devoe,
	o => \w~output_o\);

-- Location: IOOBUF_X0_Y7_N2
\stop~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \stop~0_combout\,
	devoe => ww_devoe,
	o => \stop~output_o\);

-- Location: IOOBUF_X1_Y0_N23
\data[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr24~combout\,
	devoe => ww_devoe,
	o => \data[0]~output_o\);

-- Location: IOOBUF_X0_Y6_N16
\data[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr23~combout\,
	devoe => ww_devoe,
	o => \data[1]~output_o\);

-- Location: IOOBUF_X0_Y9_N9
\data[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr22~0_combout\,
	devoe => ww_devoe,
	o => \data[2]~output_o\);

-- Location: IOOBUF_X0_Y18_N23
\data[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr21~combout\,
	devoe => ww_devoe,
	o => \data[3]~output_o\);

-- Location: IOOBUF_X0_Y18_N16
\data[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr21~combout\,
	devoe => ww_devoe,
	o => \data[4]~output_o\);

-- Location: IOOBUF_X5_Y0_N16
\data[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_count[0]~0_combout\,
	devoe => ww_devoe,
	o => \data[5]~output_o\);

-- Location: IOOBUF_X18_Y24_N16
\data[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \data[6]~output_o\);

-- Location: IOOBUF_X0_Y6_N23
\data[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr19~combout\,
	devoe => ww_devoe,
	o => \data[7]~output_o\);

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

-- Location: IOIBUF_X0_Y11_N15
\buisy~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buisy,
	o => \buisy~input_o\);

-- Location: IOIBUF_X1_Y0_N15
\start~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

-- Location: LCCOMB_X4_Y8_N10
\state.idle~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.idle~1_combout\ = (\start~input_o\) # (\state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \start~input_o\,
	datac => \state.idle~q\,
	combout => \state.idle~1_combout\);

-- Location: IOIBUF_X0_Y21_N8
\err~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_err,
	o => \err~input_o\);

-- Location: IOIBUF_X0_Y11_N22
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: LCCOMB_X1_Y11_N16
\state.idle~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.idle~0_combout\ = (\err~input_o\) # (\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \err~input_o\,
	datad => \reset~input_o\,
	combout => \state.idle~0_combout\);

-- Location: CLKCTRL_G0
\state.idle~0clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \state.idle~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \state.idle~0clkctrl_outclk\);

-- Location: FF_X4_Y8_N11
\state.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.idle~1_combout\,
	clrn => \ALT_INV_state.idle~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.idle~q\);

-- Location: LCCOMB_X4_Y8_N20
\Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\buisy~input_o\ & ((\state.dp_BA~q\) # ((\start~input_o\ & !\state.idle~q\)))) # (!\buisy~input_o\ & (\start~input_o\ & ((!\state.idle~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buisy~input_o\,
	datab => \start~input_o\,
	datac => \state.dp_BA~q\,
	datad => \state.idle~q\,
	combout => \Selector0~0_combout\);

-- Location: FF_X4_Y8_N21
\state.dp_BA\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector0~0_combout\,
	clrn => \ALT_INV_state.idle~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.dp_BA~q\);

-- Location: LCCOMB_X6_Y8_N16
\WideOr18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr18~0_combout\ = (!\state.dp_00~q\ & (!\state.dp_02~q\ & (!\state.dp_1E~q\ & !\state.dp_07~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.dp_00~q\,
	datab => \state.dp_02~q\,
	datac => \state.dp_1E~q\,
	datad => \state.dp_07~q\,
	combout => \WideOr18~0_combout\);

-- Location: LCCOMB_X6_Y8_N10
\WideOr18~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr18~1_combout\ = (!\state.dp_00_2~q\ & (!\state.dp_81~q\ & \WideOr18~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.dp_00_2~q\,
	datac => \state.dp_81~q\,
	datad => \WideOr18~0_combout\,
	combout => \WideOr18~1_combout\);

-- Location: LCCOMB_X4_Y8_N28
\count[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[0]~0_combout\ = (!\state.dp_BA_2~q\ & !\state.dp_BA~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.dp_BA_2~q\,
	datad => \state.dp_BA~q\,
	combout => \count[0]~0_combout\);

-- Location: LCCOMB_X5_Y8_N4
\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = count(0) $ (VCC)
-- \Add0~1\ = CARRY(count(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCCOMB_X5_Y8_N22
\Selector24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector24~0_combout\ = ((\WideOr18~1_combout\) # ((\Add0~0_combout\) # (!\Add0~16_combout\))) # (!\count[0]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[0]~0_combout\,
	datab => \WideOr18~1_combout\,
	datac => \Add0~0_combout\,
	datad => \Add0~16_combout\,
	combout => \Selector24~0_combout\);

-- Location: LCCOMB_X6_Y8_N18
\count[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[0]~1_combout\ = (!\state.idle~0_combout\ & ((\count[0]~0_combout\ & ((!\WideOr18~1_combout\))) # (!\count[0]~0_combout\ & (!\buisy~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buisy~input_o\,
	datab => \state.idle~0_combout\,
	datac => \count[0]~0_combout\,
	datad => \WideOr18~1_combout\,
	combout => \count[0]~1_combout\);

-- Location: FF_X5_Y8_N23
\count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector24~0_combout\,
	ena => \count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(0));

-- Location: LCCOMB_X5_Y8_N6
\Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (count(1) & (\Add0~1\ & VCC)) # (!count(1) & (!\Add0~1\))
-- \Add0~3\ = CARRY((!count(1) & !\Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(1),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X5_Y8_N28
\Selector23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector23~0_combout\ = (\Add0~2_combout\) # ((\WideOr18~1_combout\) # ((!\Add0~16_combout\) # (!\count[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~2_combout\,
	datab => \WideOr18~1_combout\,
	datac => \count[0]~0_combout\,
	datad => \Add0~16_combout\,
	combout => \Selector23~0_combout\);

-- Location: FF_X5_Y8_N29
\count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector23~0_combout\,
	ena => \count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(1));

-- Location: LCCOMB_X5_Y8_N8
\Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (count(2) & ((GND) # (!\Add0~3\))) # (!count(2) & (\Add0~3\ $ (GND)))
-- \Add0~5\ = CARRY((count(2)) # (!\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(2),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X5_Y8_N26
\Selector22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector22~0_combout\ = ((\WideOr18~1_combout\) # ((\Add0~4_combout\) # (!\Add0~16_combout\))) # (!\count[0]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[0]~0_combout\,
	datab => \WideOr18~1_combout\,
	datac => \Add0~4_combout\,
	datad => \Add0~16_combout\,
	combout => \Selector22~0_combout\);

-- Location: FF_X5_Y8_N27
\count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector22~0_combout\,
	ena => \count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(2));

-- Location: LCCOMB_X5_Y8_N10
\Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (count(3) & (\Add0~5\ & VCC)) # (!count(3) & (!\Add0~5\))
-- \Add0~7\ = CARRY((!count(3) & !\Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X5_Y8_N0
\Selector21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector21~0_combout\ = (\Add0~6_combout\) # ((\WideOr18~1_combout\) # ((!\Add0~16_combout\) # (!\count[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~6_combout\,
	datab => \WideOr18~1_combout\,
	datac => \count[0]~0_combout\,
	datad => \Add0~16_combout\,
	combout => \Selector21~0_combout\);

-- Location: FF_X5_Y8_N1
\count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector21~0_combout\,
	ena => \count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(3));

-- Location: LCCOMB_X5_Y8_N12
\Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (count(4) & ((GND) # (!\Add0~7\))) # (!count(4) & (\Add0~7\ $ (GND)))
-- \Add0~9\ = CARRY((count(4)) # (!\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(4),
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X5_Y8_N30
\Selector20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector20~0_combout\ = (\Add0~8_combout\) # ((\WideOr18~1_combout\) # ((!\Add0~16_combout\) # (!\count[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~8_combout\,
	datab => \WideOr18~1_combout\,
	datac => \count[0]~0_combout\,
	datad => \Add0~16_combout\,
	combout => \Selector20~0_combout\);

-- Location: FF_X5_Y8_N31
\count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector20~0_combout\,
	ena => \count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(4));

-- Location: LCCOMB_X5_Y8_N14
\Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (count(5) & (\Add0~9\ & VCC)) # (!count(5) & (!\Add0~9\))
-- \Add0~11\ = CARRY((!count(5) & !\Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(5),
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCCOMB_X5_Y8_N2
\Selector19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector19~0_combout\ = ((\WideOr18~1_combout\) # ((\Add0~10_combout\) # (!\Add0~16_combout\))) # (!\count[0]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[0]~0_combout\,
	datab => \WideOr18~1_combout\,
	datac => \Add0~10_combout\,
	datad => \Add0~16_combout\,
	combout => \Selector19~0_combout\);

-- Location: FF_X5_Y8_N3
\count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector19~0_combout\,
	ena => \count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(5));

-- Location: LCCOMB_X5_Y8_N16
\Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (count(6) & ((GND) # (!\Add0~11\))) # (!count(6) & (\Add0~11\ $ (GND)))
-- \Add0~13\ = CARRY((count(6)) # (!\Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(6),
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: LCCOMB_X5_Y8_N24
\Selector18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector18~0_combout\ = ((\Add0~12_combout\) # ((\WideOr18~1_combout\) # (!\Add0~16_combout\))) # (!\count[0]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[0]~0_combout\,
	datab => \Add0~12_combout\,
	datac => \WideOr18~1_combout\,
	datad => \Add0~16_combout\,
	combout => \Selector18~0_combout\);

-- Location: FF_X5_Y8_N25
\count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector18~0_combout\,
	ena => \count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(6));

-- Location: LCCOMB_X5_Y8_N18
\Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (count(7) & (\Add0~13\ & VCC)) # (!count(7) & (!\Add0~13\))
-- \Add0~15\ = CARRY((!count(7) & !\Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(7),
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

-- Location: LCCOMB_X6_Y8_N2
\Selector17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector17~0_combout\ = (\WideOr18~1_combout\) # ((\Add0~14_combout\) # ((!\Add0~16_combout\) # (!\count[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideOr18~1_combout\,
	datab => \Add0~14_combout\,
	datac => \count[0]~0_combout\,
	datad => \Add0~16_combout\,
	combout => \Selector17~0_combout\);

-- Location: FF_X6_Y8_N3
\count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector17~0_combout\,
	ena => \count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(7));

-- Location: LCCOMB_X5_Y8_N20
\Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = !\Add0~15\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add0~15\,
	combout => \Add0~16_combout\);

-- Location: LCCOMB_X6_Y8_N20
\Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (\buisy~input_o\ & (((\state.dp_07~q\ & \Add0~16_combout\)))) # (!\buisy~input_o\ & ((\state.dp_BA~q\) # ((\state.dp_07~q\ & \Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buisy~input_o\,
	datab => \state.dp_BA~q\,
	datac => \state.dp_07~q\,
	datad => \Add0~16_combout\,
	combout => \Selector1~0_combout\);

-- Location: FF_X6_Y8_N21
\state.dp_07\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector1~0_combout\,
	clrn => \ALT_INV_state.idle~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.dp_07~q\);

-- Location: LCCOMB_X6_Y8_N28
\Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\buisy~input_o\ & ((\state.dw_07~q\) # ((\state.dp_07~q\ & !\Add0~16_combout\)))) # (!\buisy~input_o\ & (\state.dp_07~q\ & ((!\Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buisy~input_o\,
	datab => \state.dp_07~q\,
	datac => \state.dw_07~q\,
	datad => \Add0~16_combout\,
	combout => \Selector2~0_combout\);

-- Location: FF_X6_Y8_N29
\state.dw_07\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector2~0_combout\,
	clrn => \ALT_INV_state.idle~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.dw_07~q\);

-- Location: LCCOMB_X6_Y8_N6
\Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\buisy~input_o\ & (((\state.dp_00~q\ & \Add0~16_combout\)))) # (!\buisy~input_o\ & ((\state.dw_07~q\) # ((\state.dp_00~q\ & \Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buisy~input_o\,
	datab => \state.dw_07~q\,
	datac => \state.dp_00~q\,
	datad => \Add0~16_combout\,
	combout => \Selector3~0_combout\);

-- Location: FF_X6_Y8_N7
\state.dp_00\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector3~0_combout\,
	clrn => \ALT_INV_state.idle~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.dp_00~q\);

-- Location: LCCOMB_X6_Y8_N8
\Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\buisy~input_o\ & ((\state.dw_00~q\) # ((\state.dp_00~q\ & !\Add0~16_combout\)))) # (!\buisy~input_o\ & (\state.dp_00~q\ & ((!\Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buisy~input_o\,
	datab => \state.dp_00~q\,
	datac => \state.dw_00~q\,
	datad => \Add0~16_combout\,
	combout => \Selector4~0_combout\);

-- Location: FF_X6_Y8_N9
\state.dw_00\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector4~0_combout\,
	clrn => \ALT_INV_state.idle~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.dw_00~q\);

-- Location: LCCOMB_X6_Y8_N4
\Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (\buisy~input_o\ & (((\state.dp_02~q\ & \Add0~16_combout\)))) # (!\buisy~input_o\ & ((\state.dw_00~q\) # ((\state.dp_02~q\ & \Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buisy~input_o\,
	datab => \state.dw_00~q\,
	datac => \state.dp_02~q\,
	datad => \Add0~16_combout\,
	combout => \Selector5~0_combout\);

-- Location: FF_X6_Y8_N5
\state.dp_02\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector5~0_combout\,
	clrn => \ALT_INV_state.idle~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.dp_02~q\);

-- Location: LCCOMB_X4_Y8_N22
\Selector6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (\buisy~input_o\ & ((\state.dw_02~q\) # ((\state.dp_02~q\ & !\Add0~16_combout\)))) # (!\buisy~input_o\ & (\state.dp_02~q\ & ((!\Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buisy~input_o\,
	datab => \state.dp_02~q\,
	datac => \state.dw_02~q\,
	datad => \Add0~16_combout\,
	combout => \Selector6~0_combout\);

-- Location: FF_X4_Y8_N23
\state.dw_02\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector6~0_combout\,
	clrn => \ALT_INV_state.idle~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.dw_02~q\);

-- Location: FF_X4_Y8_N29
\state.stop_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \state.dw_02~q\,
	clrn => \ALT_INV_state.idle~0clkctrl_outclk\,
	sload => VCC,
	ena => \ALT_INV_buisy~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.stop_1~q\);

-- Location: LCCOMB_X4_Y8_N26
\state.dp_BA_2~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.dp_BA_2~feeder_combout\ = \state.stop_1~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \state.stop_1~q\,
	combout => \state.dp_BA_2~feeder_combout\);

-- Location: FF_X4_Y8_N27
\state.dp_BA_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.dp_BA_2~feeder_combout\,
	clrn => \ALT_INV_state.idle~0clkctrl_outclk\,
	ena => \ALT_INV_buisy~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.dp_BA_2~q\);

-- Location: LCCOMB_X6_Y8_N22
\Selector9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector9~0_combout\ = (\buisy~input_o\ & (((\state.dp_1E~q\ & \Add0~16_combout\)))) # (!\buisy~input_o\ & ((\state.dp_BA_2~q\) # ((\state.dp_1E~q\ & \Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buisy~input_o\,
	datab => \state.dp_BA_2~q\,
	datac => \state.dp_1E~q\,
	datad => \Add0~16_combout\,
	combout => \Selector9~0_combout\);

-- Location: FF_X6_Y8_N23
\state.dp_1E\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector9~0_combout\,
	clrn => \ALT_INV_state.idle~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.dp_1E~q\);

-- Location: LCCOMB_X6_Y8_N24
\Selector10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector10~0_combout\ = (\buisy~input_o\ & ((\state.dw_1E~q\) # ((\state.dp_1E~q\ & !\Add0~16_combout\)))) # (!\buisy~input_o\ & (\state.dp_1E~q\ & ((!\Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buisy~input_o\,
	datab => \state.dp_1E~q\,
	datac => \state.dw_1E~q\,
	datad => \Add0~16_combout\,
	combout => \Selector10~0_combout\);

-- Location: FF_X6_Y8_N25
\state.dw_1E\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector10~0_combout\,
	clrn => \ALT_INV_state.idle~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.dw_1E~q\);

-- Location: LCCOMB_X6_Y8_N14
\Selector11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector11~0_combout\ = (\buisy~input_o\ & (((\state.dp_81~q\ & \Add0~16_combout\)))) # (!\buisy~input_o\ & ((\state.dw_1E~q\) # ((\state.dp_81~q\ & \Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buisy~input_o\,
	datab => \state.dw_1E~q\,
	datac => \state.dp_81~q\,
	datad => \Add0~16_combout\,
	combout => \Selector11~0_combout\);

-- Location: FF_X6_Y8_N15
\state.dp_81\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector11~0_combout\,
	clrn => \ALT_INV_state.idle~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.dp_81~q\);

-- Location: LCCOMB_X4_Y8_N12
\Selector12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector12~0_combout\ = (\buisy~input_o\ & ((\state.dw_81~q\) # ((\state.dp_81~q\ & !\Add0~16_combout\)))) # (!\buisy~input_o\ & (\state.dp_81~q\ & ((!\Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buisy~input_o\,
	datab => \state.dp_81~q\,
	datac => \state.dw_81~q\,
	datad => \Add0~16_combout\,
	combout => \Selector12~0_combout\);

-- Location: FF_X4_Y8_N13
\state.dw_81\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector12~0_combout\,
	clrn => \ALT_INV_state.idle~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.dw_81~q\);

-- Location: LCCOMB_X6_Y8_N0
\Selector13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector13~0_combout\ = (\buisy~input_o\ & (((\state.dp_00_2~q\ & \Add0~16_combout\)))) # (!\buisy~input_o\ & ((\state.dw_81~q\) # ((\state.dp_00_2~q\ & \Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buisy~input_o\,
	datab => \state.dw_81~q\,
	datac => \state.dp_00_2~q\,
	datad => \Add0~16_combout\,
	combout => \Selector13~0_combout\);

-- Location: FF_X6_Y8_N1
\state.dp_00_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector13~0_combout\,
	clrn => \ALT_INV_state.idle~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.dp_00_2~q\);

-- Location: LCCOMB_X4_Y8_N8
\Selector14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector14~0_combout\ = (\buisy~input_o\ & ((\state.dw_00_2~q\) # ((\state.dp_00_2~q\ & !\Add0~16_combout\)))) # (!\buisy~input_o\ & (\state.dp_00_2~q\ & ((!\Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buisy~input_o\,
	datab => \state.dp_00_2~q\,
	datac => \state.dw_00_2~q\,
	datad => \Add0~16_combout\,
	combout => \Selector14~0_combout\);

-- Location: FF_X4_Y8_N9
\state.dw_00_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector14~0_combout\,
	clrn => \ALT_INV_state.idle~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.dw_00_2~q\);

-- Location: FF_X4_Y8_N31
\state.stop_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \state.dw_00_2~q\,
	clrn => \ALT_INV_state.idle~0clkctrl_outclk\,
	sload => VCC,
	ena => \ALT_INV_buisy~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.stop_2~q\);

-- Location: LCCOMB_X4_Y8_N24
\state.done~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.done~0_combout\ = (\state.done~q\) # ((\state.stop_2~q\ & !\buisy~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.stop_2~q\,
	datac => \state.done~q\,
	datad => \buisy~input_o\,
	combout => \state.done~0_combout\);

-- Location: FF_X4_Y8_N25
\state.done\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.done~0_combout\,
	clrn => \ALT_INV_state.idle~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.done~q\);

-- Location: LCCOMB_X24_Y1_N4
\clk_int2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_int2~0_combout\ = !\clk_int2~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clk_int2~q\,
	combout => \clk_int2~0_combout\);

-- Location: FF_X24_Y1_N19
clk_int2 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \clk_int2~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_int2~q\);

-- Location: LCCOMB_X24_Y1_N28
\clk_int4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_int4~0_combout\ = !\clk_int4~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clk_int4~q\,
	combout => \clk_int4~0_combout\);

-- Location: FF_X24_Y1_N29
clk_int4 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_int2~q\,
	d => \clk_int4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_int4~q\);

-- Location: LCCOMB_X4_Y8_N30
\stop~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \stop~0_combout\ = (\state.stop_2~q\) # (\state.stop_1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.stop_2~q\,
	datad => \state.stop_1~q\,
	combout => \stop~0_combout\);

-- Location: LCCOMB_X6_Y8_N26
WideOr24 : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr24~combout\ = (\state.dw_81~q\) # ((\state.dp_07~q\) # ((\state.dp_81~q\) # (\state.dw_07~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.dw_81~q\,
	datab => \state.dp_07~q\,
	datac => \state.dp_81~q\,
	datad => \state.dw_07~q\,
	combout => \WideOr24~combout\);

-- Location: LCCOMB_X6_Y8_N30
\WideOr22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr22~0_combout\ = (!\state.dw_1E~q\ & (!\state.dp_07~q\ & (!\state.dp_1E~q\ & !\state.dw_07~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.dw_1E~q\,
	datab => \state.dp_07~q\,
	datac => \state.dp_1E~q\,
	datad => \state.dw_07~q\,
	combout => \WideOr22~0_combout\);

-- Location: LCCOMB_X4_Y8_N4
WideOr23 : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr23~combout\ = ((\state.dp_02~q\) # ((\state.dw_02~q\) # (!\WideOr22~0_combout\))) # (!\count[0]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[0]~0_combout\,
	datab => \state.dp_02~q\,
	datac => \state.dw_02~q\,
	datad => \WideOr22~0_combout\,
	combout => \WideOr23~combout\);

-- Location: LCCOMB_X6_Y8_N12
WideOr21 : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr21~combout\ = (\state.dp_1E~q\) # ((\state.dp_BA_2~q\) # ((\state.dp_BA~q\) # (\state.dw_1E~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.dp_1E~q\,
	datab => \state.dp_BA_2~q\,
	datac => \state.dp_BA~q\,
	datad => \state.dw_1E~q\,
	combout => \WideOr21~combout\);

-- Location: LCCOMB_X4_Y8_N14
WideOr19 : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr19~combout\ = (\state.dp_BA_2~q\) # ((\state.dp_BA~q\) # ((\state.dp_81~q\) # (\state.dw_81~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.dp_BA_2~q\,
	datab => \state.dp_BA~q\,
	datac => \state.dp_81~q\,
	datad => \state.dw_81~q\,
	combout => \WideOr19~combout\);

ww_done_s <= \done_s~output_o\;

ww_clk_o <= \clk_o~output_o\;

ww_r_s <= \r_s~output_o\;

ww_s_t <= \s_t~output_o\;

ww_w <= \w~output_o\;

ww_stop <= \stop~output_o\;

ww_data(0) <= \data[0]~output_o\;

ww_data(1) <= \data[1]~output_o\;

ww_data(2) <= \data[2]~output_o\;

ww_data(3) <= \data[3]~output_o\;

ww_data(4) <= \data[4]~output_o\;

ww_data(5) <= \data[5]~output_o\;

ww_data(6) <= \data[6]~output_o\;

ww_data(7) <= \data[7]~output_o\;
END structure;


