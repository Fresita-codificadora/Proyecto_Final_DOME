% Configura la comunicación serial
s = serialport('COM13', 115200); % Cambia 'COM3' por el puerto adecuado
s.Timeout = 10; % Tiempo de espera en segundos, ajusta si es necesario

% Define el vector de datos a enviar
data_vector = energia2; % Reemplaza con tus valores
if data_vector(end) ~= 0
    data_vector = [data_vector, 0]; % Agrega el cero adicional si no está presente
end

% Inicia el envío de datos
for i = 1:length(data_vector)
    data = data_vector(i);
    high_byte = bitshift(data, -8); % Byte alto
    low_byte = bitand(data, 255);   % Byte bajo

    % Enviar ambos bytes y mostrar el tráfico de envío
    write(s, high_byte, "uint8");
    disp(['Byte enviado (alto): ', num2str(high_byte)]);
    write(s, low_byte, "uint8");
    disp(['Byte enviado (bajo): ', num2str(low_byte)]);

    if data > 0
    % Espera el ACK
    ack = read(s, 1, "uint8");
    while ack ~= 128
        disp('ACK no recibido correctamente, reintentando...');
        ack = read(s, 1, "uint8"); % Reintenta hasta recibir el ACK
    end
    disp(['ACK recibido correctamente: ', num2str(ack),' ', num2str(i)]);
    end
end

% Empieza la captura de las 32 palabras del histograma después de enviar todos los datos
num_words = 32; % Número de palabras esperadas para el histograma
histogram_data = zeros(1, num_words); % Almacena el histograma

disp('Iniciando captura de datos del histograma...');
for j = 1:num_words
    % Recibe los dos bytes y muestra el tráfico de recepción
    high_byte = read(s, 1, "uint8");
    disp(['Byte recibido (alto): ', num2str(high_byte)]);
    low_byte = read(s, 1, "uint8");
    disp(['Byte recibido (bajo): ', num2str(low_byte)]);
    
    % Une los dos bytes en una palabra de 16 bits
    histogram_data(j) = bitor(bitshift(high_byte, 8), low_byte);
    disp(['Palabra de 16 bits formada: ', num2str(histogram_data(j))]);
end

% Imprime el histograma recibido
disp('Datos del histograma:');
disp(histogram_data);
figure
bar(histogram_data);
title('histograma con la FPGA')

% Cierra el puerto serial al terminar
clear s;
