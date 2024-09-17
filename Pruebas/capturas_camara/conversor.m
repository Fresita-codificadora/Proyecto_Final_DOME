% Supongamos que dataMatrix contiene los datos capturados
% dataMatrix = ... (cargar o capturar los datos previamente)

% Definir el ancho de la imagen
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
imwrite(uint8(imageMatrix), 'captured_image_3.png'); % Guardar como PNG
