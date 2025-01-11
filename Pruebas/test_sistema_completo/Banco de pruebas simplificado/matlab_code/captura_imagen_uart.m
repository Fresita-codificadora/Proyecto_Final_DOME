% Configuración del puerto serie
serialPort = 'COM13'; % Cambia esto según el puerto que estés usando
baudRate = 115200; % Asegúrate de que coincida con el dispositivo

% Crear objeto de puerto serie
s = serialport(serialPort, baudRate);

% Parámetros de la imagen
imageWidth = 1280; % Define el ancho de la imagen

% Configuración para recibir datos
disp('Iniciando recepción de datos...');
numPixels = 1280 * 1024; % Estimación inicial (puedes ajustarlo)
dataBuffer = uint8(zeros(1, numPixels)); % Inicializar buffer
idx = 1;

% Leer datos del puerto serie con progreso
progressStep = 1000; % Mostrar progreso cada 1000 datos capturados

while idx <= numPixels
    if s.NumBytesAvailable > 0
        data = read(s, s.NumBytesAvailable, 'uint8');
        len = length(data);
        dataBuffer(idx:idx+len-1) = data;
        idx = idx + len;

        % Mostrar progreso
        if mod(idx, progressStep) == 0 || idx > numPixels
            fprintf('Datos capturados: %d\n', idx);
        end
    end
end
disp('Recepción completa.');

% Cerrar puerto serie
clear s;

% Procesamiento de datos
% Calcular la cantidad de píxeles recibidos
numPixels = length(dataBuffer);

% Calcular la altura de la imagen como el múltiplo más cercano de imageWidth
imageHeight = floor(numPixels / imageWidth);

% Truncar dataBuffer para ajustarse a la cantidad de píxeles de la imagen
dataBuffer = dataBuffer(1:(imageWidth * imageHeight));

% Reshape dataBuffer a una matriz 2D para formar la imagen
imageMatrix = reshape(dataBuffer, [imageWidth, imageHeight])';

% Crear la imagen en escala de grises
figure;
imshow(imageMatrix, [0 255]); % Mostrar la imagen con valores de 0 a 255
title('Imagen Capturada');

% Guardar la imagen como un archivo PNG
imwrite(uint8(imageMatrix), 'captured_image.png'); % Guardar como PNG

disp('Imagen creada y guardada como captured_image.png.');
