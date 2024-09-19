% Script de prueba para enviar y recibir datos por puerto serie

% Configuración del puerto serie
port_name = 'COM13';  % Cambia este valor por el puerto serie correcto en tu sistema
baud_rate = 115200;    % Asegúrate de que coincida con la configuración del dispositivo

% Crear objeto de puerto serie
serial_port = serialport(port_name, baud_rate, 'Timeout', 10);  % Timeout de 10 segundos

% Configurar el tamaño de la trama de datos
configureTerminator(serial_port, "LF");  % Línea de finalización (line feed)

% Vector de datos a enviar (cada valor debe ser <= 255)
%datos_a_enviar = [100, 150, 200, 255, 0, 32, 64];  % Puedes cambiar estos valores
datos_a_enviar = uint8(255*rand(1,100));
% Llamada a la función para enviar y recibir datos
enviar_y_recibir_datos(serial_port, datos_a_enviar);

% Cerrar el puerto serie
clear serial_port;

function enviar_y_recibir_datos(serial_port, datos)
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
    end
end
