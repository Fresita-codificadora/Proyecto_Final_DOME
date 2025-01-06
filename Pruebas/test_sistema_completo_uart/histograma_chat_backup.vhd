library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity histograma_chat is
    generic (
        BIN_WIDTH : integer := 256 -- Ancho de cada bin
    );
    port (
        clk               : in  std_logic;
        rst               : in  std_logic;
        enable            : in  std_logic;
        escritura_externa : in  std_logic; -- Señal externa para iniciar la escritura
        energia_in        : in  std_logic_vector(13 downto 0); -- 14 bits por dirección
        cantidad_in       : in  std_logic_vector(5 downto 0);  -- 6 bits por dirección
        dir_inicio        : in  std_logic_vector(9 downto 0);  -- 10 bits para histograma
        direccion_mem     : out std_logic_vector(10 downto 0); -- 11 bits para memoria de entrada
        data_histograma   : out std_logic_vector(13 downto 0); -- 14 bits acumulados
		  direccion_hist    : out std_logic_vector(9 downto 0);  -- 10 bits para histograma
        escritura_signal  : out std_logic;
        fin_procesado     : out std_logic
    );
end entity;

architecture Behavioral of histograma_chat is
    type hist_array is array (0 to 31) of integer range 0 to 2**14-1; -- Histograma de 14 bits por bin
    signal histogram : hist_array := (others => 0);

    signal dir_mem      : integer range 0 to 2047 := 0; -- Dirección de memoria de entrada (11 bits)
    signal dir_hist     : integer range 0 to 1023 := 0; -- Dirección de histograma (10 bits)
    signal cuenta       : integer range 0 to 3 := 0;
    signal reg_energia  : integer range 0 to 2**14-1 := 0; -- 14 bits
    signal reg_cantidad : integer range 0 to 2**6-1 := 0;  -- 6 bits
    signal bin_index    : integer range 0 to 31 := 0;

    type state_type is (idle, procesar, espera_habilitacion, escritura_1, escritura_2, fin);
    signal state : state_type := idle;

begin

    process (clk, rst)
    begin
        if rst = '1' then
            state <= idle;
            dir_mem <= 0;
            dir_hist <= 0;
            histogram <= (others => 0);
            escritura_signal <= '0';
            fin_procesado <= '0';
        elsif rising_edge(clk) then
            case state is

                when idle =>
                    if enable = '1' then
                        state <= procesar;
                        dir_mem <= 0;
                        fin_procesado <= '0';
                    end if;

                when procesar =>
                    direccion_mem <= std_logic_vector(to_unsigned(dir_mem, direccion_mem'length));
                    cuenta <= cuenta + 1;

                    if cuenta = 3 then
                        reg_energia <= to_integer(unsigned(energia_in)); -- Lectura de energía
                        reg_cantidad <= to_integer(unsigned(cantidad_in)); -- Lectura de cantidad
                        cuenta <= 0;

                        if reg_energia /= 0 and reg_cantidad > 0 then
                            bin_index <= reg_energia / BIN_WIDTH;

                            if bin_index >= 0 and bin_index < 32 then
                                histogram(bin_index) <= histogram(bin_index) + 1;
									 else
										  histogram(0) <= histogram(0)+1;
                            end if;
                        end if;

                        dir_mem <= dir_mem + 1;
                        if dir_mem = 2047 then
                            state <= espera_habilitacion; -- Procesado completo, espera nueva habilitación
                            dir_mem <= 0;
                            fin_procesado <= '1';
                        end if;
                    end if;

                when espera_habilitacion =>
                    fin_procesado <= '1';
                    if escritura_externa = '1' then
                        state <= escritura_1;
                        dir_hist <= 0;
                    elsif enable = '1' then
                        state <= procesar;
                    end if;

                when escritura_1 =>
                    escritura_signal <= '1';
                    direccion_hist <= std_logic_vector(to_unsigned(dir_hist + to_integer(unsigned(dir_inicio)), direccion_hist'length));
                    data_histograma <= std_logic_vector(to_unsigned(histogram(dir_hist), data_histograma'length));
                    state <= escritura_2;

                when escritura_2 =>
                    escritura_signal <= '1';
                    dir_hist <= dir_hist + 1;

                    if dir_hist = 31 then
                        state <= fin;
                    else
                        state <= escritura_1;
                    end if;

                when fin =>
                    histogram <= (others => 0); -- Limpia el histograma
                    fin_procesado <= '1';
                    if enable = '1' then
                        state <= procesar;
                        fin_procesado <= '0';
                    end if;

                when others =>
                    state <= idle;
            end case;
        end if;
    end process;

end architecture;
