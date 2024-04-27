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

-- DATE "04/27/2024 15:10:11"

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

ENTITY 	programador IS
    PORT (
	clk_div4 : OUT std_logic;
	clk_div2 : OUT std_logic;
	count : OUT std_logic_vector(1 DOWNTO 0);
	clk : IN std_logic;
	start : IN std_logic;
	stop : IN std_logic;
	reset : IN std_logic;
	buisy : OUT std_logic_vector(1 DOWNTO 0)
	);
END programador;

-- Design Ports Information
-- clk_div4	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_div2	=>  Location: PIN_34,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- count[0]	=>  Location: PIN_30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- count[1]	=>  Location: PIN_32,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buisy[0]	=>  Location: PIN_31,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buisy[1]	=>  Location: PIN_10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- stop	=>  Location: PIN_33,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start	=>  Location: PIN_11,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF programador IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk_div4 : std_logic;
SIGNAL ww_clk_div2 : std_logic;
SIGNAL ww_count : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_clk : std_logic;
SIGNAL ww_start : std_logic;
SIGNAL ww_stop : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_buisy : std_logic_vector(1 DOWNTO 0);
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_div4~output_o\ : std_logic;
SIGNAL \clk_div2~output_o\ : std_logic;
SIGNAL \count[0]~output_o\ : std_logic;
SIGNAL \count[1]~output_o\ : std_logic;
SIGNAL \buisy[0]~output_o\ : std_logic;
SIGNAL \buisy[1]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \clk_div2_int~0_combout\ : std_logic;
SIGNAL \clk_div2_int~feeder_combout\ : std_logic;
SIGNAL \clk_div2_int~q\ : std_logic;
SIGNAL \clk_div4_int~0_combout\ : std_logic;
SIGNAL \clk_div4_int~q\ : std_logic;
SIGNAL \stop~input_o\ : std_logic;
SIGNAL \start~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \count[0]~0_combout\ : std_logic;
SIGNAL \count[0]~1_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \state.start_1~q\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \state.start_2~q\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \state.hold~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \state.idle~q\ : std_logic;
SIGNAL \count[0]~2_combout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \count_int[1]~0_combout\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \count[0]~reg0_q\ : std_logic;
SIGNAL \count[1]~reg0_q\ : std_logic;
SIGNAL \buisy~0_combout\ : std_logic;
SIGNAL \buisy~1_combout\ : std_logic;
SIGNAL count_int : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_buisy~1_combout\ : std_logic;
SIGNAL \ALT_INV_buisy~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

clk_div4 <= ww_clk_div4;
clk_div2 <= ww_clk_div2;
count <= ww_count;
ww_clk <= clk;
ww_start <= start;
ww_stop <= stop;
ww_reset <= reset;
buisy <= ww_buisy;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\ALT_INV_buisy~1_combout\ <= NOT \buisy~1_combout\;
\ALT_INV_buisy~0_combout\ <= NOT \buisy~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y9_N9
\clk_div4~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clk_div4_int~q\,
	devoe => ww_devoe,
	o => \clk_div4~output_o\);

-- Location: IOOBUF_X0_Y5_N16
\clk_div2~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clk_div2_int~q\,
	devoe => ww_devoe,
	o => \clk_div2~output_o\);

-- Location: IOOBUF_X0_Y8_N16
\count[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \count[0]~reg0_q\,
	devoe => ww_devoe,
	o => \count[0]~output_o\);

-- Location: IOOBUF_X0_Y6_N16
\count[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \count[1]~reg0_q\,
	devoe => ww_devoe,
	o => \count[1]~output_o\);

-- Location: IOOBUF_X0_Y7_N2
\buisy[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_buisy~0_combout\,
	devoe => ww_devoe,
	o => \buisy[0]~output_o\);

-- Location: IOOBUF_X0_Y18_N16
\buisy[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_buisy~1_combout\,
	devoe => ww_devoe,
	o => \buisy[1]~output_o\);

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

-- Location: LCCOMB_X2_Y10_N18
\clk_div2_int~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div2_int~0_combout\ = !\clk_div2_int~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div2_int~q\,
	combout => \clk_div2_int~0_combout\);

-- Location: LCCOMB_X2_Y10_N0
\clk_div2_int~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div2_int~feeder_combout\ = \clk_div2_int~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clk_div2_int~0_combout\,
	combout => \clk_div2_int~feeder_combout\);

-- Location: FF_X2_Y10_N1
clk_div2_int : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clk_div2_int~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div2_int~q\);

-- Location: LCCOMB_X2_Y10_N10
\clk_div4_int~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div4_int~0_combout\ = !\clk_div4_int~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clk_div4_int~q\,
	combout => \clk_div4_int~0_combout\);

-- Location: FF_X2_Y10_N11
clk_div4_int : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_div2_int~q\,
	d => \clk_div4_int~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div4_int~q\);

-- Location: IOIBUF_X0_Y6_N22
\stop~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_stop,
	o => \stop~input_o\);

-- Location: IOIBUF_X0_Y18_N22
\start~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

-- Location: IOIBUF_X0_Y11_N15
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: LCCOMB_X1_Y10_N2
\count[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[0]~0_combout\ = (\reset~input_o\) # (!\state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \state.idle~q\,
	combout => \count[0]~0_combout\);

