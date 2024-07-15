library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity control_mux is
	port (
		fin_1,fin_2 : in std_logic;
		selec : out integer range 0 to 3
		);
end entity;

architecture arch of control_mux is 

begin
	process (fin_1,fin_2)
	begin
		if fin_1='1' then
			selec<=0;
		elsif fin_2='1' then
			selec<=1;
		else
			selec<=2;
		end if;
	end process;
end architecture;