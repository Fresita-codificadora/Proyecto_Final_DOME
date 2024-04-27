library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity serialout is
port (
		carga : in std_logic;
		enable_out : in std_logic;
		data_in : in std_logic_vector (7 downto 0);
		data_out : out std_logic;
		clk : in std_logic
);
end serialout;

architecture arch of serialout is 
signal data : std_logic_vector (7 downto 0); --senal auxiliar que va a cargar los datos realmente
begin	
	process(clk)
	variable cnt : integer range 0 to 7 := 0;  --variable auxiliar que lo que hace es contar los 8 bits de salida
	begin
	if (enable_out='1') then                   -- condicion de habilitado/deshablitado para poner en alta impedancia la salida
		if (clk'event and clk='1') then
			if (cnt<=7) then
				data_out<=data(cnt);              -- salida serie de los datos
				cnt:=cnt+1;
			else
				cnt:=0;                           -- reiniciamos el contador
			end if;
		end if;
		else 
			data_out<= 'Z';                     -- alta impedancia si esta deshablitado
	end if;
	if (carga = '1') then 
			data<=data_in;                      -- esto carga asincronica de los datos
			data_out<= 'Z';
	end if;
end process;
end arch;