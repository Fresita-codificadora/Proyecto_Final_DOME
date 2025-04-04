-- este es el bloque encargado de el algortimo, toma los datos de "captura_pixeles" y los procesa uno a uno
-- categorizandolos, ademas requiere de las memorias ram encargadas de la linea de entrada, llamada FIFO por la tesis anterior
-- la memoria ram de cantidad, utilizada posteriormente en el filtrado y la memoria ram de energia que es la que realmente interesa
-- ademas tiene 3 controles
-- umbral  energia minima que se requiere para ser un pixel valido
-- pixeles cantidad total de pixeles del sensor/imagen 1280*1024=1_310_720
-- ancho	ancho de los pixeles activos en el exjemplo anterior 1280

-- este bloque fue probado con en proyecto de la carpeta prueba_algoritmo

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.all; --libreria para cambios entre formatos

entity algo_3_final is
  generic (
    umbral : integer := 0; --energia minima para ser un pixel valido
    pixels : integer := 7081; --cantidad total de pixeles activos de imagen / sensor
    ancho  : integer := 97 -- ancho de los pixeles activos
  );
  port (
    clk        : in std_logic;
    trigger    : in std_logic;
    pix_data   : in std_logic_vector(7 downto 0);
	  pix_count  : in std_logic_vector(20 downto 0);
    data_ram_i : in std_logic_vector(10 downto 0);
    data_ram_o : out std_logic_vector(10 downto 0); --correspondiente a la FIFO
    addr_ram   : out std_logic_vector(10 downto 0);
    we         : out std_logic;
    --otras memorias
    data_ram_energia_i  : in std_logic_vector (13 downto 0);
    data_ram_energia_o  : out std_logic_vector (13 downto 0);
    addr_ram_energia    : out std_logic_vector (10 downto 0);
    data_ram_cantidad_i : in std_logic_vector (5 downto 0);
    data_ram_cantidad_o : out std_logic_vector (5 downto 0);
    --
    fin_borrado: out std_logic; 
    fin_signal : out std_logic
  );

end entity;

architecture rtl of algo_3_final is

  -- Build an enumerated type for the state machine
  type state_type is (erase, escritura_erase_1, escritura_erase_2, nuevo_pix, dir_anterior, lectura_anterior, dir_ancho_1, lectura_ancho_1
    , dir_ancho_2, lectura_ancho_2, dir_ancho_3, lectura_ancho_3, casos, dir_cantidad_energia, lectura_cantidad_energia, escritura_1,
    escritura_2, incremento_indice, fin);

  -- Register to hold the current state
  signal state : state_type;

  signal data_a_escribir                                     : integer range 0 to 2047      := 0;
  signal dir_mem, dir_mem_1, dir_mem_2, dir_mem_3            : integer range 0 to 2047      := 1;
  signal pix_count_int, pix_count_anterior                   : integer range 0 to 1_310_720 := 0;
  signal reg_anterior, reg_ancho_1, reg_ancho_2, reg_ancho_3 : integer range 0 to 2047      := 0;
  signal ignorar_ancho_1                                     : boolean                      := false;
  signal ignorar_anterior                                    : boolean                      := false;
  signal indice                                              : integer range 0 to 2047      := 1;
  -- señales para las otras memorias
  signal pix_data_reg  : integer range 0 to 2047  := 0;
  signal dir_energia   : integer range -2 to 2047 := 1;
  signal cantidad_temp : integer range 0 to 63    := 0;--son 6 bits
  signal energia_temp  : integer range 0 to 16383 := 0;--son 14 bits

  procedure encontrar_maximo(
    signal reg1   : in integer;
    signal reg2   : in integer;
    signal reg3   : in integer;
    signal reg4   : in integer;
    signal maximo : out integer
  ) is
    variable valor_max1, valor_max2, valor_max_final : integer range 0 to 2047;
  begin
    -- Convertir los registros de std_logic_vector a integer
    valor_max1 := reg1;

    -- Comparar reg1 y reg2
    if valor_max1 < reg2 then
      valor_max1 := reg2;
    end if;

    -- Comparar reg3 y reg4
    valor_max2 := reg3;
    if valor_max2 < reg4 then
      valor_max2 := reg4;
    end if;

    -- Comparar los dos máximos anteriores
    if valor_max1 > valor_max2 then
      valor_max_final := valor_max1;
    else
      valor_max_final := valor_max2;
    end if;

    -- Asignar el valor máximo final a la salida
    maximo <= valor_max_final;
  end procedure encontrar_maximo;
