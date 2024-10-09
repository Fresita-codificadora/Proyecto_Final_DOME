
--ultima ver
library ieee;
	use ieee.std_logic_1164.all;
	use IEEE.NUMERIC_STD.ALL; 		--libreria para cambios entre formatos

entity algo_3 is
	generic(
		umbral 			: integer := 0;
		pixels			: integer := 7081;
		ancho			: integer := 97;

	)
	port(
		clk		 		: in	std_logic;
		reset	 		: in	std_logic;
		pix_count 		: in std_logic_vector(20 downto 0);
		pix_data 		: in std_logic_vector(7 downto 0);
		data_ram_i		: in std_logic_vector(7 downto 0);
		uart_sending	: in std_logic;
		data_ram_o		: out std_logic_vector(7 downto 0);
		addr_ram		: out std_logic_vector(8 downto 0);
		we				: out std_logic;
		data_uart		: out std_logic_vector(7 downto 0);
		enable_uart		: out std_logic;
		--otras memorias
		data_ram_energia_i		: in std_logic_vector	(15 downto 0);
		data_ram_energia_o		: out std_logic_vector	(15 downto 0);
		addr_ram_energia		: out std_logic_vector	(8 downto 0);
		data_ram_cantidad_i		: in std_logic_vector	(7 downto 0);
		data_ram_cantidad_o		: out std_logic_vector	(7 downto 0);
		addr_ram_cantidad		: out std_logic_vector	(8 downto 0)
	);

end entity;

architecture rtl of algo_3 is

	-- Build an enumerated type for the state machine
	type state_type is (erase, escritura_erase_1, escritura_erase_2, nuevo_pix, dir_anterior, lectura_anterior, dir_ancho_1, lectura_ancho_1
						,dir_ancho_2 , lectura_ancho_2, dir_ancho_3, lectura_ancho_3, casos, dir_cantidad_energia, lectura_cantidad_energia, escritura_1,
						escritura_2, envio_uart_1,envio_uart_2, incremento_indice,envio_mem_1,envio_mem_2,envio_mem_3,envio_mem_4,
						envio_mem_5,envio_mem_6,envio_mem_7,envio_mem_8,envio_mem_9,envio_mem_10);

	-- Register to hold the current state
	signal state   : state_type;

	signal data_a_escribir 									: integer range 0 to 255		:=0;
	signal dir_mem, dir_mem_1, dir_mem_2, dir_mem_3			: integer range 0 to 255 		:=1;
	signal pix_count_int,pix_count_anterior 				: integer range 0 to 1_310_720	:=0;
	signal reg_anterior,reg_ancho_1,reg_ancho_2,reg_ancho_3 : integer range 0 to 255 		:=0;
	signal ignorar_ancho_1 									: BOOLEAN 						:= false;
	signal ignorar_anterior									: BOOLEAN 						:= false;
	signal indice											: integer range 0 to 255		:=1;
	-- señales para las otras memorias
	signal pix_data_reg										: integer range 0 to 255		:=0;
	signal dir_energia										: integer range-1 to 255		:=1;
	signal cantidad_temp									: integer range 0 to 255		:=0;
	signal energia_temp										: integer range 0 to 65535		:=0;--son 16 bits

	procedure encontrar_maximo(
		signal reg1 : in integer;
		signal reg2 : in integer;
		signal reg3 : in integer;
		signal reg4 : in integer;
		signal maximo : out integer
	) is
		variable valor_max1, valor_max2, valor_max_final : integer range 0 to 2047;
	begin
		-- Convertir los registros de std_logic_vector a integer
		valor_max1 := reg1;

		-- Comparar reg1 y reg2
		if valor_max1 < reg2 then
			valor_max1 := reg2;
		end if;

		-- Comparar reg3 y reg4
		valor_max2 := reg3;
		if valor_max2 < reg4 then
			valor_max2 := reg4;
		end if;

		-- Comparar los dos máximos anteriores
		if valor_max1 > valor_max2 then
			valor_max_final := valor_max1;
		else
			valor_max_final := valor_max2;
		end if;

		-- Asignar el valor máximo final a la salida
		maximo <= valor_max_final;
	end procedure encontrar_maximo;
