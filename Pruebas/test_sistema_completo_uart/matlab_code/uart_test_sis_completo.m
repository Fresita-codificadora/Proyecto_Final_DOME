% Script de prueba para enviar y recibir datos por puerto serie
%clear
%clc
% Configuración del puerto serie
port_name = 'COM9';  % Cambia este valor por el puerto serie correcto en tu sistema
baud_rate = 115200;    % Asegúrate de que coincida con la configuración del dispositivo
% Crear objeto de puerto serie
serial_port = serialport(port_name, baud_rate, 'Timeout', 10);  % Timeout de 10 segundos

% Configurar el tamaño de la trama de datos
configureTerminator(serial_port, "LF");  % Línea de finalización (line feed)

% Vector de datos a enviar (cada valor debe ser <= 255)
datos_a_enviar = imagen_a_vector('testPulenta.png');

% Llamada a la función para enviar y recibir datos
vector_recibido = enviar_y_recibir_datos(serial_port, datos_a_enviar);

% Mostrar imagen recibida
%imgTest = vector_a_imagen(vector_recibido, 97);
%imshow(imgTest,[]);
%colormap colorcube

% Cerrar el puerto serie
clear serial_port;

function [acks_recibidos] = enviar_y_recibir_datos(serial_port, datos)
    % Función para enviar datos por puerto serie y recibir 1 byte de ACK por cada dato enviado.
    % serial_port: objeto del puerto serie
    % datos: vector de datos a enviar (cada valor debe ser <= 255)
    
    % Inicializamos el vector para guardar los ACKs recibidos
    num_datos = length(datos);
    acks_recibidos = zeros(1, num_datos, 'uint8');  % Vector de ACKs de 8 bits

    for i = 1:num_datos
        % Obtener el dato a enviar (un byte)
        dato_a_enviar = datos(i);  
        
        % Mostrar el número del dato enviado
        disp(['Dato ', num2str(i), ': ', num2str(dato_a_enviar)]);
        
        % Enviar el dato por el puerto serie (1 byte)
        write(serial_port, dato_a_enviar, 'uint8');
        
        % Esperar a recibir 1 byte (ACK)
        while serial_port.NumBytesAvailable < 1
            % Esperar hasta que haya al menos 1 byte disponible
        end

        % Leer el byte recibido (ACK)
        ack = read(serial_port, 1, 'uint8');

        % Guardar el ACK recibido en el vector
        acks_recibidos(i) = ack;
        
        % Mostrar el dato recibido
        disp(['ACK recibido: ', num2str(ack)]);
    end
end




