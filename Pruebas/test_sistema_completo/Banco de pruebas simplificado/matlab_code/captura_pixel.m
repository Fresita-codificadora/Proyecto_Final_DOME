% Configuración del puerto serie
serialPort = 'COM12';  % Cambia esto por el puerto serie adecuado
baudRate = 9600;      % Configura la velocidad en baudios según corresponda

% Crear el objeto de puerto serie
s = serial(serialPort, 'BaudRate', baudRate);

% Ajustar el tamaño del buffer según las capacidades del hardware
s.InputBufferSize = 2048; % Ajusta a un valor razonable si es necesario

% Abrir el puerto serie
fopen(s);

% Inicializar la matriz para almacenar los datos
dataMatrix = []; % Inicializar una matriz vacía

disp('Capturando datos... Presiona Ctrl+C para detener la captura.');

try
    % Bucle para leer datos continuamente hasta que se presione Ctrl+C
    while true
        % Verificar si hay datos disponibles en el buffer
        if s.BytesAvailable > 0
            % Leer datos disponibles desde el puerto serie
            data = fread(s, s.BytesAvailable, 'uint8'); % Leer todos los bytes disponibles
            
            % Agregar los datos directamente a la matriz
            dataMatrix = [dataMatrix; data]; % Agregar como nuevas filas
            
            % Mostrar progreso (opcional)
            fprintf('Datos capturados: %d\n', size(dataMatrix, 1));
        end       
    end
catch ME
    % Capturar interrupciones por Ctrl+C y cerrar el puerto adecuadamente
    if strcmp(ME.identifier, 'MATLAB:class:InvalidHandle') || strcmp(ME.identifier, 'MATLAB:serial:fread:opfailed')
        disp('Captura de datos finalizada por Ctrl+C.');
    else
        % Mostrar otros errores si ocurren
        rethrow(ME);
    end
end

% Cerrar el puerto serie
fclose(s);

% Mostrar un resumen de la matriz de datos
disp('Captura de datos finalizada.');
disp(dataMatrix);
