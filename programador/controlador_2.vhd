library ieee;
use ieee.std_logic_1164.all;

entity controlador_2 is

	port(
	
	--entradas
		clk		 : in	std_logic;
		start	 : in	std_logic;
		reset	 : in	std_logic;
		buisy : in std_logic;
		err : in std_logic;
	-- salidas
		done_s : out std_logic;
		clk_o  : out std_logic;
		r_s  : out std_logic;
		s_t	: out std_logic;
		w : out std_logic;
		stop : out std_logic;
		data	 : out	std_logic_vector(7 downto 0)
	);

end entity;

architecture rtl of controlador_2 is

	-- Build an enumerated type for the state machine
	type state_type is (idle, dp_BA,    dp_07,dp_07_int,dw_07,   dp_00,dp_00_int,dw_00,    dp_02,dp_02_int,dw_02    ,stop_1      ,dp_BA_2      ,dp_1E,dw_1E     ,dp_81,dw_81    ,dp_00_2,dw_00_2  ,stop_2,done);

	-- Register to hold the current state
	signal state   : state_type;
	signal clk_int2,clk_int4 : std_logic;
	signal count : integer range 0 to 255;

begin


	clk_int2 <= not(clk_int2) when (clk'event and clk='1');
	clk_int4 <= not(clk_int4) when (clk_int2'event and clk_int2='1');--generador del clk 
	clk_o <= clk_int4;
	--clk_o <= not(clk_o) when (clk_int4'event and clk_int4='1');

	-- Logic to advance to the next state
	process (all)
	begin
--		if err= '1' then
--			state <= idle;  --senal de error reinicia la maquina
--		end if;
		if reset = '1' then
			state <= idle;
		elsif (clk'event and clk='1') then
			case state is
				when idle=>
					if start = '1' then
						state <= dp_BA;
					else
						state <= idle;
					end if;
					
-- escritura 0xBA para operacion de escritura
				when dp_BA =>
					if buisy = '0' then
						state <= dp_07;
						count <= 255;
					else
						state <= dp_BA;
					end if;
					
--escritura 0x07 para indicar el registro 07, que maneja el update de los cambios
				when dp_07_int =>
					state <= dp_07;
				when dp_07=>
					if count-1 >=0 then
						count <= count - 1;
						state <= dp_07_int;
					else 
						count <=255;
						state <= dw_07;
					end if;
				when dw_07 =>
					if buisy = '0' then
						state <= dp_00;
					else
						state <= dw_07;
					end if;
					
-- escritura 0x00 primera parte del registro 0x07					
				when dp_00_int =>
 					state <= dp_00;
				when dp_00=>
					if count-1 >=0 then
						count <= count - 1;
						state <= dp_00_int;
					else 
						count <=255;
						state <= dw_00;
					end if;
				when dw_00 =>
					if buisy = '0' then
						state <= dp_02;
					else
						state <= dw_00;
					end if;
-- escritura 0x02 segunda parte del registrol 0x07
				when dp_02_int =>
					state <= dp_02;				
				when dp_02=>
					if count-1 >=0 then
						count <= count - 1;
						state <= dp_02_int;
					else 
						count <=255;
						state <= dw_02;
					end if;
				when dw_02 =>
					if buisy = '0' then
						state <= stop_1;
					else
						state <= dw_02;
					end if;
					
-- primer stop para pasar a otro registro que va a controlar si esta en modo snapshot o continuo
				when stop_1 => 
					if buisy = '0' then 
						state <= dp_BA_2;
					else 
						state <= stop_1;
					end if;
					
-------------------------------------------------------------------------------------------------
---segunda parte donde se va a escribir los otros registros donde se controla el modo snapshot---
-------------------------------------------------------------------------------------------------					

	
---- escritura 0xBA para operacion de escritura
--				when dp_BA_2 =>
--					if buisy = '0' then
--						state <= dp_1E;
--						count <=255;
--					else
--						state <= dp_BA_2;
--					end if;
--					
----escritura 0x1E para indicar el registro 1E, que maneja si la camara esta en modo snapshot
--				when dp_1E=>
--					if count-1 >=0 then
--						count <= count - 1;
--						state <= dp_1E;
--					else 
--						count <=255;
--						state <= dw_1E;
--					end if;
--				when dw_1E =>
--					if buisy = '0' then
--						state <= dp_81;
--					else
--						state <= dw_1E;
--					end if;
--					
---- escritura 0x81 primera parte del registro 0x1E					
--				when dp_81=>
--					if  count-1 >=0 then
--						count <= count - 1;
--						state <= dp_81;
--					else 
--						count <=255;
--						state <= dw_81;
--					end if;
--				when dw_81 =>
--					if buisy = '0' then
--						state <= dp_00_2;
--					else
--						state <= dw_81;
--					end if;
---- escritura 0x00 segunda parte del registrol 0x1E
--				when dp_00_2=>
--					if count-1 >=0 then
--						count <= count - 1;
--						state <= dp_00_2;
--					else 
--						count <=255;
--						state <= dw_00_2;
--					end if;
--				when dw_00_2 =>
--					if buisy = '0' then
--						state <= stop_2;
--					else
--						state <= dw_00_2;
--					end if;
					
-- segundo stop ya mostramos que terminamos la escritura del registro
				when stop_2 => 
					if buisy = '0' then 
						state <= done;
					else 
						state <= stop_2;
					end if;
					
-- estado de DONE
				when done =>
					state <= done;
				
				when others =>
					state <= idle;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (all)
	begin
		case state is
			when idle =>
				r_s <= '1';
				done_s <= '0';
				s_t <= '0';
				w <= '0';
				stop <='0';
				data	 <=x"00";
			when dp_BA =>
				r_s <= '0';
				done_s <= '0';
				s_t <= '1';
				w <= '0';
				stop <='0';
				data	 <=x"BA";
			when dp_07 =>
				r_s <= '0';
				done_s <= '0';
				s_t <= '0';
				w <= '1';
				stop <='0';
				data	 <=x"07";
			when dw_07 =>
				r_s <= '0';
				done_s <= '0';
				s_t <= '0';
				w <= '0';
				stop <='0';
				data	 <=x"07";
			when dp_00 =>
				r_s <= '0';
				done_s <= '0';
				s_t <= '0';
				w <= '1';
				stop <='0';
				data	 <=x"00";
			when dw_00 =>
				r_s <= '0';
				done_s <= '0';
				s_t <= '0';
				w <= '0';
				stop <='0';
				data	 <=x"00";
			when dp_02 =>
				r_s <= '0';
				done_s <= '0';
				s_t <= '0';
				w <= '1';
				stop <='0';
				data	 <=x"02";
			when dw_02 =>
				r_s <= '0';
				done_s <= '0';
				s_t <= '0';
				w <= '0';
				stop <='0';
				data	 <=x"02";
---------------------------------------------------------
--------------------FIN PRIMERA PARTE--------------------
---------------------------------------------------------
			when stop_1 =>
				r_s <= '0';
				done_s <= '0';
				s_t <= '0';
				w <= '0';
				stop <='1';
				data	 <=x"00";
--			when dp_BA_2 =>
--				r_s <= '0';
--				done_s <= '0';
--				s_t <= '1';
--				w <= '0';
--				stop <='0';
--				data	 <=x"BA";
--			when dp_1E =>
--				r_s <= '0';
--				done_s <= '0';
--				s_t <= '0';
--				w <= '1';
--				stop <='0';
--				data	 <=x"1E";
--			when dw_1E =>
--				r_s <= '0';
--				done_s <= '0';
--				s_t <= '0';
--				w <= '0';
--				stop <='0';
--				data	 <=x"1E";
--			when dp_81 =>
--				r_s <= '0';
--				done_s <= '0';
--				s_t <= '0';
--				w <= '1';
--				stop <='0';
--				data	 <=x"81";
--			when dw_81 =>
--				r_s <= '0';
--				done_s <= '0';
--				s_t <= '0';
--				w <= '0';
--				stop <='0';
--				data	 <=x"81";
--			when dp_00_2 =>
--				r_s <= '0';
--				done_s <= '0';
--				s_t <= '0';
--				w <= '1';
--				stop <='0';
--				data	 <=x"00";
--			when dw_00_2 =>
--				r_s <= '0';
--				done_s <= '0';
--				s_t <= '0';
--				w <= '0';
--				stop <='0';
--				data	 <=x"00";
---------------------------------------------------------
--------------------FIN SEGUNDA PARTE--------------------
---------------------------------------------------------
			when stop_2 =>
				r_s <= '0';
				done_s <= '0';
				s_t <= '0';
				w <= '0';
				stop <='1';
				data	 <=x"00";
			when done =>
				r_s <= '0';
				done_s <= '1';
				s_t <= '0';
				w <= '0';
				stop <='0';
				data	 <=x"00";
			when others =>
				r_s <= '0';
				done_s <= '0';
				s_t <= '0';
				w <= '0';
				stop <='0';
				data	 <=x"00";
		end case;
	end process;

end rtl;
