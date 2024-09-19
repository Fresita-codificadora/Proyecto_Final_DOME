module test_uart_tx_rx (
    input           clk			,
    input           reset		,
    input   [7:0]   rx_in		,
    input           i_rx_dv	,//entrada del modulo rx mostrando que tiene un byte
    input           i_tx_done	,

    //output
    output reg   [7:0]  tx_out,
//    output reg    [7:0] registro_entrada,
    output reg          o_uart_tx
);
reg     [7:0]  registro_entrada;
reg     [7:0] dato_prev ;
    
    always @(posedge clk or negedge reset ) begin
        if (!reset) begin
            registro_entrada <= 8'h00;
            dato_prev <= 8'h00;
				o_uart_tx <= 1'b0;
				dato_prev <= 8'h00;
//				registro_entrada_int <= 8'h00;				
        end
        else if (i_rx_dv) begin //si recibo un nuevo byte
            registro_entrada <= rx_in;
//            registro_entrada_int <= rx_in;
        end
        else if (!i_tx_done) begin
            if(registro_entrada != dato_prev)begin                   //verifico que no este mandando otro dato
               tx_out<=registro_entrada+8'd10;
               o_uart_tx <= 1'b1;
               dato_prev<=registro_entrada;           //actualizo dato_prev
				end
        end			
        else begin
				o_uart_tx <= 1'b0;
				tx_out <= 8'h00;
		end 
    end
    
endmodule