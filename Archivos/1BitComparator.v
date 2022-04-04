module comparador_gel(
  input a,
  input b,
  output u, // si a < b => (u,v,w) = (0,0,1)
  output v, // si a = b => (u,v,w) = (0,1,0)
  output w); // si a > b => (u,v,w) = (1,0,0) 
  reg u, v, w;
  always @(a, b)
    begin
      u = 0;
      v = 0;
      w = 0;
      if (a > b)
        u =1;
      else if (a < b)
        w = 1;
      else
        v = 1;
    end
endmodule
