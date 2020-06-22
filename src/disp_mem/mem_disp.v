//1bits*32 mem for display decoded message
module mem_disp
(
   input   wire           clk,
   input   wire           RSTn,
   input   wire           wr,
   input   wire   [4:0]   addr,
   input   wire           d_i,
   output  reg            d_o
);

reg       mem   [0:31];

always @ (posedge clk or negedge RSTn)
begin
   if(RSTn==1'b0)
      d_o <= 1'b0;
   else
      d_o  <=  mem[addr];         
end

integer i;
always @ (posedge clk or negedge RSTn)
begin
   if(RSTn==1'b0)
      for ( i = 0 ; i < 32 ; i = i + 1 ) 
      begin
         mem[i] <= 1'b0;    
      end
   else if(wr)
      mem[addr]   <= d_i;        
end

endmodule
