`timescale 1ns / 1ps

module ascii_adder(
    input [6:0] AD,
    input [6:0] AU,
    input [6:0] BD,
    input [6:0] BU,
    output [6:0] YC,
    output [6:0] YD,
    output [6:0] YU
    );
    
    wire Centenas;
    wire [7:0] DeciYUnidad;
    wire [7:0] Decenas;
    wire [7:0] Unidades; 
    
    obtener_centenas Input(
    .Au(AU),
    .Ad(AD),
    .Bu(BU),
    .Bd(BD),
    .O(DeciYUnidad),
    .Cc(Centenas));
    
    Sep_Decenas SepDecenas (
    .IN(DeciYUnidad),
    .OUT(Decenas));
    
    Sep_Unidades SepUnidades(
    .In1(DeciYUnidad),
    .In2(Decenas),
    .Out(Unidades));
    
    // Obtenemos las centenas en ASCII
    assign YC[6:4] = AD[6:4];
    assign YC[0] = Centenas;
    
    // Obtenemos las decenas en ASCII
    assign YD[6:4] = AD[6:4];
    assign YD[3:0] = Decenas[3:0];
    
    // Obtenemos las unidades en ASCII
    assign YU[6:4] = AU[6:4];
    assign YU[3:0] = Unidades[3:0];
    
endmodule
