% Script de prueba para enviar y recibir datos por puerto serie
%clear
%clc
% Configuración del puerto serie
port_name = 'COM13';  % Cambia este valor por el puerto serie correcto en tu sistema
baud_rate = 2000000;    % Asegúrate de que coincida con la configuración del dispositivo
% Crear objeto de puerto serie
serial_port = serialport(port_name, baud_rate, 'Timeout', 10);  % Timeout de 10 segundos

% Configurar el tamaño de la trama de datos
configureTerminator(serial_port, "LF");  % Línea de finalización (line feed)

% Vector de datos a enviar (cada valor debe ser <= 255)
datos_a_enviar = imagen_a_vector('image.png');

% Llamada a la función para enviar y recibir datos
vector_recibido = enviar_y_recibir_datos(serial_port, datos_a_enviar);

% Recibir el vector adicional 'cantidad' (250 datos)
cantidad_uart = recibir_vector(serial_port, 2047);

% Recibir las palabras de 16 bits después de los datos de 'cantidad'
num_palabras = 2047;  % Suponiendo que vamos a recibir 100 palabras de 16 bits
palabras_16_bits = recibir_palabras_16bits(serial_port, num_palabras);

% Mostrar imagen recibida
imgTest = vector_a_imagen(vector_recibido, 863);
imshow(imgTest,[]);
colormap colorcube

% Cerrar el puerto serie
clear serial_port;

function [vector_recibido] = enviar_y_recibir_datos(serial_port, datos)
    % Función para enviar datos por puerto serie y recibir 2 bytes de respuesta
    % por cada byte enviado.
    % serial_port: objeto del puerto serie
    % datos: vector de datos a enviar (cada valor debe ser <= 255)
    
    % Inicializamos el vector para guardar las palabras de 16 bits recibidas
    num_datos = length(datos);
    vector_recibido = zeros(1, num_datos, 'uint16');  % Vector de palabras de 16 bits

    for i = 1:num_datos
        % Obtener el dato a enviar (un byte)
        dato_a_enviar = datos(i);  
        
        % Enviar el dato por el puerto serie (1 byte)
        write(serial_port, dato_a_enviar, 'uint8');
        disp(['Dato enviado: ', num2str(dato_a_enviar)]);
        
        % Esperar a recibir 2 bytes (una palabra de 16 bits)
        while serial_port.NumBytesAvailable < 2
            % Esperar hasta que haya al menos 2 bytes disponibles
        end

        % Leer los dos bytes (parte alta y parte baja)
        parte_alta = read(serial_port, 1, 'uint8');  % Primer byte recibido (parte alta)
        parte_baja = read(serial_port, 1, 'uint8');  % Segundo byte recibido (parte baja)

        % Combinar los dos bytes para formar una palabra de 16 bits
        palabra_16bits = bitor(bitshift(uint16(parte_alta), 8), uint16(parte_baja));

        % Guardar la palabra de 16 bits en el vector
        vector_recibido(i) = palabra_16bits;
        
        % Mostrar los datos recibidos
        disp(['Bytes recibidos: ', num2str(parte_alta), ' (alta), ', num2str(parte_baja), ' (baja)']);
        disp(['Palabra de 16 bits recibida: ', num2str(palabra_16bits)]);
        disp(['palabras enviadas: ',num2str(i)]);
    end
end


% Función para recibir el vector 'cantidad' de 250 datos
function cantidad = recibir_vector(serial_port, num_datos)
    cantidad = zeros(1, num_datos);  % Inicializar el vector con la cantidad esperada
    disp('Recibiendo vector "cantidad"...');
    
    for i = 1:num_datos
        while true
            if serial_port.NumBytesAvailable > 0
                % Leer el dato recibido
                cantidad(i) = read(serial_port, 1, 'uint8');
                disp(['Dato recibido en "cantidad" (', num2str(i), '): ', num2str(cantidad(i))]);
                break;  % Salir del bucle
            end
        end
    end
    
    disp('Recepción de "cantidad" completa.');
end

% Función para recibir palabras de 16 bits (2 bytes cada una)
% num_palabras ahora se refiere al número de palabras de 8 bits
function palabras_16_bits = recibir_palabras_16bits(serial_port, num_bytes)
    num_palabras = floor(num_bytes / 2);  % Calcula cuántas palabras de 16 bits se pueden formar
    palabras_16_bits = zeros(1, num_palabras);  % Inicializar el vector para las palabras de 16 bits
    disp('Recibiendo palabras de 16 bits...');

    for i = 1:num_palabras
        while true
            if serial_port.NumBytesAvailable >= 2  % Espera que haya al menos 2 bytes disponibles
                byte_high = read(serial_port, 1, 'uint8');  % Leer byte alto
                byte_low = read(serial_port, 1, 'uint8');   % Leer byte bajo
                
                % Combinar los dos bytes para formar una palabra de 16 bits
                palabras_16_bits(i) = bitor(bitshift(byte_high, 8), byte_low);  % (byte alto << 8) | byte bajo
                
                disp(['Palabra de 16 bits recibida (', num2str(i), '): ', num2str(palabras_16_bits(i))]);
                break;  % Salir del bucle
            end
        end
    end
    
    disp('Recepción de palabras de 16 bits completa.');
end
