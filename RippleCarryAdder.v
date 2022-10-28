module fulladder1Bit(X, Y, Ci, S, Co);
  input X, Y;
input Ci;
  output S, Co;
  wire w1,w2,w3;
  //Structural code for one bit full adder
  xor G1(w1, X, Y);
  xor G2(S, w1, Ci);
  and G3(w2, w1, Ci);
  and G4(w3, X, Y);
  or G5(Co, w2, w3);
endmodule

module rippleAdder16bit(X, Y,Ci, S, Co);
 input [15:0] X, Y;// Two 16-bit inputs
input Ci;
 output [15:0] S;
 output Co;
 wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15;
 // instantiating 16 1-bit full adders in Verilog


    fulladder1Bit u1(X[0], Y[0], Ci, S[0], w1);
    fulladder1Bit u2(X[1], Y[1], w1, S[1], w2);
    fulladder1Bit u3(X[2], Y[2], w2, S[2], w3);
    fulladder1Bit u4(X[3], Y[3], w3, S[3], w4);
    fulladder1Bit u5(X[4], Y[4], w4, S[4], w5);
    fulladder1Bit u6(X[5], Y[5], w5, S[5], w6);
    fulladder1Bit u7(X[6], Y[6], w6, S[6], w7);
    fulladder1Bit u8(X[7], Y[7], w7, S[7], w8);
    fulladder1Bit u9(X[8], Y[8], w8, S[8], w9);
    fulladder1Bit u10(X[9], Y[9], w9, S[9], w10);
    fulladder1Bit u11(X[10], Y[10], w10, S[10], w11);
    fulladder1Bit u12(X[11], Y[11], w11, S[11], w12);
    fulladder1Bit u13(X[12], Y[12], w12, S[12], w13);
    fulladder1Bit u14(X[13], Y[13], w13, S[13], w14);
    fulladder1Bit u15(X[14], Y[14], w14, S[14], w15);
    fulladder1Bit u16(X[15], Y[15], w15, S[15], Co);

  
endmodule

