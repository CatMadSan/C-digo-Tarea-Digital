`timescale 1ns / 1ps

module Sep_Decenas(
    input [7:0] IN,
    output [7:0] OUT
    );
    
    wire mayor, igual, menor;
    reg [2:0] sel1;
    reg [8:0] sel2;
    //reg [3:0] salida;
    
    always @ * begin
        if (IN[6] == IN[5]) begin
            if (IN[6:0] < 4'b0010)
                sel2 = 9'b100000000;
            else if (IN[6:3] == 4'b0010)
                sel2 = 9'b010000000;
            else if (IN[6:3] > 4'b0010)
                sel2 = 9'b001000000;
        end
        else if (IN[6] < IN[5]) begin
            if (IN[6:3] < 4'b0110)
                sel2 = 9'b000100000;
            else if (IN[6:3] == 4'b0110)
                sel2 = 9'b000010000;
            else if (IN[6:3] > 4'b0110)
                sel2 = 9'b000001000;
        end 
        else if (IN[6] > IN[5]) begin
            if (IN[6:3] < 4'b1010)
                sel2 = 9'b000000100;
            else if (IN[6:3] == 4'b1010)
                sel2 = 9'b000000010;
            else if (IN[6:3] > 4'b1010)
                sel2 = 9'b000000001;
        end   
    end   
            
    codificador10a4 codificado(sel2, OUT);
    
    //assign OUT[7:4] = 4'b0000;
    //assign OUT[3:0] = salida; 
    
endmodule
