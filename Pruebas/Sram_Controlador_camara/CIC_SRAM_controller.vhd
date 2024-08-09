-- maquina de estados que se encarga de borrar la sram, luego le da la señal de trigger a la camara y a las maquinas de estado
-- internas que se encargan de recibir los pixeles y escribirlos en la sram
-- este archivo deberia ir de la mano de un .bdf donde se deberian encontrar los archivos 
-- SRAM
-- Sram_CIC_2
-- Capture_input_controller
-- Programador_controlador_block
-- divisor
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity CIC_SRAM_controller is

	port(
	-- entradas-----
		clk		 : in	std_logic;
		reset	 : in	std_logic;
		trigger : in std_logic;		-- señal de trigger proveniente de un boton
		enable_done : in std_logic; -- esta señal deberia venir de programador_controlador_block
		sw : in std_logic_vector(17 downto 0); -- los switches para ver las posiciones de memoria luego de escribir todo
		-- entrada de Sram_CIC_2--
		data_Sram_CIC : in std_logic_vector(15 downto 0);  -- estas son las señales provenientes de SRAM_CIC_2
		add_Sram_CIC : in std_logic_vector(19 downto 0);
		reset_Sram,r_w_Sram,fin_Sram : in std_logic;
	-- salidas internas --
		trigger_CIC : out std_logic;  -- este es el trigger que va a SRAM_CIC_2 y a capture_input_controller 
		enable_CIC : out std_logic;   -- enable para el CIC
		-- SRAM --
		reset_n : out std_logic;
		data : out std_logic_vector(15 downto 0);   --señales que necesita el bloque SRAM para escribir la SRAM
		addrs : out std_logic_vector (19 downto 0);
		action : out std_logic;
		-- salidas Sram_CIC_2 --
		start_CIC : out std_logic;		-- señal que usa sram_CIC_2 para reiniciar sin la señal de reset
	-- salidas externas--
		led_errase,led_lectura: out std_logic;      -- señales para marcar la finalizacion de ciertos procesos 
		trigger_cam : out std_logic;					-- trigger que le tengo que mandar a la camara
		estado : out integer range 0 to 7
	);

end entity;

architecture rtl of CIC_SRAM_controller is

	-- Build an enumerated type for the state machine
	type state_type is (reset_state, errase, wait_done , trigger_wait,trigger_interno, trigger_camara, escritura, lectura);

	-- Register to hold the current state
	signal state   : state_type;

	-- signal internas --
	signal count_errase : integer range 0 to 2**20-1:=0;
	signal clk_25	: std_logic;
