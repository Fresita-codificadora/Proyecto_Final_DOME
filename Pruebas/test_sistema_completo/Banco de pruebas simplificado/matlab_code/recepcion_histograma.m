% Configuración inicial
clc;
clear;

% Configuración del puerto serie
puerto = 'COM13'; % Cambia 'COMX' por el puerto correspondiente
baudRate = 115200; % Configura la velocidad adecuada para tu dispositivo
s = serialport(puerto, baudRate);

% Parámetros del puerto
configureTerminator(s, "LF"); % Configura un terminador si es necesario
flush(s); % Limpia el buffer

% Enviar el dato inicial (255) para iniciar la comunicación
dato_inicial = 255;
write(s, dato_inicial, 'uint8');
disp('Dato inicial enviado.');

% Número máximo de datos a recibir
cantidad_datos = 32; % Cambia esto al número deseado
datos_recibidos = []; % Almacenará los datos de 16 bits

try
    while length(datos_recibidos) < cantidad_datos
        % Leer el primer byte
        if s.NumBytesAvailable >= 1
            byte1 = read(s, 1, 'uint8');
        else
            continue;
        end

        % Leer el segundo byte
        if s.NumBytesAvailable >= 1
            byte2 = read(s, 1, 'uint8');
        else
            continue;
        end

        % Armar la palabra de 16 bits
        dato_16bits = bitor(bitshift(byte1, 8), byte2);
        datos_recibidos = [datos_recibidos, dato_16bits];

        % Mostrar el dato recibido
        fprintf('Dato recibido: %d\n', dato_16bits);
    end
    
    disp('Cantidad de datos recibida alcanzada.');
catch ME
    disp('Error detectado durante la comunicación.');
    disp(ME.message);
end

% Mostrar todos los datos recibidos
disp('Datos recibidos:');
disp(datos_recibidos);

% Finalizar y cerrar el puerto serie
clear s;

datos_recibidos = datos_recibidos(1:32);
figure
bar(datos_recibidos);
