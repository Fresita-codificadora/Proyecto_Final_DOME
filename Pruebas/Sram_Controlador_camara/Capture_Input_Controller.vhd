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
        line_valid,frame_valid,pclk,reset,enable,trigger: in std_logic;
		  leer : out std_logic;
		  D_in : in std_logic_vector (7 downto 0);
		  pix_count : out integer range 0 to 1_310_721;
		  D_out : out std_logic_vector (7 downto 0)
    );
end Capture_Input_Controller;

architecture arch of Capture_Input_Controller is
signal d_buff:std_logic_vector(7 downto 0);
signal pix_count_int:integer range 0 to 1_310_721:=0;
begin
	process(all)
	begin
		if frame_valid='1' and line_valid='1' and enable='1' then
			Leer <= '1';
		else 
			leer <='0';
		end if;
	end process;
	
	process(all)
	begin	
		if reset = '0' or trigger='1' then --or pix_count_int=1_310_721
			pix_count_int<=0;
		elsif falling_edge(pclk) and enable='1' then
			if Leer = '1' then
				d_buff <= D_in;
				pix_count_int<=pix_count_int+1;
			end if;
		end if;
	end process;
	D_out<=d_buff;
	pix_count<=pix_count_int;
end architecture;

