library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_algo_nuevo is
	port(
		clk			: in	std_logic;
		reset	 		: in	std_logic;
		rx_dv	 		: in std_logic;
		rx_byte 		: in std_logic_vector (7 downto 0);
      ack         : in std_logic;
		byte_o	: out std_logic_vector(7 downto 0);
		pix_valid   : out std_logic
		
	);

end entity;

architecture rtl of uart_algo_nuevo is

	-- Build an enumerated type for the state machine
	type state_type is (idle, envio);

	-- Register to hold the current state
	signal state   : state_type;
	
	signal reg_data : std_logic_vector (7 downto 0);
begin
	
	-- Logic to advance to the next state
	process (all)
	begin
		if reset = '1' then
			state <= idle;
			reg_data	<= (others=>'0');
		elsif (rising_edge(clk)) then
			case state is
				when idle=>
					if rx_dv = '1' then
						state <= envio;
						reg_data <= rx_byte;
					else
						state <= idle;
					end if;
				when envio=>
                    if ack = '1' then
					    state<=idle;
                    else
                        state <= envio;
                    end if;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (all)
	begin
		case state is
			when idle =>
				byte_o		<= reg_data;
                pix_valid   <= '0';
			when envio=>
				byte_o		<= reg_data;
                pix_valid   <= '1';
		end case;
	end process;

end rtl;
