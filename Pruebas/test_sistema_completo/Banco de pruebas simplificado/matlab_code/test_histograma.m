clear
clc
%%close all
offset=-2;

ancho = 1280;
umbral=75;

%%vectordatos=imagen_a_vector('C:\Users\gazpa\Documents\GitHub\Proyecto_Final_DOME\Pruebas\prueba_algoritmo\algoritmoMatlab\images\frame-100.png');
vectordatos=imagen_a_vector('captured_image.png');
len=length(vectordatos);
indice = 1;
contador_pixel = 0;
fifo=uint32(zeros(1,ancho+2));
energia=zeros(1,2047);
cantidad=zeros(1,2047);
eventos=1;
datos_salida=zeros(1,1280*1024,'uint16');
flag_ignorar = false;
flag_ignorar_1 = false;

for i=1:len
   
    contador_pixel=contador_pixel+1;
    if contador_pixel == ancho
        flag_ignorar_1 = true;
    end 
    if contador_pixel == (ancho+1)
        contador_pixel = 1;
        flag_ignorar = true;
    end

    dato = vectordatos(i);
    if dato > umbral
        if flag_ignorar
            dato_anterior = 0;
        else
            if indice - 1 < 1 
                dato_anterior=fifo(ancho + 1);
            else
                dato_anterior=fifo(indice-1);
            end
        end
        %dato_ancho_1=0;
        if flag_ignorar_1
           dato_ancho_1=0;
        else
            if indice +3 > (ancho + 2)
                dato_ancho_1 = fifo(indice-(ancho-1));
            else
                dato_ancho_1 = fifo(indice+4+offset);
            end
        end
        %%dato_ancho_2=0;
        if indice + 2 > (ancho+2)
          dato_ancho_2 = fifo(indice-ancho);
        else
          dato_ancho_2 = fifo(indice+3+offset);
        end
        %dato_ancho_3=0;
        if flag_ignorar
           dato_ancho_3 = 0;
        else
            if indice + 1 > (ancho+2)
                dato_ancho_3 = fifo(indice-(ancho+1));
            else
                dato_ancho_3 = fifo(indice+2+offset);%%"ancho +2" es el +1
            end
        end
        if ((dato_anterior == 0) & (dato_ancho_1 == 0) & (dato_ancho_2 == 0) & (dato_ancho_3 == 0))
            fifo_0 = eventos ;
            eventos = uint32(eventos) + 1;
        else 
            fifo_0=max ([dato_anterior dato_ancho_1 dato_ancho_2 dato_ancho_3]);
        end
        else
          
         fifo_0=0;
    end
   flag_ignorar= false;
   flag_ignorar_1 = false;
   fifo(indice) = fifo_0;
   if (fifo_0 ~= 0) && (fifo_0 <= 2047)    
        energia(fifo_0)=energia(fifo_0)+uint16(dato);
        cantidad(fifo_0)=uint16(cantidad(fifo_0))+1;
   end
   datos_salida(i)=fifo_0;
   indice = indice + 1;
   if indice == (ancho+2) 
        indice = 1;
   end
   if fifo_0 == 2047
       fifo_0 = 1;
       eventos = 1;
   end 
end
figure
imgTest=vector_a_imagen(datos_salida,ancho);
imshow(imgTest,[]);
colormap colorcube
energia = mod(energia, 2^14); %%limitamos a 14 bits enegia
cantidad = mod(cantidad, 2^6); %% limitamos a 6 bits cantidad 
%% filtrado
histo_8192 = 0;
ind=0;
for i=1:length(cantidad)
    if (cantidad(i)>1 & energia(i)>0)
        ind=ind+1;
        energia2(ind)=energia(i);
        histo_8192 = histo_8192 + histograma_manopla_8192(energia(i));
    end;
end;

%% histogramas
%  figure;
%  hist(energia,2^16);
% xlim([umbral max(energia)])
%  figure;
%  hist(energia,32);
%  xlim([umbral max(energia)])
% figure;
% hist(energia2,length(energia2));
% xlim([umbral max(energia2)]);
% figure;
% hist(energia2,32);
% xlim([umbral max(energia2)])
figure
bar(histo_8192);
title('histograma con paso 512');
