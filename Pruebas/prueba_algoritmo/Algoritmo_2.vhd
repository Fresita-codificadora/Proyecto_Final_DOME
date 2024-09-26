-- estan mal los tamaños por algun motivo

-- FIFO_0 es el dato que le mando a la FIFO interno
--FIFO_dir_o es la direccion que le mando a la ram encargada de la FIFO

library ieee;
	use ieee.std_logic_1164.all;
	use IEEE.NUMERIC_STD.ALL; 		--libreria para cambios entre formatos
	use IEEE.MATH_REAL.ALL; 		--libreria para log2 y ceil

entity Algoritmo_2 is
	generic(
		umbral 				: integer :=10;
		cantidad_eventos 	: integer :=2**11;
		ancho 				: integer := 97;
		pixels 				: integer := 7081
		);
	port(
		-- entradas generales--
		clk_i										: in	std_logic;
		reset_i									: in	std_logic;								--leer y trigger son senales externas que le avisan que debe leer los pixeles o reiniciar todo para un nueva img
		-- habilitaciones --
		enable_done									: in std_logic;
		-- entrada de trigger -- 				
  		trigger										: in std_logic;
		-- entradas Capture_input_controller--
		pix_cnt_i									: in std_logic_vector(20 downto 0);   --cuenta de los pixeles leidos
		pix_data_i 									: in std_logic_vector(7 downto 0);		-- data proveniente de Capture_input_controller
		-- entrada ram energia y cantidad--
--		energia_i 					: in std_logic_vector (13 downto 0);
--		cantidad_i 					: in std_logic_vector(5 downto 0);
		--entrada FIFO
		FIFO_data_i									: in std_logic_vector(10 downto 0);

		--salida hacia la FIFO--
		FIFO_data_o									: out std_logic_vector (10 downto 0);
		FIFO_dir_o									: out std_logic_vector (10 downto 0); 	--las direcciones necesarias para las 1283 posiciones de memoria
		FIFO_RW_o									: out std_logic;								--señal para lectura y escritura de la ram FIFO
--		-- salida hacia ram cantidad --
--		cantidad_o 					: out std_logic_vector (5 downto 0);
--		indice_cantidad_o 		: out std_logic_vector (10 downto 0);
--		--r_w_cantidad				: out std_logic;
--		-- salida hacia ram energia --
--		energia_o					: out std_logic_vector (13 downto 0); 
--		indice_energias_o 		: out std_logic_vector (10 downto 0);
--		--r_w_energia 				: out std_logic;
		uart_tx_busy				: in std_logic;
		estado 						: out std_logic_vector(3 downto 0)
	);

end entity;

