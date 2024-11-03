-- Quartus Prime VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity Histograma is

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
					if (reg_energia >= 0 and reg_energia < 256) then
						histogram(1) <= histogram(1) + 1;
					elsif (reg_energia >= 256 and reg_energia < 512) then
						histogram(2) <= histogram(2) + 1;
					elsif (reg_energia >= 512 and reg_energia < 768) then
						histogram(3) <= histogram(3) + 1;
					elsif (reg_energia >= 768 and reg_energia < 1024) then
						histogram(4) <= histogram(4) + 1;
					elsif (reg_energia >= 1024 and reg_energia < 1280) then
						histogram(5) <= histogram(5) + 1;
					elsif (reg_energia >= 1280 and reg_energia < 1536) then
						histogram(6) <= histogram(6) + 1;
					elsif (reg_energia >= 1536 and reg_energia < 1792) then
						histogram(7) <= histogram(7) + 1;
					elsif (reg_energia >= 1792 and reg_energia < 2048) then
						histogram(8) <= histogram(8) + 1;
					elsif (reg_energia >= 2048 and reg_energia < 2304) then
						histogram(9) <= histogram(9) + 1;
					elsif (reg_energia >= 2304 and reg_energia < 2560) then
						histogram(10) <= histogram(10) + 1;
					elsif (reg_energia >= 2560 and reg_energia < 2816) then
						histogram(11) <= histogram(11) + 1;
					elsif (reg_energia >= 2816 and reg_energia < 3072) then
						histogram(12) <= histogram(12) + 1;
					elsif (reg_energia >= 3072 and reg_energia < 3328) then
						histogram(13) <= histogram(13) + 1;
					elsif (reg_energia >= 3328 and reg_energia < 3584) then
						histogram(14) <= histogram(14) + 1;
					elsif (reg_energia >= 3584 and reg_energia < 3840) then
						histogram(15) <= histogram(15) + 1;
					elsif (reg_energia >= 3840 and reg_energia < 4096) then
						histogram(16) <= histogram(16) + 1;
					elsif (reg_energia >= 4096 and reg_energia < 4352) then
						histogram(17) <= histogram(17) + 1;
					elsif (reg_energia >= 4352 and reg_energia < 4608) then
						histogram(18) <= histogram(18) + 1;
					elsif (reg_energia >= 4608 and reg_energia < 4864) then
						histogram(19) <= histogram(19) + 1;
					elsif (reg_energia >= 4864 and reg_energia < 5120) then
						histogram(20) <= histogram(20) + 1;
					elsif (reg_energia >= 5120 and reg_energia < 5376) then
						histogram(21) <= histogram(21) + 1;
					elsif (reg_energia >= 5376 and reg_energia < 5632) then
						histogram(22) <= histogram(22) + 1;
					elsif (reg_energia >= 5632 and reg_energia < 5888) then
						histogram(23) <= histogram(23) + 1;
					elsif (reg_energia >= 5888 and reg_energia < 6144) then
						histogram(24) <= histogram(24) + 1;
					elsif (reg_energia >= 6144 and reg_energia < 6400) then
						histogram(25) <= histogram(25) + 1;
					elsif (reg_energia >= 6400 and reg_energia < 6656) then
						histogram(26) <= histogram(26) + 1;
					elsif (reg_energia >= 6656 and reg_energia < 6912) then
						histogram(27) <= histogram(27) + 1;
					elsif (reg_energia >= 6912 and reg_energia < 7168) then
						histogram(28) <= histogram(28) + 1;
					elsif (reg_energia >= 7168 and reg_energia < 7424) then
						histogram(29) <= histogram(29) + 1;
					elsif (reg_energia >= 7424 and reg_energia < 7680) then
						histogram(30) <= histogram(30) + 1;
					elsif (reg_energia >= 7680 and reg_energia < 7936) then
						histogram(31) <= histogram(31) + 1;
					elsif (reg_energia >= 7936 and reg_energia <= 8192) then
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
