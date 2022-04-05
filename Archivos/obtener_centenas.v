`timescale 1ns / 1ps

module obtener_centenas(inout [7:0] N, output [7:0] O, [3:0] Cc);
    // bloque para restarle 100
    reg [7:0] sum; 
    always @* begin
        sum <= N + 8'b00011100;
        sum[7] = 0;
    end

    // bloque para comparar el numero original con 100
    wire igual, mayor, menor;
    assign menor = (N<6'd100) ? 1'b1:1'b0;   
    assign mayor = (N>6'd100 && N==6'd100) ? 1'b1:1'b0;  
  
    // bloque de mux para elegir entre el numero orignal o la resta
    // HAY QUE TENER UNA FORMA DE VER SI ES 100
    assign O = mayor ? sum : N;    
    assign Cc = mayor;

endmodule
