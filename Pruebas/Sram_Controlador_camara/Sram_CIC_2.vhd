-- Quartus Prime VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Sram_CIC_2 is

	port(
		clk : in	std_logic;
		Start,reset,leer: in	std_logic;
		data : in std_logic_vector(7 downto 0);
		data_o : out std_logic_vector(15 downto 0);
		add : out std_logic_vector(19 downto 0);
		reset_o,r_w_O,fin_signal : out std_logic
	);

end entity;

architecture rtl of Sram_CIC_2 is

	-- Build an enumerated type for the state machine
	type state_type is (idle, B_menossig, B_massig, escritura, memoria, final);

	-- Register to hold the current state
	signal state   : state_type;
	signal data_reg : std_logic_vector(15 downto 0):=x"0000";
	signal add_count : integer range 0 to 2**20-1:=0;
	signal clk_int: std_logic;
begin
	div_clk:process (clk) -- no se si lo necesito
	begin
		if rising_edge(clk) then
			clk_int<= not clk_int;
		end if;
	end process;

	-- Logic to advance to the next state
	process (clk, reset)
		variable leer_ant, datos_leidos : std_logic:='0';
		variable pix_cnt : integer range 0 to 1_310_720:=0;
	begin
		if reset = '0' then
			state <= idle;
			leer_ant:='0';
			datos_leidos:='0';
			pix_cnt:=0;
		elsif (rising_edge(clk)) then
			case state is
				when idle=>
					if leer/=leer_ant then -- si hay un cambio en el estado de leer deberia cambiar de estado (leer=1)
						state<=B_massig;
						leer_ant:=leer;  -- deberia escribir en leer_ant=1
					else 
						state<=idle;
					end if;
				when B_massig=>  -- debera entrar con leer_ant = 1 entonces si leer = 0 debemos cambiar de estado
					
					if leer/=leer_ant then -- si hay un cambio en el estado de leer deberia cambiar de estado (leer=0)
						state<=B_menossig;
						leer_ant:=leer; -- deberia escribir en leer_ant=0
						datos_leidos:='0';
					else 
						if datos_leidos='0' then -- si los datos todavia no fueron leidos, lo que hacemos es leerlos
							data_reg(15 downto 8)<=data;
							datos_leidos:='1';
							pix_cnt:=pix_cnt+1;
						end if;
						state<=B_massig; --volvemos al estado mas_sig a esperar que cambie la señal de leer
					end if;	
				when B_menossig=>  -- debera entrar con leer_ant=0 entoces nos tenemos que quedar aca hasta que cambie a leer=1, escribir y despues cambiar de estado
					if leer/=leer_ant then -- si hay un cambio en el estado de leer deberia escribir y cambiar de estado (leer=1)
						data_reg(7 downto 0)<=data;
						pix_cnt:=pix_cnt+1;
						state<=escritura;
						leer_ant:=leer; -- deberia escribir en leer_ant=1
					else 
						state<=B_menossig; --volvemos al estado mas_sig a esperar que cambie la señal de leer
					end if;
				when escritura => -- escribo a la memoria
					state<= memoria;
				when memoria =>
					if pix_cnt<1_310_720 then
						if leer='1' then
							state<=memoria; -- Si todavia no es el final de la imagen y leer sigue en 1 esperamos a que cabie la señal leer;
						else 
							add_count<=add_count+1;-- aumentamos el address luego de escribir los 16 bits
							state<=idle;
							leer_ant:='0'; -- reiniciamos leer_ant
						end if;
					else
						state<=final; -- si ya leimos toda la camara ya podemos pasar al estado fin donde la lectura del frame se concreto
					end if;		
				when final =>
					if start='0' then
						state<=idle;
					else
						state<=final;
					end if;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state, add_count,data_reg)
	begin
		case state is
			when idle =>
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=x"0000";
				reset_o<='0';
				r_w_O <='0';
				fin_signal<='0';
			when B_menossig =>
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=x"0000";
				reset_o<='0';
				r_w_O <='0';
				fin_signal<='0';
			when B_massig=>
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=x"0000";
				reset_o<='0';
				r_w_O <='0';
				fin_signal<='0';				
			when escritura => 
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=data_reg;
				reset_o<='1';
				r_w_O <='1';
				fin_signal<='0';
			when memoria => 
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=x"0000";
				reset_o<='1';
				r_w_O <='1';
				fin_signal<='0';
			when final => 
				add <="ZZZZZZZZZZZZZZZZZZZZ";
				data_o <=x"0000";
				reset_o<='Z';
				r_w_O <='Z';
				fin_signal<='1';
		end case;
	end process;

end rtl;
