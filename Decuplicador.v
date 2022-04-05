module Mulplicador (A, G);

  input [3:0] A;
  output [7:0] G;
  reg signed [6:0] mul;
  always @(A)*
      mul = A * 4'b1010;
  assign G = mul;

endmodule
