`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 10:02:35 AM
// Design Name: 
// Module Name: Sep_Unidades
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Sep_Unidades(
    input [7:0] In1, //Numero de dos dígitos original
    input [7:0] In2, //Digito de los decimales
    output [7:0] Out
    );
    
    wire [7:0] Decimas;
    wire [7:0] Enteros;
    
    assign Decimas = In2 * 8'b00001010;
    
    Restador8bits Resta(
    .IN1(In1),
    .IN2(Decimas),
    .OUT(Enteros));
    
    assign Out = Enteros;
    
endmodule
