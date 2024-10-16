-- ARCHIVO: Capture_Input_Controller.vhd
-- DESCRIPCION: modulo encargada de generar las señales para la lectura de datos en los flancos descendientes 
--             de la señal pclk proveniente del sensor

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
        line_valid,frame_valid,pclk: in std_logic;
		  leer : out std_logic;
		  D_in : in std_logic_vector (7 downto 0);
		  D_out : out std_logic_vector (7 downto 0)
    );
end Capture_Input_Controller;

architecture arch of Capture_Input_Controller is
signal d_buff:std_logic_vector(7 downto 0);
begin
	process(all)
	begin
		if frame_valid='1' and line_valid='1' then
			Leer <= '1';
		else 
			leer <='0';
		end if;
	end process;
	
	process(all)
	begin	
		if falling_edge(pclk) then
			if Leer = '1' then
				d_buff <= D_in;
			end if;
		end if;
	end process;
	D_out<=d_buff;
end architecture;

