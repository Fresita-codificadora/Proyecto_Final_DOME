function histograma = histograma_manopla_1024(energia)
    % Inicializa el histograma con 32 bins en cero
    histograma = zeros(1, 32);

    % Clasifica el valor de energia en uno de los bins
    if (energia >= 0 && energia < 32)
        histograma(1) = 1;
    elseif (energia >= 32 && energia < 64)
        histograma(2) =  1;
    elseif (energia >= 64 && energia < 96)
        histograma(3) =  1;
    elseif (energia >= 96 && energia < 128)
        histograma(4) = 1;
    elseif (energia >= 128 && energia < 160)
        histograma(5) =  1;
    elseif (energia >= 160 && energia < 192)
        histograma(6) =  1;
    elseif (energia >= 192 && energia < 224)
        histograma(7) =  1;
    elseif (energia >= 224 && energia < 256)
        histograma(8) =  1;
    elseif (energia >= 256 && energia < 288)
        histograma(9) =  1;
    elseif (energia >= 288 && energia < 320)
        histograma(10) =  1;
    elseif (energia >= 320 && energia < 352)
        histograma(11) =  1;
    elseif (energia >= 352 && energia < 384)
        histograma(12) =  1;
    elseif (energia >= 384 && energia < 416)
        histograma(13) =  1;
    elseif (energia >= 416 && energia < 448)
        histograma(14) =  1;
    elseif (energia >= 448 && energia < 480)
        histograma(15) =  1;
    elseif (energia >= 480 && energia < 512)
        histograma(16) =  1;
    elseif (energia >= 512 && energia < 544)
        histograma(17) =  1;
    elseif (energia >= 544 && energia < 576)
        histograma(18) =  1;
    elseif (energia >= 576 && energia < 608)
        histograma(19) =  1;
    elseif (energia >= 608 && energia < 640)
        histograma(20) =  1;
    elseif (energia >= 640 && energia < 672)
        histograma(21) =  1;
    elseif (energia >= 672 && energia < 704)
        histograma(22) =  1;
    elseif (energia >= 704 && energia < 736)
        histograma(23) =  1;
    elseif (energia >= 736 && energia < 768)
        histograma(24) =  1;
    elseif (energia >= 768 && energia < 800)
        histograma(25) =  1;
    elseif (energia >= 800 && energia < 832)
        histograma(26) =  1;
    elseif (energia >= 832 && energia < 864)
        histograma(27) =  1;
    elseif (energia >= 864 && energia < 896)
        histograma(28) =  1;
    elseif (energia >= 896 && energia < 928)
        histograma(29) =  1;
    elseif (energia >= 928 && energia < 960)
        histograma(30) =  1;
    elseif (energia >= 960 && energia < 992)
        histograma(31) =  1;
    elseif (energia >= 992 && energia <= 1024)
        histograma(32) = 1;
    else
        disp("Valor fuera de rango");
    end
end
