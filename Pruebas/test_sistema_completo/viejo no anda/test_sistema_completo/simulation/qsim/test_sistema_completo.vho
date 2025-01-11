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

-- DATE "11/14/2024 11:49:01"

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

ENTITY 	decod_control IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	rx_dv_i : IN std_logic;
	rx_byte : IN std_logic_vector(7 DOWNTO 0);
	cntrl_reset : OUT std_logic;
	cntrl_envio : OUT std_logic
	);
END decod_control;

-- Design Ports Information
-- cntrl_reset	=>  Location: PIN_AA5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_envio	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_dv_i	=>  Location: PIN_W3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_byte[0]	=>  Location: PIN_W4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_byte[1]	=>  Location: PIN_Y6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_byte[2]	=>  Location: PIN_W7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_byte[3]	=>  Location: PIN_Y5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_byte[4]	=>  Location: PIN_V6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_byte[5]	=>  Location: PIN_V7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_byte[6]	=>  Location: PIN_AE2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_byte[7]	=>  Location: PIN_AE1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF decod_control IS
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
SIGNAL ww_reset : std_logic;
SIGNAL ww_rx_dv_i : std_logic;
SIGNAL ww_rx_byte : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_cntrl_reset : std_logic;
SIGNAL ww_cntrl_envio : std_logic;
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \cntrl_reset~output_o\ : std_logic;
SIGNAL \cntrl_envio~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \rx_byte[0]~input_o\ : std_logic;
SIGNAL \rx_byte[2]~input_o\ : std_logic;
SIGNAL \rx_byte[1]~input_o\ : std_logic;
SIGNAL \rx_byte[3]~input_o\ : std_logic;
SIGNAL \cntrl_reset_int~0_combout\ : std_logic;
SIGNAL \rx_dv_i~input_o\ : std_logic;
SIGNAL \rx_byte[4]~input_o\ : std_logic;
SIGNAL \rx_byte[7]~input_o\ : std_logic;
SIGNAL \rx_byte[5]~input_o\ : std_logic;
SIGNAL \rx_byte[6]~input_o\ : std_logic;
SIGNAL \cntrl_reset_int~1_combout\ : std_logic;
SIGNAL \cntrl_reset_int~2_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \cntrl_reset_int~q\ : std_logic;
SIGNAL \cuenta_reset~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_reset[0]~q\ : std_logic;
SIGNAL \cuenta_reset~0_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_reset[1]~q\ : std_logic;
SIGNAL \mantenimiento~0_combout\ : std_logic;
SIGNAL \mantenimiento:cntrl_reset_int_2~q\ : std_logic;
SIGNAL \cntrl_envio_int~1_combout\ : std_logic;
SIGNAL \cntrl_envio_int~0_combout\ : std_logic;
SIGNAL \cntrl_envio_int~2_combout\ : std_logic;
SIGNAL \cntrl_envio_int~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[0]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[0]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[0]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[1]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[1]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[1]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[2]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[2]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[2]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[3]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[3]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[3]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[4]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[4]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[4]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[5]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[5]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[5]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[6]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[6]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[6]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[7]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[7]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[7]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[8]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[8]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[8]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[9]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[9]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[9]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[10]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[10]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[10]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[11]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[11]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[11]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[12]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[12]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[12]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[13]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[13]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[13]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[14]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[14]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[14]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[15]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[15]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[15]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[16]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[16]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[16]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[17]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[17]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[17]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[18]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[18]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[18]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[19]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[19]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[19]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[20]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[20]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[20]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[21]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[21]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[21]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[22]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[22]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[22]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[23]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[23]~q\ : std_logic;
SIGNAL \mantenimiento~1_combout\ : std_logic;
SIGNAL \LessThan1~4_combout\ : std_logic;
SIGNAL \LessThan1~5_combout\ : std_logic;
SIGNAL \LessThan1~6_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[23]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[24]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[24]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[24]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[25]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[25]~q\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[25]~2\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[26]~1_combout\ : std_logic;
SIGNAL \mantenimiento:cuenta_envio[26]~q\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \LessThan1~2_combout\ : std_logic;
SIGNAL \LessThan1~3_combout\ : std_logic;
SIGNAL \mantenimiento~2_combout\ : std_logic;
SIGNAL \mantenimiento~3_combout\ : std_logic;
SIGNAL \mantenimiento:cntrl_envio_int_2~q\ : std_logic;
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_mantenimiento~3_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_rx_dv_i <= rx_dv_i;
ww_rx_byte <= rx_byte;
cntrl_reset <= ww_cntrl_reset;
cntrl_envio <= ww_cntrl_envio;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\ALT_INV_mantenimiento~3_combout\ <= NOT \mantenimiento~3_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y10_N23
\cntrl_reset~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mantenimiento:cntrl_reset_int_2~q\,
	devoe => ww_devoe,
	o => \cntrl_reset~output_o\);

-- Location: IOOBUF_X0_Y9_N16
\cntrl_envio~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mantenimiento:cntrl_envio_int_2~q\,
	devoe => ww_devoe,
	o => \cntrl_envio~output_o\);

-- Location: IOIBUF_X0_Y36_N8
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

