library ieee;
	use ieee.std_logic_1164.all;
	use IEEE.NUMERIC_STD.ALL; 		--libreria para cambios entre formatos

entity maximo_2 is
port(
	reg1,reg2,reg3,reg4 : in std_logic_vector(10 downto 0);
	maximo_o : out std_logic_vector(10 downto 0)
);
end entity;
	
architecture arch of maximo_2 is
	
begin	
	process (all)
		variable valor_max1, valor_max2, valor_max_final,maximo : integer range 0 to 2047;
	begin
			-- Convertir los registros de std_logic_vector a integer
			valor_max1 := to_integer(unsigned(reg1));
	
			-- Comparar reg1 y reg2
			if valor_max1 < to_integer(unsigned(reg2)) then
				valor_max1 := to_integer(unsigned(reg2));
			end if;
	
			-- Comparar reg3 y reg4
			valor_max2 := to_integer(unsigned(reg3));
			if valor_max2 < to_integer(unsigned(reg4)) then
				valor_max2 := to_integer(unsigned(reg4));
			end if;
	
			-- Comparar los dos máximos anteriores
			if valor_max1 > valor_max2 then
				valor_max_final := valor_max1;
			else
				valor_max_final := valor_max2;
			end if;
	
			-- Asignar el valor máximo final a la salida
			maximo := valor_max_final;
			maximo_o <= std_logic_vector(to_unsigned(maximo,11));
	end process;
end architecture;