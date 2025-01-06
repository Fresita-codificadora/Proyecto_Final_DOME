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

-- DATE "12/12/2024 20:01:45"

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

ENTITY 	ack_sender IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	trigger : IN std_logic;
	uart_busy : IN std_logic;
	tx_enable : BUFFER std_logic;
	uart_byte : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END ack_sender;

-- Design Ports Information
-- tx_enable	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- uart_byte[0]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- uart_byte[1]	=>  Location: PIN_K7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- uart_byte[2]	=>  Location: PIN_C7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- uart_byte[3]	=>  Location: PIN_A23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- uart_byte[4]	=>  Location: PIN_E7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- uart_byte[5]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- uart_byte[6]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- uart_byte[7]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- trigger	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- uart_busy	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ack_sender IS
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
SIGNAL ww_trigger : std_logic;
SIGNAL ww_uart_busy : std_logic;
SIGNAL ww_tx_enable : std_logic;
SIGNAL ww_uart_byte : std_logic_vector(7 DOWNTO 0);
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \tx_enable~output_o\ : std_logic;
SIGNAL \uart_byte[0]~output_o\ : std_logic;
SIGNAL \uart_byte[1]~output_o\ : std_logic;
SIGNAL \uart_byte[2]~output_o\ : std_logic;
SIGNAL \uart_byte[3]~output_o\ : std_logic;
SIGNAL \uart_byte[4]~output_o\ : std_logic;
SIGNAL \uart_byte[5]~output_o\ : std_logic;
SIGNAL \uart_byte[6]~output_o\ : std_logic;
SIGNAL \uart_byte[7]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \uart_busy~input_o\ : std_logic;
SIGNAL \tx_counter[0]~32_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \tx_counter[17]~96_combout\ : std_logic;
SIGNAL \trigger~input_o\ : std_logic;
SIGNAL \tx_counter[17]~97_combout\ : std_logic;
SIGNAL \tx_counter[0]~33\ : std_logic;
SIGNAL \tx_counter[1]~34_combout\ : std_logic;
SIGNAL \tx_counter[1]~35\ : std_logic;
SIGNAL \tx_counter[2]~36_combout\ : std_logic;
SIGNAL \tx_counter[2]~37\ : std_logic;
SIGNAL \tx_counter[3]~38_combout\ : std_logic;
SIGNAL \tx_counter[3]~39\ : std_logic;
SIGNAL \tx_counter[4]~40_combout\ : std_logic;
SIGNAL \tx_counter[4]~41\ : std_logic;
SIGNAL \tx_counter[5]~42_combout\ : std_logic;
SIGNAL \tx_counter[5]~43\ : std_logic;
SIGNAL \tx_counter[6]~44_combout\ : std_logic;
SIGNAL \tx_counter[6]~45\ : std_logic;
SIGNAL \tx_counter[7]~46_combout\ : std_logic;
SIGNAL \tx_counter[7]~47\ : std_logic;
SIGNAL \tx_counter[8]~48_combout\ : std_logic;
SIGNAL \tx_counter[8]~49\ : std_logic;
SIGNAL \tx_counter[9]~50_combout\ : std_logic;
SIGNAL \tx_counter[9]~51\ : std_logic;
SIGNAL \tx_counter[10]~52_combout\ : std_logic;
SIGNAL \tx_counter[10]~53\ : std_logic;
SIGNAL \tx_counter[11]~54_combout\ : std_logic;
SIGNAL \tx_counter[11]~55\ : std_logic;
SIGNAL \tx_counter[12]~56_combout\ : std_logic;
SIGNAL \tx_counter[12]~57\ : std_logic;
SIGNAL \tx_counter[13]~58_combout\ : std_logic;
SIGNAL \tx_counter[13]~59\ : std_logic;
SIGNAL \tx_counter[14]~60_combout\ : std_logic;
SIGNAL \tx_counter[14]~61\ : std_logic;
SIGNAL \tx_counter[15]~62_combout\ : std_logic;
SIGNAL \tx_counter[15]~63\ : std_logic;
SIGNAL \tx_counter[16]~64_combout\ : std_logic;
SIGNAL \tx_counter[16]~65\ : std_logic;
SIGNAL \tx_counter[17]~66_combout\ : std_logic;
SIGNAL \tx_counter[17]~67\ : std_logic;
SIGNAL \tx_counter[18]~68_combout\ : std_logic;
SIGNAL \tx_counter[18]~69\ : std_logic;
SIGNAL \tx_counter[19]~70_combout\ : std_logic;
SIGNAL \LessThan0~5_combout\ : std_logic;
SIGNAL \tx_counter[19]~71\ : std_logic;
SIGNAL \tx_counter[20]~72_combout\ : std_logic;
SIGNAL \tx_counter[20]~73\ : std_logic;
SIGNAL \tx_counter[21]~74_combout\ : std_logic;
SIGNAL \tx_counter[21]~75\ : std_logic;
SIGNAL \tx_counter[22]~76_combout\ : std_logic;
SIGNAL \tx_counter[22]~77\ : std_logic;
SIGNAL \tx_counter[23]~78_combout\ : std_logic;
SIGNAL \LessThan0~6_combout\ : std_logic;
SIGNAL \LessThan0~7_combout\ : std_logic;
SIGNAL \tx_counter[23]~79\ : std_logic;
SIGNAL \tx_counter[24]~80_combout\ : std_logic;
SIGNAL \tx_counter[24]~81\ : std_logic;
SIGNAL \tx_counter[25]~82_combout\ : std_logic;
SIGNAL \tx_counter[25]~83\ : std_logic;
SIGNAL \tx_counter[26]~84_combout\ : std_logic;
SIGNAL \tx_counter[26]~85\ : std_logic;
SIGNAL \tx_counter[27]~86_combout\ : std_logic;
SIGNAL \tx_counter[27]~87\ : std_logic;
SIGNAL \tx_counter[28]~88_combout\ : std_logic;
SIGNAL \tx_counter[28]~89\ : std_logic;
SIGNAL \tx_counter[29]~90_combout\ : std_logic;
SIGNAL \tx_counter[29]~91\ : std_logic;
SIGNAL \tx_counter[30]~92_combout\ : std_logic;
SIGNAL \tx_counter[30]~93\ : std_logic;
SIGNAL \tx_counter[31]~94_combout\ : std_logic;
SIGNAL \LessThan0~8_combout\ : std_logic;
SIGNAL \LessThan0~9_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \LessThan0~10_combout\ : std_logic;
SIGNAL \Selector34~1_combout\ : std_logic;
SIGNAL \state.SEND~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \Selector35~2_combout\ : std_logic;
SIGNAL \state.WAIT_BUSY~q\ : std_logic;
SIGNAL \Selector34~0_combout\ : std_logic;
SIGNAL \state.IDLE~0_combout\ : std_logic;
SIGNAL \state.IDLE~q\ : std_logic;
SIGNAL \uart_byte[0]~0_combout\ : std_logic;
SIGNAL \Selector0~1_combout\ : std_logic;
SIGNAL \tx_enable~reg0_q\ : std_logic;
SIGNAL \uart_byte[0]~reg0feeder_combout\ : std_logic;
SIGNAL \uart_byte[0]~reg0_q\ : std_logic;
SIGNAL \uart_byte[2]~reg0feeder_combout\ : std_logic;
SIGNAL \uart_byte[2]~reg0_q\ : std_logic;
SIGNAL \uart_byte[4]~reg0feeder_combout\ : std_logic;
SIGNAL \uart_byte[4]~reg0_q\ : std_logic;
SIGNAL \uart_byte[5]~reg0feeder_combout\ : std_logic;
SIGNAL \uart_byte[5]~reg0_q\ : std_logic;
SIGNAL tx_counter : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_trigger <= trigger;
ww_uart_busy <= uart_busy;
tx_enable <= ww_tx_enable;
uart_byte <= ww_uart_byte;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X18_Y73_N23
\tx_enable~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tx_enable~reg0_q\,
	devoe => ww_devoe,
	o => \tx_enable~output_o\);

