function img = vector_a_imagen(vector, ancho)
    % Obtener el tamaño del vector
    longitud_vector = length(vector);
    
    % Calcular la altura de la imagen con base en el ancho
    alto = longitud_vector / ancho;
    
    % Verificar si el ancho y el alto son consistentes con la longitud del vector
    if mod(longitud_vector, ancho) ~= 0
        error('El ancho proporcionado no es consistente con la longitud del vector.');
    end
    
    % Convertir el vector en una matriz (imagen) con el tamaño adecuado
    img = reshape(vector, [ancho, alto])';
    
    % Convertir la matriz a uint8
    %%img = uint32(img);
    img=double(img);
    % Mostrar información sobre la imagen
    fprintf('La imagen reconstruida tiene un tamaño de %dx%d\n', size(img,1), size(img,2));
end
