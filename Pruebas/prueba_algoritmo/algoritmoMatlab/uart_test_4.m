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

% Ahora recibir el vector adicional 'cantidad' (250 datos)
cantidad = recibir_vector(serial_port, 250);

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
