module 4fulladder (Cin, A, B, S, Cout);
input Cin;
input [3:0] A;
input [3:0] B;
output [3:0] S;
output Cout;

reg [4:0] Sum;

always @*
  Sum <= A + B + Cin;
  
  assing S = Sum [3:0];
  assign Cout = Sum [4];

endmodule
