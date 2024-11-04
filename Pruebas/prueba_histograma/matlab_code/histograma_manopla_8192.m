function histograma = histograma_manopla_8192(energia)
    % Inicializa el histograma con 32 bins en cero
    histograma = zeros(1, 32);

    % Clasifica el valor de energia en uno de los bins
    if (energia >= 0 && energia < 256)
        histograma(1) = histograma(1) + 1;
    elseif (energia >= 256 && energia < 512)
        histograma(2) = histograma(2) + 1;
    elseif (energia >= 512 && energia < 768)
        histograma(3) = histograma(3) + 1;
    elseif (energia >= 768 && energia < 1024)
        histograma(4) = histograma(4) + 1;
    elseif (energia >= 1024 && energia < 1280)
        histograma(5) = histograma(5) + 1;
    elseif (energia >= 1280 && energia < 1536)
        histograma(6) = histograma(6) + 1;
    elseif (energia >= 1536 && energia < 1792)
        histograma(7) = histograma(7) + 1;
    elseif (energia >= 1792 && energia < 2048)
        histograma(8) = histograma(8) + 1;
    elseif (energia >= 2048 && energia < 2304)
        histograma(9) = histograma(9) + 1;
    elseif (energia >= 2304 && energia < 2560)
        histograma(10) = histograma(10) + 1;
    elseif (energia >= 2560 && energia < 2816)
        histograma(11) = histograma(11) + 1;
    elseif (energia >= 2816 && energia < 3072)
        histograma(12) = histograma(12) + 1;
    elseif (energia >= 3072 && energia < 3328)
        histograma(13) = histograma(13) + 1;
    elseif (energia >= 3328 && energia < 3584)
        histograma(14) = histograma(14) + 1;
    elseif (energia >= 3584 && energia < 3840)
        histograma(15) = histograma(15) + 1;
    elseif (energia >= 3840 && energia < 4096)
        histograma(16) = histograma(16) + 1;
    elseif (energia >= 4096 && energia < 4352)
        histograma(17) = histograma(17) + 1;
    elseif (energia >= 4352 && energia < 4608)
        histograma(18) = histograma(18) + 1;
    elseif (energia >= 4608 && energia < 4864)
        histograma(19) = histograma(19) + 1;
    elseif (energia >= 4864 && energia < 5120)
        histograma(20) = histograma(20) + 1;
    elseif (energia >= 5120 && energia < 5376)
        histograma(21) = histograma(21) + 1;
    elseif (energia >= 5376 && energia < 5632)
        histograma(22) = histograma(22) + 1;
    elseif (energia >= 5632 && energia < 5888)
        histograma(23) = histograma(23) + 1;
    elseif (energia >= 5888 && energia < 6144)
        histograma(24) = histograma(24) + 1;
    elseif (energia >= 6144 && energia < 6400)
        histograma(25) = histograma(25) + 1;
    elseif (energia >= 6400 && energia < 6656)
        histograma(26) = histograma(26) + 1;
    elseif (energia >= 6656 && energia < 6912)
        histograma(27) = histograma(27) + 1;
    elseif (energia >= 6912 && energia < 7168)
        histograma(28) = histograma(28) + 1;
    elseif (energia >= 7168 && energia < 7424)
        histograma(29) = histograma(29) + 1;
    elseif (energia >= 7424 && energia < 7680)
        histograma(30) = histograma(30) + 1;
    elseif (energia >= 7680 && energia < 7936)
        histograma(31) = histograma(31) + 1;
    elseif (energia >= 7936 && energia <= 8192)
        histograma(32) = histograma(32) + 1;
    else
        disp("Valor fuera de rango");
    end
end
