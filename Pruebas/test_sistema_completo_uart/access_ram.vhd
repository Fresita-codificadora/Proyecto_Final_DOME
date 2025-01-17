library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity access_ram is
  generic (
    addr_width : integer := 10;
    data_width : integer := 16
  );
  port (
    selector : in std_logic;
    data_1   : in std_logic_vector(data_width - 1 downto 0);
	 addr_1   : in std_logic_vector(addr_width - 1 downto 0);
	 r_w_1	 : in std_logic;
    addr_2   : in std_logic_vector(addr_width - 1 downto 0);
	 r_w_2	 : in std_logic;
    --salidas
    data_o : out std_logic_vector(data_width - 1 downto 0);
	 addr_o : out std_logic_vector(addr_width - 1 downto 0);
	 r_w_o  : out std_logic
  );
end entity access_ram;

architecture rtl of access_ram is

begin
  process (all)
  begin
    if selector = '1' then
      addr_o <= addr_2;
      data_o <= (others => '0');
		r_w_o  <= r_w_2;
    else
      addr_o <= addr_1;
      data_o <= data_1;
		r_w_o  <= r_w_1;
    end if;
  end process;
end architecture;