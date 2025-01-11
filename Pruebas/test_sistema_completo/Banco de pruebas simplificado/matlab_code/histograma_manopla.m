function histograma = histograma_manopla(energia)
    % Inicializa el histograma con 32 bins en cero
    histograma = zeros(1, 32);

    % Recorre cada valor de energia
    for i = 1:length(energia)
        if (energia(i) >= 512 && energia(i) < 1024)
            histograma(2) = histograma(2) + 1;
        elseif (energia(i) >= 1024 && energia(i) < 1536)
            histograma(3) = histograma(3) + 1;
        elseif (energia(i) >= 1536 && energia(i) < 2048)
            histograma(4) = histograma(4) + 1;
        elseif (energia(i) >= 2048 && energia(i) < 2560)
            histograma(5) = histograma(5) + 1;
        elseif (energia(i) >= 2560 && energia(i) < 3072)
            histograma(6) = histograma(6) + 1;
        elseif (energia(i) >= 3072 && energia(i) < 3584)
            histograma(7) = histograma(7) + 1;
        elseif (energia(i) >= 3584 && energia(i) < 4096)
            histograma(8) = histograma(8) + 1;
        elseif (energia(i) >= 4096 && energia(i) < 4608)
            histograma(9) = histograma(9) + 1;
        elseif (energia(i) >= 4608 && energia(i) < 5120)
            histograma(10) = histograma(10) + 1;
        elseif (energia(i) >= 5120 && energia(i) < 5632)
            histograma(11) = histograma(11) + 1;
        elseif (energia(i) >= 5632 && energia(i) < 6144)
            histograma(12) = histograma(12) + 1;
        elseif (energia(i) >= 6144 && energia(i) < 6656)
            histograma(13) = histograma(13) + 1;
        elseif (energia(i) >= 6656 && energia(i) < 7168)
            histograma(14) = histograma(14) + 1;
        elseif (energia(i) >= 7168 && energia(i) < 7680)
            histograma(15) = histograma(15) + 1;
        elseif (energia(i) >= 7680 && energia(i) < 8192)
            histograma(16) = histograma(16) + 1;
        elseif (energia(i) >= 8192 && energia(i) < 8704)
            histograma(17) = histograma(17) + 1;
        elseif (energia(i) >= 8704 && energia(i) < 9216)
            histograma(18) = histograma(18) + 1;
        elseif (energia(i) >= 9216 && energia(i) < 9728)
            histograma(19) = histograma(19) + 1;
        elseif (energia(i) >= 9728 && energia(i) < 10240)
            histograma(20) = histograma(20) + 1;
        elseif (energia(i) >= 10240 && energia(i) < 10752)
            histograma(21) = histograma(21) + 1;
        elseif (energia(i) >= 10752 && energia(i) < 11264)
            histograma(22) = histograma(22) + 1;
        elseif (energia(i) >= 11264 && energia(i) < 11776)
            histograma(23) = histograma(23) + 1;
        elseif (energia(i) >= 11776 && energia(i) < 12288)
            histograma(24) = histograma(24) + 1;
        elseif (energia(i) >= 12288 && energia(i) < 12800)
            histograma(25) = histograma(25) + 1;
        elseif (energia(i) >= 12800 && energia(i) < 13312)
            histograma(26) = histograma(26) + 1;
        elseif (energia(i) >= 13312 && energia(i) < 13824)
            histograma(27) = histograma(27) + 1;
        elseif (energia(i) >= 13824 && energia(i) < 14336)
            histograma(28) = histograma(28) + 1;
        elseif (energia(i) >= 14336 && energia(i) < 14848)
            histograma(29) = histograma(29) + 1;
        elseif (energia(i) >= 14848 && energia(i) < 15360)
            histograma(30) = histograma(30) + 1;
        elseif (energia(i) >= 15360 && energia(i) < 15872)
            histograma(31) = histograma(31) + 1;
        elseif (energia(i) >= 15872 && energia(i) <= 16384)
            histograma(32) = histograma(32) + 1;
        else
            histograma(1) = histograma(1) + 1;
        end
    end
end
