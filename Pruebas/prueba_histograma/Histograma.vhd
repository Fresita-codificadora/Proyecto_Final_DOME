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

entity Histograma is
	generic(
				num_bits : integer :=13
				);

	port(
		clk		 					: in	std_logic;
		reset	 					: in	std_logic;
		data_ener					: in	std_logic_vector(13 downto 0);
		data_cant					: in	std_logic_vector(5 downto 0);
		enable						: in 	std_logic;
		--salidas
		hist_data					: out std_logic_vector(13 downto 0);
		hist_addr					: out std_logic_vector(9 downto 0);
		r_w_hist	 				: out std_logic;
		cant_ener_addr				: out std_logic_vector(10 downto 0);
		r_w_cant_ener				: out std_logic
	);

end entity;

architecture rtl of Histograma is

	-- Build an enumerated type for the state machine
	type state_type is (idle, direccion, lectura, filtro, histograma, escritura_1, escritura_2, cambio_dir_escritura);

	-- Register to hold the current state
	signal state   : state_type;

	signal dir_mem : integer range 0 to 2047 	:= 0;
	signal indice_hist : integer range 0 to 32 	:=1;
	signal dir_escritura : integer range 0 to 1023 :=0;
	signal reg_cantidad									: integer range 0 to 64		:=0;
	signal reg_energia									: integer range 0 to 16384	:=0;--son 14 bits
	constant ancho_bin : integer := (2**num_bits)/32;

		-- Definimos el histograma como un arreglo de 32 bins de 14 bits.
	type hist_array is array (1 to 32) of integer range 0 to (2**14-1);
	signal histogram : hist_array := (others => 0); --lo iniciamos en cero
begin
	-- Logic to advance to the next state
	process (all)
		variable cuenta : integer range 0 to 2047 :=1;
	begin
		if reset = '0' then
			state <= idle;
			dir_mem <= 0;
			cuenta := 1;
			histogram <= (others => 0) ;
		elsif (rising_edge(clk)) then
			case state is
				when idle=>
					if enable = '1' then
						state <= direccion;
						dir_mem <= 0;
					else
						state <= idle;
					end if;
				when direccion=>
					dir_mem <= dir_mem + 1; --cambiamos la direccion de memoria de energia y cantidad
					if dir_mem < 2047 then --si no llegamos al final de la memoria hacemos la lectura
						cuenta := 1;
						state <= lectura;
					else
						state <= escritura_1;
						dir_mem <= 0;
					end if;
				when lectura=>				-- en este momento deberiamos haber leido las memorias cantidad y energia
					cuenta := cuenta + 1;
					if cuenta < 3 then
						state <= lectura;
					else
						cuenta := 1;
						state <= filtro;
					end if ;
				when filtro =>
					if (reg_cantidad > 1 and reg_energia > 0) then
						state <= histograma;						
					elsif reg_energia = 0 then --si en energia hay un valor que es cero, es por que ya llegamos al final de los eventos
						state <= escritura_1;
					else --este es el caso de que reg_cantidad sea 1(osea ignoramos)
						state <= direccion;
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
					state <= direccion;	
				when escritura_1 =>
					state <= escritura_2;
				when escritura_2 =>
					state <= cambio_dir_escritura;
				when cambio_dir_escritura =>
					dir_escritura <= dir_escritura + 1;
					indice_hist <= indice_hist + 1;
					if dir_escritura < 32 then
						state <= escritura_1;
					else --si ya escribimos los 32 lugares de memoria vamos a idle
						state <= idle;
					end if;			
					if indice_hist=32 then --reiniciamos el indice hist
						indice_hist <= 1;
					end if;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (all)
	begin
		case state is
			when idle =>
				hist_data		<= (others => 'Z');			
				hist_addr		<= (others => 'Z');		
				r_w_hist	 	<= 'Z';			
				cant_ener_addr	<= (others => 'Z');		
				r_w_cant_ener	<= 'Z';			
			when direccion =>
				hist_data		<= (others => '0');			
				hist_addr		<= (others => '0');		
				r_w_hist	 	<= '0';			
				cant_ener_addr	<= Std_Logic_Vector(to_unsigned(dir_mem,11));		
				r_w_cant_ener	<= '0';	
			when lectura =>
				hist_data		<= (others => '0');			
				hist_addr		<= (others => '0');		
				r_w_hist	 	<= '0';			
				cant_ener_addr	<= Std_Logic_Vector(to_unsigned(dir_mem,11));		
				r_w_cant_ener	<= '0';
			when filtro =>
				hist_data		<= (others => '0');			
				hist_addr		<= (others => '0');		
				r_w_hist	 	<= '0';			
				cant_ener_addr	<= (others => '0') ;		
				r_w_cant_ener	<= '0';
			when histograma =>
				hist_data		<= (others => '0');			
				hist_addr		<= (others => '0');		
				r_w_hist	 	<= '0';			
				cant_ener_addr	<= (others => '0') ;		
				r_w_cant_ener	<= '0';
			when escritura_1 =>
				hist_data		<= std_logic_vector(to_unsigned(histogram(indice_hist),14));			
				hist_addr		<= std_logic_vector(to_unsigned(dir_escritura,10));		
				r_w_hist	 	<= '1';			
				cant_ener_addr	<= (others => '0') ;		
				r_w_cant_ener	<= '0';
			when escritura_2 =>
				hist_data		<= std_logic_vector(to_unsigned(histogram(indice_hist),14));			
				hist_addr		<= std_logic_vector(to_unsigned(dir_escritura,10));		
				r_w_hist	 	<= '1';			
				cant_ener_addr	<= (others => '0') ;		
				r_w_cant_ener	<= '0';
			when cambio_dir_escritura =>
				hist_data		<= (others => '0');			
				hist_addr		<= (others => '0');		
				r_w_hist	 	<= '0';			
				cant_ener_addr	<= (others => '0') ;		
				r_w_cant_ener	<= '0';
		end case;
		if reset = '0' then
			reg_energia <= 0;
			reg_cantidad <= 0;
		elsif rising_edge(clk) then
			case state is
				when lectura =>
					reg_energia <= to_integer(unsigned(data_ener));
					reg_cantidad <= to_integer(unsigned(data_cant));
				when others =>
					
			end case;
		end if;	
	end process;

end rtl;