architecture rtl of Algoritmo_2 is

	-- Build an enumerated type for the state machine
	type state_type is (otro_ancho_2,errase, wait_done, trigger_wait, nuevo_pix, dir_anterior, lectura_anterior_1,lectura_anterior_2, dir_ancho_1, lectura_ancho_1_1,lectura_ancho_1_2, dir_ancho_2, lectura_ancho_2, dir_ancho_3, lectura_ancho_3,lectura_ancho_3_1, casos, lectura_energia_cantidad, escritura_energia_cantidad, escritura ,escritura_2 ,incremento_indice_FIFO);

	-- Register to hold the current state
	signal state   		: state_type;

	constant num_bits : integer := integer(ceil(log2(real(cantidad_eventos))));
	constant cant_pixeles : integer := pixels;
	-- senales internas
	signal reg_FIFO_1, reg_ancho_1, reg_ancho_2 ,reg_ancho_3 : std_logic_vector(num_bits-1 downto 0);
	signal indice_FIFO 													: integer range 0 to 2**11-1:=0; 
	signal data_reg 														: std_logic_vector(7 downto 0):=x"00";
	signal indice 															: integer range 0 to cantidad_eventos-1:=1;
	signal FIFO_0 															: integer range 0 to cantidad_eventos-1;
	signal pix_previo 													: integer range 0 to cant_pixeles := 16;
	signal temp_energia 													: std_logic_vector(13 downto 0):="00000000000000";
	signal temp_cantidad  												: std_logic_vector(5 downto 0):="000000";	
	signal pix_cnt_int													: integer range 0 to 1_310_720;
	signal borrado 														: STD_LOGIC := '0';
	signal fifo_reg														: STD_LOGIC_VECTOR(10 downto 0);
		    -- Declaramos el procedimiento para encontrar el máximo
		procedure encontrar_maximo(
			signal reg1 : in std_logic_vector(10 downto 0);
			signal reg2 : in std_logic_vector(10 downto 0);
			signal reg3 : in std_logic_vector(10 downto 0);
			signal reg4 : in std_logic_vector(10 downto 0);
			signal maximo : out integer
		) is
			variable valor_max1, valor_max2, valor_max_final : integer range 0 to 2047;
		begin
			-- Convertir los registros de std_logic_vector a integer
			valor_max1 := to_integer(unsigned(reg1));
	
			-- Comparar reg1 y reg2
			if valor_max1 < to_integer(unsigned(reg2)) then
				valor_max1 := to_integer(unsigned(reg2));
			end if;
	
			-- Comparar reg3 y reg4
			valor_max2 := to_integer(unsigned(reg3));
			if valor_max2 < to_integer(unsigned(reg4)) then
				valor_max2 := to_integer(unsigned(reg4));
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
	pix_cnt_int <= to_integer(unsigned(pix_cnt_i));
	-- Logic to advance to the next state
	process (all)
	begin
		if reset_i = '0' then
			state <= errase;
			pix_previo <= 16;
			data_reg <= (others => '0' );
			indice<= 1;
			indice_FIFO <= 0;
			reg_FIFO_1<=(others =>'0');
			reg_ancho_1<=(others =>'0');
			reg_ancho_2<=(others =>'0');
			reg_ancho_3<=(others =>'0');
			borrado <= '0';
		elsif (rising_edge(clk_i)) then
			case state is
				when errase=>                   		--este estado deberia borrar toda la memoria ram de la fifo
					if indice_FIFO <= ancho+1 then
						indice_FIFO<=indice_FIFO+1;  	-- esto es el addrs que le mando para borrar todo
						state <= escritura;
						FIFO_0 <= 0;
					else
						state <= wait_done;   				--aca ya deberia haber borrado toda la memora 
						indice_FIFO <= 0;
						borrado <= '1';
					end if;
				when wait_done=> 								-- en este estado esperamos a que el programador_controlador_block termine
					if enable_done = '1' then
						state <= trigger_wait;  			-- si termino vamos a esperar el trigger
					else
						state <= wait_done;					-- ESTE ESTADO PROBABLEMENTE ESTE EN UNA JERARQUIA MAYOR
					end if;
				when trigger_wait=>							-- en este estado esperamos a la señal de trigger
					if pix_previo<cant_pixeles then			-- si la cuenta interna de pixeles es menor al maximo numero de pixeles hacemos lo de siempre de mandar los trigger
						if trigger = '1' then			
							state <= nuevo_pix;
						else
							state <= trigger_wait;
						end if;
					else									--es como un reset si la cuenta interna de pixeles es mayor a la cuenta maxima lo que tenemos que hacer es borrar la FIFO ya que es un nuevo frame
						if trigger = '1' then				-- seguramente en este estado va a haber algo que me controle el enable por que si yo estoy haceiendo el histograma y me llega un 
							state <= errase;					-- nuevo trigger lo voy a tener que ignorar;
							pix_previo <= 0;
							indice <= 1;
						else
							state <= trigger_wait;
						end if;
					end if;
				when nuevo_pix=>
					if pix_cnt_int < cant_pixeles then
						if pix_cnt_int /= pix_previo then  								-- si el la cuenta de pixel es distinta a la cuenta anterior, el pixel es nuevo
							pix_previo<=pix_cnt_int;											-- actualizamos el pixel_previo
							if to_integer(unsigned(pix_data_i)) > umbral then 		--comparacion con el umbral
								data_reg<=pix_data_i;										-- si supera el umbral guardamos la data del pixel
								state<=dir_anterior;											-- tenemos que rescatar los valores de al rededor del nuevo pixel, ancho+1,ancho+2,ancho+3 ...
								FIFO_0 <= 0;
							else
								FIFO_0 <= 0;													-- mandamos un cero para el FIFO_0 asi le mandamos un 0 a la fifo desp
								state<= escritura;											-- si no supera el umbral hacemos el "shift" nomas
							end if;	
						else
							state <= nuevo_pix;												-- si no es un nuevo pixel esperamos un nuevo pixel
						end if;
					else
						state <= trigger_wait;
					end if;
				when dir_anterior =>														--presentacion de la dir de memoria que contiene el pixel anterior
					if indice_FIFO = 0 then		
						FIFO_dir_o <= std_logic_vector(to_unsigned(ancho+1,11)); 	-- si es mayor a 1283 entonces le tengo que restar 1283 a la direccion +1 entonces completo
						fifo_reg <= std_logic_vector(to_unsigned(ancho+1,11));																					-- seria indice_FIFO+1-1283=indice_FIFO-1282 , despues el dato lo leemos en el proximo estado
																											-- asi le damos 1 ciclo de reloj para responder a la memoria																					-- reloj para que me pueda dar la data;
					else
						FIFO_dir_o <= std_logic_vector(to_unsigned(indice_FIFO-1,11));
						fifo_reg <= std_logic_vector(to_unsigned(indice_FIFO-1,11));
					end if;
					state <= lectura_anterior_1;
				when lectura_anterior_1 =>
					state<= lectura_anterior_2;
					FIFO_dir_o <= fifo_reg;
				when lectura_anterior_2 =>
					state <= dir_ancho_1;
					FIFO_dir_o <= fifo_reg;
					reg_FIFO_1 <= FIFO_data_i;		--leemos el anterior
				when dir_ancho_1 =>								--presentacion de la dir de memoria que tiene el pixel en ancho+1 y lectura pixel anterior
					if indice_FIFO + 3 >= (ancho+1) then
						FIFO_dir_o <= std_logic_vector(to_unsigned(indice_FIFO+1-(ancho),11)); 	-- si es mayor a 1283 entonces le tengo que restar 1283 a la direcion + 1280
						fifo_reg <= std_logic_vector(to_unsigned(indice_FIFO+1-(ancho),11));																					-- despues el dato lo leemos en el proximo estado
																											-- asi le damos 1 ciclo de reloj para responder a la memoria																					-- reloj para que me pueda dar la data;
					else
						FIFO_dir_o <= std_logic_vector(to_unsigned(indice_FIFO+3,11));
						fifo_reg <= std_logic_vector(to_unsigned(indice_FIFO+3,11));
					end if;
					state <= lectura_ancho_1_1;
				when lectura_ancho_1_1 =>
					state <= lectura_ancho_1_2;
					FIFO_dir_o <= fifo_reg;
				when lectura_ancho_1_2 =>
					state<= dir_ancho_2;
					FIFO_dir_o <= fifo_reg;
					reg_ancho_1 <= FIFO_data_i;    --leemos ancho+1
				when dir_ancho_2 =>								--presentacion de la dir de memoria que tiene el pixel en ancho+2 y lectura pixel ancho + 1
					if indice_FIFO + 2 >= (ancho+1) then
						FIFO_dir_o <= std_logic_vector(to_unsigned(indice_FIFO-(ancho),11)); 	-- si es mayor a 1283 entonces le tengo que restar 1283 a la direcion + 1280
						fifo_reg <=	std_logic_vector(to_unsigned(indice_FIFO-(ancho),11));																				-- despues el dato lo leemos en el proximo estado
																											-- asi le damos 1 ciclo de reloj para responder a la memoria																					-- reloj para que me pueda dar la data;
					else
						FIFO_dir_o <= std_logic_vector(to_unsigned(indice_FIFO+2,11));
						fifo_reg <= std_logic_vector(to_unsigned(indice_FIFO+2,11));
					end if;
					state <= otro_ancho_2;
				when otro_ancho_2 =>
					state<= lectura_ancho_2;
					FIFO_dir_o <= fifo_reg;
				when lectura_ancho_2 =>
					state<= dir_ancho_3;
					FIFO_dir_o <= fifo_reg;
					reg_ancho_2 <= FIFO_data_i;    --leemos ancho+2
				when dir_ancho_3 =>								--presentacion de la dir de memoria que tiene el pixel en ancho+3 y lectura pixel ancho + 2
					if indice_FIFO + 1 >= (ancho+1) then
						FIFO_dir_o <= std_logic_vector(to_unsigned(indice_FIFO-(ancho+1),11)); 	-- si es mayor a 1283 entonces le tengo que restar 1283 a la direcion + 1280
						fifo_reg <= std_logic_vector(to_unsigned(indice_FIFO-(ancho+1),11));																					-- despues el dato lo leemos en el proximo estado
																											-- asi le damos 1 ciclo de reloj para responder a la memoria																					-- reloj para que me pueda dar la data;
					else
						FIFO_dir_o <= std_logic_vector(to_unsigned(indice_FIFO+1,11));
						fifo_reg <= std_logic_vector(to_unsigned(indice_FIFO+1,11));
					end if;
					state <= lectura_ancho_3_1;
				when lectura_ancho_3_1 =>
					state <= lectura_ancho_3;
					FIFO_dir_o <= fifo_reg;
				when lectura_ancho_3 => 						-- en este estado leemos la info que esta en ancho +3 no deberia hacer nada mas
					state<= casos;
					FIFO_dir_o <= fifo_reg;	
					reg_ancho_3 <= FiFO_data_i;							-- con el dato anterior, ancho+1, ancho+2 y ancho+3 ya podemos ver los casos
				when casos=>											--EN ESTE ESTADO VEMOS EL INDICE que son los datos dentro de la FIFO
					if to_integer(unsigned(reg_FIFO_1))=0 and to_integer(unsigned(reg_ancho_1))=0 and to_integer(unsigned(reg_ancho_2))=0 and to_integer(unsigned(reg_ancho_3))=0  then --nuevo evento
						FIFO_0 <= indice;
						indice <= indice + 1;			-- le asignamos el num de indice(evento) al FIFO_0 y lo aumentamos
					else
						encontrar_maximo(reg_FIFO_1, reg_ancho_1, reg_ancho_2, reg_ancho_3, FIFO_0);
						--FIFO_0 <= to_integer(unsigned(reg_ancho_2));
					end if;
					state<= escritura;
