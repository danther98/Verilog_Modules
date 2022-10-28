module Multiplier_tb;
reg [15:0] ma,mb;
wire [31:0] result;



Multiplier m16(
.a(ma),
.b(mb),
.result(result)
);
initial
begin

ma=17;mb=16;
#20 ma=13;mb=5;
#20 ma=11;mb=15;
#20 ma=512;mb=900;
#20 ma=897;mb=845;
#20 ma=477;mb=1020;
#20 ma=31;mb=999;
#20 ma=388;mb=1000;
#20 ma=999;mb=888;
#20 ma=2000;mb=1952;
#20 ma=1758;mb=2022;
#20 ma=1988;mb=1900;
#40 $finish;

end
initial
begin
$monitor("%g \t ma=%d \t mb=%d \t mbit=%d",$time,ma,mb,result);
end

endmodule
