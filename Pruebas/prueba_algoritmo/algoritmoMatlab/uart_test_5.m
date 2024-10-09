% Script de prueba para enviar y recibir datos por puerto serie
%clear
%clc
% Configuración del puerto serie
port_name = 'COM13';  % Cambia este valor por el puerto serie correcto en tu sistema
baud_rate = 115200;    % Asegúrate de que coincida con la configuración del dispositivo
% Crear objeto de puerto serie
serial_port = serialport(port_name, baud_rate, 'Timeout', 10);  % Timeout de 10 segundos

% Configurar el tamaño de la trama de datos
configureTerminator(serial_port, "LF");  % Línea de finalización (line feed)

% Vector de datos a enviar (cada valor debe ser <= 255)
datos_a_enviar = imagen_a_vector('testPulenta.png');

% Llamada a la función para enviar y recibir datos
vector_recibido = enviar_y_recibir_datos(serial_port, datos_a_enviar);

% Recibir el vector adicional 'cantidad' (250 datos)
cantidad = recibir_vector(serial_port, 250);

% Recibir las palabras de 16 bits después de los datos de 'cantidad'
num_palabras = 249;  % Suponiendo que vamos a recibir 100 palabras de 16 bits
palabras_16_bits = recibir_palabras_16bits(serial_port, num_palabras);

% Mostrar imagen recibida
imgTest = vector_a_imagen(vector_recibido, 97);
imshow(imgTest);
colormap colorcube

% Cerrar el puerto serie
clear serial_port;

% Función para enviar y recibir datos por puerto serie
function [vector] = enviar_y_recibir_datos(serial_port, datos)
    vector = zeros(1, length(datos));  % Inicializa el vector de respuesta
    for i = 1:length(datos)
        dato_a_enviar = datos(i);  % Obtener el dato a enviar
        write(serial_port, dato_a_enviar, 'uint8');  % Enviar el dato por el puerto serie
        disp(['Dato enviado: ', num2str(dato_a_enviar)]);
        
        % Esperar a recibir un dato antes de enviar el siguiente
        while true
            if serial_port.NumBytesAvailable > 0
                dato_recibido = read(serial_port, 1, 'uint8');  % Leer el dato recibido
                disp(['Dato recibido: ', num2str(dato_recibido)]);
                break;  % Salir del bucle
            end
        end
        vector(i) = dato_recibido;  % Guardar el dato recibido
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
function palabras_16_bits = recibir_palabras_16bits(serial_port, num_palabras)
    palabras_16_bits = zeros(1, num_palabras);  % Inicializar el vector para las palabras de 16 bits
    disp('Recibiendo palabras de 16 bits...');

    for i = 1:num_palabras
        while true
            if serial_port.NumBytesAvailable >= 2  % Espera que haya al menos 2 bytes disponibles
                byte_high = read(serial_port, 1, 'uint8');  % Leer byte alto
                byte_low = read(serial_port, 1, 'uint8');   % Leer byte bajo
                
                % Combinar los dos bytes para formar una palabra de 16 bits
                palabras_16_bits(i) = bitor(bitshift(byte_high, 8), byte_low);  % (byte alto << 8) | byte bajo
                
                disp(['Palabra recibida (', num2str(i), '): ', num2str(palabras_16_bits(i))]);
                break;  % Salir del bucle
            end
        end
    end
    
    disp('Recepción de palabras de 16 bits completa.');
end
