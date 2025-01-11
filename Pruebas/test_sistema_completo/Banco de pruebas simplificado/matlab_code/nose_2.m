clear
clc
% Configuración del puerto serie
serialPort = 'COM13';  % Cambia esto por el puerto serie adecuado
baudRate = 115200;      % Configura la velocidad en baudios según corresponda

% Crear el objeto de puerto serie con serialport()
s = serialport(serialPort, baudRate);

% Ajustar el tamaño del buffer si es necesario
configureTerminator(s, "LF"); % Configurar terminador (opcional, ajustar según el dispositivo)
flush(s); % Limpiar el buffer inicial

% Inicializar la matriz para almacenar los datos
dataMatrix = uint8([]); % Inicializar como un vector vacío de tipo uint8
dataGoal = 1310720; % Número objetivo de datos a capturar

disp('Capturando datos...');

% Bucle para leer datos continuamente hasta alcanzar la cantidad requerida
while length(dataMatrix) < dataGoal
    % Verificar si hay datos disponibles en el buffer
    if s.NumBytesAvailable > 0
        % Leer los datos disponibles desde el puerto serie
        data = read(s, s.NumBytesAvailable, 'uint8'); 
        
        % Asegurar que `data` sea un vector columna
        data = data(:); % Convertir a columna
        
        % Concatenar los datos directamente
        dataMatrix = [dataMatrix; data]; % Concatenar como vector columna
        
        % Mostrar progreso
        fprintf('Datos capturados: %d\n', length(dataMatrix));
    end
end

% Cerrar el puerto serie
clear s; % Liberar el recurso del puerto serie

% Mostrar un resumen de la matriz de datos
disp('Captura de datos finalizada.');
dataMatrix=dataMatrix(1:1310720);
imageWidth = 1280;

% Calcular la cantidad de píxeles disponibles
numPixels = length(dataMatrix);

% Calcular la altura de la imagen como el múltiplo más cercano de 1280
imageHeight = floor(numPixels / imageWidth);

% Truncar dataMatrix para ajustarse a la cantidad de píxeles de la imagen
dataMatrix = dataMatrix(1:(imageWidth * imageHeight));

% Reshape dataMatrix a una matriz 2D para formar la imagen
imageMatrix = reshape(dataMatrix, [imageWidth, imageHeight])';

% Crear la imagen en escala de grises
figure;
imshow(imageMatrix, [0 255]); % Mostrar la imagen con valores de 0 a 255
title('Imagen Capturada');

% Guardar la imagen como un archivo si es necesario
imwrite(uint8(imageMatrix), 'captured_image.png'); % Guardar como PNG

