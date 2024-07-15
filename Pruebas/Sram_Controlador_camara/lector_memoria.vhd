library ieee;
use ieee.std_logic_1164.all;

entity lector_memoria is

	port(
		enable : in	std_logic;
		dire_in : in std_logic_vector(17 downto 0);
		dire_out : out std_logic_vector(19 downto 0);
		reset_o,rw	 : out	std_logic 
	);

end entity;

architecture rtl of lector_memoria is

begin
	
	process(dire_in,enable)
	begin
		if enable='1' then
			reset_o<='1'; -- no reiniciamos la memoria
			rw<='0'; -- ponemos el modo lectura
			dire_out<="00" & dire_in;
		else -- todo en alta impedancia
			reset_o<='Z'; -- no reiniciamos la memoria
			rw<='Z'; -- ponemos el modo lectura
			dire_out<="ZZZZZZZZZZZZZZZZZZZZ";
		end if;
	end process;
end rtl;
