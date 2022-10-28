module Multiplier (a,b,result);
input [15:0] a,b;
output [31:0] result;
reg [31:0] a_temp;
reg [31:0] q_temp;

integer i;
always @(a,b)
        begin
a_temp ={16'b0,a[15:0]};//a_temp=32'b0;
q_temp = 32'b0;
for(i=0;i<16;i=i+1)
            begin
if(b[i] == 1)
    q_temp=q_temp+a_temp;//add based on multiplier bit
else
        q_temp=q_temp;
        a_temp={a_temp[30:0],1'b0};//shift in each iteration
            end
        end
assign result=q_temp[31:0];

endmodule





