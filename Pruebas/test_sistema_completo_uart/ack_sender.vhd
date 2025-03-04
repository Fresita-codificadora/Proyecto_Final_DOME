library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ack_sender is
    Port (
        clk          : in  std_logic;      -- Reloj del sistema
        reset        : in  std_logic;      -- Señal de reset
        trigger      : in  std_logic;      -- Señal de activación para enviar un número
        uart_busy    : in  std_logic;      -- Señal ocupada del UART
        tx_enable    : out std_logic;      -- Señal de habilitación de transmisión UART
        uart_byte    : out std_logic_vector(7 downto 0) -- Dato a enviar por UART
    );
end ack_sender;

architecture Behavioral of ack_sender is
    -- Estados de la máquina de estados
    type state_type is (IDLE, SEND, WAIT_BUSY);
    signal state      : state_type := IDLE;

    -- Contador para mantener activa la señal tx_enable
    signal tx_counter : integer := 0;

    -- Número a enviar (puedes cambiar este valor por el número que desees enviar)
    constant number_to_send : std_logic_vector(7 downto 0) := "00110101"; -- Ejemplo: 53 en decimal
begin
    process(clk, reset)
    begin
        if reset = '0' then
            -- Resetear todo
            state       <= IDLE;
            tx_enable   <= '0';
            uart_byte   <= (others => '0');
            tx_counter  <= 0;
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    tx_enable <= '0';  -- Desactivar tx_enable
                    if trigger = '1' and uart_busy = '0' then
                        -- Si se activa el trigger y el UART no está ocupado
                        uart_byte <= number_to_send;
                        tx_enable <= '1';
                        tx_counter <= 0;  -- Aseguramos que el contador comienza en 0
                        state <= SEND;
                    end if;

                when SEND =>
                    -- Mantener tx_enable activo durante un par de ciclos
                    if tx_counter < 1 then
                        tx_counter <= tx_counter + 1;
                    else
                        tx_enable <= '0';  -- Desactivar tx_enable después del tiempo definido
                        tx_counter <= 0;   -- Reiniciar el contador
                        state <= WAIT_BUSY;
                    end if;

                when WAIT_BUSY =>
                    -- Esperar a que el UART indique que está listo para el siguiente dato
                    if uart_busy = '0' then
                        state <= IDLE;
                    end if;

                when others =>
                    state <= IDLE;
            end case;
        end if;
    end process;
end Behavioral;