-- Location: IOIBUF_X0_Y14_N8
\rx_byte[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx_byte(0),
	o => \rx_byte[0]~input_o\);

-- Location: IOIBUF_X0_Y12_N22
\rx_byte[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx_byte(2),
	o => \rx_byte[2]~input_o\);

-- Location: IOIBUF_X0_Y13_N8
\rx_byte[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx_byte(1),
	o => \rx_byte[1]~input_o\);

-- Location: IOIBUF_X0_Y12_N15
\rx_byte[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx_byte(3),
	o => \rx_byte[3]~input_o\);

-- Location: LCCOMB_X8_Y13_N26
\cntrl_reset_int~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \cntrl_reset_int~0_combout\ = (\rx_byte[0]~input_o\ & (!\rx_byte[2]~input_o\ & (!\rx_byte[1]~input_o\ & !\rx_byte[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rx_byte[0]~input_o\,
	datab => \rx_byte[2]~input_o\,
	datac => \rx_byte[1]~input_o\,
	datad => \rx_byte[3]~input_o\,
	combout => \cntrl_reset_int~0_combout\);

-- Location: IOIBUF_X0_Y13_N1
\rx_dv_i~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx_dv_i,
	o => \rx_dv_i~input_o\);

-- Location: IOIBUF_X0_Y16_N22
\rx_byte[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx_byte(4),
	o => \rx_byte[4]~input_o\);

-- Location: IOIBUF_X0_Y16_N15
\rx_byte[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx_byte(7),
	o => \rx_byte[7]~input_o\);

-- Location: IOIBUF_X0_Y14_N1
\rx_byte[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx_byte(5),
	o => \rx_byte[5]~input_o\);

-- Location: IOIBUF_X0_Y17_N15
\rx_byte[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx_byte(6),
	o => \rx_byte[6]~input_o\);

-- Location: LCCOMB_X8_Y13_N24
\cntrl_reset_int~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \cntrl_reset_int~1_combout\ = (!\rx_byte[4]~input_o\ & (!\rx_byte[7]~input_o\ & (!\rx_byte[5]~input_o\ & !\rx_byte[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rx_byte[4]~input_o\,
	datab => \rx_byte[7]~input_o\,
	datac => \rx_byte[5]~input_o\,
	datad => \rx_byte[6]~input_o\,
	combout => \cntrl_reset_int~1_combout\);

-- Location: LCCOMB_X8_Y13_N28
\cntrl_reset_int~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \cntrl_reset_int~2_combout\ = (\rx_dv_i~input_o\ & ((\cntrl_reset_int~q\) # ((\cntrl_reset_int~0_combout\ & \cntrl_reset_int~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cntrl_reset_int~0_combout\,
	datab => \rx_dv_i~input_o\,
	datac => \cntrl_reset_int~q\,
	datad => \cntrl_reset_int~1_combout\,
	combout => \cntrl_reset_int~2_combout\);

-- Location: IOIBUF_X0_Y36_N15
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

-- Location: FF_X8_Y13_N29
cntrl_reset_int : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cntrl_reset_int~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cntrl_reset_int~q\);

-- Location: LCCOMB_X8_Y13_N10
\cuenta_reset~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \cuenta_reset~1_combout\ = (!\mantenimiento:cuenta_reset[1]~q\ & (!\mantenimiento:cuenta_reset[0]~q\ & ((\cntrl_reset_int~q\) # (\mantenimiento:cntrl_reset_int_2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_reset[1]~q\,
	datab => \cntrl_reset_int~q\,
	datac => \mantenimiento:cuenta_reset[0]~q\,
	datad => \mantenimiento:cntrl_reset_int_2~q\,
	combout => \cuenta_reset~1_combout\);

-- Location: FF_X8_Y13_N11
\mantenimiento:cuenta_reset[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cuenta_reset~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_reset[0]~q\);

-- Location: LCCOMB_X8_Y13_N22
\cuenta_reset~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \cuenta_reset~0_combout\ = (\mantenimiento:cuenta_reset[0]~q\ & (!\mantenimiento:cuenta_reset[1]~q\ & ((\cntrl_reset_int~q\) # (\mantenimiento:cntrl_reset_int_2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_reset[0]~q\,
	datab => \cntrl_reset_int~q\,
	datac => \mantenimiento:cuenta_reset[1]~q\,
	datad => \mantenimiento:cntrl_reset_int_2~q\,
	combout => \cuenta_reset~0_combout\);

-- Location: FF_X8_Y13_N23
\mantenimiento:cuenta_reset[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cuenta_reset~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_reset[1]~q\);

-- Location: LCCOMB_X8_Y13_N8
\mantenimiento~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento~0_combout\ = (!\mantenimiento:cuenta_reset[1]~q\ & ((\mantenimiento:cntrl_reset_int_2~q\) # (\cntrl_reset_int~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mantenimiento:cuenta_reset[1]~q\,
	datac => \mantenimiento:cntrl_reset_int_2~q\,
	datad => \cntrl_reset_int~q\,
	combout => \mantenimiento~0_combout\);

-- Location: FF_X8_Y13_N9
\mantenimiento:cntrl_reset_int_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cntrl_reset_int_2~q\);

-- Location: LCCOMB_X8_Y13_N30
\cntrl_envio_int~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \cntrl_envio_int~1_combout\ = (\rx_byte[4]~input_o\ & (\rx_byte[7]~input_o\ & (\rx_byte[5]~input_o\ & \rx_byte[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rx_byte[4]~input_o\,
	datab => \rx_byte[7]~input_o\,
	datac => \rx_byte[5]~input_o\,
	datad => \rx_byte[6]~input_o\,
	combout => \cntrl_envio_int~1_combout\);

-- Location: LCCOMB_X8_Y13_N20
\cntrl_envio_int~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \cntrl_envio_int~0_combout\ = (\rx_byte[0]~input_o\ & (\rx_byte[2]~input_o\ & (\rx_byte[1]~input_o\ & \rx_byte[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rx_byte[0]~input_o\,
	datab => \rx_byte[2]~input_o\,
	datac => \rx_byte[1]~input_o\,
	datad => \rx_byte[3]~input_o\,
	combout => \cntrl_envio_int~0_combout\);

-- Location: LCCOMB_X8_Y13_N12
\cntrl_envio_int~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \cntrl_envio_int~2_combout\ = (\rx_dv_i~input_o\ & ((\cntrl_envio_int~q\) # ((\cntrl_envio_int~1_combout\ & \cntrl_envio_int~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cntrl_envio_int~1_combout\,
	datab => \rx_dv_i~input_o\,
	datac => \cntrl_envio_int~q\,
	datad => \cntrl_envio_int~0_combout\,
	combout => \cntrl_envio_int~2_combout\);

-- Location: FF_X8_Y13_N13
cntrl_envio_int : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cntrl_envio_int~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cntrl_envio_int~q\);

-- Location: LCCOMB_X9_Y14_N6
\mantenimiento:cuenta_envio[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[0]~1_combout\ = \mantenimiento:cuenta_envio[0]~q\ $ (VCC)
-- \mantenimiento:cuenta_envio[0]~2\ = CARRY(\mantenimiento:cuenta_envio[0]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[0]~q\,
	datad => VCC,
	combout => \mantenimiento:cuenta_envio[0]~1_combout\,
	cout => \mantenimiento:cuenta_envio[0]~2\);

-- Location: FF_X9_Y14_N7
\mantenimiento:cuenta_envio[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[0]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[0]~q\);

-- Location: LCCOMB_X9_Y14_N8
\mantenimiento:cuenta_envio[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[1]~1_combout\ = (\mantenimiento:cuenta_envio[1]~q\ & (!\mantenimiento:cuenta_envio[0]~2\)) # (!\mantenimiento:cuenta_envio[1]~q\ & ((\mantenimiento:cuenta_envio[0]~2\) # (GND)))
-- \mantenimiento:cuenta_envio[1]~2\ = CARRY((!\mantenimiento:cuenta_envio[0]~2\) # (!\mantenimiento:cuenta_envio[1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \mantenimiento:cuenta_envio[1]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[0]~2\,
	combout => \mantenimiento:cuenta_envio[1]~1_combout\,
	cout => \mantenimiento:cuenta_envio[1]~2\);

-- Location: FF_X9_Y14_N9
\mantenimiento:cuenta_envio[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[1]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[1]~q\);

-- Location: LCCOMB_X9_Y14_N10
\mantenimiento:cuenta_envio[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[2]~1_combout\ = (\mantenimiento:cuenta_envio[2]~q\ & (\mantenimiento:cuenta_envio[1]~2\ $ (GND))) # (!\mantenimiento:cuenta_envio[2]~q\ & (!\mantenimiento:cuenta_envio[1]~2\ & VCC))
-- \mantenimiento:cuenta_envio[2]~2\ = CARRY((\mantenimiento:cuenta_envio[2]~q\ & !\mantenimiento:cuenta_envio[1]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[2]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[1]~2\,
	combout => \mantenimiento:cuenta_envio[2]~1_combout\,
	cout => \mantenimiento:cuenta_envio[2]~2\);

-- Location: FF_X9_Y14_N11
\mantenimiento:cuenta_envio[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[2]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[2]~q\);

-- Location: LCCOMB_X9_Y14_N12
\mantenimiento:cuenta_envio[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[3]~1_combout\ = (\mantenimiento:cuenta_envio[3]~q\ & (!\mantenimiento:cuenta_envio[2]~2\)) # (!\mantenimiento:cuenta_envio[3]~q\ & ((\mantenimiento:cuenta_envio[2]~2\) # (GND)))
-- \mantenimiento:cuenta_envio[3]~2\ = CARRY((!\mantenimiento:cuenta_envio[2]~2\) # (!\mantenimiento:cuenta_envio[3]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \mantenimiento:cuenta_envio[3]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[2]~2\,
	combout => \mantenimiento:cuenta_envio[3]~1_combout\,
	cout => \mantenimiento:cuenta_envio[3]~2\);

-- Location: FF_X9_Y14_N13
\mantenimiento:cuenta_envio[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[3]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[3]~q\);

-- Location: LCCOMB_X9_Y14_N14
\mantenimiento:cuenta_envio[4]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[4]~1_combout\ = (\mantenimiento:cuenta_envio[4]~q\ & (\mantenimiento:cuenta_envio[3]~2\ $ (GND))) # (!\mantenimiento:cuenta_envio[4]~q\ & (!\mantenimiento:cuenta_envio[3]~2\ & VCC))
-- \mantenimiento:cuenta_envio[4]~2\ = CARRY((\mantenimiento:cuenta_envio[4]~q\ & !\mantenimiento:cuenta_envio[3]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[4]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[3]~2\,
	combout => \mantenimiento:cuenta_envio[4]~1_combout\,
	cout => \mantenimiento:cuenta_envio[4]~2\);

-- Location: FF_X9_Y14_N15
\mantenimiento:cuenta_envio[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[4]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[4]~q\);

-- Location: LCCOMB_X9_Y14_N16
\mantenimiento:cuenta_envio[5]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[5]~1_combout\ = (\mantenimiento:cuenta_envio[5]~q\ & (!\mantenimiento:cuenta_envio[4]~2\)) # (!\mantenimiento:cuenta_envio[5]~q\ & ((\mantenimiento:cuenta_envio[4]~2\) # (GND)))
-- \mantenimiento:cuenta_envio[5]~2\ = CARRY((!\mantenimiento:cuenta_envio[4]~2\) # (!\mantenimiento:cuenta_envio[5]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[5]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[4]~2\,
	combout => \mantenimiento:cuenta_envio[5]~1_combout\,
	cout => \mantenimiento:cuenta_envio[5]~2\);

-- Location: FF_X9_Y14_N17
\mantenimiento:cuenta_envio[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[5]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[5]~q\);

-- Location: LCCOMB_X9_Y14_N18
\mantenimiento:cuenta_envio[6]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[6]~1_combout\ = (\mantenimiento:cuenta_envio[6]~q\ & (\mantenimiento:cuenta_envio[5]~2\ $ (GND))) # (!\mantenimiento:cuenta_envio[6]~q\ & (!\mantenimiento:cuenta_envio[5]~2\ & VCC))
-- \mantenimiento:cuenta_envio[6]~2\ = CARRY((\mantenimiento:cuenta_envio[6]~q\ & !\mantenimiento:cuenta_envio[5]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[6]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[5]~2\,
	combout => \mantenimiento:cuenta_envio[6]~1_combout\,
	cout => \mantenimiento:cuenta_envio[6]~2\);

-- Location: FF_X9_Y14_N19
\mantenimiento:cuenta_envio[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[6]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[6]~q\);

-- Location: LCCOMB_X9_Y14_N20
\mantenimiento:cuenta_envio[7]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[7]~1_combout\ = (\mantenimiento:cuenta_envio[7]~q\ & (!\mantenimiento:cuenta_envio[6]~2\)) # (!\mantenimiento:cuenta_envio[7]~q\ & ((\mantenimiento:cuenta_envio[6]~2\) # (GND)))
-- \mantenimiento:cuenta_envio[7]~2\ = CARRY((!\mantenimiento:cuenta_envio[6]~2\) # (!\mantenimiento:cuenta_envio[7]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[7]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[6]~2\,
	combout => \mantenimiento:cuenta_envio[7]~1_combout\,
	cout => \mantenimiento:cuenta_envio[7]~2\);

-- Location: FF_X9_Y14_N21
\mantenimiento:cuenta_envio[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[7]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[7]~q\);

-- Location: LCCOMB_X9_Y14_N22
\mantenimiento:cuenta_envio[8]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[8]~1_combout\ = (\mantenimiento:cuenta_envio[8]~q\ & (\mantenimiento:cuenta_envio[7]~2\ $ (GND))) # (!\mantenimiento:cuenta_envio[8]~q\ & (!\mantenimiento:cuenta_envio[7]~2\ & VCC))
-- \mantenimiento:cuenta_envio[8]~2\ = CARRY((\mantenimiento:cuenta_envio[8]~q\ & !\mantenimiento:cuenta_envio[7]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[8]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[7]~2\,
	combout => \mantenimiento:cuenta_envio[8]~1_combout\,
	cout => \mantenimiento:cuenta_envio[8]~2\);

-- Location: FF_X9_Y14_N23
\mantenimiento:cuenta_envio[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[8]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[8]~q\);

-- Location: LCCOMB_X9_Y14_N24
\mantenimiento:cuenta_envio[9]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[9]~1_combout\ = (\mantenimiento:cuenta_envio[9]~q\ & (!\mantenimiento:cuenta_envio[8]~2\)) # (!\mantenimiento:cuenta_envio[9]~q\ & ((\mantenimiento:cuenta_envio[8]~2\) # (GND)))
-- \mantenimiento:cuenta_envio[9]~2\ = CARRY((!\mantenimiento:cuenta_envio[8]~2\) # (!\mantenimiento:cuenta_envio[9]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \mantenimiento:cuenta_envio[9]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[8]~2\,
	combout => \mantenimiento:cuenta_envio[9]~1_combout\,
	cout => \mantenimiento:cuenta_envio[9]~2\);

-- Location: FF_X9_Y14_N25
\mantenimiento:cuenta_envio[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[9]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[9]~q\);

-- Location: LCCOMB_X9_Y14_N26
\mantenimiento:cuenta_envio[10]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[10]~1_combout\ = (\mantenimiento:cuenta_envio[10]~q\ & (\mantenimiento:cuenta_envio[9]~2\ $ (GND))) # (!\mantenimiento:cuenta_envio[10]~q\ & (!\mantenimiento:cuenta_envio[9]~2\ & VCC))
-- \mantenimiento:cuenta_envio[10]~2\ = CARRY((\mantenimiento:cuenta_envio[10]~q\ & !\mantenimiento:cuenta_envio[9]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[10]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[9]~2\,
	combout => \mantenimiento:cuenta_envio[10]~1_combout\,
	cout => \mantenimiento:cuenta_envio[10]~2\);

-- Location: FF_X9_Y14_N27
\mantenimiento:cuenta_envio[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[10]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[10]~q\);

-- Location: LCCOMB_X9_Y14_N28
\mantenimiento:cuenta_envio[11]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[11]~1_combout\ = (\mantenimiento:cuenta_envio[11]~q\ & (!\mantenimiento:cuenta_envio[10]~2\)) # (!\mantenimiento:cuenta_envio[11]~q\ & ((\mantenimiento:cuenta_envio[10]~2\) # (GND)))
-- \mantenimiento:cuenta_envio[11]~2\ = CARRY((!\mantenimiento:cuenta_envio[10]~2\) # (!\mantenimiento:cuenta_envio[11]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \mantenimiento:cuenta_envio[11]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[10]~2\,
	combout => \mantenimiento:cuenta_envio[11]~1_combout\,
	cout => \mantenimiento:cuenta_envio[11]~2\);

-- Location: FF_X9_Y14_N29
\mantenimiento:cuenta_envio[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[11]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[11]~q\);

-- Location: LCCOMB_X9_Y14_N30
\mantenimiento:cuenta_envio[12]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[12]~1_combout\ = (\mantenimiento:cuenta_envio[12]~q\ & (\mantenimiento:cuenta_envio[11]~2\ $ (GND))) # (!\mantenimiento:cuenta_envio[12]~q\ & (!\mantenimiento:cuenta_envio[11]~2\ & VCC))
-- \mantenimiento:cuenta_envio[12]~2\ = CARRY((\mantenimiento:cuenta_envio[12]~q\ & !\mantenimiento:cuenta_envio[11]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[12]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[11]~2\,
	combout => \mantenimiento:cuenta_envio[12]~1_combout\,
	cout => \mantenimiento:cuenta_envio[12]~2\);

-- Location: FF_X9_Y14_N31
\mantenimiento:cuenta_envio[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[12]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[12]~q\);

-- Location: LCCOMB_X9_Y13_N0
\mantenimiento:cuenta_envio[13]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[13]~1_combout\ = (\mantenimiento:cuenta_envio[13]~q\ & (!\mantenimiento:cuenta_envio[12]~2\)) # (!\mantenimiento:cuenta_envio[13]~q\ & ((\mantenimiento:cuenta_envio[12]~2\) # (GND)))
-- \mantenimiento:cuenta_envio[13]~2\ = CARRY((!\mantenimiento:cuenta_envio[12]~2\) # (!\mantenimiento:cuenta_envio[13]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \mantenimiento:cuenta_envio[13]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[12]~2\,
	combout => \mantenimiento:cuenta_envio[13]~1_combout\,
	cout => \mantenimiento:cuenta_envio[13]~2\);

-- Location: FF_X9_Y13_N1
\mantenimiento:cuenta_envio[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[13]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[13]~q\);

-- Location: LCCOMB_X9_Y13_N2
\mantenimiento:cuenta_envio[14]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[14]~1_combout\ = (\mantenimiento:cuenta_envio[14]~q\ & (\mantenimiento:cuenta_envio[13]~2\ $ (GND))) # (!\mantenimiento:cuenta_envio[14]~q\ & (!\mantenimiento:cuenta_envio[13]~2\ & VCC))
-- \mantenimiento:cuenta_envio[14]~2\ = CARRY((\mantenimiento:cuenta_envio[14]~q\ & !\mantenimiento:cuenta_envio[13]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \mantenimiento:cuenta_envio[14]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[13]~2\,
	combout => \mantenimiento:cuenta_envio[14]~1_combout\,
	cout => \mantenimiento:cuenta_envio[14]~2\);

-- Location: FF_X9_Y13_N3
\mantenimiento:cuenta_envio[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[14]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[14]~q\);

-- Location: LCCOMB_X9_Y13_N4
\mantenimiento:cuenta_envio[15]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[15]~1_combout\ = (\mantenimiento:cuenta_envio[15]~q\ & (!\mantenimiento:cuenta_envio[14]~2\)) # (!\mantenimiento:cuenta_envio[15]~q\ & ((\mantenimiento:cuenta_envio[14]~2\) # (GND)))
-- \mantenimiento:cuenta_envio[15]~2\ = CARRY((!\mantenimiento:cuenta_envio[14]~2\) # (!\mantenimiento:cuenta_envio[15]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \mantenimiento:cuenta_envio[15]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[14]~2\,
	combout => \mantenimiento:cuenta_envio[15]~1_combout\,
	cout => \mantenimiento:cuenta_envio[15]~2\);

-- Location: FF_X9_Y13_N5
\mantenimiento:cuenta_envio[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[15]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[15]~q\);

-- Location: LCCOMB_X9_Y13_N6
\mantenimiento:cuenta_envio[16]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[16]~1_combout\ = (\mantenimiento:cuenta_envio[16]~q\ & (\mantenimiento:cuenta_envio[15]~2\ $ (GND))) # (!\mantenimiento:cuenta_envio[16]~q\ & (!\mantenimiento:cuenta_envio[15]~2\ & VCC))
-- \mantenimiento:cuenta_envio[16]~2\ = CARRY((\mantenimiento:cuenta_envio[16]~q\ & !\mantenimiento:cuenta_envio[15]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[16]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[15]~2\,
	combout => \mantenimiento:cuenta_envio[16]~1_combout\,
	cout => \mantenimiento:cuenta_envio[16]~2\);

-- Location: FF_X9_Y13_N7
\mantenimiento:cuenta_envio[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[16]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[16]~q\);

-- Location: LCCOMB_X9_Y13_N8
\mantenimiento:cuenta_envio[17]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[17]~1_combout\ = (\mantenimiento:cuenta_envio[17]~q\ & (!\mantenimiento:cuenta_envio[16]~2\)) # (!\mantenimiento:cuenta_envio[17]~q\ & ((\mantenimiento:cuenta_envio[16]~2\) # (GND)))
-- \mantenimiento:cuenta_envio[17]~2\ = CARRY((!\mantenimiento:cuenta_envio[16]~2\) # (!\mantenimiento:cuenta_envio[17]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[17]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[16]~2\,
	combout => \mantenimiento:cuenta_envio[17]~1_combout\,
	cout => \mantenimiento:cuenta_envio[17]~2\);

-- Location: FF_X9_Y13_N9
\mantenimiento:cuenta_envio[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[17]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[17]~q\);

-- Location: LCCOMB_X9_Y13_N10
\mantenimiento:cuenta_envio[18]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[18]~1_combout\ = (\mantenimiento:cuenta_envio[18]~q\ & (\mantenimiento:cuenta_envio[17]~2\ $ (GND))) # (!\mantenimiento:cuenta_envio[18]~q\ & (!\mantenimiento:cuenta_envio[17]~2\ & VCC))
-- \mantenimiento:cuenta_envio[18]~2\ = CARRY((\mantenimiento:cuenta_envio[18]~q\ & !\mantenimiento:cuenta_envio[17]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[18]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[17]~2\,
	combout => \mantenimiento:cuenta_envio[18]~1_combout\,
	cout => \mantenimiento:cuenta_envio[18]~2\);

-- Location: FF_X9_Y13_N11
\mantenimiento:cuenta_envio[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[18]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[18]~q\);

-- Location: LCCOMB_X9_Y13_N12
\mantenimiento:cuenta_envio[19]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[19]~1_combout\ = (\mantenimiento:cuenta_envio[19]~q\ & (!\mantenimiento:cuenta_envio[18]~2\)) # (!\mantenimiento:cuenta_envio[19]~q\ & ((\mantenimiento:cuenta_envio[18]~2\) # (GND)))
-- \mantenimiento:cuenta_envio[19]~2\ = CARRY((!\mantenimiento:cuenta_envio[18]~2\) # (!\mantenimiento:cuenta_envio[19]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[19]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[18]~2\,
	combout => \mantenimiento:cuenta_envio[19]~1_combout\,
	cout => \mantenimiento:cuenta_envio[19]~2\);

-- Location: FF_X9_Y13_N13
\mantenimiento:cuenta_envio[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[19]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[19]~q\);

-- Location: LCCOMB_X9_Y13_N14
\mantenimiento:cuenta_envio[20]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[20]~1_combout\ = (\mantenimiento:cuenta_envio[20]~q\ & (\mantenimiento:cuenta_envio[19]~2\ $ (GND))) # (!\mantenimiento:cuenta_envio[20]~q\ & (!\mantenimiento:cuenta_envio[19]~2\ & VCC))
-- \mantenimiento:cuenta_envio[20]~2\ = CARRY((\mantenimiento:cuenta_envio[20]~q\ & !\mantenimiento:cuenta_envio[19]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \mantenimiento:cuenta_envio[20]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[19]~2\,
	combout => \mantenimiento:cuenta_envio[20]~1_combout\,
	cout => \mantenimiento:cuenta_envio[20]~2\);

-- Location: FF_X9_Y13_N15
\mantenimiento:cuenta_envio[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[20]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[20]~q\);

-- Location: LCCOMB_X9_Y13_N16
\mantenimiento:cuenta_envio[21]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[21]~1_combout\ = (\mantenimiento:cuenta_envio[21]~q\ & (!\mantenimiento:cuenta_envio[20]~2\)) # (!\mantenimiento:cuenta_envio[21]~q\ & ((\mantenimiento:cuenta_envio[20]~2\) # (GND)))
-- \mantenimiento:cuenta_envio[21]~2\ = CARRY((!\mantenimiento:cuenta_envio[20]~2\) # (!\mantenimiento:cuenta_envio[21]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \mantenimiento:cuenta_envio[21]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[20]~2\,
	combout => \mantenimiento:cuenta_envio[21]~1_combout\,
	cout => \mantenimiento:cuenta_envio[21]~2\);

-- Location: FF_X9_Y13_N17
\mantenimiento:cuenta_envio[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[21]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[21]~q\);

-- Location: LCCOMB_X9_Y13_N18
\mantenimiento:cuenta_envio[22]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[22]~1_combout\ = (\mantenimiento:cuenta_envio[22]~q\ & (\mantenimiento:cuenta_envio[21]~2\ $ (GND))) # (!\mantenimiento:cuenta_envio[22]~q\ & (!\mantenimiento:cuenta_envio[21]~2\ & VCC))
-- \mantenimiento:cuenta_envio[22]~2\ = CARRY((\mantenimiento:cuenta_envio[22]~q\ & !\mantenimiento:cuenta_envio[21]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[22]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[21]~2\,
	combout => \mantenimiento:cuenta_envio[22]~1_combout\,
	cout => \mantenimiento:cuenta_envio[22]~2\);

-- Location: FF_X9_Y13_N19
\mantenimiento:cuenta_envio[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[22]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[22]~q\);

-- Location: LCCOMB_X9_Y13_N20
\mantenimiento:cuenta_envio[23]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[23]~1_combout\ = (\mantenimiento:cuenta_envio[23]~q\ & (!\mantenimiento:cuenta_envio[22]~2\)) # (!\mantenimiento:cuenta_envio[23]~q\ & ((\mantenimiento:cuenta_envio[22]~2\) # (GND)))
-- \mantenimiento:cuenta_envio[23]~2\ = CARRY((!\mantenimiento:cuenta_envio[22]~2\) # (!\mantenimiento:cuenta_envio[23]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \mantenimiento:cuenta_envio[23]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[22]~2\,
	combout => \mantenimiento:cuenta_envio[23]~1_combout\,
	cout => \mantenimiento:cuenta_envio[23]~2\);

-- Location: FF_X9_Y13_N21
\mantenimiento:cuenta_envio[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[23]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[23]~q\);

-- Location: LCCOMB_X8_Y13_N6
\mantenimiento~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento~1_combout\ = (\mantenimiento:cuenta_envio[23]~q\) # ((\mantenimiento:cuenta_envio[18]~q\) # ((\mantenimiento:cuenta_envio[19]~q\) # (\mantenimiento:cuenta_envio[14]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[23]~q\,
	datab => \mantenimiento:cuenta_envio[18]~q\,
	datac => \mantenimiento:cuenta_envio[19]~q\,
	datad => \mantenimiento:cuenta_envio[14]~q\,
	combout => \mantenimiento~1_combout\);

-- Location: LCCOMB_X9_Y14_N0
\LessThan1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~4_combout\ = (!\mantenimiento:cuenta_envio[6]~q\ & (((!\mantenimiento:cuenta_envio[3]~q\ & !\mantenimiento:cuenta_envio[4]~q\)) # (!\mantenimiento:cuenta_envio[5]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[3]~q\,
	datab => \mantenimiento:cuenta_envio[6]~q\,
	datac => \mantenimiento:cuenta_envio[4]~q\,
	datad => \mantenimiento:cuenta_envio[5]~q\,
	combout => \LessThan1~4_combout\);

-- Location: LCCOMB_X9_Y14_N2
\LessThan1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~5_combout\ = (\mantenimiento:cuenta_envio[8]~q\ & (\mantenimiento:cuenta_envio[9]~q\ & (\mantenimiento:cuenta_envio[7]~q\ & !\LessThan1~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[8]~q\,
	datab => \mantenimiento:cuenta_envio[9]~q\,
	datac => \mantenimiento:cuenta_envio[7]~q\,
	datad => \LessThan1~4_combout\,
	combout => \LessThan1~5_combout\);

-- Location: LCCOMB_X9_Y14_N4
\LessThan1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~6_combout\ = (((!\mantenimiento:cuenta_envio[10]~q\ & !\LessThan1~5_combout\)) # (!\mantenimiento:cuenta_envio[12]~q\)) # (!\mantenimiento:cuenta_envio[11]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[10]~q\,
	datab => \mantenimiento:cuenta_envio[11]~q\,
	datac => \mantenimiento:cuenta_envio[12]~q\,
	datad => \LessThan1~5_combout\,
	combout => \LessThan1~6_combout\);

-- Location: LCCOMB_X9_Y13_N22
\mantenimiento:cuenta_envio[24]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[24]~1_combout\ = (\mantenimiento:cuenta_envio[24]~q\ & (\mantenimiento:cuenta_envio[23]~2\ $ (GND))) # (!\mantenimiento:cuenta_envio[24]~q\ & (!\mantenimiento:cuenta_envio[23]~2\ & VCC))
-- \mantenimiento:cuenta_envio[24]~2\ = CARRY((\mantenimiento:cuenta_envio[24]~q\ & !\mantenimiento:cuenta_envio[23]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[24]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[23]~2\,
	combout => \mantenimiento:cuenta_envio[24]~1_combout\,
	cout => \mantenimiento:cuenta_envio[24]~2\);

-- Location: FF_X9_Y13_N23
\mantenimiento:cuenta_envio[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[24]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[24]~q\);

-- Location: LCCOMB_X9_Y13_N24
\mantenimiento:cuenta_envio[25]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[25]~1_combout\ = (\mantenimiento:cuenta_envio[25]~q\ & (!\mantenimiento:cuenta_envio[24]~2\)) # (!\mantenimiento:cuenta_envio[25]~q\ & ((\mantenimiento:cuenta_envio[24]~2\) # (GND)))
-- \mantenimiento:cuenta_envio[25]~2\ = CARRY((!\mantenimiento:cuenta_envio[24]~2\) # (!\mantenimiento:cuenta_envio[25]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \mantenimiento:cuenta_envio[25]~q\,
	datad => VCC,
	cin => \mantenimiento:cuenta_envio[24]~2\,
	combout => \mantenimiento:cuenta_envio[25]~1_combout\,
	cout => \mantenimiento:cuenta_envio[25]~2\);

-- Location: FF_X9_Y13_N25
\mantenimiento:cuenta_envio[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[25]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[25]~q\);

-- Location: LCCOMB_X9_Y13_N26
\mantenimiento:cuenta_envio[26]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento:cuenta_envio[26]~1_combout\ = \mantenimiento:cuenta_envio[26]~q\ $ (!\mantenimiento:cuenta_envio[25]~2\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[26]~q\,
	cin => \mantenimiento:cuenta_envio[25]~2\,
	combout => \mantenimiento:cuenta_envio[26]~1_combout\);

-- Location: FF_X9_Y13_N27
\mantenimiento:cuenta_envio[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento:cuenta_envio[26]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_mantenimiento~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cuenta_envio[26]~q\);

-- Location: LCCOMB_X8_Y13_N18
\LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = ((!\mantenimiento:cuenta_envio[24]~q\) # (!\mantenimiento:cuenta_envio[25]~q\)) # (!\mantenimiento:cuenta_envio[26]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mantenimiento:cuenta_envio[26]~q\,
	datac => \mantenimiento:cuenta_envio[25]~q\,
	datad => \mantenimiento:cuenta_envio[24]~q\,
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X9_Y13_N28
\LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (\mantenimiento:cuenta_envio[19]~q\) # ((\mantenimiento:cuenta_envio[16]~q\ & (\mantenimiento:cuenta_envio[17]~q\ & \mantenimiento:cuenta_envio[15]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[16]~q\,
	datab => \mantenimiento:cuenta_envio[17]~q\,
	datac => \mantenimiento:cuenta_envio[15]~q\,
	datad => \mantenimiento:cuenta_envio[19]~q\,
	combout => \LessThan1~1_combout\);

-- Location: LCCOMB_X9_Y13_N30
\LessThan1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~2_combout\ = (\mantenimiento:cuenta_envio[21]~q\ & (\mantenimiento:cuenta_envio[22]~q\ & ((\mantenimiento:cuenta_envio[18]~q\) # (\LessThan1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[18]~q\,
	datab => \mantenimiento:cuenta_envio[21]~q\,
	datac => \mantenimiento:cuenta_envio[22]~q\,
	datad => \LessThan1~1_combout\,
	combout => \LessThan1~2_combout\);

-- Location: LCCOMB_X8_Y13_N0
\LessThan1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~3_combout\ = (\LessThan1~0_combout\) # ((!\mantenimiento:cuenta_envio[23]~q\ & ((!\mantenimiento:cuenta_envio[20]~q\) # (!\LessThan1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento:cuenta_envio[23]~q\,
	datab => \LessThan1~0_combout\,
	datac => \LessThan1~2_combout\,
	datad => \mantenimiento:cuenta_envio[20]~q\,
	combout => \LessThan1~3_combout\);

-- Location: LCCOMB_X8_Y13_N16
\mantenimiento~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento~2_combout\ = (\LessThan1~3_combout\) # ((!\mantenimiento~1_combout\ & (!\mantenimiento:cuenta_envio[13]~q\ & \LessThan1~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mantenimiento~1_combout\,
	datab => \mantenimiento:cuenta_envio[13]~q\,
	datac => \LessThan1~6_combout\,
	datad => \LessThan1~3_combout\,
	combout => \mantenimiento~2_combout\);

-- Location: LCCOMB_X8_Y13_N2
\mantenimiento~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \mantenimiento~3_combout\ = (\mantenimiento~2_combout\ & ((\mantenimiento:cntrl_envio_int_2~q\) # ((\cntrl_envio_int~q\ & !\cntrl_reset_int~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cntrl_envio_int~q\,
	datab => \cntrl_reset_int~q\,
	datac => \mantenimiento:cntrl_envio_int_2~q\,
	datad => \mantenimiento~2_combout\,
	combout => \mantenimiento~3_combout\);

-- Location: FF_X8_Y13_N3
\mantenimiento:cntrl_envio_int_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mantenimiento~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mantenimiento:cntrl_envio_int_2~q\);

ww_cntrl_reset <= \cntrl_reset~output_o\;

ww_cntrl_envio <= \cntrl_envio~output_o\;
END structure;