-- Location: IOOBUF_X16_Y73_N9
\uart_byte[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uart_byte[0]~reg0_q\,
	devoe => ww_devoe,
	o => \uart_byte[0]~output_o\);

-- Location: IOOBUF_X0_Y49_N9
\uart_byte[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \uart_byte[1]~output_o\);

-- Location: IOOBUF_X16_Y73_N23
\uart_byte[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uart_byte[2]~reg0_q\,
	devoe => ww_devoe,
	o => \uart_byte[2]~output_o\);

-- Location: IOOBUF_X102_Y73_N2
\uart_byte[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \uart_byte[3]~output_o\);

-- Location: IOOBUF_X13_Y73_N9
\uart_byte[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uart_byte[4]~reg0_q\,
	devoe => ww_devoe,
	o => \uart_byte[4]~output_o\);

-- Location: IOOBUF_X16_Y73_N2
\uart_byte[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uart_byte[5]~reg0_q\,
	devoe => ww_devoe,
	o => \uart_byte[5]~output_o\);

-- Location: IOOBUF_X111_Y73_N9
\uart_byte[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \uart_byte[6]~output_o\);

-- Location: IOOBUF_X79_Y0_N23
\uart_byte[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \uart_byte[7]~output_o\);

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

-- Location: IOIBUF_X18_Y73_N15
\uart_busy~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_uart_busy,
	o => \uart_busy~input_o\);

-- Location: LCCOMB_X19_Y68_N0
\tx_counter[0]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[0]~32_combout\ = tx_counter(0) $ (VCC)
-- \tx_counter[0]~33\ = CARRY(tx_counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => tx_counter(0),
	datad => VCC,
	combout => \tx_counter[0]~32_combout\,
	cout => \tx_counter[0]~33\);

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

