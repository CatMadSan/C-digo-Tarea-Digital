module 7fulladder (Cin, A, B, S, Cout);
input Cin;
input [6:0] A;
input [6:0] B;
output [6:0] S;
output Cout;

reg [7:0] Sum;

always @*
  Sum <= A + B + Cin;
  
  assing S = Sum [6:0]<
  assign Cout = Sum [7];

endmodule
