function corrected_vector = corregir_desalineamiento(vector)
    % Asegurarse de que el vector sea double y se convierta en uint16
    vector_uint16 = uint16(vector);
    
    % Inicializar el vector corregido
    corrected_vector = zeros(1, length(vector_uint16) - 1, 'uint16');
    
    % Corregir el desalineamiento
    for i = 1:length(vector_uint16)-1
        % Tomar los últimos 8 bits del número actual (bits menos significativos)
        parte_superior = bitand(vector_uint16(i), 255);
        
        % Tomar los primeros 8 bits del siguiente número (bits más significativos)
        parte_inferior = bitshift(vector_uint16(i+1), -8);
        
        % Combinar ambas partes en el número corregido
        corrected_vector(i) = bitor(bitshift(parte_superior, 8), parte_inferior);
    end
    
    % El último valor no puede ser corregido directamente, lo descartamos
end
