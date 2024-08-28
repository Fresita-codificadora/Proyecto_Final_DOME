library ieee;
	use ieee.std_logic_1164.all;
	use IEEE.NUMERIC_STD.ALL; --libreria para cambios entre formatos
	use IEEE.MATH_REAL.ALL; --libreria para log2 y ceil

entity Algorimo is
	generic(
		umbral 				: integer :=0;
		cantidad_eventos 	: integer :=256		
	)

	port(
		-- entradas generales
		clk_i										: in	std_logic;
		Start_i,reset_i,leer_i,trigger_i			: in	std_logic;	--leer y trigger son senales externas que le avisan que debe leer los pixeles o reiniciar todo para un nueva img
		-- entradas Capture_input_controller
		pix_cnt_i									: in integer range 0 to 1_310_721;   --cuenta de los pixeles leidos
		pix_data_i 										: in std_logic_vector(7 downto 0);		-- data proveniente de Capture_input_controller
		--entradas realimentadas FIFO
		FIFO_1_i , ancho_1_i , ancho_2_i , ancho_3_i 	: in std_logic_vector (integer(ceil(log2(real(cantidad_eventos))))-1 downto 0);
		-- entrada ram energia y cantidad
		energia_i , cantidad_i 					  	: in std_logic_vector(7 downto 0);

		-- salidas shift FIFO
		--??
		--salida hacia la FIFO
		FIFO_0_o 										: out std_logic_vector (integer(ceil(log2(real(cantidad_eventos)))) downto 0);
		--salida hacia energia y cantidad'
		energia_o , cantidad_o 						: out std_logic_vector (7 downto 0);
		--salida control ram de energias y cantidad
		r_w_energia , r_w_cantidad					: out std_logic;
		indice_energias_o , idice_cantidad_o 		: out std_logic_vector (integer(ceil(log2(real(cantidad_eventos)))) downto 0)

	);

end entity;

architecture rtl of Algorimo is

	-- Build an enumerated type for the state machine
	type state_type is (s0, s1, s2, s3);

	-- Register to hold the current state
	signal state   		: state_type;

	-- senales internas
	signal data_reg 						: std_logic_vector(7 downto 0):=x"00";
	signal indice , FIFO_0 , maximo			: integer range 0 to cantidad_eventos-1;
	signal pix_previo 						: integer range 0 to 1_310_721;
	signal temp_energia , temp_cantidad  	: std_logic_vector(7 downto 0):=x"00";	
begin

	-- Logic to advance to the next state
	process (clk, reset)
	begin
		if reset = '0' then
			state <= nuevo_pix;
			pix_previo <= 0;
			data_reg <= (others => '0' );
			indice<= 0;
		elsif (rising_edge(clk)) then
			case state is
				when nuevo_pix=>
					if pix_cnt_i /= pix_previo then  					-- si el la cuenta de pixel es distinta a la cuenta anterior, el pixel es nuevo
						pix_previo<=pix_cnt_i;							-- actualizamos el pixel_previo
						if to_integer(unsigned(pix_data)) > umbral then --comparacion con el umbral
							data_reg<=pix_data;							-- si supera el umbral guardamos la data del pixel
							state<=escritura;								-- lo mandamos a analizar asi vemos que etiqueta le ponemos
							maximo<=0;
						else
							FIFO_0 <= 0;								-- mandamos un cero para el FIFO_0 asi le mandamos un 0 a la fifo desp
							state<= escritura;								-- si no supera el umbral hacemos el shift nomas
						end if;	
					else
						state <= nuevo_pix;								-- si no es un nuevo pixel esperamos un nuevo pixel
					end if;
				when casos=>											--EN ESTE ESTADO VEMOS EL INDICE 
					if to_integer(unsigned(FIFO_1_i))=0 and to_integer(unsigned(ancho_1_i))=0 and to_integer(unsigned(ancho_2_i))=0 and to_integer(unsigned(ancho_3_i))=0  then --nuevo evento
						FIFO_0 <= indice;								-- le asignamos el num de indice(evento) al, FIFO y lo aumentamos
						indice <= indice + 1; 							-- aumentamos el numero de evento
					else
						maximo <= FIFO_1_i;
						if ancho_1_i > maximo then
							maximo <= ancho_1_i;
						end if;
						if ancho_2_i > maximo then
							maximo <= ancho_2_i;
						end if;
						if ancho_3_i > maximo then
							maximo <= ancho_3_i;
						end if;
						FIFO_0 <= maximo;  								-- esto no estoy seguro de si va a ser en paralelo o secuencial
																		-- pero la idea es la misma que me busque cual es el indice maximo y se lo aplique a FIFO_0
					end if;
					state<= energia_cantidad;
				when lectura_energia_cantidad =>								-- EN ESTE ESTADO ESCRIBIMOS LAS MEMORIAS RAM
					indice_energias_o <= std_logic_vector(to_unsigned(FIFO_0, FIFO_0'length));
					indice_cantidad_o <= std_logic_vector(to_unsigned(FIFO_0, FIFO_0'length));	-- les mandamos el indice como direccion de memoria a las RAM
					temp_energia <= energia_i;
					temp_cantidad <= cantidad_i;
					state <= escritura_energia_cantidad;
				when escritura_energia_cantidad =>
					indice_energias_o <= std_logic_vector(to_unsigned(FIFO_0, FIFO_0'length));
					indice_cantidad_o <= std_logic_vector(to_unsigned(FIFO_0, FIFO_0'length));	-- les mandamos el indice como direccion de memoria a las RAM
					energia_o <= std_logic_vector(unsigned(temp_energia) + unsigned(data_reg));	-- le sumamos la energia del nuevo pixel
					cantidad_o <= std_logic_vector(unsigned(temp_cantidad) + 1) ;				-- le sumamos 1 a la cantidad de pixeles que tiene la mancha
					state <= shift;
				when shift=>
					-- hacer el shift ???????
					state<=nuevo_pix;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when nuevo_pix =>
				--salida hacia la FIFO
				FIFO_0_o<=??;
			when casos =>
				output <= "01";
			when lectura_energia_cantidad =>
				output <= "10";
			when escritura_energia_cantidad =>
				output <= "11";
			when shift =>
				shift_dale<='1'; -- place holder
		end case;
	end process;

end rtl;
