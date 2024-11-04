clear
clc
%close all
% Ruta base de las imágenes
%%rutaBase ='C:\Users\gazpa\Desktop\imagenes video martin\prueba2\images\'
rutaBase = 'C:\Users\gazpa\Documents\GitHub\Proyecto_Final_DOME\Pruebas\prueba_histograma\matlab_code\images\';
umbral = 100;
ancho = 1280;

% Número de imágenes a procesar
numImagenes = 60;
eventos_i = 0;
eventos_total=0;

cantidad = cell(1,60);
energia  = cell(1,60);
%histograma = cell(1,32);
histo_8192=zeros(1,32);
histo_1024=zeros(1,32);
histo_2048=zeros(1,32);
histo_16k=zeros(1,32);
for i = 1:numImagenes
    % Construir el nombre de cada archivo
    nombreImagen = sprintf('%sframe-%d.png', rutaBase, i);
    
    % Leer la imagen
    %%imagen = imread(nombreImagen);
    
    % Aplicar tu función o algoritmo a la imagen
    [cantidad_i,energia_i] = algoritmo(nombreImagen,umbral,ancho);
    % filtro e histograma
    ind=0;
    %%histo=zeros(1,32);
    for j=1:length(energia_i)
        if (cantidad_i(j)>1 & energia_i(j)>0)
        %if energia_i(j)>0
            ind=ind+1;
            cantidad_posta(ind)=cantidad_i(j);
            energia_posta(ind)=energia_i(j);
            histo_8192 = histo_8192 + histograma_manopla_8192(energia_i(j));
            histo_1024 = histo_1024 + histograma_manopla_1024(energia_i(j));
            histo_2048 = histo_2048 + histograma_manopla_2047(energia_i(j));
            histo_16k = histo_16k + histograma_manopla(energia_i(j));
        end;
    end;
    cantidad{i}=cantidad_posta;
    energia{i}=energia_posta;
    %%histograma{i}=histo;
    % Opcional: guardar o procesar el resultado
    %fprintf('Procesado: %s\n', nombreImagen);
end
all_cantidad=cell2mat(cantidad);
all_energia =cell2mat(energia);

figure
bar(histo_8192);
title('histograma con paso 256');
figure
bar(histo_1024);
title('histograma con paso 32');
figure
bar(histo_2048);
title('histograma con paso 64');
figure
bar(histo_16k);
title('histograma con paso 512');
%figure
%hist(all_cantidad,32);
figure
hist(all_energia,2^14);
title('maxima resolución')
