%clear
%clc
offset=-2;


vectordatos=imagen_a_vector('testPulenta.png');
len=length(vectordatos);
indice = 1;
contador_pixel = 0;
fifo=zeros(1,99);
energia=zeros(1,255);
cantidad=zeros(1,255);
eventos=1;
datos_salida=[];
flag_ignorar = false;
flag_ignorar_1 = false;
entro = 0;
for i=1:len
   
    contador_pixel=contador_pixel+1;
    if contador_pixel == 97
        flag_ignorar_1 = true;
    end 
    if contador_pixel == 98
        contador_pixel = 1;
        flag_ignorar = true;
    end

    dato = vectordatos(i);
    if dato > 0
        if flag_ignorar
            dato_anterior = 0;
        else
            if indice - 1 < 1 
                dato_anterior=fifo(98);
            else
                dato_anterior=fifo(indice-1);
            end
        end
        %dato_ancho_1=0;
        if flag_ignorar_1
           dato_ancho_1=0;
        else
            if indice +3 > 99
                dato_ancho_1 = fifo(indice-96);
            else
                dato_ancho_1 = fifo(indice+4+offset);
            end
        end
        %%dato_ancho_2=0;
        if indice + 2 > 99
          dato_ancho_2 = fifo(indice-97);
        else
          dato_ancho_2 = fifo(indice+3+offset);
        end
        %dato_ancho_3=0;
        if flag_ignorar
           dato_ancho_3 = 0;
        else
            if indice + 1 > 99
                dato_ancho_3 = fifo(indice-98);
            else
                dato_ancho_3 = fifo(indice+2+offset);%%"ancho +2" es el +1
            end
        end
        if ((dato_anterior == 0) & (dato_ancho_1 == 0) & (dato_ancho_2 == 0) & (dato_ancho_3 == 0))
            fifo_0 = eventos ;
            eventos = eventos + 1;
        else 
            fifo_0=max ([dato_anterior dato_ancho_1 dato_ancho_2 dato_ancho_3]);
        end
        else
          
         fifo_0=0;
    end
   flag_ignorar= false;
   flag_ignorar_1 = false;
   fifo(indice) = fifo_0;
   if fifo_0 ~= 0    
        energia(fifo_0)=energia(fifo_0)+uint16(dato);
        cantidad(fifo_0)=cantidad(fifo_0)+1;
   end
   datos_salida(i)=fifo_0;
   indice = indice + 1;
   if indice == 99 
        indice = 1;
   end
end
figure
imgTest=vector_a_imagen(datos_salida,97);
imshow(imgTest);
colormap colorcube
figure
bar(energia);
figure
bar(cantidad);
