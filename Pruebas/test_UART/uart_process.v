module uart_process (
    input  wire         clk,
    input  wire         resetn,
    input  wire [7:0]   rx_data,       // Dato recibido desde UART_RX
    input  wire         rx_data_valid, // Señal de dato válido desde UART_RX
    output reg  [7:0]   tx_data,       // Dato a enviar a UART_TX
    output reg          tx_en          // Señal de habilitación para UART_TX
);

always @(posedge clk or negedge resetn) begin
    if (!resetn) begin
        tx_data <= 8'b0;
        tx_en   <= 1'b0;
    end else if (rx_data_valid) begin
        tx_data <= rx_data + 8'd10; // Suma 10 al dato recibido
        tx_en   <= 1'b1;            // Habilita la transmisión
    end else begin
        tx_en   <= 1'b0;            // Deshabilita la transmisión cuando no hay dato nuevo
    end
end

endmodule
