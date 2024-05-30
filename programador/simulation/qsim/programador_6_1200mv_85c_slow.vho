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

-- DATE "05/29/2024 16:45:22"

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
	reset_camara : OUT std_logic
	);
END Block1;

-- Design Ports Information
-- DONE	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sca	=>  Location: PIN_59,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- trigg	=>  Location: PIN_65,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_out	=>  Location: PIN_30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset_camara	=>  Location: PIN_66,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sda	=>  Location: PIN_75,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start	=>  Location: PIN_25,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \sda~input_o\ : std_logic;
SIGNAL \sca~output_o\ : std_logic;
SIGNAL \sda~output_o\ : std_logic;
SIGNAL \DONE~output_o\ : std_logic;
SIGNAL \trigg~output_o\ : std_logic;
SIGNAL \clk_out~output_o\ : std_logic;
SIGNAL \reset_camara~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \start~input_o\ : std_logic;
SIGNAL \inst|state.idle~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst|state.idle~q\ : std_logic;
SIGNAL \inst|Selector0~0_combout\ : std_logic;
SIGNAL \inst|state.dp_BA~q\ : std_logic;
SIGNAL \inst|WideOr17~0_combout\ : std_logic;
SIGNAL \inst|count[0]~0_combout\ : std_logic;
SIGNAL \inst|WideOr17~1_combout\ : std_logic;
SIGNAL \inst|Add0~0_combout\ : std_logic;
SIGNAL \inst|Selector24~0_combout\ : std_logic;
SIGNAL \inst|count[0]~1_combout\ : std_logic;
SIGNAL \inst|Add0~1\ : std_logic;
SIGNAL \inst|Add0~2_combout\ : std_logic;
SIGNAL \inst|Selector23~0_combout\ : std_logic;
SIGNAL \inst|Add0~3\ : std_logic;
SIGNAL \inst|Add0~4_combout\ : std_logic;
SIGNAL \inst|Selector22~0_combout\ : std_logic;
SIGNAL \inst|Add0~5\ : std_logic;
SIGNAL \inst|Add0~6_combout\ : std_logic;
SIGNAL \inst|Selector21~0_combout\ : std_logic;
SIGNAL \inst|Add0~7\ : std_logic;
SIGNAL \inst|Add0~8_combout\ : std_logic;
SIGNAL \inst|Selector20~0_combout\ : std_logic;
SIGNAL \inst|Add0~9\ : std_logic;
SIGNAL \inst|Add0~10_combout\ : std_logic;
SIGNAL \inst|Selector19~0_combout\ : std_logic;
SIGNAL \inst|Add0~11\ : std_logic;
SIGNAL \inst|Add0~12_combout\ : std_logic;
SIGNAL \inst|Selector18~0_combout\ : std_logic;
SIGNAL \inst|Add0~13\ : std_logic;
SIGNAL \inst|Add0~14_combout\ : std_logic;
SIGNAL \inst|Selector17~0_combout\ : std_logic;
SIGNAL \inst|Add0~15\ : std_logic;
SIGNAL \inst|Add0~16_combout\ : std_logic;
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
SIGNAL \inst|state.stop_2~q\ : std_logic;
SIGNAL \inst|state.done~0_combout\ : std_logic;
SIGNAL \inst|state.done~q\ : std_logic;
SIGNAL \inst|count\ : std_logic_vector(7 DOWNTO 0);

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
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X23_Y0_N16
\sca~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sca~output_o\);

-- Location: IOOBUF_X34_Y3_N23
\sda~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sda~output_o\);

-- Location: IOOBUF_X0_Y9_N9
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

-- Location: IOOBUF_X28_Y0_N23
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

-- Location: IOOBUF_X28_Y0_N2
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

-- Location: IOIBUF_X0_Y11_N22
\start~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

-- Location: LCCOMB_X4_Y9_N24
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

-- Location: FF_X4_Y9_N25
\inst|state.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|state.idle~0_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.idle~q\);

