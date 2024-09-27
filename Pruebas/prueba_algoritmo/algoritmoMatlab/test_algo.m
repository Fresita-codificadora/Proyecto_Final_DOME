vectordatos=imagen_a_vector('testPulenta.png');
len=length(vectordatos);
indice = 0;
fifo=zeros(97);
eventos=1;
datos_salida=[];
for i=1:len
    indice = indice + 1;
    if indice == 100 
        indice = 1;
    end
    dato = vectordatos(i);
    if dato > 0
        if indice == 1
            dato_anterior=fifo(100);
        else
            dato_anterior=fifo(indice-1);
        end
        if indice + 4 > 100
           dato_ancho_1 = fifo(indice-96);
        else
           dato_ancho_1 = fifo(indice+4);
        end
        if indice + 3 > 100
           dato_ancho_2 = fifo(indice-97);
        else
           dato_ancho_2 = fifo(indice+3);
        end
        if indice + 2 > 100
           dato_ancho_3 = fifo(indice-98);
        else
           dato_ancho_3 = fifo(indice+2);
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
   fifo(indice) = fifo_0;
   datos_salida(i)=fifo_0;
end
imgTest=vector_a_imagen(datos_salida,97);
imshow(imgTest);
colormap colorcube
