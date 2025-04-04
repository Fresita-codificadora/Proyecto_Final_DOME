-- maquina de estados que se encarga generar el vector a escribir en la sram de la de2 115 con los 8 bits menos significativos siendo el primer pixel
-- y los 8 bit mas significativos siendo el segundo pixel que recibio para poder utilizar toda la memoria, estos datos son escritos en la sram
-- luego se avanza en la memoria hasta escribir toda la imagen, una vez cumplida esta condicion se manda la señal de fin para que la mauqina de estados  
-- controlador_sram_CIC_UART tome la batuta y lo mande a una PC
-- 
-- este archivo deberia ir de la mano de un .bdf donde se deberian encontrar los archivos 
-- controlador_sram_CIC_UART
-- SRAM
-- Captura_pixeles
-- Programador_controlador_block
-- divisor
-- UART_TX
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity sram_CIC is

	port(
		clk: in	std_logic;
		Start,reset,leer,trigger: in	std_logic;
		--pix_cnt: in integer range 0 to 1_310_721;
		pix_valid : in std_logic;
		data : in std_logic_vector(7 downto 0);
		data_o : out std_logic_vector(15 downto 0);
		add : out std_logic_vector(19 downto 0);
		reset_o,r_w_O,fin_signal : out std_logic
	);

end entity;

architecture rtl of sram_CIC is

	-- Build an enumerated type for the state machine
	type state_type is ( add_increment,espero_proximo, escritura_lsb, escritura_msb, fin);
	
	-- Register to hold the current state
	signal state   : state_type;
	signal clk_int : std_logic;
	signal data_reg, vec_salida_lsb : std_logic_vector(7 downto 0):=x"00";
	signal add_count : integer range 0 to 2**20-1:=0;
	signal pix_previo : integer range 0 to 1_310_721;
	signal lsb : std_logic; --senal para marcar si ya se escribio el lsb o no
	signal pix_cnt_int : integer range 0 to 1310720:=0;
begin
--	div_clk:process (clk) -- no se si lo necesito
--	begin
--		if rising_edge(clk) then
--			clk_int<= not clk_int;
--		end if;
--	end process;
	-- Logic to advance to the next state
	process (all)
	begin
		if reset = '0' or trigger = '1' then
			state <= espero_proximo;
			data_reg <=x"00";
			vec_salida_lsb <= x"00";
			add_count <=0;
			lsb <= '0';
			pix_cnt_int <= 0;
		elsif (rising_edge(clk)) then
			case state is
--				when idle=>
--					if pix_cnt<1_310_719 then
--						if leer = '1' then
--							state <= espero_proximo;
--						else
--							state <= idle;
--						end if;
--					else
--						state<=fin;
--					end if;
				when espero_proximo=>
					if pix_cnt_int<1_310_720 then
						if pix_valid = '1' then
							pix_cnt_int <= pix_cnt_int + 1;
							data_reg <= data;
							if lsb = '0' then
								state <= escritura_lsb;
							else
							    state <= escritura_msb;
							end if;
						else
							state <= espero_proximo;
						end if;
					else 
						state <= fin;
					end if;
				when escritura_lsb=>
					if pix_cnt_int<1_310_719 then
						state <= espero_proximo;
						lsb<='1';
						vec_salida_lsb<=data_reg;
					else
						state <= fin;
					end if;
				when escritura_msb=>
					if pix_cnt_int<1_310_719 then
						state <= add_increment;
					else
						state <= fin;
					end if;
				when add_increment =>
					if pix_cnt_int<1_310_719 then
						state <= espero_proximo;
						lsb<='0';
						add_count<=add_count+1;
					else
						state <= fin;
					end if;
				when fin =>
					if trigger='1' then
						state<=espero_proximo;
						add_count<=0;
					else
						state<=fin;
					end if;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (all)
	begin
		case state is
--			when idle =>
--				add <=std_logic_vector(to_unsigned(add_count,20));
--				data_o <=x"0000";
--				reset_o<='1';
--				r_w_O <='1';
--				fin_signal<='0';
			when espero_proximo =>
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=x"0000";
				reset_o<='1';
				r_w_O <='1';
				fin_signal<='0';
			when escritura_lsb =>
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=x"0000";
				reset_o<='1';
				r_w_O <='1';
				fin_signal<='0';
			when escritura_msb =>
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=vec_salida_lsb & data_reg;                --aca le mando lo del anterior y lo del nuevo
				reset_o<='1';
				r_w_O <='1';
				fin_signal<='0';
			when add_increment =>
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=vec_salida_lsb & data_reg;                --aca le mando lo del anterior y lo del nuevo
				reset_o<='1';
				r_w_O <='1';
				fin_signal<='0';
			when fin =>
				add <=(others=>'Z');
				data_o <=(others=>'Z');
				reset_o<='Z';
				r_w_O <='Z';
				fin_signal<='1';
		end case;
	end process;

end rtl;
