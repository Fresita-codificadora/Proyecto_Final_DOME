library ieee;
	use ieee.std_logic_1164.all;
	use IEEE.NUMERIC_STD.ALL; 		--libreria para cambios entre formatos
	use IEEE.MATH_REAL.ALL; 		--libreria para log2 y ceil
	use STD.TEXTIO.ALL;  -- Biblioteca para manejo de archivos

entity algorimo_tb is

end entity;

architecture arch of algorimo_tb is
component Algoritmo is
	generic(
		umbral 				: integer :=0;
		cantidad_eventos 	: integer :=2**12		
	);
	port(
		-- entradas generales--
		clk_i											: in	std_logic;
		Start_i,reset_i				: in	std_logic;								--leer y trigger son senales externas que le avisan que debe leer los pixeles o reiniciar todo para un nueva img
		-- habilitaciones --
		enable_done									: in std_logic;
		-- entrada de trigger -- 				
  		trigger										: in std_logic;
		-- entradas Capture_input_controller--
		pix_cnt_i									: in integer range 0 to 1_310_721;   --cuenta de los pixeles leidos
		pix_data_i 									: in std_logic_vector(7 downto 0);		-- data proveniente de Capture_input_controller
		-- entrada ram energia y cantidad--
		energia_i , cantidad_i 					: in std_logic_vector(7 downto 0);
		--entrada FIFO
		FIFO_data_i									: in std_logic_vector(integer(ceil(log2(real(cantidad_eventos))))-1 downto 0);


		-- salida trigger --
		trigger_CIC, enable_CIC, trigger_cam: out std_logic; 
		-- salidas shift FIFO--
		--??
		--salida hacia la FIFO--
		FIFO_data_o									: out std_logic_vector (integer(ceil(log2(real(cantidad_eventos))))-1 downto 0);
		FIFO_dir_o									: out std_logic_vector (10 downto 0); 	--las direcciones necesarias para las 1283 posiciones de memoria
		FIFO_RW_o									: out std_logic;								--señal para lectura y escritura de la ram FIFO

		--salida hacia energia y cantidad--
		energia_o , cantidad_o 					: out std_logic_vector (7 downto 0);
		--salida control ram de energias y cantidad--
		r_w_energia , r_w_cantidad				: out std_logic;
		indice_energias_o , indice_cantidad_o 		: out std_logic_vector (integer(ceil(log2(real(cantidad_eventos))))-1 downto 0)

	);
end component;
	signal		clk_i,clk_inv					:std_logic;																		
	signal		Start_i							:std_logic;
	signal		reset_i							:std_logic;							--leer y trigger son senales externas que le avisan que debe leer los pixeles o reiniciar todo para un nueva img
				-- abilitaciones --	
	signal		enable_done						:std_logic;	
				-- ntrada de trigger -- 					
	signal		trigger							:std_logic;				
				-- ntradas Capture_input	_controller--
	signal		pix_cnt_i						:integer range 0 to 1_310_720;					   --cuenta de los pixeles leidos
	signal		pix_data_i 						:std_logic_vector(7 downto 0);						-- data proveniente de Capture_input_controller
			-- entrda ram energia y cant	idad--
	signal		energia_i 						:std_logic_vector(7 downto 0);
	signal		cantidad_i 						:std_logic_vector(7 downto 0);
				--etrada FIFO	
	signal		FIFO_data_i						:std_logic_vector(11 downto 0);
		
				-- alida trigger --	
	signal		trigger_CIC						:std_logic;
	signal		enable_CIC						:std_logic;
	signal		trigger_cam						:std_logic;
				--slida hacia la FIFO--		
	signal		FIFO_data_o						:std_logic_vector(11 downto 0);	
	signal		FIFO_dir_o						:std_logic_vector(10 downto 0);				 	--las direcciones necesarias para las 1283 posiciones de memoria
	signal		FIFO_RW_o						:std_logic;									--señal para lectura y escritura de la ram FIFO
		
				--slida hacia energia y 	cantidad--
	signal		energia_o 						:std_logic_vector(7 downto 0);
	signal		cantidad_o 						:std_logic_vector(7 downto 0);
				--slida control ram de e	nergias y cantidad--
	signal		r_w_energia 					:std_logic;
	signal		r_w_cantidad					:std_logic;
	signal		indice_energias_o 				:std_logic_vector(11 downto 0);
	signal		indice_cantidad_o 				:std_logic_vector(11 downto 0);

	-- Declaración de variables para manejo de archivos
    file input_file 		: text open read_mode is "input_data.txt";  -- Abrir archivo de entrada
    variable line_data_i 	: line;   -- Variable para leer líneas del archivo
    variable read_value 	: std_logic_vector(7 downto 0);  -- Variable para almacenar los datos leídos
	
	file output_file 		: text open write_mode is "output_data.txt";  -- Archivo de salida
    variable line_data_o 	: line;   -- Variable para escribir líneas en el archivo


