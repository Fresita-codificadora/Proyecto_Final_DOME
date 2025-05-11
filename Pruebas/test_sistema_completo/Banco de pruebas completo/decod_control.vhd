library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decod_control is

  port (
    clk   : in std_logic; --clk de entrada, pensado en 50 MHz
    reset : in std_logic; -- reset asincronico
    -- entradas			
    rx_dv_i : in std_logic;
    rx_byte : in std_logic_vector(7 downto 0);
    -- salidas
    cntrl_reset : out std_logic;
    cntrl_envio : out std_logic
  );

end entity;

architecture arch of decod_control is
  signal cntrl_envio_int, cntrl_reset_int : std_logic := '0';
begin

  recepcion_byte : process (clk, reset)
  begin
    if reset = '1' then -- Reset asíncrono
      cntrl_envio_int <= '0';
      cntrl_reset_int <= '0';
    elsif rising_edge(clk) then -- Sincronización con el reloj
      if rx_dv_i = '1' then
        if rx_byte = "00000001" then -- Señal de reset recibida
          cntrl_reset_int <= '1'; -- Flag para reset
        elsif rx_byte = "11111111" then -- Señal de envío recibido
          cntrl_envio_int <= '1';
        end if;
      else
        cntrl_envio_int <= '0';
        cntrl_reset_int <= '0';
      end if;
    end if;

  end process;
  mantenimiento : process (clk, reset)
    variable cuenta_reset : integer range 0 to 3           := 0;
    variable cuenta_envio : integer range 0 to 2 ** 27 - 1 := 0; 	-- son 27 bits por que tiene que contar aprox 125017000 ciclos de reloj en el peor caso equivalente a
																						-- 2.50034 segundos en el peor caso
	variable cntrl_reset_int_2, cntrl_envio_int_2 : std_logic:='0';
  begin
    if reset = '1' then
      cuenta_envio := 0;
		cntrl_envio_int_2 := '0';
      cntrl_envio <= '0';
      cuenta_reset := 0;
		cntrl_reset_int_2 := '0';
      cntrl_reset <= '0';
    elsif rising_edge(clk) then
      -- Control de señales de reset y envío
      if cntrl_reset_int = '1' then
        cntrl_reset_int_2 := '1';
      elsif cntrl_envio_int = '1' then
        cntrl_envio_int_2 := '1';
      end if;

      -- Lógica para cuenta_reset
      if cuenta_reset < 2 and cntrl_reset_int_2 = '1' then
        cuenta_reset := cuenta_reset + 1;
      else
        cuenta_reset := 0;
        cntrl_reset_int_2 := '0';
      end if;

      -- Lógica para cuenta_envio
      if cuenta_envio < 125017000 and cntrl_envio_int_2 = '1' then
        cuenta_envio := cuenta_envio + 1;
      else
        cuenta_envio := 0;
        cntrl_envio_int_2 := '0';
      end if;
    end if;
	 cntrl_envio <= cntrl_envio_int_2;
	 cntrl_reset <= cntrl_reset_int_2;
  end process;
end arch;