begin
	clk_interno:process(clk)
	begin
		if rising_edge(clk) then
			clk_25<= not clk_25;
		end if;
	end process;
	-- Logic to advance to the next state
	process (clk_25, reset)
		variable cuenta_trigger_camara : integer range 0 to 9;
	begin
		if reset = '0' then
			state <= reset_state;
			count_errase<=0;
			cuenta_trigger_camara:=0;
		elsif (rising_edge(clk_25)) then
			case state is
				when reset_state =>
					state<=errase;
				when errase=>                   --este estado deberia borrar toda la memoria sram
					if count_errase=2**20-1 then
						state <= wait_done;   --aca ya deberia haber borrado toda la memora 
					else
						count_errase<=count_errase+1;  -- esto es el addrs que le mando para borrar todo
						state <= errase;
					end if;
				when wait_done=> -- en este estado esperamos a que el programador_controlador_block termine
					if enable_done = '1' then
						state <= trigger_wait;  -- si termino vamos a esperar el trigger
					else
						state <= wait_done;
					end if;
				when trigger_wait=>
					if trigger = '0' then
						state <= trigger_interno;
					else
						state <= trigger_wait;
					end if;
				when trigger_interno => -- le mandamos la señal de trigger a las maquinas de estado inteno asi reinician sus contadores
					state<= trigger_camara;--procedemos a mandarselo a la camara;
				when trigger_camara =>
					if cuenta_trigger_camara<=3 then
						cuenta_trigger_camara:=cuenta_trigger_camara+1;       --esperamos al menos 5 ciclos de reloj mandando la señal de trigger a la camara por que estamos en diferentes dominios de clk 
						state <= trigger_camara; -- el clk de la camara deberia ser 5 veces menos que el clk de esta maquina de estados
					else
						cuenta_trigger_camara:=0;
						state<=escritura;
					end if;
				when escritura => -- lo que esta pasando en este estado es que estamos esperando que me mande todo los pixeles la camara
					if fin_Sram='1' then 
						state<=lectura; -- cuando me manda la fin signal ya podemos pasar a la parte de lectura donde le mandamos la señal de los sw a SRAM
					elsif trigger='0'then
						state<=trigger_wait;
					else
						state<=escritura; -- si todavia no me mandaron la señal de fin me quedo en escritura
					end if;
				when lectura =>
					if trigger='0' then -- si me manda la seña de trigger de nuevo volvemo a arrancar
						state<=errase;
						start_CIC<='0';
					else 
						state<=lectura;
					end if;
			end case;
			start_CIC<='1';  -- esto esta para que entodos los casos me mande un 1 en start_CIC, exepto en el caso de lectura
		end if;
	end process;

	-- Output depends solely on the current state
	process (all)
	begin
		case state is
			when reset_state=>
				trigger_CIC <= '0';
				enable_CIC <= '0';  
				-- SRAM --
				reset_n <= '0'; --reseteamos la sram
				data <= (others=>'0');   -- todo en cero
				addrs <= (others=>'0');
				action <='1';           -- modo escritura sram
			-- salidas externas--
				led_errase <='0';
				led_lectura<='0';
				trigger_cam <='0';
				estado<=0;
			when errase =>
				trigger_CIC <= '0';
				enable_CIC <= '0';  
				-- SRAM --
				reset_n <= '1';
				data <= (others=>'0');   -- todo en cero
				addrs <= std_logic_vector(to_unsigned(count_errase,20));
				action <='1';           -- modo escritura sram
			-- salidas externas--
				led_errase <='0';
				led_lectura<='0';
				trigger_cam <='0';
				estado<=1;
			when wait_done =>
				trigger_CIC <= '0';
				enable_CIC <= '0';  
				-- SRAM --
				reset_n <= '1';
				data <= (others=>'0');   -- todo en cero
				addrs <= (others=>'0');
				action <='1';          --modo escritura sram
			-- salidas externas--
				led_errase <='1'; -- el errase ya se hizo se mantiene prendido
				led_lectura<='0';
				trigger_cam <='0';
				estado<=2;
			when trigger_wait =>
				trigger_CIC <= '0';
				enable_CIC <= '0';  
				-- SRAM --
				reset_n <= '1';
				data <= (others=>'0');   
				addrs <= (others=>'0');
				action <='1';
			-- salidas externas--
				led_errase <='1';   -- el errase ya se hizo se mantiene prendido
				led_lectura<='0';
				trigger_cam <='0';
				estado<=3;
			when trigger_interno =>
				trigger_CIC <= '1'; -- mandamos trigger interno
				enable_CIC <= '1';  -- habilitamos
				-- SRAM --
				reset_n <= '1';
				data <= (others=>'0');  
				addrs <= (others=>'0');
				action <='1';				-- modo escritura sram
			-- salidas externas--
				led_errase <='1';			-- el errase ya se hizo se mantiene prendido
				led_lectura<='0';
				trigger_cam <='0';
				estado<=4;
			when trigger_camara =>
				trigger_CIC <= '0'; -- listo con el trigger interno
				enable_CIC <= '1';  -- seguimos hablitando
				-- SRAM --
				reset_n <= reset_Sram;
				data <= data_Sram_CIC;         -- ahora sram es un bypass a las entradas de CIC
				addrs <= add_Sram_CIC;
				action <=r_w_Sram;      
			-- salidas externas--
				led_errase <='1';			-- el errase ya se hizo se mantiene prendido
				led_lectura<='0';
				trigger_cam <='1';      -- mandamos el trigger a la camara
				estado<=5;
			when escritura =>
				trigger_CIC <= '0'; -- listo con el trigger interno
				enable_CIC <= '1';  -- seguimos hablitando
				-- SRAM --
				reset_n <= reset_Sram;
				data <= data_Sram_CIC;         -- ahora sram es un bypass a las entradas de CIC
				addrs <= add_Sram_CIC;
				action <=r_w_Sram;
			-- salidas externas--
				led_errase <='1';			-- el errase ya se hizo se mantiene prendido
				led_lectura<='0';
				trigger_cam <='0';      -- listo con el trigger a la camara
				estado<=6;
			when lectura =>
				trigger_CIC <= '0'; -- listo con el trigger interno
				enable_CIC <= '1';  -- seguimos hablitando
				-- SRAM --
				reset_n <= '1';
				data <= (others=>'Z');         
				addrs <= "00" & sw;  -- la direccion de lectura es la de los sw como no alcanza los primeros son 00
				action <='0'; --  lo ponemos en modo lectura a la sram
			-- salidas externas--
				led_errase <='1';			-- el errase ya se hizo se mantiene prendido
				led_lectura<='1';			-- prendemos por que esta hablitada la lectura
				trigger_cam <='0';      -- listo con el trigger a la camara
				estado<=7;
		end case;
	end process;

end rtl;
