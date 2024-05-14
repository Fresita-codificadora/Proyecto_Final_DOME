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
--		clk   : in std_LOGIC;
		-- Inout ports
		sda_o : out std_LOGIC;
		sda_o_2:out std_LOGIC;
		sda	: in std_LOGIC
	);
end entity;

architecture arch of camara is

	-- Declarations (optional)
	signal count : integer range 0 to 9;
begin



process(all)
	begin
		if falling_edge(sda) then -- condicion de start
			count <= 0;                    -- en condicion de start reiniciamos la cuenta
			sda_o <= 'Z'; 
		elsif ( falling_edge(sda)) then -- condicion de stop
			count <= 0;
			sda_o <= 'Z';
		end if; 
	end process
process (all)
	begin
		if (rising_edge(sca)) then -- flanco ascendente de sca
			count <= count + 1;				-- tiene que contar 9 pulsos 
			sda_o_2 <= 'Z';
		elsif (count = 9 and rising_edge(sca)) then
			sda_o_2 <= '0';						-- mandamos un ack desp de los 9 pulsos 
			count <= 0;						-- reiniciamos la cuenta
		end if;
	end process;
end arch;