-- Location: LCCOMB_X18_Y67_N2
\tx_counter[17]~96\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[17]~96_combout\ = (!\LessThan0~10_combout\) # (!\state.SEND~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.SEND~q\,
	datad => \LessThan0~10_combout\,
	combout => \tx_counter[17]~96_combout\);

-- Location: IOIBUF_X16_Y73_N15
\trigger~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_trigger,
	o => \trigger~input_o\);

-- Location: LCCOMB_X17_Y67_N26
\tx_counter[17]~97\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[17]~97_combout\ = (!\state.WAIT_BUSY~q\ & ((\state.IDLE~q\) # ((!\uart_busy~input_o\ & \trigger~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_busy~input_o\,
	datab => \state.WAIT_BUSY~q\,
	datac => \state.IDLE~q\,
	datad => \trigger~input_o\,
	combout => \tx_counter[17]~97_combout\);

-- Location: FF_X19_Y68_N1
\tx_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[0]~32_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(0));

-- Location: LCCOMB_X19_Y68_N2
\tx_counter[1]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[1]~34_combout\ = (tx_counter(1) & (!\tx_counter[0]~33\)) # (!tx_counter(1) & ((\tx_counter[0]~33\) # (GND)))
-- \tx_counter[1]~35\ = CARRY((!\tx_counter[0]~33\) # (!tx_counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_counter(1),
	datad => VCC,
	cin => \tx_counter[0]~33\,
	combout => \tx_counter[1]~34_combout\,
	cout => \tx_counter[1]~35\);

-- Location: FF_X19_Y68_N3
\tx_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[1]~34_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(1));

-- Location: LCCOMB_X19_Y68_N4
\tx_counter[2]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[2]~36_combout\ = (tx_counter(2) & (\tx_counter[1]~35\ $ (GND))) # (!tx_counter(2) & (!\tx_counter[1]~35\ & VCC))
-- \tx_counter[2]~37\ = CARRY((tx_counter(2) & !\tx_counter[1]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_counter(2),
	datad => VCC,
	cin => \tx_counter[1]~35\,
	combout => \tx_counter[2]~36_combout\,
	cout => \tx_counter[2]~37\);

-- Location: FF_X19_Y68_N5
\tx_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[2]~36_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(2));

-- Location: LCCOMB_X19_Y68_N6
\tx_counter[3]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[3]~38_combout\ = (tx_counter(3) & (!\tx_counter[2]~37\)) # (!tx_counter(3) & ((\tx_counter[2]~37\) # (GND)))
-- \tx_counter[3]~39\ = CARRY((!\tx_counter[2]~37\) # (!tx_counter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => tx_counter(3),
	datad => VCC,
	cin => \tx_counter[2]~37\,
	combout => \tx_counter[3]~38_combout\,
	cout => \tx_counter[3]~39\);

-- Location: FF_X19_Y68_N7
\tx_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[3]~38_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(3));

-- Location: LCCOMB_X19_Y68_N8
\tx_counter[4]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[4]~40_combout\ = (tx_counter(4) & (\tx_counter[3]~39\ $ (GND))) # (!tx_counter(4) & (!\tx_counter[3]~39\ & VCC))
-- \tx_counter[4]~41\ = CARRY((tx_counter(4) & !\tx_counter[3]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_counter(4),
	datad => VCC,
	cin => \tx_counter[3]~39\,
	combout => \tx_counter[4]~40_combout\,
	cout => \tx_counter[4]~41\);

-- Location: FF_X19_Y68_N9
\tx_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[4]~40_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(4));

-- Location: LCCOMB_X19_Y68_N10
\tx_counter[5]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[5]~42_combout\ = (tx_counter(5) & (!\tx_counter[4]~41\)) # (!tx_counter(5) & ((\tx_counter[4]~41\) # (GND)))
-- \tx_counter[5]~43\ = CARRY((!\tx_counter[4]~41\) # (!tx_counter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => tx_counter(5),
	datad => VCC,
	cin => \tx_counter[4]~41\,
	combout => \tx_counter[5]~42_combout\,
	cout => \tx_counter[5]~43\);

-- Location: FF_X19_Y68_N11
\tx_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[5]~42_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(5));

-- Location: LCCOMB_X19_Y68_N12
\tx_counter[6]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[6]~44_combout\ = (tx_counter(6) & (\tx_counter[5]~43\ $ (GND))) # (!tx_counter(6) & (!\tx_counter[5]~43\ & VCC))
-- \tx_counter[6]~45\ = CARRY((tx_counter(6) & !\tx_counter[5]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => tx_counter(6),
	datad => VCC,
	cin => \tx_counter[5]~43\,
	combout => \tx_counter[6]~44_combout\,
	cout => \tx_counter[6]~45\);

-- Location: FF_X19_Y68_N13
\tx_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[6]~44_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(6));

-- Location: LCCOMB_X19_Y68_N14
\tx_counter[7]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[7]~46_combout\ = (tx_counter(7) & (!\tx_counter[6]~45\)) # (!tx_counter(7) & ((\tx_counter[6]~45\) # (GND)))
-- \tx_counter[7]~47\ = CARRY((!\tx_counter[6]~45\) # (!tx_counter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_counter(7),
	datad => VCC,
	cin => \tx_counter[6]~45\,
	combout => \tx_counter[7]~46_combout\,
	cout => \tx_counter[7]~47\);

