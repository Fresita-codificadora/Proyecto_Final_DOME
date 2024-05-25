-- ARCHIVO: indice.vhd
-- DESCRIPCION: modulo encargado de agregar un indice para luego reconstruir en la PC

-- PUERTOS:
--    clk: clock de entrada a 12 MHz
--    frame_valid: entrada, señal de frame_valid del sensor
--    line_valid: entrada, señal de line_valid del sensor
--    pclk: entrada, señal de pclk del sensor
--    D_in : entrada de los datos en paralelo
--    D_out : salida de los datos paralelos con un buffer de por medio


library ieee;
use ieee.std_logic_1164.all;

entity Capture_Input_Controller is
    port(
        clk: in std_logic;  
        line_valid,frame_valid,pclk: in std_logic;
		  D_in : in std_logic_vector (7 downto 0);
		  D_out : out std_logic_vector (7 downto 0)
    );
end Capture_Input_Controller;

architecture arch of Capture_Input_Controller is
signal d_buff:std_logic_vector(7 downto 0);
signal Leer: std_logic := '0';
  
begin
	process(all)
	begin
			if falling_edge(pclk) then
				if frame_valid='1' and line_valid='1' then
					Leer <= '1';
				else 
					leer <='0';
				end if;
			end if;
	end process;
	process(all)
	begin	
		if rising_edge(clk) then
			if Leer = '1' then
				d_buff <= D_in;
			else 
				d_buff <= d_buff;
			end if;
		end if;
	end process;
	D_out<=d_buff;
end architecture;

