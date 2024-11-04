-- la variable num_bits define el ancho de los bines siendo el maximo 2**14/32=512
--2**13/32=256;
--2**12/32=128;
--...
--2**10/32=32; 
--ademas esto define el maximo admitido del histograma ya que es 2**num_bits, asi que esto
--debe definirse segun las necesidades del usuario final

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity Histograma_2 is
	generic(
				num_bits : integer := 13  --ver nota arriba
	);
	port(
		clk		 					: in	std_logic;
		reset	 					: in	std_logic;
		data_ener					: in	std_logic_vector(13 downto 0);
		data_count					: in 	Std_Logic_Vector(20 downto 0); --esto va a contar cuantos datos le van mandando es para control de flujo
		uart_sending 				: in 	std_logic;
		--salidas
		data_uart					: out std_logic_vector(7 downto 0);
		r_w_hist	 				: out std_logic
	);

end entity;

architecture rtl of Histograma_2 is

	-- Build an enumerated type for the state machine
	type state_type is (idle, histograma, envio_ok_1, envio_ok_2, envio_1, envio_2, envio_3, envio_4);

	-- Register to hold the current state
	signal state   : state_type;

	signal dir_mem : integer range 0 to 2047 	:= 0;
	signal indice_hist : integer range 0 to 32 	:=1;
	signal dir_escritura : integer range 0 to 1023 :=0;
	signal reg_cantidad									: integer range 0 to 64		:=0;
	signal reg_energia									: integer range 0 to 16384	:=0;--son 14 bits
	signal dato_count_int, dato_ant								: integer range 0 to 2**20-1;
	
	constant ancho_bin : integer := (2**num_bits)/32;

		-- Definimos el histograma como un arreglo de 32 bins de 14 bits.
	type hist_array is array (1 to 32) of integer range 0 to (2**14-1);
	signal histogram : hist_array := (others => 0); --lo iniciamos en cero
