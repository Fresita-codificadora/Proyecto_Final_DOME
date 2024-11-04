clear
clc
close all
% Ruta base de las imágenes
rutaBase = 'C:\Users\gazpa\Documents\GitHub\Proyecto_Final_DOME\Pruebas\prueba_algoritmo\algoritmoMatlab\images\';
umbral = 100;
ancho = 1280;

% Número de imágenes a procesar
numImagenes = 60;
eventos_i = 0;
eventos_total=0;

cantidad = cell(1,60);
energia  = cell(1,60);
for i = 1:numImagenes
    % Construir el nombre de cada archivo
    nombreImagen = sprintf('%sframe-%d.png', rutaBase, i);
    
    % Leer la imagen
    %%imagen = imread(nombreImagen);
    
    % Aplicar tu función o algoritmo a la imagen
    [cantidad_i,energia_i] = algoritmo(nombreImagen,umbral,ancho);
    ind=0;
    for j=1:length(energia_i)
        if (cantidad_i(j)>1 & energia_i(j)>0)
            ind=ind+1;
            cantidad_posta(ind)=cantidad_i(j);
            energia_posta(ind)=energia_i(j);
        end;
    end;
    cantidad{i}=cantidad_posta;
    energia{i}=energia_posta;
    % Opcional: guardar o procesar el resultado
    %fprintf('Procesado: %s\n', nombreImagen);
end
all_cantidad=cell2mat(cantidad);
all_energia =cell2mat(energia);
figure
hist(all_cantidad,2^16);
figure
hist(all_energia,2^16);
figure
hist(all_cantidad,32);
figure
hist(all_energia,32);