library ieee;
use ieee.std_logic_1164.all;

entity blinky is
    port (
        clk : in std_logic;
        led : out std_logic
    );
end entity;

architecture rtl of blinky is
    signal counter : integer := 0;
    signal led_int : std_logic;
begin
    led <= led_int;
    process(clk)
    begin
        if rising_edge(clk) then
            counter <= counter + 1;
            if counter = 6000000 then
                led_int <= not led_int;
                counter <= 0;
            end if;
        end if;
    end process;
end rtl;