-- Location: LCCOMB_X5_Y9_N26
\inst|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector0~0_combout\ = (!\start~input_o\ & !\inst|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \start~input_o\,
	datad => \inst|state.idle~q\,
	combout => \inst|Selector0~0_combout\);

-- Location: FF_X5_Y9_N27
\inst|state.dp_BA\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector0~0_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dp_BA~q\);

-- Location: LCCOMB_X5_Y9_N22
\inst|WideOr17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|WideOr17~0_combout\ = (\inst|state.dp_81~q\) # ((\inst|state.dp_00_2~q\) # ((\inst|state.dp_02~q\) # (\inst|state.dp_1E~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dp_81~q\,
	datab => \inst|state.dp_00_2~q\,
	datac => \inst|state.dp_02~q\,
	datad => \inst|state.dp_1E~q\,
	combout => \inst|WideOr17~0_combout\);

-- Location: LCCOMB_X5_Y9_N6
\inst|count[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|count[0]~0_combout\ = (!\inst|state.dp_BA~q\ & !\inst|state.dp_BA_2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|state.dp_BA~q\,
	datad => \inst|state.dp_BA_2~q\,
	combout => \inst|count[0]~0_combout\);

-- Location: LCCOMB_X5_Y9_N28
\inst|WideOr17~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|WideOr17~1_combout\ = (\inst|state.dp_00~q\) # ((\inst|state.dp_07~q\) # ((\inst|WideOr17~0_combout\) # (!\inst|count[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dp_00~q\,
	datab => \inst|state.dp_07~q\,
	datac => \inst|WideOr17~0_combout\,
	datad => \inst|count[0]~0_combout\,
	combout => \inst|WideOr17~1_combout\);

-- Location: LCCOMB_X6_Y9_N4
\inst|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~0_combout\ = \inst|count\(0) $ (VCC)
-- \inst|Add0~1\ = CARRY(\inst|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count\(0),
	datad => VCC,
	combout => \inst|Add0~0_combout\,
	cout => \inst|Add0~1\);

-- Location: LCCOMB_X6_Y9_N22
\inst|Selector24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector24~0_combout\ = (((\inst|Add0~0_combout\) # (!\inst|Add0~16_combout\)) # (!\inst|count[0]~0_combout\)) # (!\inst|WideOr17~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|WideOr17~1_combout\,
	datab => \inst|count[0]~0_combout\,
	datac => \inst|Add0~0_combout\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector24~0_combout\);

-- Location: LCCOMB_X5_Y9_N24
\inst|count[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|count[0]~1_combout\ = (\reset~input_o\ & \inst|WideOr17~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datad => \inst|WideOr17~1_combout\,
	combout => \inst|count[0]~1_combout\);

-- Location: FF_X6_Y9_N23
\inst|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector24~0_combout\,
	ena => \inst|count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(0));

-- Location: LCCOMB_X6_Y9_N6
\inst|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~2_combout\ = (\inst|count\(1) & (\inst|Add0~1\ & VCC)) # (!\inst|count\(1) & (!\inst|Add0~1\))
-- \inst|Add0~3\ = CARRY((!\inst|count\(1) & !\inst|Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|count\(1),
	datad => VCC,
	cin => \inst|Add0~1\,
	combout => \inst|Add0~2_combout\,
	cout => \inst|Add0~3\);

-- Location: LCCOMB_X6_Y9_N28
\inst|Selector23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector23~0_combout\ = (\inst|Add0~2_combout\) # (((!\inst|Add0~16_combout\) # (!\inst|count[0]~0_combout\)) # (!\inst|WideOr17~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add0~2_combout\,
	datab => \inst|WideOr17~1_combout\,
	datac => \inst|count[0]~0_combout\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector23~0_combout\);

-- Location: FF_X6_Y9_N29
\inst|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector23~0_combout\,
	ena => \inst|count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(1));

