`timescale 1ns / 1ps

module ascii_a_binario(input [3:0] Au, [3:0] Bu, [3:0] Ad, [3:0] Bd, output [7:0] N);

    // bloque multiplicador de las decenas por 10
    reg [6:0] multiA;  // valor de la multiplicacion de Ad x 10
    reg [6:0] multiB;  // valor de la multiplicacion de Bd x 10
    always @ *
        begin
        multiA <= Ad * 4'b1010;
        multiB <= Bd * 4'b1010;
        end

    // bloque sumador de la decena y la unidad
    reg [6:0] sumA;
    reg [6:0] sumB;
    always @ *
        begin
        sumA <= multiA + Au;
        sumB <= multiB + Bu;
        end
    
    // bloque para sumar A y B en binario  
    reg [7:0] sum;
    always @ *
        begin
        sum <= sumA + sumB;
        end
        
    assign N = sum;

endmodule