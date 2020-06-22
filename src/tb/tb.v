`timescale 1ns / 1ps

module tb();

reg clk,
reg RSTn,

reg d_in_valid;
reg [1:0] d_in;

wire d_out_valid;
wire d_out;

reg [10:0] in_cnt;
reg [9:0]  out_cnt;

reg [31:0] correct_cnt;
reg [31:0] error_cnt;

reg [1087:0] dataIn;//1024bits encoded message +(tblen*2)bits0
reg [511:0]  dataOut;

initial $readmemb("dataIn.txt",dataIn);
initial $readmemb("dataOut.txt",dataOut);

assign #2 clk = ~clk;

initial 
begin
    clk         <= 1'b1;
    RSTn        <= 1'b0;

    d_in_valid  <= 1'b0;
    d_in[1:0]   <= 2'b0;

    in_cnt      <= 0;
    out_cnt     <= 0;

    correct_cnt <= 0;
    error_cnt   <= 0;

    #4
    RSTn       <= 1'b1;
    d_in_valid <= 1'b1;
    #4352
    d_in_valid <= 1'b0

end


always@(posedge clk)
begin
    if(d_in_valid)
    begin
      d_in      = dataIn[in_cnt+1:in_cnt];
      in_cnt    = in_cnt + 2;
    end
end

always@(negedge clk)
begin
    if(d_out_valid && out_cnt < 512)
    begin
        if(d_out == dataOut[out_cnt])
        begin
          $display("Correct! Expected %b. Got %b.",dataOut[out_cnt],d_out);
          correct_cnt = correct_cnt + 1;
        end
        else
        begin
          $display("Error!Expected %b. Got %b.",dataOut[out_cnt],d_out);
          error_cnt = error_cnt + 1;
        end
        out_cnt = out_cnt + 1;
    end
end

always @ (posedge clk)
begin
  if(out_cnt== 512)
    $display("Correct bits: %b. Error bits: %b.",correct_cnt,error_cnt);  
end

viterbi_decoder inst_viterbi_decoder(
    .clk(clk),
    .RSTn(RSTn),
    .d_in_valid(d_in_valid),
    .d_in(d_in),
    .d_out_valid(d_out_valid),
    .d_out(d_out)
);

endmodule
