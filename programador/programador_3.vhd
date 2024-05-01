library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

--bitacora del codigo
--27/4 el codigo hace algo
-- con los cambios en los if, podes leer los comentarios sobre los contadores
--basicamente lo que pasa es que cuenta 1 ciclo mas de lo que necesitas, cuando llegas a idle ya estarias como tarde
--por que pasaria un ciclo y vos ya deberias haber cambiado el bit, por ahi sacar un estado redundante
--el estado redundante me parece que es start_1, no se no tengo mas tiempo de probar 
--por lo menos la simulacion esta andando, no anda la simulacion con los retardos
--no se por que le tengo que preguntar a lucas, ahora pusheo este codigo que parece querer hacer algo
--proximos pasos a seguir 

--1 verificar el codigo del "curso" con el i2c_master para ver como lo resuelve el, porque me parece
-- que la solucion del contador es poco optima y propensa a errores
--preguntarle a lu una posible solucion al tema de los contadores.

--una solucion es agregar mas estados, para que cada estado sea un cuarto de ciclo y listo 
	
-- otra solucion es hacer 2 maquinas de estados, una que manda pulsos mientras va contando , entonces te marca el primer cuarto el segundo cuarto el tercer cuarto y asi
entity programador is

	port(
		--variables unicamente necesarias para la simulacion 
		clk_div8_sim : out std_logic;
		--variables necesarias		
		clk		 : in	std_logic;
		
		
		start	 : in	std_logic;
--		r_w : in std_logic;
		stop : in std_logic;
		reset	 : in	std_logic;
--		data : in std_logic_vector (7 downto 0);
--		sda	 : out	std_logic;
--		sca    : out std_logic;
		buisy : out std_logic_vector (1 downto 0)
	);

end entity;

architecture rtl of programador is

	-- Build an enumerated type for the state machine
	type state_type is (idle, start_1, start_2,start_3, hold);
	-- Register to hold the current state
	signal state   : state_type;
	
	signal clk_div2,clk_div4,clk_div8 : std_logic;

begin
	clk_div2 <= not(clk_div2) when (clk'event and clk='1');
	clk_div4 <= not(clk_div4) when (clk_div2'event and clk_div2='1');--generador del clk 
	clk_div8 <= not(clk_div4) when (clk_div4'event and clk_div4='1');
	clk_div8_sim<=clk_div8;
	
	PROCESS(clk_div8, reset_n)
    VARIABLE count  :  INTEGER RANGE 0 TO divider*4;  --timing for clock generation
  BEGIN
    IF(reset_n = '0') THEN               					 --reset asserted
      stretch <= '0';
      count := 0;
    ELSIF(clk'EVENT AND clk = '1') THEN
      data_clk_prev <= data_clk;          --store previous value of data clock
      IF(count = divider*4-1) THEN        --end of timing cycle
        count := 0;                       --reset timer
      ELSIF(stretch = '0') THEN           --clock stretching from slave not detected
        count := count + 1;               --continue clock generation timing
      END IF;
      CASE count IS
        WHEN 0 TO divider-1 =>            --first 1/4 cycle of clocking
          scl_clk <= '0';
          data_clk <= '0';
        WHEN divider TO divider*2-1 =>    --second 1/4 cycle of clocking
          scl_clk <= '0';
          data_clk <= '1';
        WHEN divider*2 TO divider*3-1 =>  --third 1/4 cycle of clocking
          scl_clk <= '1';                 --release scl
          IF(scl = '0') THEN              --detect if slave is stretching clock
            stretch <= '1';
          ELSE
            stretch <= '0';
          END IF;
          data_clk <= '1';
        WHEN OTHERS =>                    --last 1/4 cycle of clocking
          scl_clk <= '1';
          data_clk <= '0';
      END CASE;
    END IF;
  END PROCESS;
	
--	-- Logic to advance to the next state
	process (clk, reset)
	begin
		if reset = '1' then
			state <= idle;
		elsif (rising_edge(clk)) then
			case state is
				when idle=>
					if start = '1' then
						state <= start_1;
					else
						state <= idle;
					end if;
				when start_1=>
					if clk_div8 = '1' then         --verificamos que el clk_div4 este en alto para dar el bit start, primer cuarto de ciclo								
						state <= start_2;
					end if;
				when start_2=> -- segundo cuarto de ciclo
					state<=start_3;
				when start_3=> 			 --tercer cuarto de ciclo finalizacion del start bit 
												--hay que pasar a state  o esperar
					if clk_div8='1' then  --si esta en alto clk/8 entonces estamos "temprano"  y hay que retrasar
						state<= start_3;
					else 							--si esta en bajo clk/8 estamos "tarde" o bien ponele y hay que terminar el star en el porximo cuarto
						state <= b_0;
					end if;
				when b_0 =>
					state
					
					
				when hold =>
					if stop = '1' then 
						state <= idle;
					else 
						state <= hold;
					end if;
--				when hold =>
--					if r_w = '1' then
--						state <= d_1;
--					elsif stop= '1' then
--						state <= stop_1;
--					else
--						state <= hold;
--					end if;
--				when d_1 =>
--					state <= d_2;
--				when d_2 =>
--					state <= d_3;
--				when d_3 =>
--					state <= d_4;
--				when d_4 =>
--					state <= d_5;
--				when d_5 <=
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when idle =>
				buisy <= "00";
			when start_1 =>
				buisy <= "01";
			when start_2 =>
				buisy <= "10";
			when hold =>
				buisy <= "11";
		end case;
	end process;

end rtl;
