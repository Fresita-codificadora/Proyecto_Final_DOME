library ieee;
	use ieee.std_logic_1164.all;
-- la ecuacion para saber la frecuencia de salida es f_out=f_fin /(2*(cuenta+1))	
entity divisor is
	port (
			clk_in : in std_logic;
			clk_out:out std_logic
	   );
end entity;

architecture arch of divisor is
	signal enable: std_logic;
	signal clk_int:std_logic;
begin
	process(clk_in)
		variable cuenta : integer range 0 to 11:=0;
	begin
		if rising_edge(clk_in) then
			if cuenta=11 then 
				cuenta:=0;
				enable<='1';
			else
				cuenta:=cuenta+1;
				enable<='0';
			end if;
		if enable = '1' then
			clk_int<=not clk_int;
		end if;
		end if;
	end process;
	clk_out<=clk_int;
end architecture;