library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
entity testigo_error is
  port (
	clk			 : in std_logic;
	error_signal : in std_logic;
	reset		 : in std_logic;
	error_led    : out std_logic
  ) ;
end testigo_error;

architecture arch of testigo_error is


begin
	process(all)
	begin
		if reset = '0' then
			error_led <= '0';
		elsif rising_edge(clk) then
			if error_signal = '1' then
				error_led <= '1' ;
			end if;
		end if;
	end process;
end arch ; -- arch