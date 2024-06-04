-- Quartus Prime VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
use ieee.std_logic_1164.all;

entity control_2 is

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

architecture rtl of control_2 is

	-- Build an enumerated type for the state machine
	type state_type is (s0, s1, s2, s3,done_state);

	-- Register to hold the current state
	signal state   : state_type;
	signal clk_int : std_logic;
	signal busy_prev: std_logic;
	signal busy_cnt : integer;
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
	process (all)
		
	begin
		busy_prev <= buisy;                       --capture the value of the previous i2c busy signal
		IF(busy_prev = '0' AND buisy = '1') THEN  --i2c busy just went high
			busy_cnt <= busy_cnt + 1;                    --counts the times busy has gone from low to high during transaction
		END IF;
	end process;

	-- Output depends solely on the current state
	process (all)
	begin
		case busy_cnt is
			when 0 =>
				enable <= '1';
				rw <= '0';
				rst <='1';
				addr	<= x"07";
				data_wr0 <=x"02" ;
				data_wr1 <= x"00";
				done<='0';
			when 1 =>
				enable <= '1';
				rw <= '0';
				rst <='1';
				addr	<= x"1E";
				data_wr0 <=x"00" ;
				data_wr1 <= x"81";
				done<='0';
			when 2 =>
				enable <= '1';
				rw <= '0';
				rst <='1';
				addr	<= x"1E";
				data_wr0 <=x"00" ;
				data_wr1 <= x"81";
				done<='1';
			when others =>
		end case;
	end process;

end rtl;