begin

  pix_count_int <= to_integer(unsigned(pix_count));
  -- Logic to advance to the next state
  process (all)
    variable cuenta       : integer range 0 to 2047 := 0;
    variable cuenta_pixel : integer range 0 to 2047 := 0;
    variable eventos      : integer range 0 to 2047 := 1;
  begin
    if trigger = '1' then
      state <= erase;
      cuenta       := 0;
      cuenta_pixel := 0;
      pix_count_anterior <= 0;
      eventos := 1;
      indice           <= 0;
      ignorar_ancho_1  <= false;
      ignorar_anterior <= false;
      dir_mem          <= 0;
      dir_energia      <= 0;
    elsif (rising_edge(clk)) then
      case state is
        when erase =>
          if cuenta < 2047 then
            cuenta := cuenta + 1;
            state           <= escritura_erase_1; --voy a escribir ceros
            indice          <= indice + 1; --aumento la direccion a escribir
            data_a_escribir <= 0; -- la data a escribir es siempre cero cuando borramos
          else
            indice <= 1; -- reinicio el direccionamiento de memoria
            cuenta := 1;
            state <= nuevo_pix; -- voy a esperar un nuevo pixel
          end if;
        when escritura_erase_1 =>
          state <= escritura_erase_2;
        when escritura_erase_2 =>
          state <= erase;
        when nuevo_pix =>
          if pix_count_int < pixels then
            if pix_count_int /= pix_count_anterior then --me llego un nuevo pixel
              pix_count_anterior <= pix_count_int; --actualizo con que voy a comparar despues

              if to_integer(unsigned(pix_data)) > umbral then --verifico que supere al umbral
                state <= dir_ancho_2; --si supera voy a buscar los pixeles circuncidantes
              else
                data_a_escribir <= 0; --si no supera escribimos un cero en la "FIFO"
                state           <= escritura_1;
              end if;

              cuenta_pixel := cuenta_pixel + 1; --esta cuenta la voy a usar como la cantidad de pixeles que me llegan para activar unas flags
              if cuenta_pixel = ancho then
                ignorar_ancho_1 <= true; --estas son las flags que se usan
              elsif cuenta_pixel = (ancho + 1) then
                ignorar_anterior <= true; -- otra flag que se usa
                cuenta_pixel := 1;
              end if;
            else
              state <= nuevo_pix;
            end if;
          else
            state <= fin;
          end if;
        when dir_ancho_2 =>
          if indice + 2 > (ancho + 2) then
            dir_mem_2 <= indice - ancho;
          else
            dir_mem_2 <= indice + 2;
          end if;
          state <= lectura_ancho_2;
        when lectura_ancho_2 =>
          cuenta := cuenta + 1;
          if cuenta < 3 then
            state <= lectura_ancho_2;
          else
            cuenta := 1;
            state <= dir_ancho_1;
          end if;
        when dir_ancho_1 =>
          if indice + 3 > (ancho + 2) then
            dir_mem_1 <= indice - (ancho - 1);
          else
            dir_mem_1 <= indice + 3;
          end if;
          state <= lectura_ancho_1;
        when lectura_ancho_1 =>
          cuenta := cuenta + 1;
          if cuenta < 3 then
            state <= lectura_ancho_1;
          else
            cuenta := 1;
            state <= dir_ancho_3;
          end if;
        when dir_ancho_3 =>
          if indice + 1 > (ancho + 2) then
            dir_mem_3 <= indice - (ancho + 1);
          else
            dir_mem_3 <= indice + 1;
          end if;
          state <= lectura_ancho_3;
        when lectura_ancho_3 =>
          cuenta := cuenta + 1;
          if cuenta < 3 then
            state <= lectura_ancho_3;
          else
            cuenta := 1;
            state <= dir_anterior;
          end if;
        when dir_anterior =>
          if indice = 1 then
            dir_mem <= (ancho + 1);
          else
            dir_mem <= indice - 1;
          end if;
          state <= lectura_anterior;
        when lectura_anterior =>
          cuenta := cuenta + 1;
          if cuenta < 3 then
            state <= lectura_anterior;
          else
            cuenta := 1;
            state <= casos;
          end if;
        when casos =>
          if reg_anterior /= 0 or reg_ancho_1 /= 0 or reg_ancho_2 /= 0 or reg_ancho_3 /= 0 then --si alguno de los piexles circuncidantes no es cero
            encontrar_maximo(reg_ancho_1, reg_ancho_2, reg_ancho_3, reg_anterior, data_a_escribir); --buscamos el de indice maximo y se lo asignamos
          else
            data_a_escribir <= eventos;
            eventos := eventos + 1;
          end if;
          state <= dir_cantidad_energia;
        when dir_cantidad_energia =>
          dir_energia <= data_a_escribir; --data a escribir es el indice de las memorias ram de energia y cantidad que me interesa, tal vez un mal nombre
          state       <= lectura_cantidad_energia;
        when lectura_cantidad_energia =>
          cuenta := cuenta + 1;
          if cuenta < 3 then
            state <= lectura_cantidad_energia;
          else
            cuenta := 1;
            state <= escritura_1;
          end if;
        when escritura_1 =>
          state <= escritura_2;
        when escritura_2 =>
          state <= incremento_indice;
        when incremento_indice =>
          indice <= indice + 1; --este seria el equivalente a la direccion de memoria que quiero usar 
          if indice = (ancho + 2) then
            indice <= 1;
          end if;
          ignorar_ancho_1  <= false;
          ignorar_anterior <= false;
          state            <= nuevo_pix;
        when fin =>
          state <= fin;
      end case;
    end if;
  end process;

  -- Output depends solely on the current state
  process (all)
  begin
    case state is
      when erase =>
        data_ram_o          <= std_logic_vector(to_unsigned(data_a_escribir, 11));
        addr_ram            <= std_logic_vector(to_unsigned(indice, 11));
        we                  <= '1'; --escritura
        data_ram_energia_o  <= std_logic_vector(to_unsigned(data_a_escribir, 14));
        addr_ram_energia    <= std_logic_vector(to_unsigned(indice, 11));
        data_ram_cantidad_o <= std_logic_vector(to_unsigned(data_a_escribir, 6)); --data a escribir :=0;
        fin_signal          <= '0';
        fin_borrado         <= '0';
      when escritura_erase_1 =>
        data_ram_o          <= std_logic_vector(to_unsigned(data_a_escribir, 11));
        addr_ram            <= std_logic_vector(to_unsigned(indice, 11));
        we                  <= '1'; --escritura
        data_ram_energia_o  <= std_logic_vector(to_unsigned(data_a_escribir, 14));
        addr_ram_energia    <= std_logic_vector(to_unsigned(indice, 11));
        data_ram_cantidad_o <= std_logic_vector(to_unsigned(data_a_escribir, 6));
        fin_signal          <= '0';
        fin_borrado         <= '0';
      when escritura_erase_2 =>
        data_ram_o          <= std_logic_vector(to_unsigned(data_a_escribir, 11));
        addr_ram            <= std_logic_vector(to_unsigned(indice, 11));
        we                  <= '1'; --escritura
        data_ram_energia_o  <= std_logic_vector(to_unsigned(data_a_escribir, 14));
        addr_ram_energia    <= std_logic_vector(to_unsigned(indice, 11));
        data_ram_cantidad_o <= std_logic_vector(to_unsigned(data_a_escribir, 6));
        fin_signal          <= '0';
        fin_borrado         <= '0';
      when nuevo_pix                 =>
        data_ram_o          <= (others => '0');
        addr_ram            <= (others => '0');
        we                  <= '0'; --lectura
        data_ram_energia_o  <= (others => '0');
        addr_ram_energia    <= (others => '0');
        data_ram_cantidad_o <= (others => '0');
        fin_signal          <= '0';
        fin_borrado         <= '1';
      when dir_ancho_2               =>
        data_ram_o          <= (others => '0');
        addr_ram            <= std_logic_vector(to_unsigned(dir_mem_2, 11));
        we                  <= '0'; --lectura
        data_ram_energia_o  <= (others => '0');
        addr_ram_energia    <= (others => '0');
        data_ram_cantidad_o <= (others => '0');
        fin_signal          <= '0';
        fin_borrado         <= '0';
      when lectura_ancho_2           =>
        data_ram_o          <= (others => '0');
        addr_ram            <= std_logic_vector(to_unsigned(dir_mem_2, 11));
        we                  <= '0'; --lectura
        data_ram_energia_o  <= (others => '0');
        addr_ram_energia    <= (others => '0');
        data_ram_cantidad_o <= (others => '0');
        fin_signal          <= '0';
        fin_borrado         <= '0';
      when dir_ancho_1               =>
        data_ram_o          <= (others => '0');
        addr_ram            <= std_logic_vector(to_unsigned(dir_mem_1, 11));
        we                  <= '0'; --lectura
        data_ram_energia_o  <= (others => '0');
        addr_ram_energia    <= (others => '0');
        data_ram_cantidad_o <= (others => '0');
        fin_signal          <= '0';
        fin_borrado         <= '0';
      when lectura_ancho_1           =>
        data_ram_o          <= (others => '0');
        addr_ram            <= std_logic_vector(to_unsigned(dir_mem_1, 11));
        we                  <= '0'; --lectura
        data_ram_energia_o  <= (others => '0');
        addr_ram_energia    <= (others => '0');
        data_ram_cantidad_o <= (others => '0');
        fin_signal          <= '0';
        fin_borrado         <= '0';
      when dir_ancho_3               =>
        data_ram_o          <= (others => '0');
        addr_ram            <= std_logic_vector(to_unsigned(dir_mem_3, 11));
        we                  <= '0'; --lectura
        data_ram_energia_o  <= (others => '0');
        addr_ram_energia    <= (others => '0');
        data_ram_cantidad_o <= (others => '0');
        fin_signal          <= '0';
        fin_borrado         <= '0';
      when lectura_ancho_3           =>
        data_ram_o          <= (others => '0');
        addr_ram            <= std_logic_vector(to_unsigned(dir_mem_3, 11));
        we                  <= '0'; --lectura
        data_ram_energia_o  <= (others => '0');
        addr_ram_energia    <= (others => '0');
        data_ram_cantidad_o <= (others => '0');
        fin_signal          <= '0';
        fin_borrado         <= '0';
      when dir_anterior              =>
        data_ram_o          <= (others => '0');
        addr_ram            <= std_logic_vector(to_unsigned(dir_mem, 11));
        we                  <= '0'; --lectura
        data_ram_energia_o  <= (others => '0');
        addr_ram_energia    <= (others => '0');
        data_ram_cantidad_o <= (others => '0');
        fin_signal          <= '0';
        fin_borrado         <= '0';
      when lectura_anterior          =>
        data_ram_o          <= (others => '0');
        addr_ram            <= std_logic_vector(to_unsigned(dir_mem, 11));
        we                  <= '0'; --lectura
        data_ram_energia_o  <= (others => '0');
        addr_ram_energia    <= (others => '0');
        data_ram_cantidad_o <= (others => '0');
        fin_signal          <= '0';
        fin_borrado         <= '0';
      when casos                     =>
        data_ram_o          <= (others => '0');
        addr_ram            <= (others => '0');
        we                  <= '0'; --lectura
        data_ram_energia_o  <= (others => '0');
        addr_ram_energia    <= (others => '0');
        data_ram_cantidad_o <= (others => '0');
        fin_signal          <= '0';
        fin_borrado         <= '0';
      when dir_cantidad_energia      =>
        data_ram_o          <= (others => '0');
        addr_ram            <= std_logic_vector(to_unsigned(indice, 11));
        we                  <= '0';
        data_ram_energia_o  <= (others => '0');
        addr_ram_energia    <= std_logic_vector(to_unsigned(dir_energia, 11));
        data_ram_cantidad_o <= (others => '0');
        fin_signal          <= '0';
        fin_borrado         <= '0';
      when lectura_cantidad_energia  =>
        data_ram_o          <= (others => '0');
        addr_ram            <= std_logic_vector(to_unsigned(indice, 11));
        we                  <= '0';
        data_ram_energia_o  <= (others => '0');
        addr_ram_energia    <= std_logic_vector(to_unsigned(dir_energia, 11));
        data_ram_cantidad_o <= (others => '0');
        fin_signal          <= '0';
        fin_borrado         <= '0';
      when escritura_1 =>
        data_ram_o          <= std_logic_vector(to_unsigned(data_a_escribir, 11));
        addr_ram            <= std_logic_vector(to_unsigned(indice, 11));
        we                  <= '1'; --escritura
        data_ram_energia_o  <= std_logic_vector(to_unsigned(energia_temp + pix_data_reg, 14));
        addr_ram_energia    <= std_logic_vector(to_unsigned(dir_energia, 11));
        data_ram_cantidad_o <= std_logic_vector(to_unsigned(cantidad_temp + 1, 6));
        fin_signal          <= '0';
        fin_borrado         <= '0';
      when escritura_2 =>
        data_ram_o          <= std_logic_vector(to_unsigned(data_a_escribir, 11));
        addr_ram            <= std_logic_vector(to_unsigned(indice, 11));
        we                  <= '1'; --escritura
        data_ram_energia_o  <= std_logic_vector(to_unsigned(energia_temp + pix_data_reg, 14));
        addr_ram_energia    <= std_logic_vector(to_unsigned(dir_energia, 11));
        data_ram_cantidad_o <= std_logic_vector(to_unsigned(cantidad_temp + 1, 6));
        fin_signal          <= '0';
        fin_borrado         <= '0';
      when incremento_indice         =>
        data_ram_o          <= (others => '0');
        addr_ram            <= (others => '0');
        we                  <= '0'; --lectura
        data_ram_energia_o  <= (others => '0');
        addr_ram_energia    <= (others => '0');
        data_ram_cantidad_o <= (others => '0');
        fin_signal          <= '0';
        fin_borrado         <= '0';
      when fin                       =>
        data_ram_o          <= (others => 'Z');
        addr_ram            <= (others => 'Z');
        we                  <= 'Z'; --lectura
        data_ram_energia_o  <= (others => 'Z');
        addr_ram_energia    <= (others => 'Z');
        data_ram_cantidad_o <= (others => 'Z');
        fin_signal          <= '1';
        fin_borrado         <= '0';
    end case;
    if trigger = '1' then
      reg_ancho_1   <= 0;
      reg_ancho_2   <= 0;
      reg_ancho_3   <= 0;
      reg_anterior  <= 0;
      pix_data_reg  <= 0;
      energia_temp  <= 0;
      cantidad_temp <= 0;
    elsif rising_edge(clk) then
      case state is
        when dir_ancho_2 => --testeado, gracias a esto funciona*
          pix_data_reg <= to_integer(unsigned(pix_data)); --guardo la informacion del nuevo pixel(puede traer problemas)
        when lectura_ancho_2 =>
          --reg_ancho_2 <= 0;--debug
          reg_ancho_2 <= to_integer(unsigned(data_ram_i));
        when lectura_ancho_1 =>
          if ignorar_ancho_1 then
            reg_ancho_1 <= 0;
          else
            reg_ancho_1 <= to_integer(unsigned(data_ram_i));
          end if;
        when lectura_ancho_3 =>
          if ignorar_anterior then
            reg_ancho_3 <= 0;
          else
            reg_ancho_3 <= to_integer(unsigned(data_ram_i));
          end if;
        when lectura_anterior =>
          if ignorar_anterior then
            reg_anterior <= 0;
          else
            reg_anterior <= to_integer(unsigned(data_ram_i));
          end if;
        when lectura_cantidad_energia =>
          energia_temp  <= to_integer(unsigned(data_ram_energia_i));
          cantidad_temp <= to_integer(unsigned(data_ram_cantidad_i));
        when others =>

      end case;
    end if;
  end process;

end rtl;
