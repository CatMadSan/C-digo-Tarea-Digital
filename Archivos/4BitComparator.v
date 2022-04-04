module comparador_gel(
 input [3:0] a,
 input [3:0] b,
 output g, // si a < b => (g,e,l) = (0,0,1)
 output e, // si a = b => (g,e,l) = (0,1,0)
 output l);
 reg g, e, l;
 always @(a, b)
  begin
    g = 0;
    e = 0;
    l = 0;
    if (a > b)
      g =1;
    else if (a < b)
      l = 1;
    else
      e = 1;
  end
endmodule
