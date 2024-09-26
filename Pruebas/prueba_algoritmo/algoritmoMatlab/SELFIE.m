%Detecta eventos en una im�gen.

%% Reseteo matlab

%clear
%close all
%clc

%% Variables iniciales

nombreImagen = 'testPulenta.png'; %Nombre del archivo que contiene la im�gen
umbral = 0; %Umbral para tener en cuenta un pixel
maxEvents = 256; %Cantidad m�xima de eventos que supongo que van a aparecer. Esto podr�a llegar a no ser necesario.

%% Genero vectores de trabajo

imagen = imread(nombreImagen); %Cargo la im�gen de prueba
cantidad = zeros(1, maxEvents); %Histograma de eventos. El n�mero de evento es la posici�n, el valor es la cantidad de p�xeles del evento.
energias = zeros(1, maxEvents); %Histograma de energ�as de cada evento. El n�mero de evento es la posici�n, el valor es la energ�a del evento.

%% Progama principal

[alto, ancho, ~] = size(imagen); %Tama�o de la im�gen
%pixelFIFO = zeros(1, ancho + 1); %En este buffer guardo los p�xels que necesito en memoria
largoFIFO = ancho + 3;
eventFIFO = zeros(1, largoFIFO); %Ac� voy guardando el n�mero de evento. Arm�ndolo con zeros() queda como un m�rgen negro horizontal
nextEvent = 1; %Identificad�r del pr�ximo evento en ser generada

imgTest = zeros([alto, ancho]);

