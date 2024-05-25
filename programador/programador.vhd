-- ARCHIVO: programador.vhd
-- DESCRIPCION: maquina de estados, encagada de implementar el protocolo similar al i2c para la camara 
-- ESTADOS:
--    idle : Estado inicial donde se espera a la señal start
--    start : Estado donde se inicia el proceso de envio de datos, mandando el bit start
--    b_trans : estado de transicion para la escritura donde se cambia el bit a enviar
--    b_write : estado de escitura del bit donde se pone el clk en alto para que se realice la escritura
--    ack_1 : estado donde se espera el ack, existen 2 estados de ack por que hay que pulsar el clk para que el esclavo puedda mandar el ack
--    ack_2 : estado donde se pulsa el clk y se espera eller el bit de ack
--    error : estado de error cuando no se recibe un ack, hay que reiniciar la maquina de estados
--    idle_2 : estado de idle donde no hayq que pasar por el estado start, y ya estamos listos para mandar otro byte
--    stop_1 : estado donde se manda la señal de stop
--    stop_2 : estado donde se manda la segunda parte de la señal de stop
-- PUERTOS:
--    clk: clock de entrada a el doble de la frecuencia que la esperada en el puerto i2c, en mi caso debo tener en cuenta que la restriccion de la camara
--         me pide que el flanco al menos sea de 5 clk del clk maestro por lo que este clk como maximo es 5 veces menos que el clk maestro
--    s_t: entrada, señal de start que comienza la maquina de estados
--    r_w: entrada, señal que le indica a la maquina de estados que puede escribir el proximo byte luego de estar en idle_2, debemos haber cambiado los datos de entrada antes de accionar esta señal
--    stop: entrada, señal que le indica que comience el proceso de stop
--   	reset : entrada, señal que reinicia la maquina de estados estas  
--    data_in : entrada, señal paralela del lato que tiene que enviar
--    sda_o : salida, señal serie de salida de datos con un buffer tristae
--    sca_o : salida, señal de salida de clk para la salida de datos serie
--    err : salida, señal de error cuando no se tiene la señal de ack
--    buisy : salida, señal que indica que se esta mandando un byte y que se debe mantener los datos

library ieee;
use ieee.std_logic_1164.all;

entity programador is

	port(
	   -- entradas
		clk		 : in	std_logic;	
		s_t	 : in	std_logic; --start input
		r_w : in std_logic;
		stop : in std_logic; 
		reset	 : in	std_logic;
		data_in : in std_logic_vector (7 downto 0);
		--salidas
		sda_o	 : inout	std_logic := 'Z';
		sca_o  : out std_logic := 'Z';
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
	signal data : std_logic_vector (7 downto 0);

begin

	
	sda_o <= 'Z' when sda = '1' else '0'; -- convierte sda de 0 o 1 a 0 o Z
	sca_o <= 'Z' when sca = '1' else '0';
	-- Logic to advance to the next state
	
	process (clk, reset)
	begin
		if reset = '1' then
			state <= idle;
		elsif (rising_edge(clk)) then
			case state is
				when idle=>
					if s_t = '1' then
						state <= start;       -- idle ppal donde esperamos la señal de start(s_t) para comenzar a mandar la primera direccion
						data <= data_in;
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
						data <= data_in;
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
