library ieee;
	-- STD_LOGIC and STD_LOGIC_VECTOR types, and relevant functions
	use ieee.std_logic_1164.all;
	-- SIGNED and UNSIGNED types, and relevant functions
	use ieee.numeric_std.all;
	-- Basic sequential functions and concurrent procedures
	use ieee.VITAL_Primitives.all;

entity camara is
port
	(
		-- Input ports
		sca	: in  std_LOGIC;
		clk   : in std_LOGIC;
		-- Inout ports
		sda	: inout std_LOGIC
	);
end entity;

architecture arch of camara is

	-- Declarations (optional)
	signal count : integer range 0 to 9;
begin



process(all)
	begin
	if rising_edge(clk) then
		if (sca = '1'and falling_edge(sda) ) then -- condicion de start
			count <= 0;                    -- en condicion de start reiniciamos la cuenta
			sda <= 'Z';
		elsif (rising_edge(sca)) then -- flanco ascendente de sca
			count <= count + 1;				-- tiene que contar 9 pulsos 
			sda <= 'Z';
		elsif (count = 9 and rising_edge(sca)) then
			sda <= '0';						-- mandamos un ack desp de los 9 pulsos 
			count <= 0;						-- reiniciamos la cuenta
		elsif ( falling_edge(sda) and sda = '0') then -- condicion de stop
			count <= 0;
			sda <= 'Z';
		end if; 
	end if;
	end process;
end arch;