begin
	dato_count_int <= to_integer(unsigned(data_count));--transformamos el dato de la cuenta
	-- Logic to advance to the next state
	process (all)
		variable cuenta : integer range 0 to 2047 :=1;
	begin
		if reset = '0' then
			state <= idle;
			dir_mem <= 0;
			cuenta := 1;
			histogram <= (others => 0) ;
			dato_ant <= 100;
			reg_energia <= 0;
		elsif (rising_edge(clk)) then
			case state is
				when idle=>
					if dato_count_int /= dato_ant then
						dato_ant <= dato_count_int;
						reg_energia <= to_integer(unsigned(data_ener)); 
						if TO_INTEGER(unsigned(data_ener))>0 then --si el dato de energia es mayor a cero entonces hacemos el histograma
							state <= histograma;
						else
							state <= envio_1;
							indice_hist <= 1;
						end if;
					else
						state <= idle;
					end if;
				when histograma =>
					if (reg_energia >= 0 and reg_energia < ancho_bin) then
					    histogram(1) <= histogram(1) + 1;
					elsif (reg_energia >= ancho_bin and reg_energia < 2 * ancho_bin) then
					    histogram(2) <= histogram(2) + 1;
					elsif (reg_energia >= 2 * ancho_bin and reg_energia < 3 * ancho_bin) then
					    histogram(3) <= histogram(3) + 1;
					elsif (reg_energia >= 3 * ancho_bin and reg_energia < 4 * ancho_bin) then
					    histogram(4) <= histogram(4) + 1;
					elsif (reg_energia >= 4 * ancho_bin and reg_energia < 5 * ancho_bin) then
					    histogram(5) <= histogram(5) + 1;
					elsif (reg_energia >= 5 * ancho_bin and reg_energia < 6 * ancho_bin) then
					    histogram(6) <= histogram(6) + 1;
					elsif (reg_energia >= 6 * ancho_bin and reg_energia < 7 * ancho_bin) then
					    histogram(7) <= histogram(7) + 1;
					elsif (reg_energia >= 7 * ancho_bin and reg_energia < 8 * ancho_bin) then
					    histogram(8) <= histogram(8) + 1;
					elsif (reg_energia >= 8 * ancho_bin and reg_energia < 9 * ancho_bin) then
					    histogram(9) <= histogram(9) + 1;
					elsif (reg_energia >= 9 * ancho_bin and reg_energia < 10 * ancho_bin) then
					    histogram(10) <= histogram(10) + 1;
					elsif (reg_energia >= 10 * ancho_bin and reg_energia < 11 * ancho_bin) then
					    histogram(11) <= histogram(11) + 1;
					elsif (reg_energia >= 11 * ancho_bin and reg_energia < 12 * ancho_bin) then
					    histogram(12) <= histogram(12) + 1;
					elsif (reg_energia >= 12 * ancho_bin and reg_energia < 13 * ancho_bin) then
					    histogram(13) <= histogram(13) + 1;
					elsif (reg_energia >= 13 * ancho_bin and reg_energia < 14 * ancho_bin) then
					    histogram(14) <= histogram(14) + 1;
					elsif (reg_energia >= 14 * ancho_bin and reg_energia < 15 * ancho_bin) then
					    histogram(15) <= histogram(15) + 1;
					elsif (reg_energia >= 15 * ancho_bin and reg_energia < 16 * ancho_bin) then
					    histogram(16) <= histogram(16) + 1;
					elsif (reg_energia >= 16 * ancho_bin and reg_energia < 17 * ancho_bin) then
					    histogram(17) <= histogram(17) + 1;
					elsif (reg_energia >= 17 * ancho_bin and reg_energia < 18 * ancho_bin) then
					    histogram(18) <= histogram(18) + 1;
					elsif (reg_energia >= 18 * ancho_bin and reg_energia < 19 * ancho_bin) then
					    histogram(19) <= histogram(19) + 1;
					elsif (reg_energia >= 19 * ancho_bin and reg_energia < 20 * ancho_bin) then
					    histogram(20) <= histogram(20) + 1;
					elsif (reg_energia >= 20 * ancho_bin and reg_energia < 21 * ancho_bin) then
					    histogram(21) <= histogram(21) + 1;
					elsif (reg_energia >= 21 * ancho_bin and reg_energia < 22 * ancho_bin) then
					    histogram(22) <= histogram(22) + 1;
					elsif (reg_energia >= 22 * ancho_bin and reg_energia < 23 * ancho_bin) then
					    histogram(23) <= histogram(23) + 1;
					elsif (reg_energia >= 23 * ancho_bin and reg_energia < 24 * ancho_bin) then
					    histogram(24) <= histogram(24) + 1;
					elsif (reg_energia >= 24 * ancho_bin and reg_energia < 25 * ancho_bin) then
					    histogram(25) <= histogram(25) + 1;
					elsif (reg_energia >= 25 * ancho_bin and reg_energia < 26 * ancho_bin) then
					    histogram(26) <= histogram(26) + 1;
					elsif (reg_energia >= 26 * ancho_bin and reg_energia < 27 * ancho_bin) then
					    histogram(27) <= histogram(27) + 1;
					elsif (reg_energia >= 27 * ancho_bin and reg_energia < 28 * ancho_bin) then
					    histogram(28) <= histogram(28) + 1;
					elsif (reg_energia >= 28 * ancho_bin and reg_energia < 29 * ancho_bin) then
					    histogram(29) <= histogram(29) + 1;
					elsif (reg_energia >= 29 * ancho_bin and reg_energia < 30 * ancho_bin) then
					    histogram(30) <= histogram(30) + 1;
					elsif (reg_energia >= 30 * ancho_bin and reg_energia < 31 * ancho_bin) then
					    histogram(31) <= histogram(31) + 1;
					elsif (reg_energia >= 31 * ancho_bin and reg_energia < 32 * ancho_bin) then
					    histogram(32) <= histogram(32) + 1;
					else 
					end if;
					state <= envio_ok_1;	
				when envio_ok_1 =>
					state <= envio_ok_2;
				when envio_ok_2 =>
					if uart_sending = '1' then
						state <= envio_ok_2;
					else
						state <= idle;
					end if;
				when envio_1 =>
					state <= envio_2;
				when envio_2 =>
					if uart_sending = '1' then
						state <= envio_2;
					else
						state <= envio_3;
					end if;
				when envio_3 =>
					state <= envio_4;
				when envio_4 =>
					if uart_sending = '1' then
						state <= envio_4;
					else
						indice_hist <= indice_hist + 1;
						if indice_hist <= 32 then
							state <= envio_1;
						else
							state <= idle;
						end if;
					end if;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (all)
	begin
		case state is
			when idle =>
				data_uart	<=	(others => '0'); 
				r_w_hist	<=	'0';  						
			when histograma =>
				data_uart	<=	(others => '0');
				r_w_hist	<=	'0';
			when envio_ok_1 =>
				data_uart 	<= "10000000";
				r_w_hist 	<= '1';
			when envio_ok_2 =>
				data_uart 	<= "10000000";
				r_w_hist 	<= '0';
			when envio_1 =>
				data_uart 	<= "00" & std_logic_vector(to_unsigned(histogram(indice_hist),14))(13 downto 8);
				r_w_hist 	<= '1';
			when envio_2 =>
				data_uart 	<= "00" & std_logic_vector(to_unsigned(histogram(indice_hist),14))(13 downto 8);
				r_w_hist 	<= '0';
			when envio_3 =>
				data_uart 	<= std_logic_vector(to_unsigned(histogram(indice_hist),14))(7 downto 0);
				r_w_hist 	<= '1';
			when envio_4 =>
				data_uart 	<= std_logic_vector(to_unsigned(histogram(indice_hist),14))(7 downto 0);
				r_w_hist 	<= '0';
		end case;	
	end process;

end rtl;
