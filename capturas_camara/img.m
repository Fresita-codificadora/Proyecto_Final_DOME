clear
close all
clc

%% 
filename = 'primera_img.txt';  % Nombre del archivo de texto
fid = fopen(filename, 'r');  % Abre el archivo en modo de lectura

if fid == -1
    error('Error al abrir el archivo');
else
    rawData = fread(fid, '*char')';  % Lee todo el contenido del archivo como una cadena de texto
    fclose(fid);  % Cierra el archivo
end

% Asegurarse de que la longitud de rawData sea múltiplo de 8 truncando el exceso
n = numel(rawData);  % Número de caracteres en el archivo

if mod(n, 8) ~= 0
    nTruncado = n - mod(n, 8);  % Trunca al múltiplo de 8 más cercano hacia abajo
    rawData = rawData(1:nTruncado);  % Elimina el exceso de bits
end

% Dividir la cadena en bloques de 8 bits
numWords = numel(rawData) / 8;  % Número de palabras de 8 bits
dataMatrix = zeros(1, numWords);  % Inicializa la matriz para almacenar las palabras

dataMatrix=dec2bin(rawData(1:nTruncado),8);
dataMatrix_dec=bin2dec(dataMatrix(:,1:8));

reconstruct_image(dataMatrix_dec)

function reconstruct_image(pixelValues)
    % reconstruct_image reconstruye y muestra una imagen a partir de valores de píxeles.
    %
    % INPUT:
    %   pixelValues - Un vector que contiene los valores de los píxeles (0-255)
    %
    % OUTPUT:
    %   Muestra la imagen reconstruida.

    % Determinar el número de píxeles (columnas)
    numCols = 1280;

    % Calcular el número de píxeles adicionales necesarios para llegar a un múltiplo de 1280
    numExtraPixels = mod(numel(pixelValues), numCols);
    if numExtraPixels ~= 0
        % Calcular cuántos píxeles faltan para completar la última fila
        numPaddingPixels = numCols - numExtraPixels;
        % Rellenar con ceros (píxeles negros)
        pixelValues = [pixelValues; zeros(numPaddingPixels, 1)];
    end

    % Calcular el número de filas
    numRows = numel(pixelValues) / numCols;

    % Reshape del vector de píxeles en una matriz de numRows x numCols
    imageMatrix = reshape(pixelValues, numCols, numRows)';

    % Mostrar la imagen
    figure;
    imshow(uint8(imageMatrix));  % Convertir a uint8 para visualizar la imagen correctamente
    title('Imagen reconstruida');
end




