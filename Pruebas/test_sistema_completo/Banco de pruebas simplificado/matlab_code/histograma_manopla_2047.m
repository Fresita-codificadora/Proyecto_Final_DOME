function histograma = histograma_manopla_2047(energia)
    % Inicializa el histograma con 32 bins en cero
    histograma = zeros(1, 32);

    % Clasifica el valor de energia en uno de los bins
    if (energia >= 0 && energia < 64)
        histograma(1) = histograma(1) + 1;
    elseif (energia >= 64 && energia < 128)
        histograma(2) = histograma(2) + 1;
    elseif (energia >= 128 && energia < 192)
        histograma(3) = histograma(3) + 1;
    elseif (energia >= 192 && energia < 256)
        histograma(4) = histograma(4) + 1;
    elseif (energia >= 256 && energia < 320)
        histograma(5) = histograma(5) + 1;
    elseif (energia >= 320 && energia < 384)
        histograma(6) = histograma(6) + 1;
    elseif (energia >= 384 && energia < 448)
        histograma(7) = histograma(7) + 1;
    elseif (energia >= 448 && energia < 512)
        histograma(8) = histograma(8) + 1;
    elseif (energia >= 512 && energia < 576)
        histograma(9) = histograma(9) + 1;
    elseif (energia >= 576 && energia < 640)
        histograma(10) = histograma(10) + 1;
    elseif (energia >= 640 && energia < 704)
        histograma(11) = histograma(11) + 1;
    elseif (energia >= 704 && energia < 768)
        histograma(12) = histograma(12) + 1;
    elseif (energia >= 768 && energia < 832)
        histograma(13) = histograma(13) + 1;
    elseif (energia >= 832 && energia < 896)
        histograma(14) = histograma(14) + 1;
    elseif (energia >= 896 && energia < 960)
        histograma(15) = histograma(15) + 1;
    elseif (energia >= 960 && energia < 1024)
        histograma(16) = histograma(16) + 1;
    elseif (energia >= 1024 && energia < 1088)
        histograma(17) = histograma(17) + 1;
    elseif (energia >= 1088 && energia < 1152)
        histograma(18) = histograma(18) + 1;
    elseif (energia >= 1152 && energia < 1216)
        histograma(19) = histograma(19) + 1;
    elseif (energia >= 1216 && energia < 1280)
        histograma(20) = histograma(20) + 1;
    elseif (energia >= 1280 && energia < 1344)
        histograma(21) = histograma(21) + 1;
    elseif (energia >= 1344 && energia < 1408)
        histograma(22) = histograma(22) + 1;
    elseif (energia >= 1408 && energia < 1472)
        histograma(23) = histograma(23) + 1;
    elseif (energia >= 1472 && energia < 1536)
        histograma(24) = histograma(24) + 1;
    elseif (energia >= 1536 && energia < 1600)
        histograma(25) = histograma(25) + 1;
    elseif (energia >= 1600 && energia < 1664)
        histograma(26) = histograma(26) + 1;
    elseif (energia >= 1664 && energia < 1728)
        histograma(27) = histograma(27) + 1;
    elseif (energia >= 1728 && energia < 1792)
        histograma(28) = histograma(28) + 1;
    elseif (energia >= 1792 && energia < 1856)
        histograma(29) = histograma(29) + 1;
    elseif (energia >= 1856 && energia < 1920)
        histograma(30) = histograma(30) + 1;
    elseif (energia >= 1920 && energia < 1984)
        histograma(31) = histograma(31) + 1;
    elseif (energia >= 1984 && energia <= 2048)
        histograma(32) = histograma(32) + 1;
    else
        disp("Valor fuera de rango");
    end
end
