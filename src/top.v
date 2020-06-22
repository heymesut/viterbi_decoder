module viterbi_decoder(
    input  wire        clk,
    input  wire        RSTn,
    
    input  wire        d_in_valid,
    input  wire [1:0]  d_in,

    output wire        d_out_valid,
    output wire        d_out
);


wire process_en;

wire [1:0] mem_bank;
wire [1:0] mem_bank_buf_buf;

wire  [63:0]  d_o_mem_A;
wire  [63:0]  d_o_mem_B;
wire  [63:0]  d_o_mem_C;
wire  [63:0]  d_o_mem_D;

wire d_o_tbu_0;
wire d_o_tbu_1;

wire wr_disp_mem_0;
wire wr_disp_mem_1;

//BMC modules

//ACS modules

//trellis memory module
trellis_memory trellis_memory(
    .clk(clk),
    .RSTn(RSTn),
    .selection(selection),
    .d_in_valid(d_in_valid),
    .process_en(process_en),

    .mem_bank(mem_bank),
    .d_o_mem_A(d_o_mem_A),
    .d_o_mem_B(d_o_mem_B),
    .d_o_mem_C(d_o_mem_C),
    .d_o_mem_D(d_o_mem_D)
);

//tbu module
tbu_top tbu_top(
    .clk(clk),
    .RSTn(RSTn),
    .mem_bank(mem_bank),
    .d_o_mem_A(d_o_mem_A),
    .d_o_mem_B(d_o_mem_B),
    .d_o_mem_C(d_o_mem_C),
    .d_o_mem_D(d_o_mem_D),

    .d_o_tbu_0(d_o_tbu_0),
    .d_o_tbu_0(d_o_tbu_1),
    .wr_disp_mem_0(wr_disp_mem_0),
    .wr_disp_mem_1(wr_disp_mem_1),
    .mem_bank_buf_buf(mem_bank_buf_buf)
);


//Display Memory modules
mem_disp_top mem_disp_top(
    .clk(clk),
    .RSTn(RSTn),
    .d_in_valid(d_in_valid),
    .mem_bank_buf_buf(mem_bank_buf_buf),
    .wr_disp_mem_0(wr_disp_mem_0),
    .wr_disp_mem_1(wr_disp_mem_1),
    .d_in_disp_mem_0(d_o_tbu_0),
    .d_in_disp_mem_1(d_o_tbu_1),

    .process_en(process_en),
    .d_out_valid(d_out_valid),
    .decoder_o_reg(d_out)
);

endmodule