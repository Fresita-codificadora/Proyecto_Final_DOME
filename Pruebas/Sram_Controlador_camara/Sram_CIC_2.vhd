--Maquina de estados encargada de tomar los datos del Capture_input_controller y escribirlos en la sram, necesita aparte el trigger_hendler
-- para recibir la señal de trigger correspondiente y que renicie la maquina de estados previo a recibir un nuevo frame

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Sram_CIC_2 is

	port(
		clk: in	std_logic;
		Start,reset,leer,trigger: in	std_logic;
		pix_cnt: in integer range 0 to 1_310_721;
		data : in std_logic_vector(7 downto 0);
		data_o : out std_logic_vector(15 downto 0);
		add : out std_logic_vector(19 downto 0);
		reset_o,r_w_O,fin_signal : out std_logic
--		estado : out std_logic_vector(3 downto 0) debug
	);

end entity;

architecture rtl of Sram_CIC_2 is

	-- Build an enumerated type for the state machine
	type state_type is (idle, B_menossig, B_massig, escritura, final);

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
	process (clk_int, reset, trigger)
		variable datos_leidos : std_logic:='0';
	begin
		if reset = '0' or trigger='1' then
			state <= idle;
			datos_leidos:='0';
			add_count<=0;
		elsif (rising_edge(clk_int)) then
			case state is
				when idle=>
					if pix_cnt<1_310_719 then
						if leer='1' then
							state<=B_massig;
							add_count<=add_count+1;
						else 
							state<=idle;
						end if;
					else
						state<=final;
					end if;
				when B_massig=>
					if pix_cnt<1_310_719 then
						if datos_leidos='1' then
							state<=B_massig;
							datos_leidos:='0';
						elsif datos_leidos='0' and (pix_cnt mod 2)=0 then -- si no leimos los datos y el numero de pixeles es par leemos el dato
							datos_leidos:='1';
							data_reg(15 downto 8)<=data;
						else 
							state<=B_massig; --volvemos al estado mas_sig a esperar que cambie la señal de datos leidos o que sea par
						end if;
					else 
						state<=final;
					end if;
				when B_menossig=>
					if pix_cnt<1_310_719 then
						if datos_leidos='1' then
							state<=escritura;
							datos_leidos:='0';
						elsif datos_leidos='0' and (pix_cnt mod 2)=1 then -- si no leimos los datos y el numero de pixeles es impar leemos el dato
							datos_leidos:='1';
							data_reg(7 downto 0)<=data;
						else
							state<=B_menossig; --volvemos al estado menos_sig 
						end if;
					else 
						state<=final;
					end if;
				when escritura => -- escribo a la memoria
						state<=idle;
				when final =>
					if start='0' then
						state<=idle;
					else
						state<=final;
					end if;
				when others=>
				 state <= idle;
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
				r_w_O <='1';
				fin_signal<='0';
--				estado<="0000";
			when B_menossig =>
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=x"0000";
				reset_o<='0';
				r_w_O <='1';
				fin_signal<='0';
--				estado<="0001";
			when B_massig=>
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=x"0000";
				reset_o<='0';
				r_w_O <='1';
				fin_signal<='0';
--				estado<="0010";
			when escritura => 
				add <=std_logic_vector(to_unsigned(add_count,20));
				data_o <=data_reg;
				reset_o<='1';
				r_w_O <='1';
				fin_signal<='0';
--				estado<="0011";
			when final => 
				add <="ZZZZZZZZZZZZZZZZZZZZ";
				data_o <=x"0000";
				reset_o<='Z';
				r_w_O <='Z';
				fin_signal<='1';
--				estado<="0100";
		end case;
	end process;

end rtl;
