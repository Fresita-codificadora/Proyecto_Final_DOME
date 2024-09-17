library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
entity escritura_lectura is

	port(
		--entradas
		clk		 	: in	std_logic;
		btn		 	: in	std_logic;
		reset	 		: in	std_logic;
		data_i		: in 	std_logic_vector(10 downto 0);
		--salidas
		dir_o			: out 	std_logic_vector(10 downto 0);
		data_o		: out 	std_logic_vector(10 downto 0);
		write_en 	: out 	std_logic
--		estado		: out 	integer range 0 to 4;
--		led_salida 	: out	std_logic_vector(10 downto 0)
	);

end entity;

architecture rtl of escritura_lectura is

	-- Build an enumerated type for the state machine
	type state_type is (dir_y_enable, escritura, lectura, cambio_dir, boton_press);

	-- Register to hold the current state
	signal state   : state_type;

	-- señales internas
	signal dir_interna : integer range 0 to 2**11-1;
	signal contador_dato : integer range 0 to 2048;
begin

	-- Logic to advance to the next state
	process (all)
		variable boton_prev : std_logic;
	begin
		if reset = '0' then					--la edu ciaa tiene resistencias de pull_up
			state <= dir_y_enable;
			dir_interna <= 0;
			contador_dato <= 0;
		elsif (rising_edge(clk)) then
			case state is
				when dir_y_enable=>
					state <= escritura;
					dir_interna<=dir_interna+1;
					contador_dato <= contador_dato + 1;
				when escritura=>
					if dir_interna < 2**11-1  then --si todavia no termine de barrer vamos a dir_y_enable
						state <= dir_y_enable;
					else
						dir_interna <= 0;							--si ya barrimos toda la memoria escribiendo el contador
						state <= lectura;
					end if;
				when lectura=>
					state <= cambio_dir;
				when cambio_dir =>
					if btn = '0' then
						state <= boton_press;
						boton_prev := '0';
					else
						state <= cambio_dir;
					end if;
				when boton_press =>
						if	btn = boton_prev then
							state <= boton_press;
						else
							dir_interna <= dir_interna + 1;
							state <= lectura;
							boton_prev := '1';
						end if;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (all)
	begin
		case state is
			when dir_y_enable =>
				write_en 	<= '0'; 	--no habilito la escitura
				dir_o			<= std_logic_vector(to_unsigned(dir_interna,11));			
				data_o		<= std_logic_vector(to_unsigned(contador_dato,11));
--				led_salida 	<= (others => '0');
--				estado		<= 0;
			when escritura =>
				write_en 	<= '1'; 	--habilito la escritura
				dir_o			<= std_logic_vector(to_unsigned(dir_interna,11));			
				data_o		<= std_logic_vector(to_unsigned(contador_dato,11));
--				led_salida 	<= (others => '0');
--				estado		<= 1;
			when lectura =>
				write_en 	<= '0'; 	
				dir_o		<= std_logic_vector(to_unsigned(dir_interna,11));			
				data_o		<= (others => '0');
--				led_salida 	<= (others => '0');
--				estado		<= 2;
			when cambio_dir =>
				write_en 	<= '0'; 	
				dir_o		<= std_logic_vector(to_unsigned(dir_interna,11));			
				data_o		<= (others => '0');
--				led_salida 	<= data_i;
--				estado		<= 3;
			when boton_press=>
				write_en 	<= '0'; 	
				dir_o			<= std_logic_vector(to_unsigned(dir_interna,11));			
				data_o		<= (others => '0');
--				led_salida 	<= data_i;
--				estado		<= 4;
		end case;
	end process;

end rtl;
