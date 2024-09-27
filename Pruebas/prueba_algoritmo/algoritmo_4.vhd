library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pixel_processor is
    generic (
        image_width  : integer := 128; -- Ancho de la imagen
        num_events   : integer := 256  -- Número máximo de eventos
    );
    port (
        clk           : in  std_logic;
        rst           : in  std_logic;
        pixel_in      : in  std_logic_vector(7 downto 0); -- Pixel de entrada
        pixel_count   : in  integer range 0 to pixeles - 1; -- Contador de píxeles (total de la imagen)
        umbral        : in  std_logic_vector(7 downto 0); -- Umbral
        data_out_ram  : in  std_logic_vector(7 downto 0); -- Datos leídos de la RAM
        address_ram   : out std_logic_vector(8 downto 0); -- Dirección de RAM (9 bits para ancho + 3)
        data_in_ram   : out std_logic_vector(7 downto 0); -- Datos a escribir en la RAM
        we_ram        : out std_logic  -- Señal de escritura en RAM
    );
end entity;

architecture Behavioral of pixel_processor is
    constant ram_size   : integer := image_width + 3; -- Tamaño de la RAM cíclica
    signal ram_index    : integer range 0 to ram_size - 1 := 0; -- Índice para la RAM cíclica
    signal next_event   : integer := 1;
    signal max_event    : integer := 0;
    signal current_pixel : std_logic_vector(7 downto 0) := (others => '0');
    
    -- Estados de control
    type state_type is (IDLE, READ_NEIGHBORS, ASSIGN_EVENT, WRITE_EVENT, WAIT_RAM);
    signal state         : state_type := IDLE;
    signal ram_delay     : integer := 0; -- Contador para el retardo de 2 ciclos de la RAM
    
    -- Calcular los vecinos (índices cíclicos para ancho +1, ancho +2, ancho +3)
    function calc_neighbor_index(index : integer; offset : integer) return integer is
    begin
        return (index + offset) mod ram_size; -- Uso de módulo para mantener el comportamiento cíclico
    end function;
    
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                state <= IDLE;
                address_ram <= (others => '0');
                we_ram <= '0';
                ram_delay <= 0;
                next_event <= 1;
                ram_index <= 0;
            else
                case state is
                    -- Estado de espera de un nuevo píxel
                    when IDLE =>
                        if pixel_count /= 0 then
                            -- Umbral del píxel actual
                            if unsigned(pixel_in) < unsigned(umbral) then
                                current_pixel <= (others => '0'); -- Se umbraliza a cero
                            else
                                current_pixel <= pixel_in;
                                
                                -- Iniciar la lectura de vecinos desde la RAM
                                address_ram <= std_logic_vector(to_unsigned(calc_neighbor_index(ram_index, 1), 9));
                                we_ram <= '0'; -- Leer de RAM
                                state <= WAIT_RAM;
                                ram_delay <= 0;
                            end if;
                        end if;

                    -- Esperamos los 2 ciclos de retardo para leer la RAM
                    when WAIT_RAM =>
                        if ram_delay < 2 then
                            ram_delay <= ram_delay + 1;
                        else
                            -- Leer el primer vecino (ancho + 1)
                            max_event <= to_integer(unsigned(data_out_ram));
                            -- Leer el segundo vecino (ancho + 2)
                            address_ram <= std_logic_vector(to_unsigned(calc_neighbor_index(ram_index, 2), 9));
                            ram_delay <= 0;
                            state <= READ_NEIGHBORS;
                        end if;

                    -- Leer los otros dos vecinos (ancho + 2 y ancho + 3)
                    when READ_NEIGHBORS =>
                        if ram_delay < 2 then
                            ram_delay <= ram_delay + 1;
                        else
                            -- Leer el tercer vecino (ancho + 3)
                            max_event := max(max_event, to_integer(unsigned(data_out_ram))); -- Comparar con el segundo vecino
                            address_ram <= std_logic_vector(to_unsigned(calc_neighbor_index(ram_index, 3), 9));
                            ram_delay <= 0;
                            state <= ASSIGN_EVENT;
                        end if;

                    -- Asignar el evento correspondiente
                    when ASSIGN_EVENT =>
                        if current_pixel /= "00000000" then
                            -- Si los vecinos son cero, asignar un nuevo evento
                            if max_event = 0 then
                                max_event := next_event;
                                next_event := next_event + 1;
                            end if;
                            
                            -- Escribir el valor de evento correspondiente en la RAM
                            data_in_ram <= std_logic_vector(to_unsigned(max_event, 8)); -- Escribir el evento
                            address_ram <= std_logic_vector(to_unsigned(ram_index, 9)); -- Escribir en la posición actual
                            we_ram <= '1'; -- Habilitar escritura
                            state <= WRITE_EVENT;
                        else
                            -- No hacer nada si el pixel está umbralizado a cero
                            state <= IDLE;
                        end if;
                    
                    -- Estado para realizar la escritura en la RAM
                    when WRITE_EVENT =>
                        we_ram <= '0'; -- Deshabilitar la escritura
                        -- Avanzar el índice cíclico para el siguiente píxel
                        if ram_index = ram_size - 1 then
                            ram_index <= 0; -- Reiniciar si llegamos al final
                        else
                            ram_index <= ram_index + 1;
                        end if;
                        state <= IDLE; -- Volver a esperar otro píxel
                end case;
            end if;
        end if;
    end process;
end architecture;
