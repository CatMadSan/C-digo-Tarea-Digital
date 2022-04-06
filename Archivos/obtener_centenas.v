`timescale 1ns / 1ps

module obtener_centenas(input [3:0] Au, [3:0] Bu, [3:0] Ad, [3:0] Bd, output [7:0] O, Cc);
    // bloque para restarle 100
    
    wire [7:0] N;
    
    ascii_a_binario(Au, Bu, Ad, Bd, N);
    
    reg [7:0] sum; 
    always @* begin
        sum = N + 8'b00011100;
        sum[7] = 0;
    end

    // bloque para comparar el numero original con 100
    wire mayor;
    assign mayor = (N>=8'd100) ? 1'b1:1'b0;  
  
    // bloque de mux para elegir entre el numero orignal o la resta
    // HAY QUE TENER UNA FORMA DE VER SI ES 100
    assign O = mayor ? sum : N;    
    assign Cc = mayor;

endmodule
