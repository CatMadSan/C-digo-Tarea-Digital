`timescale 1ns / 1ps


module codificador10a4(input [8:0] E, output reg [3:0] O);

always @(E)
    case (E)
        9'b100000000 : O <= 4'b0001;
        9'b010000000 : O <= 4'b0010;
        9'b001000000 : O <= 4'b0011;
        9'b000100000 : O <= 4'b0100;
        9'b000010000 : O <= 4'b0101;
        9'b000001000 : O <= 4'b0110;
        9'b000000100 : O <= 4'b0111;
        9'b000000010 : O <= 4'b1000;
        9'b000000001 : O <= 4'b1001;
        default : O <= 4'b0000;
    endcase  

endmodule
