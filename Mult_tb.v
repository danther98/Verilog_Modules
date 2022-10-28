`timescale 1ns/1ps
module Mult_tb;
//inputs 
reg [15:0] inA;
reg [15:0] inB;
reg [15:0] inC;
reg [15:0] inD;
reg [15:0] inE;
reg [15:0] inF;
reg [15:0] inG;
reg [15:0] inH;
reg [15:0] inI;
reg [15:0] inJ;
reg [15:0] inK;
reg [15:0] inL;
reg [15:0] inM;
reg [15:0] inN;
reg [15:0] inO;
reg [15:0] inP;
reg [3:0] sel;
reg res;
//outputs
wire [15:0] out;
reg  [15:0] i= 16'd0;
//instantiate the Unit Under Test (UUT)
mux_16to1 mul (
.inA(inA),
.inB(inB),
.inC(inC),
.inD(inD),
.inE(inE),
.inF(inF),
.inG(inG),
.inH(inH),
.inI(inI),
.inJ(inJ),
.inK(inK),
.inL(inL),
.inM(inM),
.inN(inN),
.inO(inO),
.inP(inP),
.sel(sel),
.out(out),
.res(res)
);
initial begin
//initialize inputs
inA = 16'd1;
inB = 16'd2;
inC = 16'd3;
inD = 16'd4;
inE = 16'd5;
inF = 16'd6;
inG = 16'd7;
inH = 16'd8;
inI = 16'd9;
inJ = 16'd10;
inK = 16'd11;
inL = 16'd12;
inM = 16'd13;
inN = 16'd14;
inO = 16'd15;
inP = 16'd16;
sel = 4'd0;
res = 1'b0;

#100;
    for(i=0;i<=16;i=i+1'd1) begin
        sel = sel + 1'b1;
        #20;
    end 
    #20;
res=1'b1;
#20;
end
endmodule



