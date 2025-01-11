library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity access_UART is
  port (
    selector : in std_logic;
    tx_en_1   : in std_logic;
	 data_1   : in std_logic_vector(7 downto 0);
	 tx_en_2	 : in std_logic;
    data_2   : in std_logic_vector(7 downto 0);
    --salidas
    tx_en_o : out std_logic;
	 data_o : out std_logic_vector(7 downto 0)
  );
end entity access_UART;

architecture rtl of access_UART is

begin
  process (all)
  begin
    if selector = '1' then
		tx_en_o <= tx_en_2;
		data_o <= data_2;
    else
      tx_en_o <= tx_en_1;
		data_o <= data_1;
    end if;
  end process;
end architecture;