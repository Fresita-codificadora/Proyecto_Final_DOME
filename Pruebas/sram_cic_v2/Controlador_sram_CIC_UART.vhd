-- maquina de estados que se encarga de borrar la sram, luego le da la señal de trigger a la camara y a las maquinas de estado
-- internas que se encargan de recibir los pixeles y escribirlos en la sram despues se los manda a la UART para que se lo mande 
-- con suerte a una PC
-- este archivo deberia ir de la mano de un .bdf donde se deberian encontrar los archivos 
-- SRAm
-- Sram_CIC
-- Captura_pixeles
-- Programador_controlador_block
-- divisor
-- UART_TX
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity Controlador_sram_CIC_UART is
	port(
	-- entradas-----
		data_sram_i : in std_logic_vector(15 downto 0);
		clk		 : in	std_logic;
		reset	 : in	std_logic;
		trigger : in std_logic;		-- señal de trigger proveniente de un boton
		enable_done : in std_logic; -- esta señal deberia venir de programador_controlador_block
		UART_enviando : in std_logic; --señales que marcan en que estado esta la UART
		-- entrada de Sram_CIC_2--
		data_Sram_CIC : in std_logic_vector(15 downto 0);  -- estas son las señales provenientes de SRAM_CIC_2
		add_Sram_CIC : in std_logic_vector(19 downto 0);
		reset_Sram,r_w_Sram,fin_Sram : in std_logic;
	-- salidas internas --
		UART_send : out std_logic;    -- señal para que envie la UART
		UART_data : out std_logic_vector(7 downto 0);
		-- SRAM --
		reset_n : out std_logic;
		data : out std_logic_vector(15 downto 0);   --señales que necesita el bloque SRAM para escribir la SRAM
		addrs : out std_logic_vector (19 downto 0);
		action : out std_logic;
	-- salidas externas--
		led_errase,led_lectura: out std_logic;      -- señales para marcar la finalizacion de ciertos procesos 
		estado : out integer range 0 to 9
	);

end entity;

architecture rtl of Controlador_sram_CIC_UART is

	-- Build an enumerated type for the state machine
	type state_type is (reset_state, trigger_wait, errase, wait_done, escritura, UART_terminado, UART_send_start,UART_mandando);

	-- Register to hold the current state
	signal state   : state_type;

	-- signal internas --
	signal count_mem : integer range 0 to 2**20-1:=0;
	signal cuenta_vueltas : integer range 0 to 3;
