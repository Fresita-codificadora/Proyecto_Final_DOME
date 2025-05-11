library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity captura_pixeles is
	port (
			--entradas
			clk_interno		: in std_logic;
			reset				: in std_logic;
			trigger			: in std_logic;
			pix_clk			: in std_logic;
			pix_data_i		: in std_logic_vector(7 downto 0);
			line_valid		: in std_logic;
			frame_valid		: in std_logic;
			--salidas
			pix_data_o		: out std_logic_vector(7 downto 0);
			pix_count		: out integer range 0 to 2**21-1
	);
end entity;

architecture arch of captura_pixeles is
	signal register_0, register_1, register_out : std_logic_vector(7 downto 0):=(others=>'0');
	signal pix_count_interno_0,pix_count_interno_1,pix_count_interno_out : integer range 0 to 2**21-1;
	signal leer : std_logic;
	signal reg_max : integer range 0 to 2**21-1:=0;
	signal contador : integer range 0 to 255;						--debug
begin
	
	line_frame : process(all)
	begin 
		if frame_valid='1' and line_valid='1' then
			leer <= '1';
		else 
			leer <= '0';
		end if;
	end process;
	clk_lento:process(all)
	begin
		if reset='0' or trigger = '1' then
			pix_count_interno_0 <= 0;
			register_0<=(others=>'0');
		elsif falling_edge(pix_clk) then
			if leer = '1' then
--				contador<= contador+1;
--				if contador = 255 then
--					contador <=0;
--				end if;
--				register_0 <= std_logic_vector(to_unsigned(contador,8));
				register_0<=pix_data_i;
				pix_count_interno_0<=pix_count_interno_0+1;
			end if;
		end if;
	end process;
	
	clk_rapido: process(all)
	begin
		if	reset = '0' or trigger = '1' then
			pix_count_interno_1 <= 0;
			pix_count_interno_out <= 0;
			register_1<=(others=>'0');
			register_out<=(others=>'0');
		elsif rising_edge(clk_interno) then
			register_1 <= register_0;
			register_out <= register_1;
			pix_count_interno_1 <= pix_count_interno_0;
			pix_count_interno_out <= pix_count_interno_1;
		end if;
	end process;
	
--	maximo : process(all)					--debug
--	begin
--		if reset = '0' or trigger = '1' then
--			reg_max<=0;
--		elsif rising_edge(clk_interno) then
--			if pix_count_interno_out>reg_max then
--				reg_max<=pix_count_interno_out;
--			end if;
--		end if;
--	end process;
	pix_data_o <= register_out;
	pix_count <= pix_count_interno_out;
	--pix_count <= reg_max;								--debug
end architecture;