-- Location: FF_X19_Y68_N15
\tx_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[7]~46_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(7));

-- Location: LCCOMB_X19_Y68_N16
\tx_counter[8]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[8]~48_combout\ = (tx_counter(8) & (\tx_counter[7]~47\ $ (GND))) # (!tx_counter(8) & (!\tx_counter[7]~47\ & VCC))
-- \tx_counter[8]~49\ = CARRY((tx_counter(8) & !\tx_counter[7]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_counter(8),
	datad => VCC,
	cin => \tx_counter[7]~47\,
	combout => \tx_counter[8]~48_combout\,
	cout => \tx_counter[8]~49\);

-- Location: FF_X19_Y68_N17
\tx_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[8]~48_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(8));

-- Location: LCCOMB_X19_Y68_N18
\tx_counter[9]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[9]~50_combout\ = (tx_counter(9) & (!\tx_counter[8]~49\)) # (!tx_counter(9) & ((\tx_counter[8]~49\) # (GND)))
-- \tx_counter[9]~51\ = CARRY((!\tx_counter[8]~49\) # (!tx_counter(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_counter(9),
	datad => VCC,
	cin => \tx_counter[8]~49\,
	combout => \tx_counter[9]~50_combout\,
	cout => \tx_counter[9]~51\);

-- Location: FF_X19_Y68_N19
\tx_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[9]~50_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(9));

-- Location: LCCOMB_X19_Y68_N20
\tx_counter[10]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[10]~52_combout\ = (tx_counter(10) & (\tx_counter[9]~51\ $ (GND))) # (!tx_counter(10) & (!\tx_counter[9]~51\ & VCC))
-- \tx_counter[10]~53\ = CARRY((tx_counter(10) & !\tx_counter[9]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_counter(10),
	datad => VCC,
	cin => \tx_counter[9]~51\,
	combout => \tx_counter[10]~52_combout\,
	cout => \tx_counter[10]~53\);

-- Location: FF_X19_Y68_N21
\tx_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[10]~52_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(10));

-- Location: LCCOMB_X19_Y68_N22
\tx_counter[11]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[11]~54_combout\ = (tx_counter(11) & (!\tx_counter[10]~53\)) # (!tx_counter(11) & ((\tx_counter[10]~53\) # (GND)))
-- \tx_counter[11]~55\ = CARRY((!\tx_counter[10]~53\) # (!tx_counter(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => tx_counter(11),
	datad => VCC,
	cin => \tx_counter[10]~53\,
	combout => \tx_counter[11]~54_combout\,
	cout => \tx_counter[11]~55\);

-- Location: FF_X19_Y68_N23
\tx_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[11]~54_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(11));

-- Location: LCCOMB_X19_Y68_N24
\tx_counter[12]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[12]~56_combout\ = (tx_counter(12) & (\tx_counter[11]~55\ $ (GND))) # (!tx_counter(12) & (!\tx_counter[11]~55\ & VCC))
-- \tx_counter[12]~57\ = CARRY((tx_counter(12) & !\tx_counter[11]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_counter(12),
	datad => VCC,
	cin => \tx_counter[11]~55\,
	combout => \tx_counter[12]~56_combout\,
	cout => \tx_counter[12]~57\);

-- Location: FF_X19_Y68_N25
\tx_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[12]~56_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(12));

-- Location: LCCOMB_X19_Y68_N26
\tx_counter[13]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[13]~58_combout\ = (tx_counter(13) & (!\tx_counter[12]~57\)) # (!tx_counter(13) & ((\tx_counter[12]~57\) # (GND)))
-- \tx_counter[13]~59\ = CARRY((!\tx_counter[12]~57\) # (!tx_counter(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => tx_counter(13),
	datad => VCC,
	cin => \tx_counter[12]~57\,
	combout => \tx_counter[13]~58_combout\,
	cout => \tx_counter[13]~59\);

-- Location: FF_X19_Y68_N27
\tx_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[13]~58_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(13));

-- Location: LCCOMB_X19_Y68_N28
\tx_counter[14]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[14]~60_combout\ = (tx_counter(14) & (\tx_counter[13]~59\ $ (GND))) # (!tx_counter(14) & (!\tx_counter[13]~59\ & VCC))
-- \tx_counter[14]~61\ = CARRY((tx_counter(14) & !\tx_counter[13]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_counter(14),
	datad => VCC,
	cin => \tx_counter[13]~59\,
	combout => \tx_counter[14]~60_combout\,
	cout => \tx_counter[14]~61\);

-- Location: FF_X19_Y68_N29
\tx_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[14]~60_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(14));

