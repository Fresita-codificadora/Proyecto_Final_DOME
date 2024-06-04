-- Quartus Prime VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
use ieee.std_logic_1164.all;

entity control is

	port(
		clk	 : in	std_logic;
		st,buisy	 : in	std_logic;
		reset	 : in	std_logic;
		enable,rw,rst,done: out std_logic;
		addr	 : out	std_logic_vector(7 downto 0);
		data_wr0   : out     STD_LOGIC_VECTOR(7 DOWNTO 0); --data to write to slave LSB
		data_wr1   : out     STD_LOGIC_VECTOR(7 DOWNTO 0) --data to write to slave MSB
	);

end entity;

architecture rtl of control is

	-- Build an enumerated type for the state machine
	type state_type is (s0, s1, s2, s3,done_state);

	-- Register to hold the current state
	signal state   : state_type;
	signal clk_int : std_logic;

begin
	process (all)
		variable cuenta_int : integer range 0 to 3;
	begin
		if rising_edge(clk) then
			cuenta_int:=cuenta_int+1;
			if cuenta_int=3 then
				clk_int<=not clk_int;
			end if;
		end if;
		end process;

	-- Logic to advance to the next state
	process (clk_int, reset,st,buisy)
	begin
		if reset = '0' then
			state <= s0;
		elsif (rising_edge(clk_int)) then
			case state is
				when s0=> --idle
					if st = '0' then
						state <= s1;
					else
						state <= s0;
					end if;
				when s1=>
					if buisy = '0' then -- mandar x07 addr y x00 y x02
						state <= s2;
					else
						state <= s1;
					end if;
				when s2=> -- estado intermedio
					if buisy = '0' then 
						state <= s3;
					else
						state <= s2;
					end if;
				when s3 =>  -- mandar x1E addr y x81 y x00 
					if buisy = '0' then 
						state<=done_state;
					else
						state <= s3;
					end if;
				when done_state =>
					state<=done_state;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when s0 =>
				enable <= '0';
				rw <= '0';
				rst <='1';
				addr	<= x"07";
				data_wr0 <=x"02" ;
				data_wr1 <= x"00";
				done<='0';
			when s1 =>
				enable <= '1';
				rw <= '0';
				rst <='1';
				addr	<= x"07";
				data_wr0 <=x"02" ;
				data_wr1 <= x"00";
				done<='0';
			when s2 =>
				enable <= '0';
				rw <= '0';
				rst <='1';
				addr	<= x"1E";
				data_wr0 <=x"00" ;
				data_wr1 <= x"81";
				done<='0';
			when s3 =>
				enable <= '1';
				rw <= '0';
				rst <='1';
				addr	<= x"1E";
				data_wr0 <=x"00" ;
				data_wr1 <= x"81";
				done<='0';
			when done_state=>
				enable <= '0';
				rw <= '0';
				rst <='0';
				addr	<= x"1E";
				data_wr0 <=x"00" ;
				data_wr1 <= x"81";
				done<='1';
		end case;
	end process;

end rtl;
