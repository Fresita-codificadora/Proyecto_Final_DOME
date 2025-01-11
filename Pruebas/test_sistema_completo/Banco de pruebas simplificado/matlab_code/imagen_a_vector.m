function vector = imagen_a_vector(imagen_path)
    % Leer la imagen en blanco y negro
    img = imread(imagen_path);
    
    % Asegurarse de que la imagen sea en blanco y negro (grayscale)
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    
    % Convertir la imagen en un vector de 1 fila (aplanar por filas)
    vector = reshape(img', 1, []);  % Aplanar la imagen por filas
    
    % Convertir el vector al formato uint8
    vector = uint8(vector);
    
    % Mostrar información de la imagen y el vector
    fprintf('Tamaño de la imagen: %dx%d\n', size(img,1), size(img,2));
    fprintf('Longitud del vector: %d\n', length(vector));
end