-- Location: LCCOMB_X19_Y68_N30
\tx_counter[15]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[15]~62_combout\ = (tx_counter(15) & (!\tx_counter[14]~61\)) # (!tx_counter(15) & ((\tx_counter[14]~61\) # (GND)))
-- \tx_counter[15]~63\ = CARRY((!\tx_counter[14]~61\) # (!tx_counter(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => tx_counter(15),
	datad => VCC,
	cin => \tx_counter[14]~61\,
	combout => \tx_counter[15]~62_combout\,
	cout => \tx_counter[15]~63\);

-- Location: FF_X19_Y68_N31
\tx_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[15]~62_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(15));

-- Location: LCCOMB_X19_Y67_N0
\tx_counter[16]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[16]~64_combout\ = (tx_counter(16) & (\tx_counter[15]~63\ $ (GND))) # (!tx_counter(16) & (!\tx_counter[15]~63\ & VCC))
-- \tx_counter[16]~65\ = CARRY((tx_counter(16) & !\tx_counter[15]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_counter(16),
	datad => VCC,
	cin => \tx_counter[15]~63\,
	combout => \tx_counter[16]~64_combout\,
	cout => \tx_counter[16]~65\);

-- Location: FF_X19_Y67_N1
\tx_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[16]~64_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(16));

-- Location: LCCOMB_X19_Y67_N2
\tx_counter[17]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[17]~66_combout\ = (tx_counter(17) & (!\tx_counter[16]~65\)) # (!tx_counter(17) & ((\tx_counter[16]~65\) # (GND)))
-- \tx_counter[17]~67\ = CARRY((!\tx_counter[16]~65\) # (!tx_counter(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_counter(17),
	datad => VCC,
	cin => \tx_counter[16]~65\,
	combout => \tx_counter[17]~66_combout\,
	cout => \tx_counter[17]~67\);

-- Location: FF_X19_Y67_N3
\tx_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[17]~66_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(17));

-- Location: LCCOMB_X19_Y67_N4
\tx_counter[18]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[18]~68_combout\ = (tx_counter(18) & (\tx_counter[17]~67\ $ (GND))) # (!tx_counter(18) & (!\tx_counter[17]~67\ & VCC))
-- \tx_counter[18]~69\ = CARRY((tx_counter(18) & !\tx_counter[17]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_counter(18),
	datad => VCC,
	cin => \tx_counter[17]~67\,
	combout => \tx_counter[18]~68_combout\,
	cout => \tx_counter[18]~69\);

-- Location: FF_X19_Y67_N5
\tx_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[18]~68_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(18));

-- Location: LCCOMB_X19_Y67_N6
\tx_counter[19]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[19]~70_combout\ = (tx_counter(19) & (!\tx_counter[18]~69\)) # (!tx_counter(19) & ((\tx_counter[18]~69\) # (GND)))
-- \tx_counter[19]~71\ = CARRY((!\tx_counter[18]~69\) # (!tx_counter(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => tx_counter(19),
	datad => VCC,
	cin => \tx_counter[18]~69\,
	combout => \tx_counter[19]~70_combout\,
	cout => \tx_counter[19]~71\);

-- Location: FF_X19_Y67_N7
\tx_counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[19]~70_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(19));

-- Location: LCCOMB_X18_Y67_N14
\LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~5_combout\ = (!tx_counter(16) & !tx_counter(17))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => tx_counter(16),
	datad => tx_counter(17),
	combout => \LessThan0~5_combout\);

-- Location: LCCOMB_X19_Y67_N8
\tx_counter[20]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[20]~72_combout\ = (tx_counter(20) & (\tx_counter[19]~71\ $ (GND))) # (!tx_counter(20) & (!\tx_counter[19]~71\ & VCC))
-- \tx_counter[20]~73\ = CARRY((tx_counter(20) & !\tx_counter[19]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_counter(20),
	datad => VCC,
	cin => \tx_counter[19]~71\,
	combout => \tx_counter[20]~72_combout\,
	cout => \tx_counter[20]~73\);

-- Location: FF_X19_Y67_N9
\tx_counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[20]~72_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(20));

-- Location: LCCOMB_X19_Y67_N10
\tx_counter[21]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[21]~74_combout\ = (tx_counter(21) & (!\tx_counter[20]~73\)) # (!tx_counter(21) & ((\tx_counter[20]~73\) # (GND)))
-- \tx_counter[21]~75\ = CARRY((!\tx_counter[20]~73\) # (!tx_counter(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => tx_counter(21),
	datad => VCC,
	cin => \tx_counter[20]~73\,
	combout => \tx_counter[21]~74_combout\,
	cout => \tx_counter[21]~75\);

-- Location: FF_X19_Y67_N11
\tx_counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[21]~74_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(21));

-- Location: LCCOMB_X19_Y67_N12
\tx_counter[22]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[22]~76_combout\ = (tx_counter(22) & (\tx_counter[21]~75\ $ (GND))) # (!tx_counter(22) & (!\tx_counter[21]~75\ & VCC))
-- \tx_counter[22]~77\ = CARRY((tx_counter(22) & !\tx_counter[21]~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => tx_counter(22),
	datad => VCC,
	cin => \tx_counter[21]~75\,
	combout => \tx_counter[22]~76_combout\,
	cout => \tx_counter[22]~77\);

-- Location: FF_X19_Y67_N13
\tx_counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[22]~76_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(22));

