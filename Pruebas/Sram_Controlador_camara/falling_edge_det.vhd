library ieee;
	use ieee.std_logic_1164.all;
	
entity falling_edge_det is
	port( 
			clk,pix_clk : in std_logic;
			F_E : out std_logic
	);
end entity;

architecture arch of falling_edge_det is
begin
	process(clk,pix_clk)
	begin
		if falling_edge(pix_clk) then
			F_E<='1';
		end if;
	end process;
	process(clk)
	begin
		if rising_edge(clk) then
			F_E<='0';
		end if;
	end process;
end architecture;