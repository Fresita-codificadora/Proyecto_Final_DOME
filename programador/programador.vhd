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
	
	
entity programador is

	port(
		--variables unicamente necesarias para la simulacion 
		clk_div4,clk_div2 : out std_logic;
		count : out std_logic_vector (1 downto 0);
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
	--type state_type is (idle, start_1, start_2, hold, stop_1, d_0, d_1, d_2, d_3, d_4, d_5, d_6, d_7, d_end);
	type state_type is (idle, start_1, start_2, hold);
	-- Register to hold the current state
	signal state   : state_type;
	
	signal clk_div2_int,clk_div4_int : std_logic;

begin
	clk_div2_int <= not(clk_div2_int) when (clk'event and clk='1');
	clk_div2 <= clk_div2_int;
	clk_div4_int <= not(clk_div4_int) when (clk_div2_int'event and clk_div2_int='1');
	clk_div4 <= clk_div4_int;
--	-- Logic to advance to the next state
	process (clk, reset)
	variable count_int : integer range 0 to 4;
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
					if clk_div4_int = '1' then 
						count_int := 0;                  --verificamos que el clk_div4 este en alto para dar el bit start
																	-- esta cuenta hay que reiniciarla aca adentro si no se rompe el programa
						state <= start_2;
						count <= std_logic_vector(to_unsigned(count_int,2));--sim
					end if;
				when start_2=> 
					if count_int < 1 then
						count_int:= count_int + 1; -- los ciclos que cuenta es uno mas de lo que tenemos marcado, en este caso marca 1 pero cuenta 2 ciclos
															-- el otro ciclo se lo come el estado, entrar al estado consume 1 ciclo
						count <= std_logic_vector(to_unsigned(count_int,2));--sim
					else 
						state<= hold;
						count_int :=0;							-- esta cuenta hay que reiniciarla aca adentro si no se rompe el programa
						count <= std_logic_vector(to_unsigned(count_int,2));--sim
					end if;
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
