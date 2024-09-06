library ieee;
	use ieee.std_logic_1164.all;
	
entity buffer_intermed is
	port (
			clk_in 		: in std_logic;
			data_i 		: in std_logic_vector(7 downto 0);
			pix_cnt_i	: in integer range 0 to 2**21-1;
			leer_i		: in std_logic;
			
			data_o		: out std_logic_vector(7 downto 0);
			pix_cnt_o 	: out integer range 0 to 2**21-1;
			leer_o 		: out std_logic
	   );
end entity;

architecture arch of buffer_intermed is
begin
	process(clk_in)
	begin
		if rising_edge(clk_in) then
			data_o 		<=		data_i;
			pix_cnt_o	<=	pix_cnt_i;
			leer_o		<= leer_i;
		end if;
	end process;
end architecture;