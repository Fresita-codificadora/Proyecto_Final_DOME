-- Quartus Prime VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity DUT is

	port(
		clk: in	std_logic;
		Start,reset,leer,trigger: in	std_logic;
		pix_cnt: in integer range 0 to 1_310_721;
		data : in std_logic_vector(7 downto 0);
		data_o : out std_logic_vector(15 downto 0);
		add : out std_logic_vector(19 downto 0);
		reset_o,r_w_O,fin_signal : out std_logic
	);

end entity;

architecture rtl of DUT is

	-- Build an enumerated type for the state machine
	type state_type is ( add_increment,espero_proximo, escritura_lsb, escritura_msb, fin);
	
	-- Register to hold the current state
	signal state   : state_type;
	signal clk_int : std_logic;
	signal data_reg, vec_salida_lsb : std_logic_vector(7 downto 0):=x"00";
	signal add_count : integer range 0 to 2**20-1:=0;
	signal pix_previo : integer range 0 to 1_310_721;
	signal lsb : std_logic; --senal para marcar si ya se escribio el lsb o no
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
					if pix_cnt<1_310_719 then
						if pix_cnt=pix_previo then -- si me llega el mismo pixel me quedo esperando al proximo
							state<=espero_proximo;
						else -- si llega uno nuevo
							pix_previo<=pix_cnt;
							data_reg<=data;
							if lsb = '0' then
								state<=escritura_lsb;
							else
								state<= escritura_msb;
							end if;
						end if;
					else
						state<=fin;
					end if;
				when escritura_lsb=>
					if pix_cnt<1_310_719 then
						state <= espero_proximo;
						lsb<='1';
						vec_salida_lsb<=data_reg;
					else
						state <= fin;
					end if;
				when escritura_msb=>
					if pix_cnt<1_310_719 then
						state <= add_increment;
					else
						state <= fin;
					end if;
				when add_increment =>
					if pix_cnt<1_310_719 then
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