begin
	-- Logic to advance to the next state
	
	process (clk, reset)
	begin
		if reset = '0' then
			state <= reset_state;
			count_mem<=0;
		elsif (rising_edge(clk)) then
			case state is
				when reset_state =>
					state<=errase;
				when errase=>                   --este estado deberia borrar toda la memoria sram
					if count_mem=2**20-1 then
						state <= wait_done;   --aca ya deberia haber borrado toda la memora
						count_mem<=0;
					else
						count_mem<=count_mem+1;  -- esto es el addrs que le mando para borrar todo
						state <= errase;
					end if;
				when wait_done=> -- en este estado esperamos a que el programador_controlador_block termine
					if enable_done = '1' then
						state <= trigger_wait;  -- si termino vamos a esperar el trigger
					else
						state <= wait_done;
					end if;
				when trigger_wait=>
					if trigger = '1' then
						state <= escritura;
					else
						state <= trigger_wait;
					end if;
				when escritura => -- lo que esta pasando en este estado es que estamos esperando que me mande todo los pixeles la camara
					if fin_Sram='1' then 
						state<=UART_send_start; -- cuando me manda la fin signal ya podemos pasar a la parte de lectura donde le mandamos la señal de los sw a SRAM
					else
						state<=escritura; -- si todavia no me mandaron la señal de fin me quedo en escritura
					end if;
				when UART_terminado=>    --deberiamos reconocer el UART_DONE
					if count_mem < 1_048_570 then
						state<=UART_send_start;
						cuenta_vueltas <= cuenta_vueltas + 1;
						if cuenta_vueltas >= 1 then
							count_mem<= count_mem+1;			--uso el count_mem como señal para la memoria asi puedo barrer las direcciones 
							cuenta_vueltas <= 0;
						end if;
					else							-- si ya barrimos toda la memoria ya terminamos y vamos a borrarla y a mandar otra imgen si corresponde
						count_mem<=0;
						state<=reset_state;
					end if;
				when UART_send_start =>   --debemos mandar el UART_START y ya dejarle la info que necesita la UART
					if count_mem < 1_048_570 then
						state<=UART_mandando;
					else  -- si ya barrimos toda la memoria ya terminamos y vamos a borrarla y a mandar otra imgen si corresponde
						count_mem<=0;
						state<=reset_state;
					end if;
				when UART_mandando =>   --le seguimos mandando la info hasta que termine la UART de mandar los datos
					if count_mem < 1_048_570 then
						if UART_enviando='1' then -- si la uart esta mandando, nos quedamos en el estado mandando si no bamos a uart terminado
							state<=UART_mandando;
						else
							state<=UART_terminado;
						end if;
					else
						count_mem<=0;
						state<=reset_state;
					end if;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (all)
	begin
		case state is
			when reset_state=> 
				-- SRAM --
				reset_n <= '0'; --reseteamos la sram
				data <= (others=>'0');   -- todo en cero
				addrs <= (others=>'0');
				action <='1';           -- modo escritura sram
			-- salidas externas--
				led_errase <='0';
				led_lectura<='0';
				estado<=0;
				UART_send<='0';
				UART_data<=(others=>'0');
			when errase =>
				-- SRAM --
				reset_n <= '1';
				data <= (others=>'0');   -- todo en cero
				addrs <= std_logic_vector(to_unsigned(count_mem,20));
				action <='1';           -- modo escritura sram
			-- salidas externas--
				led_errase <='0';
				led_lectura<='0';
				estado<=1;
				UART_send<='0';
				UART_data<=(others=>'0');
			when wait_done => 
				-- SRAM --
				reset_n <= '1';
				data <= (others=>'0');   -- todo en cero
				addrs <= (others=>'0');
				action <='1';          --modo escritura sram
			-- salidas externas--
				led_errase <='1'; -- el errase ya se hizo se mantiene prendido
				led_lectura<='0';
				estado<=2;
				UART_send<='0';
				UART_data<=(others=>'0');
			when trigger_wait => 
				-- SRAM --
				reset_n <= '1';
				data <= (others=>'0');   
				addrs <= (others=>'0');
				action <='1';
			-- salidas externas--
				led_errase <='1';   -- el errase ya se hizo se mantiene prendido
				led_lectura<='0';
				estado<=3;
				UART_send<='0';
				UART_data<=(others=>'0');
			when escritura =>
				-- SRAM --
				reset_n <= reset_Sram;
				data <= data_Sram_CIC;         -- ahora sram es un bypass a las entradas de CIC
				addrs <= add_Sram_CIC;
				action <=r_w_Sram;
			-- salidas externas--
				led_errase <='1';			-- el errase ya se hizo se mantiene prendido
				led_lectura<='0';
				estado<=6;
				UART_send<='0';
				UART_data<=(others=>'0');
			when UART_terminado =>
				-- SRAM --
				reset_n <= '1';
				data <= (others=>'Z');         
				addrs <= std_logic_vector(to_unsigned(count_mem,20));  -- la direccion de lectura es la del contador
				action <='0'; --  lo ponemos en modo lectura a la sram
			-- salidas externas--
				led_errase <='1';			-- el errase ya se hizo se mantiene prendido
				led_lectura<='1';			-- prendemos por que esta hablitada la lectura
				estado<=7;
				UART_send<='0';
				UART_data<=(others=>'0');		
			when UART_send_start =>
				-- SRAM --
				reset_n <= '1';
				data <= (others=>'Z');         
				addrs <= std_logic_vector(to_unsigned(count_mem,20));  -- la direccion de lectura es la del contador
				action <='0'; --  lo ponemos en modo lectura a la sram
			-- salidas externas--
				led_errase <='1';			-- el errase ya se hizo se mantiene prendido
				led_lectura<='1';			-- prendemos por que esta hablitada la lectura
				estado<=8;
				UART_send<='1';         -- mandamos el start
				if cuenta_vueltas<1 then
					UART_data<=data_sram_i(7 downto 0); --primero mandamos el menos significativo
				else
					Uart_data<=data_sram_i(15 downto 8);
				end if;
			when UART_mandando =>
				-- SRAM --
				reset_n <= '1';
				data <= (others=>'Z');         
				addrs <= std_logic_vector(to_unsigned(count_mem,20));  -- la direccion de lectura es la del contador
				action <='0'; --  lo ponemos en modo lectura a la sram
			-- salidas externas--
				led_errase <='1';			-- el errase ya se hizo se mantiene prendido
				led_lectura<='1';			-- prendemos por que esta hablitada la lectura
				estado<=9;
				UART_send<='0';         -- dejamos de mandar el start
				if cuenta_vueltas<1 then
					UART_data<=data_sram_i(7 downto 0); --primero mandamos el menos significativo
				else
					Uart_data<=data_sram_i(15 downto 8);
				end if;
		end case;
	end process;

end rtl;
