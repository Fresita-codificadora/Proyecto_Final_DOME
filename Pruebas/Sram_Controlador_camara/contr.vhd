-- Quartus Prime VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contr is

	port(
		clk		 : in	std_logic;
		Start,r_W,input	 : in	std_logic;
		reset	 : in	std_logic;
		data : in std_logic_vector(7 downto 0);
		add : out std_logic_vector(19 downto 0);
		data_o : out std_logic_vector(15 downto 0);
		reset_o,r_w_O : out std_logic;
		add_count_o : out std_logic_vector(7 downto 0)
	);

end entity;

architecture rtl of contr is

	-- Build an enumerated type for the state machine
	type state_type is (s0, s1, s2, s3);

	-- Register to hold the current state
	signal state   : state_type;
	signal data_reg : std_logic_vector(7 downto 0):=x"00";
	signal clk_int,clk_lento: std_logic;
	signal add_count : integer range 0 to 2**20-1:=0;

begin
	process (clk)
		variable cont_int : integer range 0 to 50_000_000;
	begin
		if rising_edge(clk) then
			cont_int:=cont_int+1;
			if cont_int=50_000_000 then
				clk_lento<= not clk_lento;
				cont_int:=0;
			end if;
			clk_int<= not clk_int;
		end if;
	end process;
	
	process(reset,input,clk_lento)
	begin
		if rising_edge(clk_lento) then
			if reset='0' then
				add_count<=0;
			elsif input='0' then
				add_count<=add_count+1;
			end if;
		end if;
	end process;
	add_count_o<=std_logic_vector(to_unsigned(add_count,20))(7 downto 0);
	-- Logic to advance to the next state
	process (clk_int, reset)
	begin
		if reset = '0' then
			state <= s0;
		elsif (rising_edge(clk_int)) then
			case state is
				when s0=>  -- idle reseteo todoooooooooo
					if start = '0' then
						state <= s1; -- vamos al estado idle donde vemos las entradas y hacemos deciciones
					else
						state <= s0;
					end if;
				when s1=> -- estado donde vemos las entradas, las registramos y vemos si r_w es 0(read) o 1(write)
					data_reg<=data;
					if r_w = '1' then
						state <= s2; -- escritura
					else
						state <= s3; -- lectura
					end if;
				when s2=> -- escitura 
					state<=s1;
				when s3 => -- lectura
					state<=s1;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state,add_count,data_reg)
	begin
		case state is
			when s0 =>
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=x"0000";
				reset_o<='0';
				r_w_O <='0';
			when s1 =>
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=x"0000";
				reset_o<='0';
				r_w_O <='0';
			when s2 =>
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o(15 downto 8) <=data_reg;
				data_o(7 downto 0)<=x"00";
				reset_o<='1';
				r_w_O <='1';
			when s3 =>
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=x"0000";
				reset_o<='1';
				r_w_O <='0';
		end case;
	end process;

end rtl;
