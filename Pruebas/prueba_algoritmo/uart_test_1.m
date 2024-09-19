% Configuración del puerto serie
port_name = 'COM3';  % Cambia este valor por el puerto serie correcto en tu sistema
baud_rate = 115200;    % Asegúrate de que coincida con la configuración del dispositivo

% Crear objeto de puerto serie
serial_port = serialport(port_name, baud_rate, 'Timeout', 10);  % Timeout de 10 segundos

% Configurar el tamaño de la trama de datos
configureTerminator(serial_port, "LF");  % Línea de finalización (line feed)

% Número a enviar (entre 0 y 255)
numero_a_enviar = 150;  % Cambia este número como desees (debe ser <= 255)

% Enviar número por puerto serie
write(serial_port, numero_a_enviar, 'uint8');
disp(['Número enviado: ', num2str(numero_a_enviar)]);

% Esperar y verificar continuamente si hay datos disponibles
disp('Esperando respuesta...');
while true
    if serial_port.NumBytesAvailable > 0
        % Leer número recibido por el puerto serie
        numero_recibido = read(serial_port, 1, 'uint8');
        disp(['Número recibido: ', num2str(numero_recibido)]);
        break;  % Salir del bucle tras recibir el dato
    end
end

fclose(serial_port);
% Cerrar el puerto serie
clear serial_port;
