module FA(output sum, cout, input a, b, cin);
  wire w0, w1, w2;
  
  xor (w0, a, b);
  xor (sum, w0, cin);
  
  and (w1, w0, cin);
  and (w2, a, b);
  or (cout, w1, w2);
endmodule

module RCA4(output [3:0] sum, output cout, input [3:0] a, b, input cin);
  
  wire [3:1] c;
  
  FA fa0(sum[0], c[1], a[0], b[0], cin);
  FA fa[2:1](sum[2:1], c[3:2], a[2:1], b[2:1], c[2:1]);
  FA fa31(sum[3], cout, a[3], b[3], c[3]);
  
endmodule



module SkipLogic(output cin_next,
  input [3:0] x, y, input cin, cout);
  
  wire p0, p1, p2, p3, P, e;
  
  or (p0, x[0], y[0]);
  or (p1, x[1], y[1]);
  or (p2, x[2], y[2]);
  or (p3, x[3], y[3]);
  
  and (P, p0, p1, p2, p3);
  and (e, P, cin);
  
  or (cin_next, e, cout);

endmodule

module CSkipA16(output [15:0] S, output cout, input [15:0] x, y);
  
  wire [3:0] co;
  wire [2:0] e; 
  
  RCA4 rca0(S[3:0], co[0], x[3:0], y[3:0], 0);
  RCA4 rca[3:1](S[15:4], co[3:1], x[15:4], y[15:4], e[2:0]);
  
  SkipLogic skip0(e[0], x[3:0], y[3:0], 0, co[0]);
  SkipLogic skip[2:1](e[2:1], x[11:4], y[11:4], e[1:0], co[2:1]);
  SkipLogic skip3(cout, x[15:12], y[15:12], e[2], co[3]);

endmodule
