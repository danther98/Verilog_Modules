/* //sigmoid function verilog
module SigmoidF(x,out);

    input signed [15:0] x;
    output reg signed [15:0] out;
      
    
   reg signed [15:0] y,z,sum;
   reg signed [15:0] sq,sh;
    
   always@(*)
   begin
   if(x[15]==1'b1)
       y=-x;
   else
       y=x;
   z=y>>>2 ;
      
   sum= z+16'b1111_0000_0000;
      
   sq=sum*sum;

   sh=sq>>>1;

   if(x[15]==1'b1)
       out=sh;
   else
       out=16'b00000001_00000000-sh;
   end
   
endmodule

 */
 
module SigmoidF  #(parameter dataWidth=16,weightIntWidth=4) (
     input           clk,
    input   signed [2*16-1:0]   x,
    output   reg  [16-1:0]  out
);


always @(posedge clk)
begin
    if($signed(x) >= 0)
    begin
        if(|x[2*16-1-:4+1]) //over flow to sign bit of integer part
            out <= {1'b0,{(16-1){1'b1}}}; //positive saturate
        else
            out <= x[2*16-1-4-:16];
    end
    else 
        out <= 0;      
end

endmodule