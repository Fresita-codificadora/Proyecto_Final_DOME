
library ieee;
use ieee.std_logic_1164.all;

entity trigger_handler is

	port(
		clk		 : in	std_logic;
		trigger_in	 : in	std_logic;
		reset	 : in	std_logic;
		trigger_cam,trigger_int	 : out	std_logic
	);

end entity;

architecture rtl of trigger_handler is

	-- Build an enumerated type for the state machine
	type state_type is (s0, s1, s2, s3);

	-- Register to hold the current state
	signal state   : state_type;

begin

	-- Logic to advance to the next state
	process (clk, reset)
		variable cuenta : integer range 0 to 4;
	begin
		if reset = '1' then
			state <= s0;
		elsif (rising_edge(clk)) then
			case state is
				when s0=>
					if trigger_in = '0' then -- esperamos la señal de trigger
						state <= s1;
					else
						state <= s0;
					end if;
				when s1=>                  -- enviamos las señales de trigger a las maquinas de estados
					if trigger_in = '0' then
						state <= s2;
					else
						state <= s0;
					end if;
				when s2=>                  -- enviamos las señales de trigger a la camara
					if trigger_in = '0' then
						if cuenta<=4 then
							cuenta:=cuenta+1;
							state <= s2;
						else
							cuenta:=0;
							state<=s3;
						end if;
					else
						state <= s0;
					end if;
				when s3 =>                 -- esperamos a que deje de apretar la señal de trigger
					if trigger_in = '0' then
						state <= s3;
					else
						state <= s0;
					end if;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when s0 =>
				trigger_cam<='0';
				trigger_int<='0';
			when s1 =>
				trigger_cam<='0';
				trigger_int<='1';
			when s2 =>
				trigger_cam<='1';
				trigger_int<='0';
			when s3 =>
				trigger_cam<='0';
				trigger_int<='0';
		end case;
	end process;

end rtl;