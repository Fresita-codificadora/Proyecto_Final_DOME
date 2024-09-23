% Script de prueba para enviar y recibir datos por puerto serie
clear
clc
% Configuración del puerto serie
port_name = 'COM14';  % Cambia este valor por el puerto serie correcto en tu sistema
baud_rate = 115200;    % Asegúrate de que coincida con la configuración del dispositivo

% Crear objeto de puerto serie
serial_port = serialport(port_name, baud_rate, 'Timeout', 10);  % Timeout de 10 segundos

% Configurar el tamaño de la trama de datos
configureTerminator(serial_port, "LF");  % Línea de finalización (line feed)

% Vector de datos a enviar (cada valor debe ser <= 255)

% Llamada a la función para enviar y recibir datos
%%enviar_y_recibir_datos(serial_port, datos_a_enviar);
%%datos_a_enviar = [1,2,0,3,4,0,5,6,0,7,8,0,0,0,9,10];
%%datos_a_enviar = [100, 100, 100, 0,0,0, 100, 100, 0, 0, 0, 100 ,100, 0, 0,0 ,100 ,100,0,100,100,0,0,0,100,100,0,0,0,1,1,1, 1, 1, 0,0,0, 1, 1, 0, 0, 0, 1 ,1, 0, 0,0 ,1 ,1,0,1,1,0,0,0,1,1,0,0,0,1,1];  % Puedes cambiar estos valores
%datos_a_enviar = [1,0];
%%datos_a_enviar = uint8(rand(1,100));
% Llamada a la función para enviar y recibir datos
vector_recibido=enviar_y_recibir_datos(serial_port, datos_a_enviar);


% Cerrar el puerto serie
clear serial_port;

function [vector] = enviar_y_recibir_datos(serial_port, datos)
    % Función para enviar datos por puerto serie y esperar una respuesta
    % serial_port: objeto del puerto serie
    % datos: vector de datos a enviar (máximo 255 cada uno)
    
    % Recorre el vector de datos
    for i = 1:length(datos)
        dato_a_enviar = datos(i);  % Obtener el dato a enviar
        
        % Enviar el dato por el puerto serie
        write(serial_port, dato_a_enviar, 'uint8');
        disp(['Dato enviado: ', num2str(dato_a_enviar)]);
        
        % Esperar a recibir un dato antes de enviar el siguiente
        while true
            if serial_port.NumBytesAvailable > 0
                % Leer el dato recibido
                dato_recibido = read(serial_port, 1, 'uint8');
                disp(['Dato recibido: ', num2str(dato_recibido)]);
                break;  % Salir del bucle y enviar el siguiente dato
            end
        end
     vector(i)=dato_recibido;
    end
end
