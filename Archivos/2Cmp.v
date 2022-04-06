`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2022 10:38:20 AM
// Design Name: 
// Module Name: Complemento2
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


module Cmp2(
    input [7:0] IN, //Entra número binario, 8 bits
    output [7:0] OUT //Sale número binario, 8 bits
    );
    reg [7:0] Temp;
    reg [7:0] Temp2;
    always @(*)
    begin
    Temp <= ~IN; //Invierte bits
    Temp2 <= Temp + 8'b00000001;//Les suma 1
    end
    assign OUT = Temp2;//Asigna este complemento a 2 a la salida
endmodule