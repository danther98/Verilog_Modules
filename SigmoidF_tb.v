

module SigmoidF_tb();
reg signed [31:0] x;
wire signed [15:0] out;
reg clk;

SigmoidF sig1 (
    .x(x),
    .out(out),
    .clk(clk));
    
initial begin 
clk=0;
#50
clk=1;
x=32'b00000000_00000000_0000000_00000000;
#50
clk=0; 
#50
clk=1;
x=32'b0001000000100000111000000000000;
#50
clk=0;
#50
clk=1;
x=32'b00000000_00000000_10000000_00000010;
#50
clk=0;
#50
clk=1;
x=32'b00000000_00000000_10000000_00000011;
#50
clk=0;
#50
clk=1;
x=32'b00000000_00000000_10000000_00000111;
#50
clk=0;
#50
clk=1;

x=32'b00010000001000001110000000000000;
#50

clk=0;
end







endmodule