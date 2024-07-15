library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity memory_erraser is
	port(
		clk : in std_logic;
		fin : out std_logic:='0';
		addr : out std_logic_vector(19 downto 0)
	);
end entity;

architecture arch of memory_erraser is 
	signal count : integer range 0 to (2**20 -1);
begin
	process(clk)
	begin
		if rising_edge(clk) then
			count<=count+1;
			if count=(2**20-1) then
				fin<='1';
			end if;
		end if;
	end process;
	addr<=std_logic_vector(to_unsigned(count,20));
end architecture;