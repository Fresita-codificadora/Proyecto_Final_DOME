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
            else %Para p�xeles conexos o solo un pixel
                eventFIFO(1) = max([eventFIFO(2) eventFIFO(ancho + 1) eventFIFO(ancho + 2) eventFIFO(ancho + 3)]);
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