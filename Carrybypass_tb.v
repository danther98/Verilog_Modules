module tb_CSkipA16;
  wire [15:0] S;
  wire cout;
  reg [15:0] x, y;
  
  CSkipA16 csa16(S[15:0], cout, x[15:0], y[15:0]);
  
  initial
  begin
    $display("a       |b       ||cout|sum     ");
  end
  
  initial
  begin
    $monitor("%b|%b||%b   |%b", x[15:0], y[15:0], cout, S[15:0]);
  end
  
  initial
  begin
    x=16'b1010000010100000; y=16'b1010000010100000;
    #10 x=16'b0101100011110100; y=16'b1111010011110100;
    #10 x=16'b0000111100111101; y=16'b0000111100001111;
    #10 x=16'b1100100011001010; y=16'b1100100011001010;
  end
endmodule
