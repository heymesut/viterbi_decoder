module trellis_memory(
    input  wire        clk,
    input  wire        RSTn,

    input  wire [63:0] selection,

    input  wire        d_in_valid,
    input  wire        process_en,

    output reg  [1:0]  mem_bank,

    output wire [63:0] d_o_mem_A,
    output wire [63:0] d_o_mem_B,
    output wire [63:0] d_o_mem_C,
    output wire [63:0] d_o_mem_D
);


reg [4:0] wr_mem_counter;
reg [4:0] rd_mem_counter;

reg [63:0] d_in_mem_A;
reg [63:0] d_in_mem_B;
reg [63:0] d_in_mem_C;
reg [63:0] d_in_mem_D;

reg [4:0] addr_mem_A;
reg [4:0] addr_mem_B;
reg [4:0] addr_mem_C;
reg [4:0] addr_mem_D;

reg       wr_mem_A;
reg       wr_mem_B;
reg       wr_mem_C;
reg       wr_mem_D;

//trellis memory module control signal generation
always @ (posedge clk or negedge RSTn)
begin
    if(RSTn==1'b0)
        wr_mem_counter <= 5'd0;
    else if(process_en==1'b0 && d_in_valid==1'b0)
        wr_mem_counter <= 15'd0;
    else
        wr_mem_counter <= wr_mem_counter + 5'd1;
end

always @ (posedge clk or negedge RSTn)
begin
    if(RSTn==1'b0)
        rd_mem_counter <= 5'b11111;
    else if(process_en==1'b0 && d_in_valid==1'b0)
        rd_mem_counter <= 5'b11111;
    else
        rd_mem_counter <= rd_mem_counter - 1'b1;
end


always @ (posedge clk or negedge RSTn)
begin
    if(RSTn==1'b0)
        mem_bank <= 2'b00;
    else begin
        if(wr_mem_counter==5'b11111)
            mem_bank <= mem_bank + 2'b01;
        else
            mem_bank <= mem_bank;
    end
end


always @ (posedge clk or negedge RSTn)
begin
    if(RSTn==1'b0)
    begin
        d_in_mem_A  <= 64'b0;
        d_in_mem_B  <= 64'b0;
        d_in_mem_C  <= 64'b0;
        d_in_mem_D  <= 64'b0;  
    end
    else  
    begin
        d_in_mem_A  <= selection;
        d_in_mem_B  <= selection;
        d_in_mem_C  <= selection;
        d_in_mem_D  <= selection;
    end

end


always @ (posedge clk or negedge RSTn)
begin
    if(RSTn==1'b0)
    begin
        addr_mem_A        <= 5'b0;
        addr_mem_B        <= 5'b0;
        addr_mem_C        <= 5'b0;
        addr_mem_D        <= 5'b0;

        wr_mem_A          <= 1'b0;
        wr_mem_B          <= 1'b0;
        wr_mem_C          <= 1'b0;
        wr_mem_D          <= 1'b0;
    end
    else
        case(mem_bank)
            2'b00:
            begin
            addr_mem_A        <= wr_mem_counter;
            addr_mem_B        <= rd_mem_counter;
            addr_mem_C        <= 5'b0;
            addr_mem_D        <= rd_mem_counter;

            wr_mem_A          <= 1'b1;
            wr_mem_B          <= 1'b0;
            wr_mem_C          <= 1'b0;
            wr_mem_D          <= 1'b0;
            end
            2'b01:
            begin
            addr_mem_A        <= rd_mem_counter;
            addr_mem_B        <= wr_mem_counter;
            addr_mem_C        <= rd_mem_counter;
            addr_mem_D        <= 5'b0;

            wr_mem_A          <= 1'b0;
            wr_mem_B          <= 1'b1;
            wr_mem_C          <= 1'b0;
            wr_mem_D          <= 1'b0;

            end
            2'b10:
            begin
            addr_mem_A        <= 5'b0;
            addr_mem_B        <= rd_mem_counter;
            addr_mem_C        <= wr_mem_counter;
            addr_mem_D        <= rd_mem_counter;

            wr_mem_A          <= 1'b0;
            wr_mem_B          <= 1'b0;
            wr_mem_C          <= 1'b1;
            wr_mem_D          <= 1'b0;
            end
            2'b11:
            begin
            addr_mem_A        <= rd_mem_counter;
            addr_mem_B        <= 5'b0;
            addr_mem_C        <= rd_mem_counter;
            addr_mem_D        <= wr_mem_counter;

            wr_mem_A          <= 1'b0;
            wr_mem_B          <= 1'b0;
            wr_mem_C          <= 1'b0;
            wr_mem_D          <= 1'b1;
            end
        endcase
end

//memory for survival path instantiation

mem   mem_A
(
    .clk(clk),
    .RSTn(RSTn),
    .wr(wr_mem_A),
    .addr(addr_mem_A),
    .d_i(d_in_mem_A),
    .d_o(d_o_mem_A)
);

mem   mem_B
(
    .clk(clk),
    .RSTn(RSTn),
    .wr(wr_mem_B),
    .addr(addr_mem_B),
    .d_i(d_in_mem_B),
    .d_o(d_o_mem_B)
);

mem   mem_C
(
    .clk(clk),
    .RSTn(RSTn),
    .wr(wr_mem_C),
    .addr(addr_mem_C),
    .d_i(d_in_mem_C),
    .d_o(d_o_mem_C)
);

mem   mem_D
(
    .clk(clk),
    .RSTn(RSTn),
    .wr(wr_mem_D),
    .addr(addr_mem_D),
    .d_i(d_in_mem_D),
    .d_o(d_o_mem_D)
);


endmodule