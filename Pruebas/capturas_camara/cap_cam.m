% Configuración del puerto serie
serialPort = 'COM12';  % Cambia esto por el puerto serie adecuado
baudRate = 115200;      % Configura la velocidad en baudios según corresponda

% Crear el objeto de puerto serie
s = serial(serialPort, 'BaudRate', baudRate);

% Ajustar el tamaño del buffer según las capacidades del hardware
s.InputBufferSize = 1024; % Ajusta a un valor razonable si es necesario

% Abrir el puerto serie
fopen(s);

% Inicializar la matriz para almacenar los datos
dataMatrix = []; % Inicializar una matriz vacía

disp('Capturando datos... Presiona "q" y Enter en la consola para detener la captura.');

% Bucle para leer datos hasta que se reciba la señal de finalización
stopCapture = false;  % Variable de control para finalizar la captura

while ~stopCapture
    % Verificar si hay datos disponibles en el buffer
    if s.BytesAvailable > 0
        % Leer datos disponibles desde el puerto serie
        data = fread(s, s.BytesAvailable, 'uint8'); % Leer todos los bytes disponibles
        
        % Agregar los datos directamente a la matriz
        dataMatrix = [dataMatrix; data]; % Agregar como nuevas filas
        
        % Mostrar progreso (opcional)
        fprintf('Datos capturados: %d\n', size(dataMatrix, 1));
    end
    
    % Pausa pequeña para no saturar el CPU y para chequeos de salida
    pause(0.1); % Pausar brevemente para reducir carga y permitir entrada del usuario
    
end

% Cerrar el puerto serie
fclose(s);

% Mostrar un resumen de la matriz de datos
disp('Captura de datos finalizada.');
disp(dataMatrix);