begin

UUT : Algoritmo 
		generic map (
			umbral => 80,
			cantidad_eventos => 2**12
			)
			port map(
				clk_i					=>	clk_i,													
				Start_i					=>	Start_i,
				reset_i					=>	reset_i,											
				enable_done				=>	enable_done,													
				trigger					=>	trigger	,										
				pix_cnt_i				=>	pix_cnt_i,									   
				pix_data_i 				=>	pix_data_i, 											
				energia_i 				=>	energia_i, 
				cantidad_i 				=>	cantidad_i, 					
				FIFO_data_i				=>	FIFO_data_i	,									
				trigger_CIC				=>	trigger_CIC,
				enable_CIC				=>	enable_CIC,
				trigger_cam				=>	trigger_cam,
				FIFO_data_o				=>	FIFO_data_o	,									
				FIFO_dir_o				=>	FIFO_dir_o	,								 	
				FIFO_RW_o				=>	FIFO_RW_o	,														
				cantidad_o 				=>	cantidad_o 	,				
				r_w_energia 			=>	r_w_energia ,
				r_w_cantidad			=>	r_w_cantidad,				
				indice_energias_o 		=>	indice_energias_o, 
				indice_cantidad_o 		=>	indice_cantidad_o 	
			);
	clk_process: process
	begin
		while true loop
			clk_i <= '0';
			clk_inv <='1';
			wait for 10 ns;  -- Media mitad del periodo (20 ns)
			clk_i <= '1';
			clk_inv <='0';
			wait for 10 ns;  -- Otra mitad del periodo
		end loop;
	end process clk_process;
	stop_simulation: process
    begin
        wait for 1000 ns;  -- Duración total de la simulación
        assert false report "Simulation finished" severity failure;
        wait;  -- Detiene la simulación en este punto
    end process stop_simulation;
	stimulus_process : process		--señales que no tienen que cambiar
	begin
		--inicializacion
		reset_i <='0'; --reseteamos
		enable_done <= '1'; --le mandamos esta señal que nno va a cambiar nunca
		trigger	<= '1';																				
		energia_i <= (others => '0');
		cantidad_i <=(others => '0');
		wait for 10 ns;
		
		-- señales para siempre
		reset_i <= '1'; --desreseteamos
		trigger <= '0';
		wait for 60 ns;

		trigger <= '1';
	end process;
	file_stimulus : process			--señales que provienen del archivo
	begin
		if reset_i='0' then
			pix_cnt_i<=0;
		end if;
		while not endfile(input_file) loop  -- Bucle hasta el final del archivo
			wait until falling_edge(clk_i);  -- Sincronizar con el reloj

			readline(input_file, line_data_i);  -- Leer una línea del archivo
			read(line_data_i, read_value);      -- Convertir la línea a un valor de 8 bits

			pix_data_i <= read_value;   -- Asignar el valor leído a la entrada A
			pix_cnt_i <= pix_cnt_i+1;-- le sumamos uno a pix_cnt

			write(line_data_o, integer'image(pix_cnt));  -- Convertir índice a string
         write(line_data_o, string'(" "));           -- Separador (espacio)
         write(line_data_o, std_logic_vector'image(FIFO_data_o));  -- Convertir SUM a string
         writeline(output_file, line_data_o);  -- Escribir en el archivo
		end loop;
	end process;
end architecture;