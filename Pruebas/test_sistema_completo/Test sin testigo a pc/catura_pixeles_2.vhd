library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity captura_pixeles_2 is
	port (
			--entradas
			--clk_interno		: in std_logic;
			--reset				: in std_logic;
			trigger			: in std_logic;
			pix_clk			: in std_logic;
			pix_data_i		: in std_logic_vector(7 downto 0);
			line_valid		: in std_logic;
			frame_valid		: in std_logic;
            ack             : in std_logic;
			--salidas
			pix_data_o		: out std_logic_vector(7 downto 0);
			pix_valid       : out std_logic;
            error           : out std_logic
	);
end entity;

architecture arch of captura_pixeles_2 is
	signal register_0 : std_logic_vector(7 downto 0):=(others=>'0');
	signal leer,pix_valid_int : std_logic;
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
		if trigger = '1' then
			register_0<=(others=>'0');
            error <= '0';
            pix_valid_int <= '0';
        elsif ack = '1' then
            pix_valid_int <= '0';
		 elsif falling_edge(pix_clk) and pix_valid_int = '0' then
			if leer = '1' then --en el caso de que se haya leido el dato y este dispuesto a recibir otro
			   register_0<=pix_data_i;
               pix_valid_int <= '1';
               error <= '0';
			end if;
		 elsif falling_edge(pix_clk) and pix_valid_int = '1' then --en el caso de que no se haya leido el dato entonces hay que esperar
             error <= '1'; 
		end if;
	end process;
	
    pix_valid <= pix_valid_int;
	pix_data_o <= register_0;
	
end architecture;
