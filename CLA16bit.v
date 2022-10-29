//creating 4-bit CLA
module CLA4(S,Co,X,Y,Cin); 
input[3:0] X,Y;
input Cin;
output [3:0] S;
output Co;
wire p0,p1,p2,p3,g0,g1,g2,g3,c1,c2,c3,c4;
assign p0=(X[0]^Y[0]),
p1=(X[1]^Y[1]),
p2=(X[2]^Y[2]),
p3=(X[3]^Y[3]);
assign g0=(X[0]&Y[0]),
g1=(X[1]&Y[1]),
g2=(X[2]&Y[2]),
g3=(X[3]&Y[3]);
assign c0=Cin,
c1=g0|(p0&Cin),
c2=g1|(p1&g0)|(p1&p0&Cin),
c3=g2|(p2&g1)|(p2&p1&g0)|(p1&p1&p0&Cin),
c4=g3|(p3&g2)|(p3&p2&g1)|(p3&p2&p1&g0)|(p3&p2&p1&p0&Cin);
assign S[0]=p0^c0,
S[1]=p1^c1,
S[2]=p2^c2,
S[3]=p3^c3;
assign Co=c4;

/* input [3:0] X,Y;
input Cin;
output Co;
output[3:0] S;
wire [3:1] C;
wire [0:3] P;
wire [0:3] G;

xor #(2) p0(P[0],X[0],Y[0]);
xor #(2) p1(P[1],X[1],Y[1]);
xor #(2) p2(P[2],X[2],Y[2]);
xor #(2) p3(P[3],X[3],Y[3]);

and #(2) g0(G[0],X[0],Y[0]);
and #(2) g1(G[1],X[1],Y[1]);
and #(2) g2(G[2],X[2],Y[2]);
and #(2) g3(G[3],X[3],Y[3]);

wire temp1;
and #(2) c11(temp1, P[0], Cin);
or #(2) c12(C[1],G[0],temp1);

wire temp2;
wire temp3; 
and #(2) c21(temp2, P[1], G[0]);
and #(3) c22(temp3, P[1],P[0],Cin);
or #(2) c23(C[2],temp2,temp3,G[1]);

wire temp4;
wire temp5;
wire temp6;
 and #(2) c31(temp4 , P[2] , G[1]);
  and #(3) c32(temp5 , P[2] , P[1] , G[0]);
  and #(4) c33(temp6 , P[2] , P[1] , P[0] , Cin);
  or #(4) c34(C[3] , temp4 , temp5 , temp6 , G[2]);

wire temp7;
wire temp8;
wire temp9;
wire temp10;
 and #(2) c41(temp7 , P[3] , G[2]);
  and #(3) c42(temp8 , P[3] , P[2] , G[1]);
  and #(4) c43(temp9 , P[3] , P[2] , P[1] , G[0]);
  and #(5) c44(temp10 , P[3] , P[2] , P[1] , P[0] , Cin);
  or #(5) c45(Cout , temp7 , temp8 , temp9 , temp10 , G[3]);

  xor #(2) s0(S[0] , P[0] , Cin);
  xor #(2) s1(S[1] , P[1] , C[1]);
  xor #(2) s2(S[2] , P[2] , C[2]);
  xor #(2) s3(S[3] , P[3] , C[3]); */

endmodule 

//Creating 16-bit CLA
module CLA16(S,Co,X,Y,Cin);
  input [15:0] X; 
  input [15:0] Y; 
  input Cin; 
  output [15:0] S; 
  output Co;   
  wire [3:0] C;
  
  CLA4 F0_3(S[3:0] , C[1] , X[3:0] , Y[3:0] , Cin);
  CLA4 F4_7(S[7:4] , C[2] , X[7:4] , Y[7:4] , C[1]);
  CLA4 F8_11(S[11:8] , C[3] , X[11:8] , Y[11:8] , C[2]);
  CLA4 F12_15(S[15:12] , Co , X[15:12] , Y[15:12] , C[3]);
  
endmodule