-- Location: LCCOMB_X19_Y67_N14
\tx_counter[23]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[23]~78_combout\ = (tx_counter(23) & (!\tx_counter[22]~77\)) # (!tx_counter(23) & ((\tx_counter[22]~77\) # (GND)))
-- \tx_counter[23]~79\ = CARRY((!\tx_counter[22]~77\) # (!tx_counter(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_counter(23),
	datad => VCC,
	cin => \tx_counter[22]~77\,
	combout => \tx_counter[23]~78_combout\,
	cout => \tx_counter[23]~79\);

-- Location: FF_X19_Y67_N15
\tx_counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[23]~78_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(23));

-- Location: LCCOMB_X18_Y67_N16
\LessThan0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~6_combout\ = (!tx_counter(21) & (!tx_counter(22) & (!tx_counter(20) & !tx_counter(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => tx_counter(21),
	datab => tx_counter(22),
	datac => tx_counter(20),
	datad => tx_counter(23),
	combout => \LessThan0~6_combout\);

-- Location: LCCOMB_X18_Y67_N30
\LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~7_combout\ = (!tx_counter(19) & (!tx_counter(18) & (\LessThan0~5_combout\ & \LessThan0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => tx_counter(19),
	datab => tx_counter(18),
	datac => \LessThan0~5_combout\,
	datad => \LessThan0~6_combout\,
	combout => \LessThan0~7_combout\);

-- Location: LCCOMB_X19_Y67_N16
\tx_counter[24]~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[24]~80_combout\ = (tx_counter(24) & (\tx_counter[23]~79\ $ (GND))) # (!tx_counter(24) & (!\tx_counter[23]~79\ & VCC))
-- \tx_counter[24]~81\ = CARRY((tx_counter(24) & !\tx_counter[23]~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_counter(24),
	datad => VCC,
	cin => \tx_counter[23]~79\,
	combout => \tx_counter[24]~80_combout\,
	cout => \tx_counter[24]~81\);

-- Location: FF_X19_Y67_N17
\tx_counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[24]~80_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(24));

-- Location: LCCOMB_X19_Y67_N18
\tx_counter[25]~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[25]~82_combout\ = (tx_counter(25) & (!\tx_counter[24]~81\)) # (!tx_counter(25) & ((\tx_counter[24]~81\) # (GND)))
-- \tx_counter[25]~83\ = CARRY((!\tx_counter[24]~81\) # (!tx_counter(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_counter(25),
	datad => VCC,
	cin => \tx_counter[24]~81\,
	combout => \tx_counter[25]~82_combout\,
	cout => \tx_counter[25]~83\);

-- Location: FF_X19_Y67_N19
\tx_counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[25]~82_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(25));

-- Location: LCCOMB_X19_Y67_N20
\tx_counter[26]~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[26]~84_combout\ = (tx_counter(26) & (\tx_counter[25]~83\ $ (GND))) # (!tx_counter(26) & (!\tx_counter[25]~83\ & VCC))
-- \tx_counter[26]~85\ = CARRY((tx_counter(26) & !\tx_counter[25]~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_counter(26),
	datad => VCC,
	cin => \tx_counter[25]~83\,
	combout => \tx_counter[26]~84_combout\,
	cout => \tx_counter[26]~85\);

-- Location: FF_X19_Y67_N21
\tx_counter[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[26]~84_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(26));

-- Location: LCCOMB_X19_Y67_N22
\tx_counter[27]~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[27]~86_combout\ = (tx_counter(27) & (!\tx_counter[26]~85\)) # (!tx_counter(27) & ((\tx_counter[26]~85\) # (GND)))
-- \tx_counter[27]~87\ = CARRY((!\tx_counter[26]~85\) # (!tx_counter(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => tx_counter(27),
	datad => VCC,
	cin => \tx_counter[26]~85\,
	combout => \tx_counter[27]~86_combout\,
	cout => \tx_counter[27]~87\);

-- Location: FF_X19_Y67_N23
\tx_counter[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[27]~86_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(27));

-- Location: LCCOMB_X19_Y67_N24
\tx_counter[28]~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[28]~88_combout\ = (tx_counter(28) & (\tx_counter[27]~87\ $ (GND))) # (!tx_counter(28) & (!\tx_counter[27]~87\ & VCC))
-- \tx_counter[28]~89\ = CARRY((tx_counter(28) & !\tx_counter[27]~87\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_counter(28),
	datad => VCC,
	cin => \tx_counter[27]~87\,
	combout => \tx_counter[28]~88_combout\,
	cout => \tx_counter[28]~89\);

-- Location: FF_X19_Y67_N25
\tx_counter[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[28]~88_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(28));

-- Location: LCCOMB_X19_Y67_N26
\tx_counter[29]~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[29]~90_combout\ = (tx_counter(29) & (!\tx_counter[28]~89\)) # (!tx_counter(29) & ((\tx_counter[28]~89\) # (GND)))
-- \tx_counter[29]~91\ = CARRY((!\tx_counter[28]~89\) # (!tx_counter(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => tx_counter(29),
	datad => VCC,
	cin => \tx_counter[28]~89\,
	combout => \tx_counter[29]~90_combout\,
	cout => \tx_counter[29]~91\);

-- Location: FF_X19_Y67_N27
\tx_counter[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[29]~90_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(29));

-- Location: LCCOMB_X19_Y67_N28
\tx_counter[30]~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[30]~92_combout\ = (tx_counter(30) & (\tx_counter[29]~91\ $ (GND))) # (!tx_counter(30) & (!\tx_counter[29]~91\ & VCC))
-- \tx_counter[30]~93\ = CARRY((tx_counter(30) & !\tx_counter[29]~91\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_counter(30),
	datad => VCC,
	cin => \tx_counter[29]~91\,
	combout => \tx_counter[30]~92_combout\,
	cout => \tx_counter[30]~93\);

-- Location: FF_X19_Y67_N29
\tx_counter[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[30]~92_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(30));

-- Location: LCCOMB_X19_Y67_N30
\tx_counter[31]~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_counter[31]~94_combout\ = tx_counter(31) $ (\tx_counter[30]~93\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => tx_counter(31),
	cin => \tx_counter[30]~93\,
	combout => \tx_counter[31]~94_combout\);

-- Location: FF_X19_Y67_N31
\tx_counter[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tx_counter[31]~94_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \tx_counter[17]~96_combout\,
	ena => \tx_counter[17]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_counter(31));

-- Location: LCCOMB_X18_Y67_N24
\LessThan0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~8_combout\ = (!tx_counter(24) & (!tx_counter(25) & (!tx_counter(26) & !tx_counter(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => tx_counter(24),
	datab => tx_counter(25),
	datac => tx_counter(26),
	datad => tx_counter(27),
	combout => \LessThan0~8_combout\);

-- Location: LCCOMB_X18_Y67_N26
\LessThan0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~9_combout\ = (!tx_counter(28) & (!tx_counter(29) & (!tx_counter(30) & \LessThan0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => tx_counter(28),
	datab => tx_counter(29),
	datac => tx_counter(30),
	datad => \LessThan0~8_combout\,
	combout => \LessThan0~9_combout\);

-- Location: LCCOMB_X18_Y67_N6
\LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = (!tx_counter(12) & (!tx_counter(13) & (!tx_counter(15) & !tx_counter(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => tx_counter(12),
	datab => tx_counter(13),
	datac => tx_counter(15),
	datad => tx_counter(14),
	combout => \LessThan0~3_combout\);

-- Location: LCCOMB_X18_Y67_N4
\LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (!tx_counter(0) & (!tx_counter(1) & (!tx_counter(2) & !tx_counter(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => tx_counter(0),
	datab => tx_counter(1),
	datac => tx_counter(2),
	datad => tx_counter(3),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X18_Y67_N22
\LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (!tx_counter(6) & (!tx_counter(4) & (!tx_counter(5) & !tx_counter(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => tx_counter(6),
	datab => tx_counter(4),
	datac => tx_counter(5),
	datad => tx_counter(7),
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X18_Y67_N0
\LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (!tx_counter(9) & (!tx_counter(10) & (!tx_counter(8) & !tx_counter(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => tx_counter(9),
	datab => tx_counter(10),
	datac => tx_counter(8),
	datad => tx_counter(11),
	combout => \LessThan0~2_combout\);

-- Location: LCCOMB_X18_Y67_N12
\LessThan0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = (\LessThan0~3_combout\ & (\LessThan0~0_combout\ & (\LessThan0~1_combout\ & \LessThan0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~3_combout\,
	datab => \LessThan0~0_combout\,
	datac => \LessThan0~1_combout\,
	datad => \LessThan0~2_combout\,
	combout => \LessThan0~4_combout\);

-- Location: LCCOMB_X18_Y67_N20
\LessThan0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~10_combout\ = (tx_counter(31)) # ((\LessThan0~7_combout\ & (\LessThan0~9_combout\ & \LessThan0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~7_combout\,
	datab => tx_counter(31),
	datac => \LessThan0~9_combout\,
	datad => \LessThan0~4_combout\,
	combout => \LessThan0~10_combout\);

-- Location: LCCOMB_X17_Y67_N14
\Selector34~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector34~1_combout\ = (\Selector34~0_combout\ & ((\uart_byte[0]~0_combout\) # ((\LessThan0~10_combout\ & \state.SEND~q\)))) # (!\Selector34~0_combout\ & (\state.SEND~q\ & (\LessThan0~10_combout\ $ (!\uart_byte[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~10_combout\,
	datab => \Selector34~0_combout\,
	datac => \state.SEND~q\,
	datad => \uart_byte[0]~0_combout\,
	combout => \Selector34~1_combout\);

-- Location: FF_X17_Y67_N15
\state.SEND\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector34~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.SEND~q\);

-- Location: LCCOMB_X18_Y67_N18
\Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\LessThan0~10_combout\) # (!\state.SEND~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.SEND~q\,
	datad => \LessThan0~10_combout\,
	combout => \Selector0~0_combout\);

-- Location: LCCOMB_X18_Y67_N28
\Selector35~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector35~2_combout\ = (\uart_byte[0]~0_combout\ & (\state.WAIT_BUSY~q\ & (\uart_busy~input_o\ $ (\Selector0~0_combout\)))) # (!\uart_byte[0]~0_combout\ & (((\uart_busy~input_o\ & \state.WAIT_BUSY~q\)) # (!\Selector0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000011010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_byte[0]~0_combout\,
	datab => \uart_busy~input_o\,
	datac => \state.WAIT_BUSY~q\,
	datad => \Selector0~0_combout\,
	combout => \Selector35~2_combout\);

-- Location: FF_X18_Y67_N29
\state.WAIT_BUSY\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector35~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.WAIT_BUSY~q\);

-- Location: LCCOMB_X17_Y67_N20
\Selector34~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector34~0_combout\ = (\uart_busy~input_o\) # (!\state.WAIT_BUSY~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_busy~input_o\,
	datad => \state.WAIT_BUSY~q\,
	combout => \Selector34~0_combout\);

-- Location: LCCOMB_X18_Y67_N10
\state.IDLE~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.IDLE~0_combout\ = (\Selector34~0_combout\ & ((\state.IDLE~q\) # (\uart_byte[0]~0_combout\ $ (!\Selector0~0_combout\)))) # (!\Selector34~0_combout\ & (\state.IDLE~q\ & (\uart_byte[0]~0_combout\ $ (!\Selector0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_byte[0]~0_combout\,
	datab => \Selector34~0_combout\,
	datac => \state.IDLE~q\,
	datad => \Selector0~0_combout\,
	combout => \state.IDLE~0_combout\);

-- Location: FF_X18_Y67_N11
\state.IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.IDLE~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.IDLE~q\);

-- Location: LCCOMB_X17_Y67_N12
\uart_byte[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_byte[0]~0_combout\ = (!\uart_busy~input_o\ & (!\state.IDLE~q\ & \trigger~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_busy~input_o\,
	datab => \state.IDLE~q\,
	datad => \trigger~input_o\,
	combout => \uart_byte[0]~0_combout\);

-- Location: LCCOMB_X18_Y67_N8
\Selector0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~1_combout\ = (\uart_byte[0]~0_combout\) # ((\Selector0~0_combout\ & (\tx_enable~reg0_q\ & \state.IDLE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_byte[0]~0_combout\,
	datab => \Selector0~0_combout\,
	datac => \tx_enable~reg0_q\,
	datad => \state.IDLE~q\,
	combout => \Selector0~1_combout\);

-- Location: FF_X18_Y67_N9
\tx_enable~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector0~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_enable~reg0_q\);

-- Location: LCCOMB_X17_Y67_N16
\uart_byte[0]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_byte[0]~reg0feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \uart_byte[0]~reg0feeder_combout\);

-- Location: FF_X17_Y67_N17
\uart_byte[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uart_byte[0]~reg0feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \uart_byte[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_byte[0]~reg0_q\);

-- Location: LCCOMB_X17_Y67_N10
\uart_byte[2]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_byte[2]~reg0feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \uart_byte[2]~reg0feeder_combout\);

-- Location: FF_X17_Y67_N11
\uart_byte[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uart_byte[2]~reg0feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \uart_byte[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_byte[2]~reg0_q\);

-- Location: LCCOMB_X17_Y67_N24
\uart_byte[4]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_byte[4]~reg0feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \uart_byte[4]~reg0feeder_combout\);

-- Location: FF_X17_Y67_N25
\uart_byte[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uart_byte[4]~reg0feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \uart_byte[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_byte[4]~reg0_q\);

-- Location: LCCOMB_X17_Y67_N22
\uart_byte[5]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_byte[5]~reg0feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \uart_byte[5]~reg0feeder_combout\);

-- Location: FF_X17_Y67_N23
\uart_byte[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uart_byte[5]~reg0feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \uart_byte[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_byte[5]~reg0_q\);

ww_tx_enable <= \tx_enable~output_o\;

ww_uart_byte(0) <= \uart_byte[0]~output_o\;

ww_uart_byte(1) <= \uart_byte[1]~output_o\;

ww_uart_byte(2) <= \uart_byte[2]~output_o\;

ww_uart_byte(3) <= \uart_byte[3]~output_o\;

ww_uart_byte(4) <= \uart_byte[4]~output_o\;

ww_uart_byte(5) <= \uart_byte[5]~output_o\;

ww_uart_byte(6) <= \uart_byte[6]~output_o\;

ww_uart_byte(7) <= \uart_byte[7]~output_o\;
END structure;


