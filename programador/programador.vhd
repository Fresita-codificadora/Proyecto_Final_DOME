library ieee;
	use ieee.std_logic_1164.all;

entity programador is

	port(
		clk		 : in	std_logic;
		clk_div4,clk_div2 : out std_logic;
		start	 : in	std_logic;
--		r_w : in std_logic;
		stop : in std_logic;
		reset	 : in	std_logic;
--		data : in std_logic_vector (7 downto 0);
--		sda	 : out	std_logic;
--		sca    : out std_logic;
		buisy : out std_logic_vector (1 downto 0)
	);

end entity;

architecture rtl of programador is

	-- Build an enumerated type for the state machine
	--type state_type is (idle, start_1, start_2, hold, stop_1, d_0, d_1, d_2, d_3, d_4, d_5, d_6, d_7, d_end);
	type state_type is (idle, start_1, start_2, hold);
	-- Register to hold the current state
	signal state   : state_type;
	
	signal clk_div2_int,clk_div4_int : std_logic;
--	
--	component div is
--		generic (modulus : integer);
--		port( clk_in : in std_logic; clk_out : out std_logic);
--	end component div;
	

begin
--	div1 : div generic map (2)port map (clk_in=>clk,clk_out=>clk_div2_int);
--	clk_div2<=clk_div2_int;
--	div2 : div generic map (2)port map (clk_in=>clk_div2_int,clk_out=>clk_div4_int);
--	clk_div4<=clk_div4_int;
	-- Contdor de 4 Estados (Divisor x4)
	clk_div2_int <= not(clk_div2_int) when (clk'event and clk='1');
	clk_div2 <= clk_div2_int;
	clk_div4_int <= not(clk_div4_int) when (clk_div2_int'event and clk_div2_int='1');
	clk_div4 <= clk_div4_int;
--	-- Logic to advance to the next state
	--process (clk, reset)
--	variable count : integer range 0 to 4;
	--begin
--		if reset = '1' then
--			state <= idle;
--		elsif (rising_edge(clk)) then
--			case state is
--				when idle=>
--					if start = '1' then
--						state <= start_1;
--					else
--						state <= idle;
--					end if;
--				when start_1=>
--					if clk_div4_int = '1' then 
--						count := 0;
--					end if;
--					if count < 1 then
--						count := count + 1;
--					else
--						state <= start_2;
--					end if;
--				when start_2=>
--					count := 0;
--					while count < 2 loop
--						count := count + 1;
--					end loop;
--					if count = 2 then
--						state <= hold;
--					end if;
--				when hold =>
--					if stop = '1' then 
--						state <= idle;
--					else 
--						state <= hold;
--					end if;
----				when hold =>
----					if r_w = '1' then
----						state <= d_1;
----					elsif stop= '1' then
----						state <= stop_1;
----					else
----						state <= hold;
----					end if;
----				when d_1 =>
----					state <= d_2;
----				when d_2 =>
----					state <= d_3;
----				when d_3 =>
----					state <= d_4;
----				when d_4 =>
----					state <= d_5;
----				when d_5 <=
--			end case;
--		end if;
--	end process;
--
--	-- Output depends solely on the current state
--	process (state)
--	begin
--		case state is
--			when idle =>
--				buisy <= "00";
--			when start_1 =>
--				buisy <= "01";
--			when start_2 =>
--				buisy <= "10";
--			when hold =>
--				buisy <= "11";
--		end case;
--	end process;

end rtl;
