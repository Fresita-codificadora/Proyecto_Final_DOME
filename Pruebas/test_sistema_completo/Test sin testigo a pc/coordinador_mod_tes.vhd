--maquina de estados que ese encarga de coordinar al resto de maquinas de estado, para capturar las 60 imagenes procesarlas y
--esperar la señal del satelite para enviar los histogramas, ademas cuenta con un hard_reset

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity coordinador_mod_tes is

  port (
    clk   : in std_logic; --clk de entrada, pensado en 50 MHz
    reset : in std_logic; -- reset asincronico
    -- entradas			
    fin_programador          : in std_logic; -- señal proveniente del bloque programador_block indicando fin de la programacion de la camara
    fin_histograma           : in std_logic; -- señal proveniente de algo_3_final indicando que el histograma ya fue generado
    fin_escritura_histograma : in std_logic;
    fin_borrado_algo         : in std_logic; -- señal proveniente de algo_3_final indicando que las memorias fueron borradas y ya esta listo para recibir info luego de un reset
    datos_histograma         : in std_logic_vector(13 downto 0); -- señal de datos provenientes de la memoria ram donde se almacenan los histogramas
    uart_tx_busy_i           : in std_logic;
    --señales de control entrada
    cntrl_envio     : in std_logic; -- señal proveniente del bloque decod_control eneargado de marcar el envio de los histogramas solicitado por parte del satelite
    trigger_externo : in std_logic;--señal unicamente valida para el banco de pruebas
    --error           : in std_logic;
    -- salidas 
    selector_ram_histograma : out std_logic;-- señal que se utiliza para el selector de ram para ver que maquina de estados tiene acceso a la ram en que momento
    trigger_intern          : out std_logic; -- señal que se encarga de los triggers internos de las maquinas de estados
    trigger_cam_o           : out std_logic; -- señal enviada a la camara para que envie el frame
    start_program           : out std_logic; -- señal enviada al programador para que programe a la camara
    escritura_hist          : out std_logic; -- señal enviada al histograma para que vuelque los registros en memoria
    errase_histograma       : out std_logic; -- señal encargada de reiniciar el histograma despues de haber escrito en memoria
    dir_mem_hist            : out std_logic_vector(9 downto 0); -- señal para el histograma para controlar en que pos de memoria se escribe el histograma actual
    reset_decod             : out std_logic;
    uart_tx_en_o            : out std_logic;
    uart_byte_o             : out std_logic_vector(7 downto 0);
    -- menejo memoria de histograma
    addr_histograma  : out std_logic_vector(9 downto 0); --addrs que se va a mandar por el bus de datos de la memoria que guarda los histogramas
    we_histograma    : out std_logic;
    selector_uart    : out std_logic; -- solo valido para el banco de pruebas
    trigger_wait_led : out std_logic
    --estado : out integer range 0 to 20
    --error_led       : out std_logic
  );

end entity;

architecture rtl of coordinador_mod_tes is

  -- Build an enumerated type for the state machine
  type state_type is (reset_todo, esp_borrado_1, fin_prog, trigger_algorimo, esp_borrado_2, trigger_cam, esp_fin_histograma,
    enable_histograma_escritura, esp_fin_escritura, reset_histograma, trigger_wait,
    lectura_histograma, envio_uart_1, envio_uart_2, envio_uart_3, envio_uart_4, incremento_addr_histograma_envio,
    borrado_mem_histograma, escritura_borrado_hist_1, escritura_borrado_hist_2);

  -- Register to hold the current state
  signal state : state_type;

  --señales internas
  signal addr_histograma_int : integer range 0 to 1023 := 0; -- esta es la direccion que vamos a usar para enviar los histogramas 
  signal img                 : integer range 0 to 60; --esta variable representa la cantidad de imagenes que el sistema tomara, antes de guardarla en la memoria
  signal dir_mem_hist_int    : integer range 0 to 1023       := 0; -- esta es la direccion inicial en la que se va a escribir el histograma
  signal reg_histograma      : std_logic_vector(13 downto 0) := (others => '0');
