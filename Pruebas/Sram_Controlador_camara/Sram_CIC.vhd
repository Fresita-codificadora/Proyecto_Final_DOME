-- Quartus Prime VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Sram_CIC is

	port(
		clk : in	std_logic;
		Start,reset,leer: in	std_logic;
		data : in std_logic_vector(7 downto 0);
		data_o : out std_logic_vector(15 downto 0);
		add : out std_logic_vector(19 downto 0);
		reset_o,r_w_O,fin_signal : out std_logic
	);

end entity;

architecture rtl of Sram_CIC is

	-- Build an enumerated type for the state machine
	type state_type is (idle, mas_sig, menos_sig, escritura,address, fin);

	-- Register to hold the current state
	signal state   : state_type;
	signal data_reg : std_logic_vector(15 downto 0):=x"0000";
	signal clk_int,clk_lento: std_logic;
	signal add_count : integer range 0 to 2**20-1:=0;

begin
	div_clk:process (clk) -- no se si lo necesito
		variable cont_int : integer range 0 to 50_000_000;
	begin
		if rising_edge(clk) then
			cont_int:=cont_int+1;
			if cont_int=50_000_000 then
				clk_lento<= not clk_lento;
				cont_int:=0;
			end if;
			clk_int<= not clk_int;
		end if;
	end process;
	

	-- Logic to advance to the next state
	process (clk_int, reset)
		variable leer_int:std_logic:='0';
		variable pixel_cnt:integer range 0 to 1_310_720 := 0;
	begin
		if reset = '0' then
			state <= idle;
			add_count<=0;
			pixel_cnt:=0;
		elsif (rising_edge(clk_int)) then
			case state is
				when idle=>  -- idle reseteo todo
					if start = '0' then
						state <= mas_sig;
						leer_int:='0';
					else
						state <= idle;
					end if;
				when mas_sig=> -- escritura de la parte mas significativa del registro
					
					if leer_int='1' then --si leimos ya podemos seguir
						leer_int:='0';
						state<=menos_sig;
					else                -- si no leimos esperamos la señal leer externa
						state<=mas_sig;
						if leer='1' then
							leer_int:='1'; -- ponemos bandera de que leimos
							pixel_cnt := pixel_cnt + 1; -- aumentamos el numero de pixel
							data_reg(15 downto 8)<= data;
						else
							leer_int:='0';
						end if;
					end if;
				
				when menos_sig=> -- escritura de la parte menos significativa
					
					if leer_int='1' then --si leimos ya podemos seguir
						leer_int:='0';
						state<=escritura;
					else                -- si no leimos esperamos la señal leer externa
						state<=menos_sig;
						if leer='1' then
							leer_int:='1'; -- ponemos bandera de que leimos
							pixel_cnt := pixel_cnt + 1; -- aumentamos el numero de pixel
							data_reg(7 downto 0) <=data;
						else 
							leer_int:='0';
						end if;
					end if;
					
				when escritura=> --escribimos el vector nuevo conformado por el mas sig y el menos sig  r_w es 0(read) o 1(write)
					state<=address;
				when address => -- aumentamos el address
					if pixel_cnt<1_310_720 then
						state<=mas_sig;
						add_count<=add_count+1;-- aumentamos el address luego de escribir los 16 bits
					else
						state<=fin; -- si ya leimos toda la camara ya podemos pasar al estado fin donde la lectura del frame se concreto
					end if;
				when fin =>
					if start='0' then
						state<=idle;
					else
						state<=fin;
					end if;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state,add_count,data_reg)
	begin
		case state is
			when idle =>
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=x"0000";
				reset_o<='0';
				r_w_O <='0';
				fin_signal<='0';
			when menos_sig => -- cambiar sal
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=x"0000";
				reset_o<='0';
				r_w_O <='0';
				fin_signal<='0';
			when mas_sig=> -- cambiar sal
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=x"0000";
				reset_o<='0';
				r_w_O <='0';
				fin_signal<='0';				
			when escritura => -- no cambiar sal
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=data_reg;
				reset_o<='1';
				r_w_O <='1';
				fin_signal<='0';
			when address => --cambiar sal
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=x"0000";
				reset_o<='1';
				r_w_O <='1';
				fin_signal<='0';
			when fin => -- cambiar salida -- agergar señal de fin
				add <="Z";
				data_o <=x"0000";
				reset_o<='Z';
				r_w_O <='Z';
				fin_signal<='1';
		end case;
	end process;

end rtl;