begin
	
	pix_count_int <= to_integer(unsigned(pix_count));
	-- Logic to advance to the next state
	process (all)
		variable cuenta  			: integer range 0 to 255 := 0;
		variable cuenta_pixel		: integer range 0 to 255 := 0;
		variable eventos 			: integer range 0 to 255 := 1;
	begin
		if reset = '0' then
			state <= erase;
			cuenta :=0;
			cuenta_pixel := 0;
			pix_count_anterior <= 0;
			eventos := 1;
			indice <= 0;
			ignorar_ancho_1 <= false;
			ignorar_anterior <= false;
			dir_mem	<= 0;
			dir_energia	<= 0;
		elsif (rising_edge(clk)) then
			case state is
				when erase=>
					if cuenta < 250 then
						cuenta := cuenta + 1; 
						state <= escritura_erase_1;			--voy a escribir ceros
						indice <= indice + 1;			--aumento la direccion a escribir
						data_a_escribir <= 0;			-- la data a escribir es siempre cero
					else
						indice <= 1;					-- reinicio el direccionamiento de memoria
						cuenta := 1; 
						state <= nuevo_pix;				-- voy a esperar un nuevo pixel
					end if;
				when escritura_erase_1 =>
					state <= escritura_erase_2;
				when escritura_erase_2 =>
					state <= erase;
				when nuevo_pix=>
					if pix_count_int < 7081 then	
						if pix_count_int /= pix_count_anterior then --me llego un nuevo pixel
							pix_count_anterior <= pix_count_int;

							if to_integer(unsigned(pix_data)) > 0 then
								state <= dir_ancho_2;
							else 
								data_a_escribir <= 0;
								state <= escritura_1;
							end if;

							cuenta_pixel:=cuenta_pixel + 1;						--esta cuenta la voy a usar como la cantidad de pixeles que me llegan para activar unas flags
							if cuenta_pixel = 97 then
								ignorar_ancho_1 <= true;
							elsif cuenta_pixel = 98 then
								ignorar_anterior <= true;
								cuenta_pixel := 1;
							end if ;
						else
							state <= nuevo_pix;
						end if;
					else
						dir_energia <= -1;
						state <= envio_mem_1;
					end if;
				when dir_ancho_2=>
					if indice + 2 > 99 then
						dir_mem_2 <= indice - 97;
					else
						dir_mem_2 <= indice + 2;
					end if;
					state <= lectura_ancho_2;
				when lectura_ancho_2 =>
					cuenta := cuenta + 1;
					if cuenta < 3 then
						state <= lectura_ancho_2;
					else
						cuenta := 1;
						state <= dir_ancho_1;
					end if ;
				when dir_ancho_1 =>
					if indice + 3 > 99 then
						dir_mem_1 <= indice - 96;
					else
						dir_mem_1 <= indice + 3;
					end if;
					state <= lectura_ancho_1;
				when lectura_ancho_1 =>
					cuenta := cuenta + 1;
					if cuenta < 3 then
						state <= lectura_ancho_1;
					else
						cuenta := 1;
						state <= dir_ancho_3;
					end if ;
				when dir_ancho_3 =>
					if indice + 1 > 99 then
						dir_mem_3 <= indice - 98;
					else
						dir_mem_3 <= indice + 1;
					end if;
					state <= lectura_ancho_3;
				when lectura_ancho_3 =>
					cuenta := cuenta + 1;
					if cuenta < 3 then
						state <= lectura_ancho_3;
					else
						cuenta := 1;
						state <= dir_anterior;
					end if ;
				when dir_anterior =>
					if indice = 1 then
						dir_mem <= 98;
					else
						dir_mem <= indice - 1;
					end if;
					state <= lectura_anterior;
				when lectura_anterior =>
					cuenta := cuenta + 1;
					if cuenta < 3 then
						state <= lectura_anterior;
					else
						cuenta := 1;
						state <= casos;
					end if ;
				when casos =>
					if reg_anterior /= 0 or reg_ancho_1 /= 0 or reg_ancho_2 /= 0 or reg_ancho_3 /=0 then
						encontrar_maximo(reg_ancho_1,reg_ancho_2,reg_ancho_3,reg_anterior,data_a_escribir);
					else
						data_a_escribir <= eventos;
						eventos := eventos + 1;
					end if;
					state <= dir_cantidad_energia;
				when dir_cantidad_energia =>
					dir_energia <= data_a_escribir; --data a escribir es el indice que me interesa, tal vez un mal nombre
					state <= lectura_cantidad_energia;
				when lectura_cantidad_energia =>
					cuenta := cuenta + 1;
					if cuenta < 3 then
						state <= lectura_cantidad_energia;
					else
						cuenta := 1;
						state <= escritura_1;
					end if ;
				when escritura_1 =>
					state <= escritura_2;
				when escritura_2 =>
					state <= envio_uart_1;
				when envio_uart_1 =>
					state <= envio_uart_2;
				when envio_uart_2 =>
					if uart_sending = '1' then
						state <= envio_uart_2;
					else
						state <= incremento_indice;
					end if;
				when incremento_indice =>
					indice <= indice + 1;					--este seria el equivalente a la direccion de memoria que quiero usar 
					if indice = 99 then
						indice <= 1;
					end if;
					ignorar_ancho_1 <= false;
					ignorar_anterior <= false;
					state <= nuevo_pix;
				when envio_mem_1 =>		--equivalente a direccion
					if dir_energia < 250 then
						dir_energia <= dir_energia + 1;
						state <= envio_mem_2;
					else
						state <= envio_mem_5;
						dir_energia <= 0;
					end if;
				when envio_mem_2 =>		--equivalente a lectura
					cuenta := cuenta + 1;
					if cuenta < 3 then
						state <= envio_mem_2;
					else
						cuenta := 1;
						state <= envio_mem_3;
					end if ;
				when envio_mem_3 =>		--equivalente a envio uart 1
					state <= envio_mem_4;
				when envio_mem_4 =>		--equivalente a envio uart 2
					if uart_sending = '1' then
						state <= envio_mem_4;
					else
						state <= envio_mem_1;
					end if;
					when envio_mem_5 =>		--equivalente a direccion
					if dir_energia < 250 then
						dir_energia <= dir_energia + 1;
						state <= envio_mem_6;
					else
						state <= erase;
					end if;
				when envio_mem_6 =>		--equivalente a lectura
					cuenta := cuenta + 1;
					if cuenta < 3 then
						state <= envio_mem_6;
					else
						cuenta := 1;
						state <= envio_mem_7;
					end if ;
				when envio_mem_7 =>		--equivalente a envio uart 1 para enviar los 16 bit parte baja
					state <= envio_mem_8;
				when envio_mem_8 =>		--equivalente a envio uart 2
					if uart_sending = '1' then
						state <= envio_mem_8;
					else
						state <= envio_mem_9;
					end if;
				when envio_mem_9 =>		--equivalente a envio uart 1 para enviar los 16 bit parte baja
					state <= envio_mem_10;
				when envio_mem_10 =>		--equivalente a envio uart 2
					if uart_sending = '1' then
						state <= envio_mem_10;
					else
						state <= envio_mem_5;
					end if;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (all)
	begin
		case state is
			when erase =>
				data_ram_o			<= std_logic_vector(to_unsigned(data_a_escribir,8));
				addr_ram			<= std_logic_vector(to_unsigned(indice,9));
				we					<= '1';  --escritura
				data_uart			<= (others => '0');
				enable_uart			<= '0';
				data_ram_energia_o	<= std_logic_vector(to_unsigned(data_a_escribir,16));
				addr_ram_energia	<= std_logic_vector(to_unsigned(indice,9));
				data_ram_cantidad_o	<= std_logic_vector(to_unsigned(data_a_escribir,8)); --data a escribir :=0;
				addr_ram_cantidad	<= std_logic_vector(to_unsigned(indice,9));
			--	estado			<= "0";	
			when escritura_erase_1 =>
				data_ram_o		<= std_logic_vector(to_unsigned(data_a_escribir,8));
				addr_ram		<= std_logic_vector(to_unsigned(indice,9));
				we				<= '1';  --escritura
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= std_logic_vector(to_unsigned(data_a_escribir,16)); 
				addr_ram_energia	<= std_logic_vector(to_unsigned(indice,9)); 
				data_ram_cantidad_o	<= std_logic_vector(to_unsigned(data_a_escribir,8)); 
				addr_ram_cantidad	<= std_logic_vector(to_unsigned(indice,9));
			--	estado			<= "0";	 			
			when escritura_erase_2 =>
				data_ram_o		<= std_logic_vector(to_unsigned(data_a_escribir,8));
				addr_ram		<= std_logic_vector(to_unsigned(indice,9));
				we				<= '1';  --escritura
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= std_logic_vector(to_unsigned(data_a_escribir,16)); 
				addr_ram_energia	<= std_logic_vector(to_unsigned(indice,9)); 
				data_ram_cantidad_o	<= std_logic_vector(to_unsigned(data_a_escribir,8)); 
				addr_ram_cantidad	<= std_logic_vector(to_unsigned(indice,9));
			--	estado			<= "0";	
			when nuevo_pix =>
				data_ram_o		<= (others => '0');
				addr_ram		<= (others => '0');
				we				<= '0';  --lectura
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0'); 
			--	estado			<= "0";
			when dir_ancho_2 =>
				data_ram_o		<= (others => '0');
				addr_ram		<= std_logic_vector(to_unsigned(dir_mem_2,9));
				we				<= '0';  --lectura
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0');
			--	estado			<= "0";
			when lectura_ancho_2 =>
				data_ram_o		<= (others => '0');
				addr_ram		<= std_logic_vector(to_unsigned(dir_mem_2,9));
				we				<= '0';  --lectura
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0');
			--	estado			<= "0";
			when dir_ancho_1 =>
				data_ram_o		<= (others => '0');
				addr_ram		<= std_logic_vector(to_unsigned(dir_mem_1,9));
				we				<= '0';  --lectura
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0');
			--	estado			<= "0";
			when lectura_ancho_1 =>
				data_ram_o		<= (others => '0');
				addr_ram		<= std_logic_vector(to_unsigned(dir_mem_1,9));
				we				<= '0';  --lectura
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0');
			--	estado			<= "0";		
			when dir_ancho_3 =>
				data_ram_o		<= (others => '0');
				addr_ram		<= std_logic_vector(to_unsigned(dir_mem_3,9));
				we				<= '0';  --lectura
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0');
			--	estado			<= "0";
			when lectura_ancho_3 =>
				data_ram_o		<= (others => '0');
				addr_ram		<= std_logic_vector(to_unsigned(dir_mem_3,9));
				we				<= '0';  --lectura
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0');
			--	estado			<= "0";	
			when dir_anterior =>
				data_ram_o		<= (others => '0');
				addr_ram		<= std_logic_vector(to_unsigned(dir_mem,9));
				we				<= '0';  --lectura
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0');
			--	estado			<= "0";
			when lectura_anterior =>
				data_ram_o		<= (others => '0');
				addr_ram		<= std_logic_vector(to_unsigned(dir_mem,9));
				we				<= '0';  --lectura
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0');
			--	estado			<= "0";
			when casos =>
				data_ram_o		<= (others => '0');
				addr_ram		<= (others => '0');
				we				<= '0';  --lectura
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0');
			--	estado			<= "0";
			when dir_cantidad_energia =>
				data_ram_o		<= (others => '0');
				addr_ram		<= std_logic_vector(to_unsigned(indice,9));
				we				<= '0';  
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= std_logic_vector(to_unsigned(dir_energia,9)); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= std_logic_vector(to_unsigned(dir_energia,9));
			when lectura_cantidad_energia =>
				data_ram_o		<= (others => '0');
				addr_ram		<= std_logic_vector(to_unsigned(indice,9));
				we				<= '0';  
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= std_logic_vector(to_unsigned(dir_energia,9)); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= std_logic_vector(to_unsigned(dir_energia,9));				
			when escritura_1 =>
				data_ram_o		<= std_logic_vector(to_unsigned(data_a_escribir,8));
				addr_ram		<= std_logic_vector(to_unsigned(indice,9));
				we				<= '1';  --escritura
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= std_logic_vector(to_unsigned(energia_temp + pix_data_reg,16)); 
				addr_ram_energia	<= std_logic_vector(to_unsigned(dir_energia,9)); 
				data_ram_cantidad_o	<= std_logic_vector(to_unsigned(cantidad_temp + 1,8)); 
				addr_ram_cantidad	<= std_logic_vector(to_unsigned(dir_energia,9));
			--	estado			<= "0";	 			
			when escritura_2 =>
				data_ram_o		<= std_logic_vector(to_unsigned(data_a_escribir,8));
				addr_ram		<= std_logic_vector(to_unsigned(indice,9));
				we				<= '1';  --escritura
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= std_logic_vector(to_unsigned(energia_temp + pix_data_reg,16)); 
				addr_ram_energia	<= std_logic_vector(to_unsigned(dir_energia,9)); 
				data_ram_cantidad_o	<= std_logic_vector(to_unsigned(cantidad_temp + 1,8)); 
				addr_ram_cantidad	<= std_logic_vector(to_unsigned(dir_energia,9));
			--	estado			<= "0";			
			when envio_uart_1 =>
				data_ram_o		<= (others => '0');
				addr_ram		<= (others => '0');
				we				<= '0';  --escritura
				data_uart		<= std_logic_vector(to_unsigned(data_a_escribir,8));
				enable_uart		<= '1';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0');
			--	estado			<= "0";
			when envio_uart_2 =>
				data_ram_o		<= (others => '0');
				addr_ram		<= (others => '0');
				we				<= '0';  --escritura
				data_uart		<= std_logic_vector(to_unsigned(data_a_escribir,8));
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0');
			--	estado			<= "0";
			when incremento_indice =>
				data_ram_o		<= (others => '0');
				addr_ram		<= (others => '0');
				we				<= '0';  --lectura
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0');
			--	estado			<= "0";
			when envio_mem_1 =>		--equivalente a dir
				data_ram_o		<= (others => '0');
				addr_ram		<= (others => '0');
				we				<= '0';  
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= std_logic_vector(to_unsigned(dir_energia,9));
			when envio_mem_2 =>		--equivalente a lectura
				data_ram_o		<= (others => '0');
				addr_ram		<= (others => '0');
				we				<= '0';  
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= std_logic_vector(to_unsigned(dir_energia,9));	
			when envio_mem_3 =>		--equivalente a uart 1
				data_ram_o		<= (others => '0');
				addr_ram		<= (others => '0');
				we				<= '0';  
				data_uart		<= std_logic_vector(to_unsigned(cantidad_temp,8));
				enable_uart		<= '1';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0');
			--	estado			<= "0";
			when envio_mem_4 =>			--equivalente a uart 2
				data_ram_o		<= (others => '0');
				addr_ram		<= (others => '0');
				we				<= '0';  
				data_uart		<= std_logic_vector(to_unsigned(cantidad_temp,8));
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0');
			--	estado			<= "0";
			when envio_mem_5 =>		--equivalente a dir
				data_ram_o		<= (others => '0');
				addr_ram		<= (others => '0');
				we				<= '0';  
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= std_logic_vector(to_unsigned(dir_energia,9)); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0');
			when envio_mem_6 =>		--equivalente a lectura
				data_ram_o		<= (others => '0');
				addr_ram		<= (others => '0');
				we				<= '0';  
				data_uart		<= (others => '0');
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= std_logic_vector(to_unsigned(dir_energia,9)); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0');	
			when envio_mem_7 =>		--equivalente a uart 1	parte alta
				data_ram_o		<= (others => '0');
				addr_ram		<= (others => '0');
				we				<= '0';  
				data_uart		<= std_logic_vector(to_unsigned(energia_temp,16)(15 downto 8));
				enable_uart		<= '1';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0');
			--	estado			<= "0";
			when envio_mem_8 =>			--equivalente a uart 2
				data_ram_o		<= (others => '0');
				addr_ram		<= (others => '0');
				we				<= '0';  
				data_uart		<= std_logic_vector(to_unsigned(energia_temp,16)(15 downto 8));
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0');
			--	estado			<= "0";
			when envio_mem_9 =>		--equivalente a uart 1 parte baja
				data_ram_o		<= (others => '0');
				addr_ram		<= (others => '0');
				we				<= '0';  --escritura
				data_uart		<= std_logic_vector(to_unsigned(energia_temp,16)(7 downto 0));
				enable_uart		<= '1';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0');
			--	estado			<= "0";
			when envio_mem_10 =>			--equivalente a uart 2
				data_ram_o		<= (others => '0');
				addr_ram		<= (others => '0');
				we				<= '0';  --escritura
				data_uart		<= std_logic_vector(to_unsigned(energia_temp,16)(7 downto 0));
				enable_uart		<= '0';
				data_ram_energia_o	<= (others => '0'); 
				addr_ram_energia	<= (others => '0'); 
				data_ram_cantidad_o	<= (others => '0'); 
				addr_ram_cantidad	<= (others => '0');
			--	estado			<= "0";			 					 			
		end case;
		if reset = '0' then
			reg_ancho_1<= 0;
			reg_ancho_2<= 0;
			reg_ancho_3<= 0;
			reg_anterior<= 0;
			pix_data_reg <= 0;
			energia_temp <= 0;
			cantidad_temp <= 0;
		elsif rising_edge(clk) then
			case state is
				when dir_ancho_2 =>  --testeado, gracias a esto funciona*
					pix_data_reg <= to_integer(unsigned(pix_data)); --guardo la informacion del nuevo pixel(puede traer problemas)
				when lectura_ancho_2 =>
					--reg_ancho_2 <= 0;--debug
					reg_ancho_2 	<= to_integer(unsigned(data_ram_i));
				when lectura_ancho_1 =>
					if ignorar_ancho_1 then
						reg_ancho_1 	<= 0;
					else
						reg_ancho_1 	<= to_integer(unsigned(data_ram_i));
					end if;
				when lectura_ancho_3 =>
					if ignorar_anterior then
						reg_ancho_3 	<= 0;
					else
						reg_ancho_3 	<= to_integer(unsigned(data_ram_i));
					end if;
				when lectura_anterior =>
					if ignorar_anterior then
						reg_anterior 	<= 0;
					else
						reg_anterior 	<= to_integer(unsigned(data_ram_i));
					end if;
				when lectura_cantidad_energia =>
					energia_temp <= to_integer(unsigned(data_ram_energia_i));
					cantidad_temp <= to_integer(unsigned(data_ram_cantidad_i));
				when envio_mem_2 =>
					cantidad_temp <= to_integer(unsigned(data_ram_cantidad_i));
				when envio_mem_6 =>
					energia_temp <= to_integer(unsigned(data_ram_energia_i));
				when others =>
					
			end case;
		end if;
	end process;

end rtl;
