-- Quartus Prime VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_algo is
	generic(
			pixels : integer := 1_310_720
	);
	port(
		clk			: in	std_logic;
		reset	 		: in	std_logic;
		rx_dv	 		: in std_logic;
		rx_byte 		: in std_logic_vector (7 downto 0);
		pix_count	: out std_logic_vector(20 downto 0);
		byte_o	: out std_logic_vector(7 downto 0)
	);

end entity;

architecture rtl of uart_algo is

	-- Build an enumerated type for the state machine
	type state_type is (idle, envio);

	-- Register to hold the current state
	signal state   : state_type;
	
	signal pix_count_int : integer range 0 to pixels:=0;
	signal reg_data : std_logic_vector (7 downto 0);
begin
	
	-- Logic to advance to the next state
	process (all)
	begin
		if reset = '0' then
			state <= idle;
			pix_count_int 		<= 0;
			reg_data	<= (others=>'0');
		elsif (rising_edge(clk)) then
			case state is
				when idle=>
					if rx_dv = '1' then
						state <= envio;
						pix_count_int <= pix_count_int + 1;
						reg_data <= rx_byte;
					else
						state <= idle;
						if pix_count_int = pixels then
							pix_count_int <= 0;
						end if;
					end if;
				when envio=>
					state<=idle;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (all)
	begin
		case state is
			when idle =>
				pix_count	<=	std_logic_vector(to_unsigned(pix_count_int, 21));
				byte_o		<= reg_data;
			when envio=>
				pix_count	<=	std_logic_vector(to_unsigned(pix_count_int, 21));
				byte_o		<= reg_data;
		end case;
	end process;

end rtl;
