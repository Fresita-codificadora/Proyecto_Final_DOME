-- Quartus Prime VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity Sram_CIC_3 is

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

architecture rtl of Sram_CIC_3 is

	-- Build an enumerated type for the state machine
	type state_type is (idle, espero_proximo, escritura, fin);
	
	-- Register to hold the current state
	signal state   : state_type;
	signal clk_int : std_logic;
	signal data_reg : std_logic_vector(15 downto 0):=x"0000";
	signal add_count : integer range 0 to 2**20-1:=0;
	signal pix_previo : integer range 0 to 1_310_721;
begin
	div_clk:process (clk) -- no se si lo necesito
	begin
		if rising_edge(clk) then
			clk_int<= not clk_int;
		end if;
	end process;
	-- Logic to advance to the next state
	process (clk, reset)
	begin
		if reset = '0' then
			state <= idle;
			data_reg <=x"0000";
			add_count <=0;
		elsif (rising_edge(clk_int)) then
			case state is
				when idle=>
					if pix_cnt<1_310_719 then
						if leer = '1' then
							state <= espero_proximo;
						else
							state <= idle;
						end if;
					else
						state<=fin;
					end if;
				when espero_proximo=>
					if pix_cnt<1_310_719 then
						if pix_cnt=pix_previo then -- si me llega el mismo pixel me quedo esperando al proximo
							state<=espero_proximo;
						else -- si llega uno nuevo
							pix_previo<=pix_cnt;
							state<=escritura;
						end if;
					else
						state<=fin;
					end if;
				when escritura=>
					if pix_cnt<1_310_719 then
						state <= espero_proximo;
						add_count<=add_count+1;
					else
						state <= fin;
					end if;
				when fin =>
					if start='0' then
						state<=idle;
					else
						state<=fin;
					end if;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when idle =>
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=x"0000";
				reset_o<='1';
				r_w_O <='1';
				fin_signal<='0';
			when espero_proximo =>
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=x"00" & data;
				reset_o<='1';
				r_w_O <='1';
				fin_signal<='0';
			when escritura =>
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=x"00" & data;
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