library ieee;
	use ieee.std_logic_1164.all;

entity mux_sram is
	port (
		selec : in integer range 0 to 3;
		data_0 : in std_logic_vector (15 downto 0);
		add_0 : in std_logic_vector(19 downto 0);
		reset_0,action_0 : in std_logic;
		data_1 : in std_logic_vector (15 downto 0);
		add_1 : in std_logic_vector(19 downto 0);
		reset_1,action_1 : in std_logic;	
		data_2 : in std_logic_vector (15 downto 0);
		add_2 : in std_logic_vector(19 downto 0);
		reset_2,action_2 : in std_logic;
		reset_o : out std_logic;
		data_o : out std_logic_vector (15 downto 0);
		add_o : out std_logic_vector(19 downto 0);
		action_o : out std_logic	
	);
end entity;

architecture arch of mux_sram is

begin
	process(all)
	begin
		if selec=0 then
			data_o<=data_0;
			add_o<=add_0;
			reset_o<=reset_0;
			action_o<=action_0;
		elsif selec=1 then
			data_o<=data_1;
			add_o<=add_1;
			reset_o<=reset_1;
			action_o<=action_1;
		elsif selec=2 then
			data_o<=data_2;
			add_o<=add_2;
			reset_o<=reset_2;
			action_o<=action_2;
		else
			data_o<=x"0000";
			add_o<=x"00000";
			reset_o<='0';
			action_o<='0';
		end if;
	end process;
end architecture;