begin

  -- Logic to advance to the next state
  process (all)
    variable cuenta                                                                        : integer range 0 to 2 ** 12 - 1;
    variable flag_borrado_2, flag_esp_fin_algo, flag_esp_fin_histograma, flag_trigger_wait : boolean := false;
  begin
    if reset = '0' then -- esta señal de reset tiene que venir del bloque decod_control osea del satelite
      state <= reset_todo;
      cuenta := 0;
      addr_histograma_int <= 0;
      flag_borrado_2          := false;
      flag_esp_fin_algo       := false;
      flag_esp_fin_histograma := false;
      flag_trigger_wait       := false;
      img              <= 1;
      dir_mem_hist_int <= 0;
      --	 elsif error = '1' then
      --		state <= error_state;
    elsif (rising_edge(clk)) then
      case state is
        when reset_todo => -- en este estado se reinician todas las maquinas de estado 
          state <= esp_borrado_1;
          cuenta := 0;
          addr_histograma_int <= 0;
          flag_borrado_2          := false;
          flag_esp_fin_algo       := false;
          flag_esp_fin_histograma := false;
          flag_trigger_wait       := false;
          img              <= 1;
          dir_mem_hist_int <= 0;
        when esp_borrado_1 => -- en este estado se espera a que se borren las memorias energia, cantidad y "FIFO" 
          if fin_borrado_algo = '1' then
            state <= fin_prog;
          else
            state <= esp_borrado_1;
          end if;
        when fin_prog => -- en este estado se verfica que el programador ya finalizo 
          if cuenta < 10 then -- esto es un watch dog
            if fin_programador = '1' then -- si ya finalizo vamos al main loop
              state <= trigger_wait;
              cuenta := 0;
            else
              cuenta := cuenta + 1;
            end if;
          else
            state <= esp_borrado_1;-- eniamos nuevamente la señal de start, para que no se bloquee en este estado
            cuenta := 0;
          end if;
        when trigger_wait =>
          if cntrl_envio = '0' then
            if trigger_externo = '0' then
              state <= trigger_algorimo;
            else
              state <= trigger_wait;
            end if;
          else
            state               <= lectura_histograma;
            addr_histograma_int <= 0;
            flag_trigger_wait := true;
          end if;
        when trigger_algorimo => -- en este estado se envia la señal de trigger a las maquinas de estado internas
          state <= esp_borrado_2;
        when esp_borrado_2 =>
          if cntrl_envio = '0' then -- si el satelite no requiere que envie los histogramas
            if fin_borrado_algo = '1' then
              state <= trigger_cam;
            else
              state <= esp_borrado_2;
            end if;
          else -- si el satelite requiere la data reiniciamos la dir de inicio y vamos a la primera lectura
            state               <= lectura_histograma;
            addr_histograma_int <= 0;
            flag_borrado_2 := true;
          end if;
        when trigger_cam => -- en este estado se envia la señal de trigger a la camara
          if cuenta < 20 then -- esto se hace por que el reloj de la camara es mucho mas lento que el reloj de esta maquina de estado entoces la señal de trigger se ensancha
            state <= trigger_cam; -- segun la formula fclk/fclkcam *2
            cuenta := cuenta + 1;
          else
            state <= esp_fin_histograma;
            cuenta := 0;
          end if;
        when esp_fin_histograma => -- en este estado se espera que el histograma termine de realizase para capturar una nueva imagen
          if cntrl_envio = '0' then -- si el satelite no requiere que envie los histogramas
            if fin_histograma = '1' then
              img <= img + 1;
              if img = 1 then -- verifica que se hallan tomado las 60 imagenes, la cantidad de imagenes puede ser ajustada en un futuro
                img   <= 1;
                state <= enable_histograma_escritura;
              else
                state <= trigger_wait;
                --state <= sw;
              end if;
            else
              state <= esp_fin_histograma;
            end if;
          else -- si el satelite requiere la data reiniciamos la dir de inicio y vamos a la primera lectura
            state               <= lectura_histograma;
            addr_histograma_int <= 0;
            flag_esp_fin_histograma := true;
          end if;
        when enable_histograma_escritura => --en este estado se escribe el histograma en memoria
          state <= esp_fin_escritura;
        when esp_fin_escritura =>
          if fin_escritura_histograma = '1' then
            state <= reset_histograma;
          else
            state <= esp_fin_escritura;
          end if;
        when reset_histograma => -- en este estado se borra la informacion dentro de la maquina de estados histograma, para hacer un nuevo histograma
          if dir_mem_hist_int < 992 then
            dir_mem_hist_int <= dir_mem_hist_int + 32;
            state            <= trigger_wait;
          else
            dir_mem_hist_int <= 0;
            state            <= trigger_wait;
          end if;
        when lectura_histograma => -- en este estado leemos la informacion dentro de la memoria del histograma para enviarlo por UART
          cuenta := cuenta + 1;
          if cuenta < 2 then
            state <= lectura_histograma;
          else
            cuenta := 0;
            state <= envio_uart_1;
          end if;
        when envio_uart_1 =>
          state <= envio_uart_2;
        when envio_uart_2 =>
          if uart_tx_busy_i = '1' then
            state <= envio_uart_2;
          else
            state <= envio_uart_3;
          end if;
        when envio_uart_3 =>
          state <= envio_uart_4;
        when envio_uart_4 =>
          if uart_tx_busy_i = '1' then
            state <= envio_uart_4;
          else
            state <= incremento_addr_histograma_envio;
          end if;
        when incremento_addr_histograma_envio => -- en este estado se incrementa la posicion de memoria que se va a leer, y se determina si ya se termino de leer la memoria
          if addr_histograma_int < 1023 then
            addr_histograma_int <= addr_histograma_int + 1;
            state               <= lectura_histograma;
          else
            addr_histograma_int <= 0; -- reiniciamos donde vamos a buscar los datos
            dir_mem_hist_int    <= 0; -- reiniciamos donde se van a escribir los datos 
            state               <= borrado_mem_histograma;
          end if;
        when borrado_mem_histograma =>
          if addr_histograma_int < 1023 then
            addr_histograma_int <= addr_histograma_int + 1;
            state               <= escritura_borrado_hist_1;
          else
            addr_histograma_int <= 0;
            if flag_borrado_2 then
              flag_borrado_2 := false;
              state <= esp_borrado_2;
            elsif flag_esp_fin_histograma then
              flag_esp_fin_histograma := false;
              state <= esp_fin_histograma;
            elsif flag_trigger_wait then
              flag_trigger_wait := false;
              state <= trigger_wait;
            else
              state <= reset_todo;
            end if;
          end if;
        when escritura_borrado_hist_1 =>
          state <= escritura_borrado_hist_2;
        when escritura_borrado_hist_2 =>
          state <= borrado_mem_histograma;
      end case;
    end if;
  end process;

  -- Output depends solely on the current state
  process (all)
  begin
    case state is
      when reset_todo => --Habria que agregar una salida que reinicie la camara como modulo 
        trigger_intern          <= '1'; --reiniciamos las maquinas de estado internas
        trigger_cam_o           <= '0';
        start_program           <= '0';
        escritura_hist          <= '0';
        errase_histograma       <= '1'; --reiniciamos el histograma 
        dir_mem_hist            <= std_logic_vector(to_unsigned(dir_mem_hist_int, 10));
        we_histograma           <= '0';--o lectura 1 escritura
        reset_decod             <= '1'; --reiniciamos la maquina de estado decod_control
        uart_tx_en_o            <= '0';
        uart_byte_o             <= (others => '0');
        addr_histograma         <= (others => '0');
        selector_ram_histograma <= '0';-- cuando esta en 0 el control de la memoria de histograma lo tiene la maquina de estado algoritmo, si esta en 1 el control lo tiene el cordinador
        --error_led <= '0';
        selector_uart    <= '0'; --en 0 el control lo tiene quien responde al ack
        trigger_wait_led <= '0';
        --estado <= 1;
      when esp_borrado_1 =>
        trigger_intern          <= '0';
        trigger_cam_o           <= '0';
        start_program           <= '1'; --le mandamos el start al programador
        escritura_hist          <= '0';
        errase_histograma       <= '0';
        dir_mem_hist            <= std_logic_vector(to_unsigned(dir_mem_hist_int, 10));
        we_histograma           <= '0';--o lectura 1 escritura
        reset_decod             <= '0';
        uart_tx_en_o            <= '0';
        uart_byte_o             <= (others => '0');
        addr_histograma         <= (others => '0');
        selector_ram_histograma <= '0';-- cuando esta en 0 el control de la memoria de histograma lo tiene la maquina de estado algoritmo, si esta en 1 el control lo tiene el cordinador
        --error_led <= '0';
        selector_uart    <= '0'; --en 0 el control lo tiene quien responde al ack
        trigger_wait_led <= '0';
        --estado <= 2;
      when trigger_algorimo =>
        trigger_intern          <= '1'; --enviamos el trigger a las maquinas internas 
        trigger_cam_o           <= '0';
        start_program           <= '0';
        escritura_hist          <= '0';
        errase_histograma       <= '0';
        dir_mem_hist            <= std_logic_vector(to_unsigned(dir_mem_hist_int, 10));
        we_histograma           <= '0';--o lectura 1 escritura
        reset_decod             <= '0';
        uart_tx_en_o            <= '0';
        uart_byte_o             <= (others => '0');
        addr_histograma         <= (others => '0');
        selector_ram_histograma <= '0';-- cuando esta en 0 el control de la memoria de histograma lo tiene la maquina de estado algoritmo, si esta en 1 el control lo tiene el cordinador
        --error_led <= '0';
        selector_uart    <= '0'; --en 0 el control lo tiene quien responde al ack
        trigger_wait_led <= '0';
        --estado <= 3;
      when trigger_cam =>
        trigger_intern          <= '0';
        trigger_cam_o           <= '1';
        start_program           <= '0';
        escritura_hist          <= '0';
        errase_histograma       <= '0';
        dir_mem_hist            <= std_logic_vector(to_unsigned(dir_mem_hist_int, 10));
        we_histograma           <= '0';--o lectura 1 escritura
        reset_decod             <= '0';
        uart_tx_en_o            <= '0';
        uart_byte_o             <= (others => '0');
        addr_histograma         <= (others => '0');
        selector_ram_histograma <= '0';-- cuando esta en 0 el control de la memoria de histograma lo tiene la maquina de estado algoritmo, si esta en 1 el control lo tiene el cordinador
        --error_led <= '0';
        selector_uart    <= '0'; --en 0 el control lo tiene quien responde al ack
        trigger_wait_led <= '0';
        --estado <= 4;
      when esp_fin_histograma =>
        trigger_intern          <= '0';
        trigger_cam_o           <= '0';
        start_program           <= '0';
        escritura_hist          <= '0';
        errase_histograma       <= '0';
        dir_mem_hist            <= std_logic_vector(to_unsigned(dir_mem_hist_int, 10));
        we_histograma           <= '0';--o lectura 1 escritura
        reset_decod             <= '0';
        uart_tx_en_o            <= '0';
        uart_byte_o             <= (others => '0');
        addr_histograma         <= (others => '0');
        selector_ram_histograma <= '0';-- cuando esta en 0 el control de la memoria de histograma lo tiene la maquina de estado algoritmo, si esta en 1 el control lo tiene el cordinador
        --error_led <= '0';
        selector_uart    <= '0'; --en 0 el control lo tiene quien responde al ack
        trigger_wait_led <= '0';
        --estado <= 5;
      when enable_histograma_escritura =>
        trigger_intern          <= '0';
        trigger_cam_o           <= '0';
        start_program           <= '0';
        escritura_hist          <= '1'; -- habilitamos la escritura asi se escribe el histograma a memoria 
        errase_histograma       <= '0';
        dir_mem_hist            <= std_logic_vector(to_unsigned(dir_mem_hist_int, 10));
        we_histograma           <= '0';--o lectura 1 escritura
        reset_decod             <= '0';
        uart_tx_en_o            <= '0';
        uart_byte_o             <= (others => '0');
        addr_histograma         <= (others => '0');
        selector_ram_histograma <= '0';-- cuando esta en 0 el control de la memoria de histograma lo tiene la maquina de estado algoritmo, si esta en 1 el control lo tiene el cordinador
        --error_led <= '0';
        selector_uart    <= '0'; --en 0 el control lo tiene quien responde al ack
        trigger_wait_led <= '0';
        --estado <= 6;
      when esp_fin_escritura =>
        trigger_intern          <= '0';
        trigger_cam_o           <= '0';
        start_program           <= '0';
        escritura_hist          <= '0';
        errase_histograma       <= '0';
        dir_mem_hist            <= std_logic_vector(to_unsigned(dir_mem_hist_int, 10));
        we_histograma           <= '0';--o lectura 1 escritura
        reset_decod             <= '0';
        uart_tx_en_o            <= '0';
        uart_byte_o             <= (others => '0');
        addr_histograma         <= (others => '0');
        selector_ram_histograma <= '0';-- cuando esta en 0 el control de la memoria de histograma lo tiene la maquina de estado algoritmo, si esta en 1 el control lo tiene el cordinador
        --error_led <= '0';
        selector_uart    <= '0'; --en 0 el control lo tiene quien responde al ack
        trigger_wait_led <= '0';
        --estado <= 7;
      when reset_histograma =>
        trigger_intern          <= '0';
        trigger_cam_o           <= '0';
        start_program           <= '0';
        escritura_hist          <= '0';
        errase_histograma       <= '1'; -- reiniciamos el histograma luego de haber escrito a memoria
        dir_mem_hist            <= std_logic_vector(to_unsigned(dir_mem_hist_int, 10));
        we_histograma           <= '0';--o lectura 1 escritura
        reset_decod             <= '0';
        uart_tx_en_o            <= '0';
        uart_byte_o             <= (others => '0');
        addr_histograma         <= (others => '0');
        selector_ram_histograma <= '0';-- cuando esta en 0 el control de la memoria de histograma lo tiene la maquina de estado algoritmo, si esta en 1 el control lo tiene el cordinador
        --error_led <= '0';
        selector_uart    <= '0'; --en 0 el control lo tiene quien responde al ack
        trigger_wait_led <= '0';
        --estado <= 8;
      when lectura_histograma =>
        trigger_intern          <= '0';
        trigger_cam_o           <= '0';
        start_program           <= '0';
        escritura_hist          <= '0';
        errase_histograma       <= '0';
        dir_mem_hist            <= std_logic_vector(to_unsigned(dir_mem_hist_int, 10));
        we_histograma           <= '0';--o lectura 1 escritura
        reset_decod             <= '0';
        uart_tx_en_o            <= '0';
        uart_byte_o             <= (others => '0');
        addr_histograma         <= std_logic_vector(to_unsigned(addr_histograma_int, 10));
        selector_ram_histograma <= '1';-- cuando esta en 0 el control de la memoria de histograma lo tiene la maquina de estado algoritmo, si esta en 1 el control lo tiene el cordinador
        --error_led <= '0';
        selector_uart    <= '1'; --en 0 el control lo tiene quien responde al ack
        trigger_wait_led <= '0';
        --estado <= 9;
      when envio_uart_1 => --envio parte alta
        trigger_intern          <= '0';
        trigger_cam_o           <= '0';
        start_program           <= '0';
        escritura_hist          <= '0';
        errase_histograma       <= '0';
        dir_mem_hist            <= std_logic_vector(to_unsigned(dir_mem_hist_int, 10));
        we_histograma           <= '0';--o lectura 1 escritura
        reset_decod             <= '0';
        uart_tx_en_o            <= '1';
        uart_byte_o             <= "00" & reg_histograma(13 downto 8);
        addr_histograma         <= std_logic_vector(to_unsigned(addr_histograma_int, 10));
        selector_ram_histograma <= '1';-- cuando esta en 0 el control de la memoria de histograma lo tiene la maquina de estado algoritmo, si esta en 1 el control lo tiene el cordinador
        --error_led <= '0';
        selector_uart    <= '1'; --en 0 el control lo tiene quien responde al ack
        trigger_wait_led <= '0';
        --estado <= 10;
      when envio_uart_2 => --envio parte alta
        trigger_intern          <= '0';
        trigger_cam_o           <= '0';
        start_program           <= '0';
        escritura_hist          <= '0';
        errase_histograma       <= '0';
        dir_mem_hist            <= std_logic_vector(to_unsigned(dir_mem_hist_int, 10));
        we_histograma           <= '0';--o lectura 1 escritura
        reset_decod             <= '0';
        uart_tx_en_o            <= '0';
        uart_byte_o             <= "00" & reg_histograma(13 downto 8);
        addr_histograma         <= std_logic_vector(to_unsigned(addr_histograma_int, 10));
        selector_ram_histograma <= '1';-- cuando esta en 0 el control de la memoria de histograma lo tiene la maquina de estado algoritmo, si esta en 1 el control lo tiene el cordinador
        --error_led <= '0';
        selector_uart    <= '1'; --en 0 el control lo tiene quien responde al ack
        trigger_wait_led <= '0';
        --estado <= 11;
      when envio_uart_3 => --envio parte baja
        trigger_intern          <= '0';
        trigger_cam_o           <= '0';
        start_program           <= '0';
        escritura_hist          <= '0';
        errase_histograma       <= '0';
        dir_mem_hist            <= std_logic_vector(to_unsigned(dir_mem_hist_int, 10));
        we_histograma           <= '0';--o lectura 1 escritura
        reset_decod             <= '0';
        uart_tx_en_o            <= '1';
        uart_byte_o             <= reg_histograma(7 downto 0);
        addr_histograma         <= std_logic_vector(to_unsigned(addr_histograma_int, 10));
        selector_ram_histograma <= '1';-- cuando esta en 0 el control de la memoria de histograma lo tiene la maquina de estado algoritmo, si esta en 1 el control lo tiene el cordinador
        --error_led <= '0';
        selector_uart    <= '1'; --en 0 el control lo tiene quien responde al ack
        trigger_wait_led <= '0';
        --estado <= 12;
      when envio_uart_4 => --envio parte baja
        trigger_intern          <= '0';
        trigger_cam_o           <= '0';
        start_program           <= '0';
        escritura_hist          <= '0';
        errase_histograma       <= '0';
        dir_mem_hist            <= std_logic_vector(to_unsigned(dir_mem_hist_int, 10));
        we_histograma           <= '0';--o lectura 1 escritura
        reset_decod             <= '0';
        uart_tx_en_o            <= '0';
        uart_byte_o             <= reg_histograma(7 downto 0);
        addr_histograma         <= std_logic_vector(to_unsigned(addr_histograma_int, 10));
        selector_ram_histograma <= '1';-- cuando esta en 0 el control de la memoria de histograma lo tiene la maquina de estado algoritmo, si esta en 1 el control lo tiene el cordinador
        --error_led <= '0';
        selector_uart    <= '1'; --en 0 el control lo tiene quien responde al ack
        trigger_wait_led <= '0';
        --estado <= 13;
      when incremento_addr_histograma_envio => --envio parte alta
        trigger_intern          <= '0';
        trigger_cam_o           <= '0';
        start_program           <= '0';
        escritura_hist          <= '0';
        errase_histograma       <= '0';
        dir_mem_hist            <= std_logic_vector(to_unsigned(dir_mem_hist_int, 10));
        we_histograma           <= '0';--o lectura 1 escritura
        reset_decod             <= '0';
        uart_tx_en_o            <= '0';
        uart_byte_o             <= (others => '0');
        addr_histograma         <= std_logic_vector(to_unsigned(addr_histograma_int, 10));
        selector_ram_histograma <= '1';-- cuando esta en 0 el control de la memoria de histograma lo tiene la maquina de estado algoritmo, si esta en 1 el control lo tiene el cordinador
        --error_led <= '0';
        selector_uart    <= '1'; --en 0 el control lo tiene quien responde al ack
        trigger_wait_led <= '0';
        --estado <= 14;
      when trigger_wait =>
        trigger_intern          <= '0';
        trigger_cam_o           <= '0';
        start_program           <= '0';
        escritura_hist          <= '0';
        errase_histograma       <= '0';
        dir_mem_hist            <= (others => '0');
        we_histograma           <= '0';--o lectura 1 escritura
        reset_decod             <= '0';
        uart_tx_en_o            <= '0';
        uart_byte_o             <= (others => '0');
        addr_histograma         <= (others => '0');
        selector_ram_histograma <= '1';-- cuando esta en 0 el control de la memoria de histograma lo tiene la maquina de estado algoritmo, si esta en 1 el control lo tiene el cordinador
        --error_led <= '0';
        selector_uart    <= '1'; --en 0 el control lo tiene quien responde al ack
        trigger_wait_led <= '1';
        --estado <= 15;
      when borrado_mem_histograma =>
        trigger_intern          <= '0';
        trigger_cam_o           <= '0';
        start_program           <= '0';
        escritura_hist          <= '0';
        errase_histograma       <= '0';
        dir_mem_hist            <= std_logic_vector(to_unsigned(dir_mem_hist_int, 10));
        we_histograma           <= '1';--o lectura 1 escritura
        reset_decod             <= '0';
        uart_tx_en_o            <= '0';
        uart_byte_o             <= (others => '0');
        addr_histograma         <= std_logic_vector(to_unsigned(addr_histograma_int, 10));
        selector_ram_histograma <= '1';-- cuando esta en 0 el control de la memoria de histograma lo tiene la maquina de estado algoritmo, si esta en 1 el control lo tiene el cordinador
        --error_led <= '0';
        selector_uart    <= '1'; --en 0 el control lo tiene quien responde al ack
        trigger_wait_led <= '0';
        --estado <= 16;
      when escritura_borrado_hist_1 =>
        trigger_intern          <= '0';
        trigger_cam_o           <= '0';
        start_program           <= '0';
        escritura_hist          <= '0';
        errase_histograma       <= '0';
        dir_mem_hist            <= std_logic_vector(to_unsigned(dir_mem_hist_int, 10));
        we_histograma           <= '1';--o lectura 1 escritura
        reset_decod             <= '0';
        uart_tx_en_o            <= '0';
        uart_byte_o             <= (others => '0');
        addr_histograma         <= std_logic_vector(to_unsigned(addr_histograma_int, 10));
        selector_ram_histograma <= '1';-- cuando esta en 0 el control de la memoria de histograma lo tiene la maquina de estado algoritmo, si esta en 1 el control lo tiene el cordinador
        --error_led <= '0';
        selector_uart    <= '1'; --en 0 el control lo tiene quien responde al ack
        trigger_wait_led <= '0';
        --estado <= 17;
      when escritura_borrado_hist_2 =>
        trigger_intern          <= '0';
        trigger_cam_o           <= '0';
        start_program           <= '0';
        escritura_hist          <= '0';
        errase_histograma       <= '0';
        dir_mem_hist            <= std_logic_vector(to_unsigned(dir_mem_hist_int, 10));
        we_histograma           <= '1';--o lectura 1 escritura
        reset_decod             <= '0';
        uart_tx_en_o            <= '0';
        uart_byte_o             <= (others => '0');
        addr_histograma         <= std_logic_vector(to_unsigned(addr_histograma_int, 10));
        selector_ram_histograma <= '1';-- cuando esta en 0 el control de la memoria de histograma lo tiene la maquina de estado algoritmo, si esta en 1 el control lo tiene el cordinador
        --error_led <= '0';
        selector_uart    <= '1'; --en 0 el control lo tiene quien responde al ack
        trigger_wait_led <= '0';
        --estado <= 18;
      when others => --estados que encajan fin_prog, esp_borrado_2
        trigger_intern          <= '0';
        trigger_cam_o           <= '0';
        start_program           <= '0';
        escritura_hist          <= '0';
        errase_histograma       <= '0';
        dir_mem_hist            <= std_logic_vector(to_unsigned(dir_mem_hist_int, 10));
        we_histograma           <= '0';--o lectura 1 escritura
        reset_decod             <= '0';
        uart_tx_en_o            <= '0';
        uart_byte_o             <= (others => '0');
        addr_histograma         <= (others => '0');
        selector_ram_histograma <= '0';-- cuando esta en 0 el control de la memoria de histograma lo tiene la maquina de estado algoritmo, si esta en 1 el control lo tiene el cordinador
        --error_led <= '0';
        selector_uart    <= '0'; --en 0 el control lo tiene quien responde al ack
        trigger_wait_led <= '0';
        --estado <= 20;
    end case;
    if reset = '0' then
      reg_histograma <= (others => '0');
    elsif (rising_edge(clk)) then
      case state is
        when lectura_histograma =>
          reg_histograma <= datos_histograma;
        when others =>
      end case;
    end if;
  end process;
end rtl;
