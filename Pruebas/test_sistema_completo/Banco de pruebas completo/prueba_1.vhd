library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity prueba_1 is
	port(
			clk_50 			: in std_logic;
			trigger_i 		: in std_logic;
			--salidas
			trigger_o		: out std_logic;
			trigger_camara	: out std_logic
	);
end entity;

architecture arch of prueba_1 is
	signal trigger_prev : std_logic := '1';
	signal inicio : std_logic;
	signal contador : integer range 0 to 20;
begin
	process(all)
	begin
		if rising_edge(clk_50) then
			if trigger_i /= trigger_prev then
				trigger_prev <= trigger_i;
				if trigger_i = '0' then
					inicio <= '1';
				end if;
--			elsif inicio= '1' then
--				inicio := '0';
			end if;
			
			if inicio ='1' then
				contador <= contador + 1;
				trigger_camara <= '1';
				trigger_o <= '1';
				if contador > 0 then 
					trigger_o <= '0';
				end if;
				if contador = 20 then
					contador <= 0;
					trigger_camara <= '0';
					inicio <= '0';
				end if;
			end if;
		end if;
	end process;
	
end architecture;