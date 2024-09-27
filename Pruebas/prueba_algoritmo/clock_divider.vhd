library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_divider is
    port (
        clk_in   : in  std_logic;  -- Reloj de entrada (50 MHz)
        reset    : in  std_logic;  -- Señal de reset
        clk_out  : out std_logic   -- Reloj de salida (25 kHz)
    );
end entity;

architecture behavioral of clock_divider is
    signal counter      : unsigned(10 downto 0) := (others => '0');  -- Contador de 11 bits (capaz de contar hasta 2000)
    signal clk_out_reg  : std_logic := '0';  -- Registro para el reloj de salida
begin

    process (clk_in, reset)
    begin
        if reset = '0' then
            counter <= (others => '0');  -- Reiniciar contador
            clk_out_reg <= '0';          -- Reiniciar reloj de salida
        elsif rising_edge(clk_in) then
            if counter = 999 then       -- Cuenta hasta 1999 (2000 ciclos)
                counter <= (others => '0');  -- Reiniciar el contador
                clk_out_reg <= not clk_out_reg;  -- Invertir el reloj de salida
            else
                counter <= counter + 1;  -- Incrementar el contador
            end if;
        end if;
    end process;

    clk_out <= clk_out_reg;  -- Asignar la salida del reloj

end architecture;
