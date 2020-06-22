module tbu_top(
    input  wire           clk,
    input  wire           RSTn,

    input  wire   [1:0]   mem_bank,

    input  wire   [63:0]  d_o_mem_A, 
    input  wire   [63:0]  d_o_mem_B,
    input  wire   [63:0]  d_o_mem_C,
    input  wire   [63:0]  d_o_mem_D,

    output wire           d_o_tbu_0,
    output wire           d_o_tbu_1,

    output wire           wr_disp_mem_0,
    output wire           wr_disp_mem_1,

    output reg    [1:0]   mem_bank_buf_buf    
);

reg [1:0] mem_bank_buf;

reg enable_tbu_0;
reg enable_tbu_1;

reg [63:0]  d_in_0_tbu_0;
reg [63:0]  d_in_1_tbu_0;

reg [63:0]  d_in_0_tbu_1;
reg [63:0]  d_in_1_tbu_1;

reg selection_tbu_0;
reg selection_tbu_1;


//Trace back module control signal
always @(posedge clk)
    mem_bank_buf   <= mem_bank;

always @(posedge clk)
    mem_bank_buf_buf   <= mem_bank_buf;


always @ (posedge clk or negedge RSTn)
begin
    if(RSTn==1'b0)
        enable_tbu_0   <= 1'b0;
    else begin
        if(mem_bank_buf_buf==2'b10)
        enable_tbu_0   <= 1'b1;
        else
        enable_tbu_0   <= enable_tbu_0;
    end   
end

always @ (posedge clk or negedge RSTn)
begin
    if(RSTn==1'b0)
        enable_tbu_1   <= 1'b0;
    else begin
        if(mem_bank_buf_buf==2'b11)
        enable_tbu_1   <= 1'b1;
        else
        enable_tbu_1   <= enable_tbu_1;
    end   
end

always @ (posedge clk or negedge RSTn)
begin
    if(RSTn ==1'b0)
        begin
            d_in_0_tbu_0    <= 64'b0;
            d_in_1_tbu_0    <= 64'b0;

            d_in_0_tbu_1    <= 64'b0;
            d_in_1_tbu_1    <= 64'b0;

            selection_tbu_0 <= 1'b0;
            selection_tbu_1 <= 1'b0;
        end
    else
        case(mem_bank_buf_buf)
            2'b00:
            begin
            d_in_0_tbu_0   <= d_o_mem_D;
            d_in_1_tbu_0   <= d_o_mem_C;
            
            d_in_0_tbu_1   <= d_o_mem_C;
            d_in_1_tbu_1   <= d_o_mem_B;

            selection_tbu_0<= 1'b0;
            selection_tbu_1<= 1'b1;
            end

            2'b01:
            begin
            d_in_0_tbu_0   <= d_o_mem_D;
            d_in_1_tbu_0   <= d_o_mem_C;
            
            d_in_0_tbu_1   <= d_o_mem_A;
            d_in_1_tbu_1   <= d_o_mem_D;
            
            selection_tbu_0<= 1'b1;
            selection_tbu_1<= 1'b0;
            end

            2'b10:
            begin
            d_in_0_tbu_0   <= d_o_mem_B;
            d_in_1_tbu_0   <= d_o_mem_A;
            
            d_in_0_tbu_1   <= d_o_mem_A;
            d_in_1_tbu_1   <= d_o_mem_D;

            selection_tbu_0<= 1'b0;
            selection_tbu_1<= 1'b1;
            end

            2'b11:
            begin
            d_in_0_tbu_0   <= d_o_mem_B;
            d_in_1_tbu_0   <= d_o_mem_A;
            
            d_in_0_tbu_1   <= d_o_mem_C;
            d_in_1_tbu_1   <= d_o_mem_B;

            selection_tbu_0<= 1'b1;
            selection_tbu_1<= 1'b0;
            end
        endcase
end

//Trace-Back modules instantiation
tbu tbu_0
(
    .clk(clk),
    .RSTn(RSTn),
    .enable(enable_tbu_0),
    .selection(selection_tbu_0),
    .d_in_0(d_in_0_tbu_0),
    .d_in_1(d_in_1_tbu_0),
    .d_o(d_o_tbu_0),
    .wr_en(wr_disp_mem_0)
);

tbu tbu_1
(
    .clk(clk),
    .RSTn(RSTn),
    .enable(enable_tbu_1),
    .selection(selection_tbu_1),
    .d_in_0(d_in_0_tbu_1),
    .d_in_1(d_in_1_tbu_1),
    .d_o(d_o_tbu_1),
    .wr_en(wr_disp_mem_1)
);

endmodule