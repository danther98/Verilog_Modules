module mux_16to1 (
input [15:0] inA,
input [15:0] inB,
input [15:0] inC,
input [15:0] inD,
input [15:0] inE,
input [15:0] inF,
input [15:0] inG,
input [15:0] inH,
input [15:0] inI,
input [15:0] inJ,
input [15:0] inK,
input [15:0] inL,
input [15:0] inM,
input [15:0] inN,
input [15:0] inO,
input [15:0] inP,
input [3:0] sel,
output reg [15:0] out,
input res
);

always @(sel) begin
case (sel)
4'b0000: out = inA;
4'b0001: out = inB;
4'b0010: out = inC;
4'b0011: out = inD;
4'b0100: out = inE;
4'b0101: out = inF;
4'b0110: out = inG;
4'b0111: out = inH;
4'b1000: out = inI;
4'b1001: out = inJ;
4'b1010: out = inK;
4'b1011: out = inL;
4'b1100: out = inM;
4'b1101: out = inN;
4'b1110: out = inO;
4'b1111: out = inP;
endcase
//when res = 1 reset to 0
if (res == 1) begin
out = 16'd0;
end
end




endmodule