--				when lectura_energia_cantidad =>								-- EN ESTE ESTADO ESCRIBIMOS LAS MEMORIAS RAM
--					indice_energias_o <= std_logic_vector(to_unsigned(FIFO_0,num_bits));
--					indice_cantidad_o <= std_logic_vector(to_unsigned(FIFO_0,num_bits));	-- les mandamos el indice como direccion de memoria a las RAM
--					temp_energia <= energia_i;
--					temp_cantidad <= cantidad_i;
--					state <= escritura_energia_cantidad;
--				when escritura_energia_cantidad =>
--					indice_energias_o <= std_logic_vector(to_unsigned(FIFO_0,num_bits));
--					indice_cantidad_o <= std_logic_vector(to_unsigned(FIFO_0,num_bits));	-- les mandamos el indice como direccion de memoria a las RAM
--					energia_o <= std_logic_vector(unsigned(temp_energia) + unsigned(data_reg));	-- le sumamos la energia del nuevo pixel
--					cantidad_o <= std_logic_vector(unsigned(temp_cantidad) + 1) ;				-- le sumamos 1 a la cantidad de pixeles que tiene la mancha
--					state <= escritura;
				when escritura =>								--estado encargado de escribir la RAM FIFO
					FIFO_dir_o <= std_logic_vector(to_unsigned(indice_FIFO,11));
					state<=escritura_2;
				when escritura_2 =>
					if borrado='0' then
						state <= errase;
					else 
						state<=incremento_indice_FIFO;
					end if;
					FIFO_dir_o <= std_logic_vector(to_unsigned(indice_FIFO,11));
				when incremento_indice_FIFO =>
					if 	uart_tx_busy = '0' then
						if indice_FIFO < ancho+1 then
							indice_FIFO <= indice_FIFO + 1;
							reg_FIFO_1<=(others =>'0');
							reg_ancho_1<=(others =>'0');
							reg_ancho_2<=(others =>'0');
							reg_ancho_3<=(others =>'0');
							state <= nuevo_pix;
						else 
							indice_FIFO <= 0;
							state <= nuevo_pix;
						end if ;
					else
						state <= incremento_indice_FIFO;
					end if;
				when others =>
					state<= nuevo_pix;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state, FIFO_0)
	begin
		case state is
			when errase =>
				FIFO_data_o	<=	(others => '0');
				FIFO_RW_o	<= '1' ;--la verdad que no se si debe ser cero o uno pero debe ser para escritura
				--salida control ram de energias y cantidad
				--r_w_energia <='0';
				--r_w_cantidad<='0';
				estado <= x"0";
			when wait_done =>
				FIFO_data_o	<=	(others => '0');
				FIFO_RW_o	<= '0' ;--la verdad que no se si debe ser cero o uno pero debe ser para lectura
				--salida control ram de energias y cantidad
				--r_w_energia <='0';
				--r_w_cantidad<='0';
				estado <= x"1";
			when trigger_wait =>
				FIFO_data_o	<=	(others => '0');
				FIFO_RW_o	<= '0' ;--la verdad que no se si debe ser cero o uno pero debe ser para lectura
				--salida control ram de energias y cantidad
				--r_w_energia <='0';
				--r_w_cantidad<='0';
				estado <= x"2";
			when nuevo_pix =>
				FIFO_data_o	<=	(others => '0');
				FIFO_RW_o	<= '0' ;--la verdad que no se si debe ser cero o uno pero debe ser para lectura
				--salida control ram de energias y cantidad
				--r_w_energia <='0';
				--r_w_cantidad<='0';
				estado <= x"3";
			when dir_anterior =>
				FIFO_data_o	<=	(others => '0');
				FIFO_RW_o	<= '0' ;--la verdad que no se si debe ser cero o uno pero debe ser para lectura
				--salida control ram de energias y cantidad
				--r_w_energia <='0';
				--r_w_cantidad<='0';
				estado <= x"4";
			when dir_ancho_1 =>
				FIFO_data_o	<=	(others => '0');
				FIFO_RW_o	<= '0' ;--la verdad que no se si debe ser cero o uno pero debe ser para lectura
				--salida control ram de energias y cantidad
				--r_w_energia <='0';
				--r_w_cantidad<='0';
			   estado <= x"5";	
			when dir_ancho_2 =>
				FIFO_data_o	<=	(others => '0');
				FIFO_RW_o	<= '0' ;--la verdad que no se si debe ser cero o uno pero debe ser para lectura
				--salida control ram de energias y cantidad
				--r_w_energia <='0';
				--r_w_cantidad<='0';
				estado <= x"6";
			when dir_ancho_3 =>
				FIFO_data_o	<=	(others => '0');
				FIFO_RW_o	<= '0' ;--la verdad que no se si debe ser cero o uno pero debe ser para lectura
				--salida control ram de energias y cantidad
				--r_w_energia <='0';
				--r_w_cantidad<='0';
				estado <= x"7";
			when lectura_ancho_3 =>
				FIFO_data_o	<=	(others => '0');
				FIFO_RW_o	<= '0' ;--la verdad que no se si debe ser cero o uno pero debe ser para lectura
				--salida control ram de energias y cantidad
				--r_w_energia <='0';
				--r_w_cantidad<='0';
			   estado <= x"8";	
			when casos =>
				FIFO_data_o	<=	(others => '0');
				FIFO_RW_o	<= '0' ;--la verdad que no se si debe ser cero o uno pero debe ser para lectura
				--salida control ram de energias y cantidad
				--r_w_energia <='0';
				--r_w_cantidad<='0';
				estado <= x"9";
			when lectura_energia_cantidad =>
				FIFO_data_o	<=	(others => '0');
				FIFO_RW_o	<= '0' ;--la verdad que no se si debe ser cero o uno pero debe ser para lectura
				--salida control ram de energias y cantidad
				--r_w_energia <='0';
				--r_w_cantidad<='0';
				estado <= x"0";
			when escritura_energia_cantidad =>
				FIFO_data_o	<=	(others => '0');
				FIFO_RW_o	<= '0' ;--la verdad que no se si debe ser cero o uno pero debe ser para lectura
				--salida control ram de energias y cantidad
				--r_w_energia <='1';--escrituras de las otras rams
				--r_w_cantidad<='1';
				estado <= x"0";
			when escritura =>
				FIFO_data_o	<=	std_logic_vector(to_unsigned(FIFO_0,11));
				FIFO_RW_o	<= '1' ;--la verdad que no se si debe ser cero o uno pero debe ser para escritura
				--salida control ram de energias y cantidad
				--r_w_energia <='0';
				--r_w_cantidad<='0';
				estado <= x"A";
			when escritura_2 =>
				FIFO_data_o	<=	std_logic_vector(to_unsigned(FIFO_0,11));
				FIFO_RW_o	<= '1' ;--la verdad que no se si debe ser cero o uno pero debe ser para escritura
				--salida control ram de energias y cantidad
				--r_w_energia <='0';
				--r_w_cantidad<='0';
				estado <= x"A";
			when incremento_indice_FIFO =>
				FIFO_data_o	<=	std_logic_vector(to_unsigned(FIFO_0,11));
				FIFO_RW_o	<= '0' ;--la verdad que no se si debe ser cero o uno pero debe ser para lectura
				--salida control ram de energias y cantidad
				--r_w_energia <='0';
				--r_w_cantidad<='0';
				estado <= x"B";
			when others =>
				FIFO_data_o	<=	(others => '0');
				FIFO_RW_o	<= '0' ;--la verdad que no se si debe ser cero o uno pero debe ser para lectura
				--salida control ram de energias y cantidad
				--r_w_energia <='0';
				--r_w_cantidad<='0';
				estado <= x"4";
		end case;
	end process;

end rtl;