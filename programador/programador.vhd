-- Quartus Prime VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
use ieee.std_logic_1164.all;

entity programador is

	port(
		--variables unicamente necesarias para la simulacion 
	--	clk_div8_sim : out std_logic;
		--variables necesarias
	   -- entradas
		clk		 : in	std_logic;	
		s_t	 : in	std_logic; --start input
		r_w : in std_logic;
		stop : in std_logic; 
		reset	 : in	std_logic;
		data_in : in std_logic_vector (7 downto 0);
		--salidas
		sda_o	 : inout	std_logic ;
		sca_o  : out std_logic ;
		err : out std_logic ;
		buisy : out std_logic  
	);

end entity;

architecture rtl of programador is

	-- Build an enumerated type for the state machine
	type state_type is (idle, start, b_trans, b_write,ack_1,ack_2,error,idle_2,stop_1,stop_2);

	-- Register to hold the current state
	signal state   : state_type;
	signal count: integer range 0 to 8;
	signal clk_div2,clk_div4,clk_div8,sda,sca : std_logic;
	signal data : std_logic_vector (7 downto 0);

begin

--esto por algun motivo no esta andando asi que nos vamos a cagar en todos y vamos a mandarle al clk derecho
--	clk_div2 <= not(clk_div2) when (clk'event and clk='1');
--	clk_div4 <= not(clk_div4) when (clk_div2'event and clk_div2='1');--generador del clk 
--	clk_div8 <= not(clk_div4) when (clk_div4'event and clk_div4='1');
--	clk_div8_sim<=clk_div8;
	
	sda_o <= 'Z' when sda = '1' else '0'; -- convierte sda de 0 o 1 a 0 o Z
	sca_o <= 'Z' when sca = '1' else '0';
	-- Logic to advance to the next state
	
	process (clk, reset)
	begin
		if reset = '1' then
			state <= idle;
		elsif (rising_edge(clk)) then
			data <= data_in;
			case state is
				when idle=>
					if s_t = '1' then
						state <= start;       -- idle ppal donde esperamos la señal de start(s_t) para comenzar a mandar la primera direccion
					else
						state <= idle;
					end if;
					
				when start=>
					count <= 7;                 -- recibimos la señal de start y mandamos el start bit
					state <= b_trans;
				
				when b_trans=>                 -- estado intermedio donde pulsamos el clk de datos
					state <= b_write;
				
				when b_write =>
					if count-1>=0 then
						count <= count - 1;
						state <= b_trans;    --pulso de clk de datos en alto donde escribimos el registro o la direccion
					else 
						count <= 7;          -- si ya escribimos los 8 datos , esperamos recibir un ack entonces pasamos al estado ack_1
						state <= ack_1;
					end if;
				
				when ack_1 =>
					state <= ack_2;      -- estado intermedio donde pulsamos el clk de datos
				
				when ack_2 =>
				
					if sda = '1' then  --estado de no recibir un ack del esclavo
						state <= error;
					else
						state <= idle_2;
					end if;
				
				when idle_2 =>
					if r_w = '1' then      --estado idle donde podemos mandar el proximo dato
						state <= b_trans;
					elsif stop = '1' then      -- si llega la señal de stop lo que hacemos es mandar el stop bit 
						state <= stop_1;
					else
						state <= idle_2;       -- si no llegan comandos nos quedamos aca esperando 
					end if;
				
				when stop_1 =>
					state <= stop_2;		-- parte del stop bit punto intermedio
				
				when stop_2 =>
					state <= idle;      -- punto final del stop bit donde volvemos al idle ppal donde se envia un nuevo start bit para comenzar
				when error =>
					state <= error;
				when others =>
					state <= idle;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when idle =>        -- en este estado ambas lineas la de datos y clk deben estar en alto, y la señal de buisy debe estar en bajo
				sca <= '1';      --clk= 1
				sda <= '1';       --dato= 1
				buisy <= '0';
				err <= '0';
			when start =>
				sca <='1';
				sda <= '0';      -- pulsamos dato cuando el clk esta en alto
				buisy <= '1';
				err <= '0';
			when b_trans =>
				sca <= '0';
				sda <= data(count);   -- mientras el clk esta en bajo cambiamos a los datos
				buisy <= '1';
				err <= '0';
			when b_write =>         -- el indice se deberia ir cambiando a medida de que count que esta en la otra parte vaya cambiando
				sca <= '1';
				sda <= data(count);   -- mantenemos datos mientras el clk esta en alto asi lo puede leer
				buisy <= '1';
				err <= '0';
			when ack_1 =>
				sca <= '0';
				sda <= sda_o;           -- pulsamos el clk a ver si recibimos el ack
				buisy <= '1';
				err <= '0';
			when ack_2 =>
				sca <= '1';     --en este estado debe ingresar el ack del esclavo por eso no esta sda
				sda <= sda_o;
				buisy <= '1';
				err <= '0';
			when idle_2=>
				sca <= '1';
				sda <= '1';
				buisy <= '0';
				err <= '0';
			when stop_1 =>
				sca <= '0';
				sda <= '0';
				buisy <= '1';
				err <= '0';
			when stop_2 =>
				sca <= '1';
				sda <= '0';
				buisy <= '1';
				err <= '0';
			when error =>
				sca <= '1';
				sda <= '1';
				buisy <= '0';
				err <= '1';
		end case;
	end process;
end rtl;