-- Location: LCCOMB_X6_Y9_N8
\inst|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~4_combout\ = (\inst|count\(2) & ((GND) # (!\inst|Add0~3\))) # (!\inst|count\(2) & (\inst|Add0~3\ $ (GND)))
-- \inst|Add0~5\ = CARRY((\inst|count\(2)) # (!\inst|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count\(2),
	datad => VCC,
	cin => \inst|Add0~3\,
	combout => \inst|Add0~4_combout\,
	cout => \inst|Add0~5\);

-- Location: LCCOMB_X6_Y9_N26
\inst|Selector22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector22~0_combout\ = (\inst|WideOr17~1_combout\ & (\inst|count[0]~0_combout\ & (\inst|Add0~4_combout\ & \inst|Add0~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|WideOr17~1_combout\,
	datab => \inst|count[0]~0_combout\,
	datac => \inst|Add0~4_combout\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector22~0_combout\);

-- Location: FF_X6_Y9_N27
\inst|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector22~0_combout\,
	ena => \inst|count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(2));

-- Location: LCCOMB_X6_Y9_N10
\inst|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~6_combout\ = (\inst|count\(3) & (\inst|Add0~5\ & VCC)) # (!\inst|count\(3) & (!\inst|Add0~5\))
-- \inst|Add0~7\ = CARRY((!\inst|count\(3) & !\inst|Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|count\(3),
	datad => VCC,
	cin => \inst|Add0~5\,
	combout => \inst|Add0~6_combout\,
	cout => \inst|Add0~7\);

-- Location: LCCOMB_X6_Y9_N0
\inst|Selector21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector21~0_combout\ = (\inst|Add0~6_combout\ & (\inst|WideOr17~1_combout\ & (\inst|count[0]~0_combout\ & \inst|Add0~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add0~6_combout\,
	datab => \inst|WideOr17~1_combout\,
	datac => \inst|count[0]~0_combout\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector21~0_combout\);

-- Location: FF_X6_Y9_N1
\inst|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector21~0_combout\,
	ena => \inst|count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(3));

-- Location: LCCOMB_X6_Y9_N12
\inst|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~8_combout\ = (\inst|count\(4) & ((GND) # (!\inst|Add0~7\))) # (!\inst|count\(4) & (\inst|Add0~7\ $ (GND)))
-- \inst|Add0~9\ = CARRY((\inst|count\(4)) # (!\inst|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|count\(4),
	datad => VCC,
	cin => \inst|Add0~7\,
	combout => \inst|Add0~8_combout\,
	cout => \inst|Add0~9\);

-- Location: LCCOMB_X6_Y9_N2
\inst|Selector20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector20~0_combout\ = (\inst|Add0~8_combout\ & (\inst|WideOr17~1_combout\ & (\inst|count[0]~0_combout\ & \inst|Add0~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add0~8_combout\,
	datab => \inst|WideOr17~1_combout\,
	datac => \inst|count[0]~0_combout\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector20~0_combout\);

-- Location: FF_X6_Y9_N3
\inst|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector20~0_combout\,
	ena => \inst|count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(4));

-- Location: LCCOMB_X6_Y9_N14
\inst|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~10_combout\ = (\inst|count\(5) & (\inst|Add0~9\ & VCC)) # (!\inst|count\(5) & (!\inst|Add0~9\))
-- \inst|Add0~11\ = CARRY((!\inst|count\(5) & !\inst|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count\(5),
	datad => VCC,
	cin => \inst|Add0~9\,
	combout => \inst|Add0~10_combout\,
	cout => \inst|Add0~11\);

-- Location: LCCOMB_X5_Y9_N14
\inst|Selector19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector19~0_combout\ = (\inst|count[0]~0_combout\ & (\inst|WideOr17~1_combout\ & (\inst|Add0~10_combout\ & \inst|Add0~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count[0]~0_combout\,
	datab => \inst|WideOr17~1_combout\,
	datac => \inst|Add0~10_combout\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector19~0_combout\);

-- Location: FF_X5_Y9_N15
\inst|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector19~0_combout\,
	ena => \inst|count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(5));

-- Location: LCCOMB_X6_Y9_N16
\inst|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~12_combout\ = (\inst|count\(6) & ((GND) # (!\inst|Add0~11\))) # (!\inst|count\(6) & (\inst|Add0~11\ $ (GND)))
-- \inst|Add0~13\ = CARRY((\inst|count\(6)) # (!\inst|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count\(6),
	datad => VCC,
	cin => \inst|Add0~11\,
	combout => \inst|Add0~12_combout\,
	cout => \inst|Add0~13\);

-- Location: LCCOMB_X6_Y9_N30
\inst|Selector18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector18~0_combout\ = (\inst|WideOr17~1_combout\ & (\inst|Add0~12_combout\ & (\inst|count[0]~0_combout\ & \inst|Add0~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|WideOr17~1_combout\,
	datab => \inst|Add0~12_combout\,
	datac => \inst|count[0]~0_combout\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector18~0_combout\);

-- Location: FF_X6_Y9_N31
\inst|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector18~0_combout\,
	ena => \inst|count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(6));

-- Location: LCCOMB_X6_Y9_N18
\inst|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~14_combout\ = (\inst|count\(7) & (\inst|Add0~13\ & VCC)) # (!\inst|count\(7) & (!\inst|Add0~13\))
-- \inst|Add0~15\ = CARRY((!\inst|count\(7) & !\inst|Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|count\(7),
	datad => VCC,
	cin => \inst|Add0~13\,
	combout => \inst|Add0~14_combout\,
	cout => \inst|Add0~15\);

-- Location: LCCOMB_X6_Y9_N24
\inst|Selector17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector17~0_combout\ = (\inst|WideOr17~1_combout\ & (\inst|count[0]~0_combout\ & (\inst|Add0~14_combout\ & \inst|Add0~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|WideOr17~1_combout\,
	datab => \inst|count[0]~0_combout\,
	datac => \inst|Add0~14_combout\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector17~0_combout\);

-- Location: FF_X6_Y9_N25
\inst|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector17~0_combout\,
	ena => \inst|count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(7));

-- Location: LCCOMB_X6_Y9_N20
\inst|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~16_combout\ = !\inst|Add0~15\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst|Add0~15\,
	combout => \inst|Add0~16_combout\);

-- Location: LCCOMB_X5_Y9_N20
\inst|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector1~0_combout\ = (\inst|state.dp_BA~q\) # ((\inst|state.dp_07~q\ & \inst|Add0~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dp_BA~q\,
	datac => \inst|state.dp_07~q\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector1~0_combout\);

-- Location: FF_X5_Y9_N21
\inst|state.dp_07\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector1~0_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dp_07~q\);

-- Location: LCCOMB_X5_Y9_N10
\inst|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector2~0_combout\ = (\inst|state.dp_07~q\ & !\inst|Add0~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.dp_07~q\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector2~0_combout\);

-- Location: FF_X5_Y9_N11
\inst|state.dw_07\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector2~0_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dw_07~q\);

-- Location: LCCOMB_X5_Y9_N30
\inst|Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector3~0_combout\ = (\inst|state.dw_07~q\) # ((\inst|state.dp_00~q\ & \inst|Add0~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dw_07~q\,
	datac => \inst|state.dp_00~q\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector3~0_combout\);

-- Location: FF_X5_Y9_N31
\inst|state.dp_00\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector3~0_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dp_00~q\);

-- Location: LCCOMB_X5_Y9_N16
\inst|Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector4~0_combout\ = (\inst|state.dp_00~q\ & !\inst|Add0~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|state.dp_00~q\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector4~0_combout\);

-- Location: FF_X5_Y9_N17
\inst|state.dw_00\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector4~0_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dw_00~q\);

-- Location: LCCOMB_X5_Y9_N8
\inst|Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector5~0_combout\ = (\inst|state.dw_00~q\) # ((\inst|state.dp_02~q\ & \inst|Add0~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.dw_00~q\,
	datac => \inst|state.dp_02~q\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector5~0_combout\);

-- Location: FF_X5_Y9_N9
\inst|state.dp_02\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector5~0_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dp_02~q\);

-- Location: LCCOMB_X7_Y9_N30
\inst|Selector6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector6~0_combout\ = (\inst|state.dp_02~q\ & !\inst|Add0~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|state.dp_02~q\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector6~0_combout\);

-- Location: FF_X7_Y9_N31
\inst|state.dw_02\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector6~0_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dw_02~q\);

-- Location: FF_X6_Y9_N21
\inst|state.stop_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst|state.dw_02~q\,
	clrn => \reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.stop_1~q\);

-- Location: FF_X5_Y9_N25
\inst|state.dp_BA_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst|state.stop_1~q\,
	clrn => \reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dp_BA_2~q\);

-- Location: LCCOMB_X5_Y9_N18
\inst|Selector9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector9~0_combout\ = (\inst|state.dp_BA_2~q\) # ((\inst|state.dp_1E~q\ & \inst|Add0~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.dp_BA_2~q\,
	datac => \inst|state.dp_1E~q\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector9~0_combout\);

-- Location: FF_X5_Y9_N19
\inst|state.dp_1E\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector9~0_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dp_1E~q\);

-- Location: LCCOMB_X5_Y9_N2
\inst|Selector10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector10~0_combout\ = (\inst|state.dp_1E~q\ & !\inst|Add0~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.dp_1E~q\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector10~0_combout\);

-- Location: FF_X5_Y9_N3
\inst|state.dw_1E\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector10~0_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dw_1E~q\);

