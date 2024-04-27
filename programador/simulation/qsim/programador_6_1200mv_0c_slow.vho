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

-- DATE "04/26/2024 16:11:34"

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
	clk : IN std_logic;
	clk_div4 : OUT std_logic;
	clk_div2 : OUT std_logic;
	start : IN std_logic;
	stop : IN std_logic;
	reset : IN std_logic;
	buisy : OUT std_logic_vector(1 DOWNTO 0)
	);
END programador;

-- Design Ports Information
-- clk_div4	=>  Location: PIN_3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_div2	=>  Location: PIN_1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- stop	=>  Location: PIN_25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_75,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buisy[0]	=>  Location: PIN_114,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buisy[1]	=>  Location: PIN_43,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_2,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_clk : std_logic;
SIGNAL ww_clk_div4 : std_logic;
SIGNAL ww_clk_div2 : std_logic;
SIGNAL ww_start : std_logic;
SIGNAL ww_stop : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_buisy : std_logic_vector(1 DOWNTO 0);
SIGNAL \start~input_o\ : std_logic;
SIGNAL \stop~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \clk_div4~output_o\ : std_logic;
SIGNAL \clk_div2~output_o\ : std_logic;
SIGNAL \buisy[0]~output_o\ : std_logic;
SIGNAL \buisy[1]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk_div2_int~0_combout\ : std_logic;
SIGNAL \clk_div2_int~feeder_combout\ : std_logic;
SIGNAL \clk_div2_int~q\ : std_logic;
SIGNAL \clk_div4_int~0_combout\ : std_logic;
SIGNAL \clk_div4_int~q\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
clk_div4 <= ww_clk_div4;
clk_div2 <= ww_clk_div2;
ww_start <= start;
ww_stop <= stop;
ww_reset <= reset;
buisy <= ww_buisy;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y23_N16
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

-- Location: IOOBUF_X0_Y23_N2
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

-- Location: IOOBUF_X28_Y24_N16
\buisy[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \buisy[0]~output_o\);

-- Location: IOOBUF_X5_Y0_N23
\buisy[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \buisy[1]~output_o\);

-- Location: IOIBUF_X0_Y23_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: LCCOMB_X1_Y23_N20
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

-- Location: LCCOMB_X1_Y23_N30
\clk_div2_int~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div2_int~feeder_combout\ = \clk_div2_int~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clk_div2_int~0_combout\,
	combout => \clk_div2_int~feeder_combout\);

-- Location: FF_X1_Y23_N31
clk_div2_int : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \clk_div2_int~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div2_int~q\);

-- Location: LCCOMB_X1_Y23_N28
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

-- Location: FF_X1_Y23_N29
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

-- Location: IOIBUF_X0_Y11_N15
\start~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

-- Location: IOIBUF_X0_Y11_N22
\stop~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_stop,
	o => \stop~input_o\);

-- Location: IOIBUF_X34_Y3_N22
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

ww_clk_div4 <= \clk_div4~output_o\;

ww_clk_div2 <= \clk_div2~output_o\;

ww_buisy(0) <= \buisy[0]~output_o\;

ww_buisy(1) <= \buisy[1]~output_o\;
END structure;


