`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 11:43:36 AM
// Design Name: 
// Module Name: Sep_Decenas
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


module Sep_Decenas(
    input [7:0] IN,
    output [7:0] OUT
    );
    
    reg [3:0] aComparar; //Se guardaran los digitos a comparar 
    reg [2:0] Throwaway1; //Para poder extraer los bits del [6:3], se requiere poner el resto,
    reg MSB;// [0:2] y 7, en alguna parte 
    reg MSB2; //Porque para una de las comparaciones, se requiere el segundo MSB del número 
    reg [5:0] Throwaway2; //Para poder poner los bits para hayar el segundo MSB en alguna parte
    wire [8:0] ResultadoCompar;
    reg A,B,C,D,E,F,G,H,I; //Se debe guardar en alguna parte los resultados de la comparacion
    reg mayorA10;
    reg [3:0] Temp1;
    wire Temp2, Temp3, Temp4;
    wire [3:0] Digito;
    
    always @(*)
    begin
    {MSB,aComparar,Throwaway1} <= IN ;
    {MSB,MSB2,Throwaway2} <= IN;
    A = 1'b0;
    B = 1'b0;
    C = 1'b0;
    D = 1'b0;
    E = 1'b0;
    F = 1'b0;
    G = 1'b0;
    H = 1'b0;
    I = 1'b0;
    mayorA10 <= IN > 10; 
    if (MSB > MSB2)
      Temp1 = 4'b1010;
    else if (MSB < MSB2)
      Temp1 = 4'b0110;
    else
      Temp1 = 4'b0010;
    end
    
    comparador_gel Comparacion(
    .a(aComparar),
    .b(Temp1),
    .g(Temp2),
    .e(Temp3),
    .l(Temp4));
    
    always @(*)
    begin
    if (MSB > MSB2) begin
      I = Temp2;
      H = Temp3;
      G = Temp4;
      end
    else if (MSB < MSB2) begin
      F = Temp2;
      E = Temp3;
      D = Temp4;
      end
    else begin
      C = Temp2; 
      B = Temp3;
      A = Temp4  & mayorA10;
      end
    end
    
    assign ResultadoCompar = {A,B,C,D,E,F,G,H,I};
    
    codificador10a4 Codificador(
    .E(ResultadoCompar),
    .O(Digito));
    
    assign OUT = 8'b00000000 + Digito;
    
endmodule
