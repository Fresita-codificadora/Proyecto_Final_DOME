library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity i2c_fsm_2 is
    Port (
        clk : in std_logic;
        reset : in std_logic;
        start : in std_logic;
        stop : in std_logic;
        enable : in std_logic;
        address : in std_logic_vector(7 downto 0);
        data_MSB : in std_logic_vector(7 downto 0);
        data_LSB : in std_logic_vector(7 downto 0);
        SCA : inout std_logic;
        SDA : inout std_logic;
        busy : out std_logic;
        error : out std_logic
    );
end i2c_fsm_2;

architecture Behavioral of i2c_fsm_2 is
    type state_type is (IDLE, START_BIT, SEND_BA, SEND_ADDRESS, SEND_MSB, SEND_LSB, ACK_CHECK, STOP_BIT, ERROR_STATE);
    signal state, next_state : state_type;
    signal clk_enable : std_logic := '0';
    signal bit_count : integer := 0;
    signal current_data : std_logic_vector(7 downto 0);
    signal data_pointer : integer := 0;
    signal ack_received : std_logic := '0';
    signal address_int : std_logic_vector(7 downto 0);
    signal data_MSB_int : std_logic_vector(7 downto 0);
    signal data_LSB_int : std_logic_vector(7 downto 0);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            state <= IDLE;
        elsif rising_edge(clk) then
            if enable = '1' then
                state <= next_state;
            end if;
        end if;
    end process;

    process(state, start, stop, ack_received, bit_count, data_pointer, clk_enable, address_int, data_MSB_int, data_LSB_int, current_data, address, data_MSB, data_LSB)
    begin
        next_state <= state;
        case state is
            when IDLE =>
                busy <= '0';
                error <= '0';
                if start = '1' then
                    address_int <= address;
                    data_MSB_int <= data_MSB;
                    data_LSB_int <= data_LSB;
                    next_state <= START_BIT;
                end if;
            when START_BIT =>
                busy <= '1';
                SCA <= 'Z'; -- High impedance
                SDA <= '0';
                next_state <= SEND_BA;
            when SEND_BA =>
                SDA <= address_int(7);
                if clk_enable = '1' then
                    bit_count <= bit_count + 1;
                    if bit_count = 7 then
                        next_state <= SEND_ADDRESS;
                        bit_count <= 0;
                    end if;
                end if;
            when SEND_ADDRESS =>
                SDA <= address_int(7 - bit_count);
                if clk_enable = '1' then
                    bit_count <= bit_count + 1;
                    if bit_count = 7 then
                        next_state <= ACK_CHECK;
                        bit_count <= 0;
                    end if;
                end if;
            when ACK_CHECK =>
                SDA <= 'Z';
                if clk_enable = '1' then
                    if SCA = '0' then
                        ack_received <= '1';
                        case data_pointer is
                            when 0 =>
                                current_data <= data_MSB_int;
                                next_state <= SEND_MSB;
                            when 1 =>
                                current_data <= data_LSB_int;
                                next_state <= SEND_LSB;
                            when others =>
                                next_state <= ERROR_STATE;
                        end case;
                    else
                        next_state <= ERROR_STATE;
                    end if;
                end if;
            when SEND_MSB =>
                SDA <= current_data(7 - bit_count);
                if clk_enable = '1' then
                    bit_count <= bit_count + 1;
                    if bit_count = 7 then
                        next_state <= ACK_CHECK;
                        bit_count <= 0;
                        data_pointer <= 1;
                    end if;
                end if;
            when SEND_LSB =>
                SDA <= current_data(7 - bit_count);
                if clk_enable = '1' then
                    bit_count <= bit_count + 1;
                    if bit_count = 7 then
                        next_state <= ACK_CHECK;
                        bit_count <= 0;
                        data_pointer <= 2;
                    end if;
                end if;
            when STOP_BIT =>
                SDA <= '0';
                if stop = '1' then
                    next_state <= IDLE;
                end if;
            when ERROR_STATE =>
                busy <= '1';
                error <= '1';
                next_state <= IDLE;
            when others =>
                next_state <= ERROR_STATE;
        end case;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            if state = START_BIT or state = SEND_BA or state = SEND_ADDRESS or state = SEND_MSB or state = SEND_LSB or state = STOP_BIT then
                clk_enable <= '1';
            else
                clk_enable <= '0';
            end if;
        end if;
    end process;

end Behavioral;

