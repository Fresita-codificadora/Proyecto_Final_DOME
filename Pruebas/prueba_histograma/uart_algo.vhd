library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_algo is
	generic(
			pixels : integer := 2047
	);
	port(
		clk			: in	std_logic;
		reset	 		: in	std_logic;
		rx_dv	 		: in std_logic;						--uart recibido dato
		rx_byte 		: in std_logic_vector (7 downto 0); --byte recibido
		byte_o	: out std_logic_vector(13 downto 0);		--dato que se envia
		pix_count	: out std_logic_vector(20 downto 0)	--cuenta que se envia 
		
	);

end entity;

architecture rtl of uart_algo is

	-- Build an enumerated type for the state machine
	type state_type is (idle, recv_first_byte, recv_second_byte);

	-- Register to hold the current state
	signal state   : state_type;

	signal pix_count_int : integer range 0 to pixels:=0;
	signal reg_data : std_logic_vector(13 downto 0);  -- Registro para los dos bytes
	signal first_byte : std_logic_vector(7 downto 0); -- Registro para almacenar el primer byte

begin

	-- Logic to advance to the next state
	process (all)
	begin
		if reset = '0' then
			state <= idle;
			pix_count_int <= 0;
			reg_data <= (others=>'0');
			first_byte <= (others=>'0');
		elsif (rising_edge(clk)) then
			case state is
				when idle =>
					if rx_dv = '1' then
						state <= recv_first_byte;
						first_byte <= rx_byte;
					end if;
					if pix_count_int = pixels then
						pix_count_int <= 0;
					end if;

				when recv_first_byte =>
					if rx_dv = '1' then
						state <= recv_second_byte;
						reg_data <= first_byte(5 downto 0) & rx_byte; -- Combinar los dos bytes en 13 bits
						pix_count_int <= pix_count_int + 1;
					end if;

				when recv_second_byte =>
					state <= idle; -- Retornar al estado inicial para recibir otra palabra de 2 bytes
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (all)
	begin
		case state is
			when idle =>
				pix_count	<=	std_logic_vector(to_unsigned(pix_count_int, 21));
				byte_o		<= (others=>'0');
			when recv_first_byte =>
				pix_count	<=	std_logic_vector(to_unsigned(pix_count_int, 21));
				byte_o		<= (others=>'0');
			when recv_second_byte =>
				pix_count	<=	std_logic_vector(to_unsigned(pix_count_int, 21));
				byte_o		<= reg_data;
		end case;
	end process;

end rtl;