%%%%%%PARA DEBUGEAR%%%%%%
eventos = zeros(alto, ancho);
%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:alto %Voy barriendo filas
    
    %Desplazo la FIFO
    for indexFifo = 0:ancho + 1
        eventFIFO(ancho + 3 - indexFifo) = eventFIFO(ancho + 2 - indexFifo);
    end
    eventFIFO(1) = 0; %Esto es como si agregara un margen negro vertical
    
    for j = 1:ancho %Voy barriendo columnas
        
        pixel = imagen(i,j); %Ac� tengo el pixel actual como si viniera del sensor, el c�digo que viene abajo tiene que estar pensadopara implementar
        
        %Umbralo la entrada
        if pixel < umbral
            pixel = 0;
        end
        
        %Desplazo la FIFO de eventos.
        for indexFifo = 0:ancho + 1
            eventFIFO(ancho + 3 - indexFifo) = eventFIFO(ancho + 2 - indexFifo);
        end
        eventFIFO(1) = 0; %Borro el primer pixel. Despu�s veo que le corresponde
        
        %Todo esto es para ver que pongo en eventFIFO(1). Asigna un evento si el pixel super� el umbral
        if pixel %Si el pixel es distinto de cero (ac� entra bien)
            if ~eventFIFO(2) && ~eventFIFO(ancho + 1) && ~eventFIFO(ancho + 2) && ~eventFIFO(ancho + 3) %Si los tres de arriba y el anterior son cero
                eventFIFO(1) = nextEvent; %Asigna siguiente evento (pareciera que esto es k)
                nextEvent = nextEvent +1; %Incrementa el siguiente evento
                %%%%%%PARA DEBUGEAR%%%%%%
                %eventos(i, j) = eventFIFO(1);
                %%%%%%%%%%%%%%%%%%%%%%%%%
            % elseif ~eventFIFO(2) && eventFIFO(ancho + 1) && ~eventFIFO(ancho + 2) && eventFIFO(ancho + 3) %En caso de que el pixel actual conecte dos eventos (caso 1)
            %     cantidad(eventFIFO(ancho + 3)) = cantidad(eventFIFO(ancho + 3)) + cantidad(eventFIFO(ancho + 1)); %Paso todo lo que hab�a en ancho + 1 a ancho + 3
            %     energias(eventFIFO(ancho + 3)) = energias(eventFIFO(ancho + 3)) + energias(eventFIFO(ancho + 1)); %Paso todo lo que hab�a en ancho + 1 a ancho + 3
            %     for indexFifo = 3:ancho %Recorre la fifo para cambiar las etiquetas de esos eventos, esquiva el �ndice ancho + 1, si sobreescribe ese a esta altura cagamos
            %         if eventFIFO(indexFifo) == eventFIFO(ancho + 1)%%re etiquetado
            %             eventFIFO(indexFifo) =  eventFIFO(ancho + 3);
            %         end
            %     end
            %     cantidad(ancho + 1) = 0;
            %     energias(ancho + 1) = 0;
            %     eventFIFO(ancho + 1) =  eventFIFO(ancho + 3); %Ahora ya lo puede escribir
            %     eventFIFO(1) =  eventFIFO(ancho + 3); %Asigna el evento nuevo (le asigna la etiqueta de +3 al nuevo evento)
            %     %%%%%%PARA DEBUGEAR%%%%%%
            %     %eventos(i, j) = eventFIFO(1);
            %     %%%%%%%%%%%%%%%%%%%%%%%%%
            % elseif eventFIFO(2) && eventFIFO(ancho + 1) && ~eventFIFO(ancho + 2) && ~eventFIFO(ancho + 3) %En caso de que el pixel actual conecte dos eventos (caso 2)
            %     cantidad(eventFIFO(ancho + 1)) = cantidad(eventFIFO(ancho + 1)) + cantidad(eventFIFO(2)); %Paso todo lo que hab�a en 2 a ancho + 1
            %     energias(eventFIFO(ancho + 1)) = energias(eventFIFO(ancho + 1)) + energias(eventFIFO(2)); %Paso todo lo que hab�a en 2 a ancho + 1
            %     for indexFifo = 3:ancho %Recorre la fifo para cambiar las etiquetas de esos eventos, esquiva el �ndice ancho + 1, si sobreescribe ese a esta altura cagamos
            %         if eventFIFO(indexFifo) == eventFIFO(2)
            %             eventFIFO(indexFifo) =  eventFIFO(ancho + 1);
            %         end
            %     end
            %     cantidad(2) = 0;
            %     energias(2) = 0;
            %     eventFIFO(2) =  eventFIFO(ancho + 1); %Ahora ya lo puede escribir
            %     eventFIFO(1) =  eventFIFO(ancho + 1); %Asigna el evento nuevo
            %     %%%%%%PARA DEBUGEAR%%%%%%
            %     %eventos(i, j) = eventFIFO(1);
            %     %%%%%%%%%%%%%%%%%%%%%%%%%
            % elseif eventFIFO(2) && ~eventFIFO(ancho + 1) && eventFIFO(ancho + 2) && ~eventFIFO(ancho + 3) %En caso de que el pixel actual conecte dos eventos (caso 3)
            %     cantidad(eventFIFO(ancho + 2)) = cantidad(eventFIFO(ancho + 2)) + cantidad(eventFIFO(2)); %Paso todo lo que hab�a en 2 a ancho + 2
            %     energias(eventFIFO(ancho + 2)) = energias(eventFIFO(ancho + 2)) + energias(eventFIFO(2)); %Paso todo lo que hab�a en 2 a ancho + 2
            %     for indexFifo = 3:ancho %Recorre la fifo para cambiar las etiquetas de esos eventos, esquiva el �ndice ancho + 1, si sobreescribe ese a esta altura cagamos
            %         if eventFIFO(indexFifo) == eventFIFO(2)
            %             eventFIFO(indexFifo) =  eventFIFO(ancho + 2);
            %         end
            %     end
            %     cantidad(2) = 0;
            %     energias(2) = 0;
            %     eventFIFO(2) =  eventFIFO(ancho + 2);
            %     eventFIFO(1) = eventFIFO(ancho + 2);
            %     %%%%%%PARA DEBUGEAR%%%%%%
            %     %eventos(i, j) = eventFIFO(1);
            %     %%%%%%%%%%%%%%%%%%%%%%%%%
            % elseif eventFIFO(2) && eventFIFO(ancho + 1) && ~eventFIFO(ancho + 2) && eventFIFO(ancho + 3) %En caso de que el pixel actual conecte dos eventos (caso 4)
            %     cantidad(eventFIFO(ancho + 1)) = cantidad(eventFIFO(ancho + 1)) + cantidad(eventFIFO(2)); %Paso todo lo que hab�a en ancho + 1 a ancho + 3
            %     energias(eventFIFO(ancho + 1)) = energias(eventFIFO(ancho + 1)) + energias(eventFIFO(2)); %Paso todo lo que hab�a en ancho + 1 a ancho + 3
            %     for indexFifo = 3:ancho %Recorre la fifo para cambiar las etiquetas de esos eventos, esquiva el �ndice ancho + 1, si sobreescribe ese a esta altura cagamos
            %         if eventFIFO(indexFifo) == eventFIFO(2)
            %             eventFIFO(indexFifo) =  eventFIFO(ancho + 1);
            %         end
            %     end
            %     cantidad(2) = 0;
            %     energias(2) = 0;
            %     eventFIFO(2) =  eventFIFO(ancho + 1); %Ahora ya lo puede escribir
            %     eventFIFO(1) =  eventFIFO(ancho + 1); %Asigna el evento nuevo
            %     %%%%%%PARA DEBUGEAR%%%%%%
            %     %eventos(i, j) = eventFIFO(1);
            %     %%%%%%%%%%%%%%%%%%%%%%%%%
            else %Para p�xeles conexos o solo un pixel
                eventFIFO(1) = max([eventFIFO(2) eventFIFO(ancho + 1) eventFIFO(ancho + 2) eventFIFO(ancho + 3)]);
                %%%%%%PARA DEBUGEAR%%%%%%
                %eventos(i, j) = eventFIFO(1);
                %%%%%%%%%%%%%%%%%%%%%%%%%
            end
            cantidad(eventFIFO(1)) = cantidad(eventFIFO(1)) + 1; %Incremento la cantidad de p�xeles del evento resultante
            energias(eventFIFO(1)) = energias(eventFIFO(1)) + pixel; %Incremento la energ�a del evento resultante
            imgTest(i,j) = eventFIFO(1);
        end
    end
end

%% Grafica salidas

figure()
imshow(imagen)
figure()
imshow(uint8(imgTest))
colormap colorcube
%%imshow(uint8(imgTest),colormap(prism))
%figure()
%spy(eventos)
%figure()
%contourf(eventos)
%figure()
%bar(eventos)
%figure()
%bar(energias)