-- Location: LCCOMB_X5_Y9_N12
\inst|Selector11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector11~0_combout\ = (\inst|state.dw_1E~q\) # ((\inst|state.dp_81~q\ & \inst|Add0~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|state.dw_1E~q\,
	datac => \inst|state.dp_81~q\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector11~0_combout\);

-- Location: FF_X5_Y9_N13
\inst|state.dp_81\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector11~0_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dp_81~q\);

-- Location: LCCOMB_X5_Y9_N0
\inst|Selector12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector12~0_combout\ = (\inst|state.dp_81~q\ & !\inst|Add0~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dp_81~q\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector12~0_combout\);

-- Location: FF_X5_Y9_N1
\inst|state.dw_81\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector12~0_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dw_81~q\);

-- Location: LCCOMB_X5_Y9_N4
\inst|Selector13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector13~0_combout\ = (\inst|state.dw_81~q\) # ((\inst|state.dp_00_2~q\ & \inst|Add0~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|state.dw_81~q\,
	datac => \inst|state.dp_00_2~q\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector13~0_combout\);

-- Location: FF_X5_Y9_N5
\inst|state.dp_00_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector13~0_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dp_00_2~q\);

-- Location: LCCOMB_X7_Y9_N0
\inst|Selector14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Selector14~0_combout\ = (\inst|state.dp_00_2~q\ & !\inst|Add0~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|state.dp_00_2~q\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|Selector14~0_combout\);

-- Location: FF_X7_Y9_N1
\inst|state.dw_00_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|Selector14~0_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.dw_00_2~q\);

-- Location: FF_X6_Y9_N5
\inst|state.stop_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst|state.dw_00_2~q\,
	clrn => \reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.stop_2~q\);

-- Location: LCCOMB_X1_Y9_N16
\inst|state.done~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|state.done~0_combout\ = (\inst|state.done~q\) # (\inst|state.stop_2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|state.done~q\,
	datad => \inst|state.stop_2~q\,
	combout => \inst|state.done~0_combout\);

-- Location: FF_X1_Y9_N17
\inst|state.done\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|state.done~0_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|state.done~q\);

-- Location: IOIBUF_X34_Y3_N22
\sda~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => sda,
	o => \sda~input_o\);

ww_DONE <= \DONE~output_o\;

ww_sca <= \sca~output_o\;

ww_trigg <= \trigg~output_o\;

ww_clk_out <= \clk_out~output_o\;

ww_reset_camara <= \reset_camara~output_o\;

sda <= \sda~output_o\;
END structure;


