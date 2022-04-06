`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2022 11:21:46 PM
// Design Name: 
// Module Name: Restador
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


module Restador8bits(
    input [7:0] IN1, 
    output [7:0] OUT,
    input [7:0] IN2
    );
    
    wire [7:0] Sustraendo; //aqui se va a guardar el complemento a 2 para la resta
    reg [8:0] Temp1; //Registro relleno de 9 bits, por si acaso hay overflow
    
    Cmp2 Neg( // se guarda en Sustraendo el, pues, sustraendo
    .IN(IN2),
    .OUT(Sustraendo)); 
    
    always @(*)
    begin
    Temp1 <= IN1 + Sustraendo; //ejecuta la resta, sumando el minuendo y el comp. 2 del sustraendo
    end
    assign OUT = Temp1; //asigna a OUT el resultado. Como OUT es de 8 bits, y Temp1 de 9, OUT solo tomara los LSB, justo los que necesitamos
endmodule