-- Location: LCCOMB_X1_Y10_N24
\count[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[0]~1_combout\ = (!\state.hold~q\ & (!\count[0]~0_combout\ & ((!\state.start_2~q\) # (!count_int(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.hold~q\,
	datab => count_int(1),
	datac => \state.start_2~q\,
	datad => \count[0]~0_combout\,
	combout => \count[0]~1_combout\);

-- Location: FF_X1_Y10_N11
\count_int[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Selector8~0_combout\,
	sload => VCC,
	ena => \count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_int(0));

-- Location: LCCOMB_X1_Y10_N20
\LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (!\clk_div4_int~q\ & ((count_int(1)) # (count_int(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div4_int~q\,
	datab => count_int(1),
	datad => count_int(0),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X1_Y10_N30
\Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (\LessThan0~0_combout\ & (\start~input_o\ & ((!\state.idle~q\)))) # (!\LessThan0~0_combout\ & ((\state.start_1~q\) # ((\start~input_o\ & !\state.idle~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \start~input_o\,
	datac => \state.start_1~q\,
	datad => \state.idle~q\,
	combout => \Selector1~0_combout\);

-- Location: CLKCTRL_G4
\reset~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~inputclkctrl_outclk\);

-- Location: FF_X1_Y10_N31
\state.start_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector1~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.start_1~q\);

-- Location: LCCOMB_X1_Y10_N8
\Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\LessThan0~0_combout\ & ((\state.start_1~q\) # ((!count_int(1) & \state.start_2~q\)))) # (!\LessThan0~0_combout\ & (!count_int(1) & (\state.start_2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => count_int(1),
	datac => \state.start_2~q\,
	datad => \state.start_1~q\,
	combout => \Selector2~0_combout\);

-- Location: FF_X1_Y10_N9
\state.start_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector2~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.start_2~q\);

-- Location: LCCOMB_X1_Y10_N12
\Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\stop~input_o\ & (\state.start_2~q\ & ((count_int(1))))) # (!\stop~input_o\ & ((\state.hold~q\) # ((\state.start_2~q\ & count_int(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stop~input_o\,
	datab => \state.start_2~q\,
	datac => \state.hold~q\,
	datad => count_int(1),
	combout => \Selector3~0_combout\);

-- Location: FF_X1_Y10_N13
\state.hold\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector3~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.hold~q\);

-- Location: LCCOMB_X1_Y10_N6
\Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\stop~input_o\ & (!\state.hold~q\ & ((\start~input_o\) # (\state.idle~q\)))) # (!\stop~input_o\ & ((\start~input_o\) # ((\state.idle~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stop~input_o\,
	datab => \start~input_o\,
	datac => \state.idle~q\,
	datad => \state.hold~q\,
	combout => \Selector0~0_combout\);

-- Location: FF_X1_Y10_N7
\state.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector0~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.idle~q\);

-- Location: LCCOMB_X1_Y10_N22
\count[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[0]~2_combout\ = ((\reset~input_o\) # ((\state.start_2~q\ & count_int(1)))) # (!\state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.idle~q\,
	datab => \reset~input_o\,
	datac => \state.start_2~q\,
	datad => count_int(1),
	combout => \count[0]~2_combout\);

-- Location: LCCOMB_X1_Y10_N18
\Selector7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (\state.start_2~q\ & (count_int(1) $ (count_int(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_int(1),
	datac => \state.start_2~q\,
	datad => count_int(0),
	combout => \Selector7~0_combout\);

-- Location: LCCOMB_X1_Y10_N16
\count_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_int[1]~0_combout\ = (\count[0]~2_combout\ & (((count_int(1))))) # (!\count[0]~2_combout\ & ((\state.hold~q\ & ((count_int(1)))) # (!\state.hold~q\ & (\Selector7~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[0]~2_combout\,
	datab => \Selector7~0_combout\,
	datac => count_int(1),
	datad => \state.hold~q\,
	combout => \count_int[1]~0_combout\);

-- Location: FF_X1_Y10_N17
\count_int[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_int[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_int(1));

-- Location: LCCOMB_X1_Y10_N26
\Selector8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = (\state.start_2~q\ & (((!count_int(0))))) # (!\state.start_2~q\ & ((\clk_div4_int~q\) # ((!count_int(1) & !count_int(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div4_int~q\,
	datab => count_int(1),
	datac => \state.start_2~q\,
	datad => count_int(0),
	combout => \Selector8~0_combout\);

-- Location: FF_X1_Y10_N21
\count[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Selector8~0_combout\,
	sload => VCC,
	ena => \count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[0]~reg0_q\);

-- Location: FF_X1_Y10_N19
\count[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector7~0_combout\,
	ena => \count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[1]~reg0_q\);

-- Location: LCCOMB_X1_Y10_N28
\buisy~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \buisy~0_combout\ = (\state.start_2~q\) # (!\state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.start_2~q\,
	datad => \state.idle~q\,
	combout => \buisy~0_combout\);

-- Location: LCCOMB_X1_Y10_N4
\buisy~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \buisy~1_combout\ = (\state.start_1~q\) # (!\state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.start_1~q\,
	datad => \state.idle~q\,
	combout => \buisy~1_combout\);

ww_clk_div4 <= \clk_div4~output_o\;

ww_clk_div2 <= \clk_div2~output_o\;

ww_count(0) <= \count[0]~output_o\;

ww_count(1) <= \count[1]~output_o\;

ww_buisy(0) <= \buisy[0]~output_o\;

ww_buisy(1) <= \buisy[1]~output_o\;
END structure;


