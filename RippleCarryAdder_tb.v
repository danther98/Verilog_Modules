`timescale 1ns/1ps
module rippleCarryAdder_tb;
//inputs
reg [15:0] X;
reg [15:0] Y;
reg Ci;
//outputs
wire [15:0] S;
wire Co;

reg[15:0] i = 16'd0;
//instantiate the Unit Under Test (UUT)
rippleAdder16bit uut (
.X(X),
.Y(Y),
.S(S),
.Co(Co),
.Ci(Ci)
);

initial begin 
//initialize inputs
X = 16'd0;
Y = 16'd0;
Ci=1'b0;
#100;
 for (i=0; i<5000; i=i+1'd1) begin
    X = X + 1'b1;
    Y = Y + 1'b1;
    #20;
    
    end 


end
endmodule


