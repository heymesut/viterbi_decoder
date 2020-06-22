module decoder
(
   clk,
   rst,
   enable,
   d_in,
   d_out
);

   input             clk;
   input             rst;
   input             enable;
   input [1:0]       d_in;
   output            d_out;

   reg               decoder_o_reg;


//bmc module signals
   wire  [1:0]       bmc_path_0_bmc [0:63];
   
   wire  [1:0]       bmc_path_1_bmc [0:63];
   

//ACS modules signals
   reg   [63:0]       validity;
   reg   [63:0]       selection;
   reg   [7:0]       path_cost   [63:0];
   wire  [63:0]       validity_nets;
   wire  [63:0]       selection_nets;

   wire              ACS_selection [0:63];



   wire              ACS_valid_o [0:63];
   


   wire  [7:0]            ACS_path_cost [0:63];
   

//Trelis memory write operation
   reg   [1:0]       mem_bank;
   reg   [1:0]       mem_bank_buf;
   reg   [1:0]       mem_bank_buf_buf;
   reg               mem_bank_buf_buf_buf;
   reg               mem_bank_buf_buf_buf_buf;
   reg               mem_bank_buf_buf_buf_buf_buf;
   reg   [9:0]       wr_mem_counter;
   reg   [9:0]       rd_mem_counter;

   reg   [9:0]       addr_mem_A;
   reg   [9:0]       addr_mem_B;
   reg   [9:0]       addr_mem_C;
   reg   [9:0]       addr_mem_D;

   reg               wr_mem_A;
   reg               wr_mem_B;
   reg               wr_mem_C;
   reg               wr_mem_D;

   reg   [7:0]       d_in_mem_A;
   reg   [7:0]       d_in_mem_B;
   reg   [7:0]       d_in_mem_C;
   reg   [7:0]       d_in_mem_D;

   wire  [7:0]       d_o_mem_A;
   wire  [7:0]       d_o_mem_B;
   wire  [7:0]       d_o_mem_C;
   wire  [7:0]       d_o_mem_D;

//Trace back module signals
   reg               selection_tbu_0;
   reg               selection_tbu_1;

   reg   [7:0]       d_in_0_tbu_0;
   reg   [7:0]       d_in_1_tbu_0;
   reg   [7:0]       d_in_0_tbu_1;
   reg   [7:0]       d_in_1_tbu_1;

   wire              d_o_tbu_0;
   wire              d_o_tbu_1;

   reg               enable_tbu_0;
   reg               enable_tbu_1;

//Display memory operations 
   wire              wr_disp_mem_0;
   wire              wr_disp_mem_1;

   wire              d_in_disp_mem_0;
   wire              d_in_disp_mem_1;

   reg   [9:0]       wr_mem_counter_disp;
   reg   [9:0]       rd_mem_counter_disp;

   reg   [9:0]       addr_disp_mem_0;
   reg   [9:0]       addr_disp_mem_1;


   assign   d_out =  decoder_o_reg;


//Branch matrc calculation modules

   bmc000000   bmc000000_inst(d_in,bmc_path_0_bmc[0],bmc_path_1_bmc[0]);
   bmc000001   bmc000001_inst(d_in,bmc_path_0_bmc[1],bmc_path_1_bmc[1]);
   bmc000010   bmc000010_inst(d_in,bmc_path_0_bmc[2],bmc_path_1_bmc[2]);
   bmc000011   bmc000011_inst(d_in,bmc_path_0_bmc[3],bmc_path_1_bmc[3]);
   bmc000100   bmc000100_inst(d_in,bmc_path_0_bmc[4],bmc_path_1_bmc[4]);
   bmc000101   bmc000101_inst(d_in,bmc_path_0_bmc[5],bmc_path_1_bmc[5]);
   bmc000110   bmc000110_inst(d_in,bmc_path_0_bmc[6],bmc_path_1_bmc[6]);
   bmc000111   bmc000111_inst(d_in,bmc_path_0_bmc[7],bmc_path_1_bmc[7]);

   bmc001000   bmc001000_inst(d_in,bmc_path_0_bmc[8],bmc_path_1_bmc[8]);
   bmc001001   bmc001001_inst(d_in,bmc_path_0_bmc[9],bmc_path_1_bmc[9]);
   bmc001010   bmc001010_inst(d_in,bmc_path_0_bmc[10],bmc_path_1_bmc[10]);
   bmc001011   bmc001011_inst(d_in,bmc_path_0_bmc[11],bmc_path_1_bmc[11]);
   bmc001100   bmc001100_inst(d_in,bmc_path_0_bmc[12],bmc_path_1_bmc[12]);
   bmc001101   bmc001101_inst(d_in,bmc_path_0_bmc[13],bmc_path_1_bmc[13]);
   bmc001110   bmc001110_inst(d_in,bmc_path_0_bmc[14],bmc_path_1_bmc[14]);
   bmc001111   bmc001111_inst(d_in,bmc_path_0_bmc[15],bmc_path_1_bmc[15]);

   bmc010000   bmc010000_inst(d_in,bmc_path_0_bmc[16],bmc_path_1_bmc[16]);
   bmc010001   bmc010001_inst(d_in,bmc_path_0_bmc[17],bmc_path_1_bmc[17]);
   bmc010010   bmc010010_inst(d_in,bmc_path_0_bmc[18],bmc_path_1_bmc[18]);
   bmc010011   bmc010011_inst(d_in,bmc_path_0_bmc[19],bmc_path_1_bmc[19]);
   bmc010100   bmc010100_inst(d_in,bmc_path_0_bmc[20],bmc_path_1_bmc[20]);
   bmc010101   bmc010101_inst(d_in,bmc_path_0_bmc[21],bmc_path_1_bmc[21]);
   bmc010110   bmc010110_inst(d_in,bmc_path_0_bmc[22],bmc_path_1_bmc[22]);
   bmc010111   bmc010111_inst(d_in,bmc_path_0_bmc[23],bmc_path_1_bmc[23]);

   bmc011000   bmc011000_inst(d_in,bmc_path_0_bmc[24],bmc_path_1_bmc[24]);
   bmc011001   bmc011001_inst(d_in,bmc_path_0_bmc[25],bmc_path_1_bmc[25]);
   bmc011010   bmc011010_inst(d_in,bmc_path_0_bmc[26],bmc_path_1_bmc[26]);
   bmc011011   bmc011011_inst(d_in,bmc_path_0_bmc[27],bmc_path_1_bmc[27]);
   bmc011100   bmc011100_inst(d_in,bmc_path_0_bmc[28],bmc_path_1_bmc[28]);
   bmc011101   bmc011101_inst(d_in,bmc_path_0_bmc[29],bmc_path_1_bmc[29]);
   bmc011110   bmc011110_inst(d_in,bmc_path_0_bmc[30],bmc_path_1_bmc[30]);
   bmc011111   bmc011111_inst(d_in,bmc_path_0_bmc[31],bmc_path_1_bmc[31]);

   bmc100000   bmc100000_inst(d_in,bmc_path_0_bmc[32],bmc_path_1_bmc[32]);
   bmc100001   bmc100001_inst(d_in,bmc_path_0_bmc[33],bmc_path_1_bmc[33]);
   bmc100010   bmc100010_inst(d_in,bmc_path_0_bmc[34],bmc_path_1_bmc[34]);
   bmc100011   bmc100011_inst(d_in,bmc_path_0_bmc[35],bmc_path_1_bmc[35]);
   bmc100100   bmc100100_inst(d_in,bmc_path_0_bmc[36],bmc_path_1_bmc[36]);
   bmc100101   bmc100101_inst(d_in,bmc_path_0_bmc[37],bmc_path_1_bmc[37]);
   bmc100110   bmc100110_inst(d_in,bmc_path_0_bmc[38],bmc_path_1_bmc[38]);
   bmc100111   bmc100111_inst(d_in,bmc_path_0_bmc[39],bmc_path_1_bmc[39]);

   bmc101000   bmc101000_inst(d_in,bmc_path_0_bmc[40],bmc_path_1_bmc[40]);
   bmc101001   bmc101001_inst(d_in,bmc_path_0_bmc[41],bmc_path_1_bmc[41]);
   bmc101010   bmc101010_inst(d_in,bmc_path_0_bmc[42],bmc_path_1_bmc[42]);
   bmc101011   bmc101011_inst(d_in,bmc_path_0_bmc[43],bmc_path_1_bmc[43]);
   bmc101100   bmc101100_inst(d_in,bmc_path_0_bmc[44],bmc_path_1_bmc[44]);
   bmc101101   bmc101101_inst(d_in,bmc_path_0_bmc[45],bmc_path_1_bmc[45]);
   bmc101110   bmc101110_inst(d_in,bmc_path_0_bmc[46],bmc_path_1_bmc[46]);
   bmc101111   bmc101111_inst(d_in,bmc_path_0_bmc[47],bmc_path_1_bmc[47]);

   bmc110000   bmc110000_inst(d_in,bmc_path_0_bmc[48],bmc_path_1_bmc[48]);
   bmc110001   bmc110001_inst(d_in,bmc_path_0_bmc[49],bmc_path_1_bmc[49]);
   bmc110010   bmc110010_inst(d_in,bmc_path_0_bmc[50],bmc_path_1_bmc[50]);
   bmc110011   bmc110011_inst(d_in,bmc_path_0_bmc[51],bmc_path_1_bmc[51]);
   bmc110100   bmc110100_inst(d_in,bmc_path_0_bmc[52],bmc_path_1_bmc[52]);
   bmc110101   bmc110101_inst(d_in,bmc_path_0_bmc[53],bmc_path_1_bmc[53]);
   bmc110110   bmc110110_inst(d_in,bmc_path_0_bmc[54],bmc_path_1_bmc[54]);
   bmc110111   bmc110111_inst(d_in,bmc_path_0_bmc[55],bmc_path_1_bmc[55]);

   bmc111000   bmc111000_inst(d_in,bmc_path_0_bmc[56],bmc_path_1_bmc[56]);
   bmc111001   bmc111001_inst(d_in,bmc_path_0_bmc[57],bmc_path_1_bmc[57]);
   bmc111010   bmc111010_inst(d_in,bmc_path_0_bmc[58],bmc_path_1_bmc[58]);
   bmc111011   bmc111011_inst(d_in,bmc_path_0_bmc[59],bmc_path_1_bmc[59]);
   bmc111100   bmc111100_inst(d_in,bmc_path_0_bmc[60],bmc_path_1_bmc[60]);
   bmc111101   bmc111101_inst(d_in,bmc_path_0_bmc[61],bmc_path_1_bmc[61]);
   bmc111110   bmc111110_inst(d_in,bmc_path_0_bmc[62],bmc_path_1_bmc[62]);
   bmc111111   bmc111111_inst(d_in,bmc_path_0_bmc[63],bmc_path_1_bmc[63]);

   


//Add Compare Select Modules

   ACS      ACS000000(validity[0],validity[1],bmc_path_0_bmc[0],bmc_path_1_bmc[0],path_cost[0],path_cost[1],ACS_selection[0],ACS_valid_o[0],ACS_path_cost[0]);
   ACS      ACS000001(validity[3],validity[2],bmc_path_0_bmc[1],bmc_path_1_bmc[1],path_cost[3],path_cost[2],ACS_selection[1],ACS_valid_o[1],ACS_path_cost[1]);
   ACS      ACS000010(validity[4],validity[5],bmc_path_0_bmc[2],bmc_path_1_bmc[2],path_cost[4],path_cost[5],ACS_selection[2],ACS_valid_o[2],ACS_path_cost[2]);
   ACS      ACS000011(validity[7],validity[6],bmc_path_0_bmc[3],bmc_path_1_bmc[3],path_cost[7],path_cost[6],ACS_selection[3],ACS_valid_o[3],ACS_path_cost[3]);
   ACS      ACS000100(validity[8],validity[9],bmc_path_0_bmc[4],bmc_path_1_bmc[4],path_cost[8],path_cost[9],ACS_selection[4],ACS_valid_o[4],ACS_path_cost[4]);
   ACS      ACS000101(validity[11],validity[10],bmc_path_0_bmc[5],bmc_path_1_bmc[5],path_cost[11],path_cost[10],ACS_selection[5],ACS_valid_o[5],ACS_path_cost[5]);
   ACS      ACS000110(validity[12],validity[13],bmc_path_0_bmc[6],bmc_path_1_bmc[6],path_cost[12],path_cost[13],ACS_selection[6],ACS_valid_o[6],ACS_path_cost[6]);
   ACS      ACS000111(validity[15],validity[14],bmc_path_0_bmc[7],bmc_path_1_bmc[7],path_cost[15],path_cost[14],ACS_selection[7],ACS_valid_o[7],ACS_path_cost[7]);

   ACS      ACS001000(validity[16],validity[17],bmc_path_0_bmc[8],bmc_path_1_bmc[8],path_cost[16],path_cost[17],ACS_selection[8],ACS_valid_o[8],ACS_path_cost[8]);
   ACS      ACS001001(validity[19],validity[18],bmc_path_0_bmc[9],bmc_path_1_bmc[9],path_cost[19],path_cost[18],ACS_selection[9],ACS_valid_o[9],ACS_path_cost[9]);
   ACS      ACS001010(validity[20],validity[21],bmc_path_0_bmc[10],bmc_path_1_bmc[10],path_cost[20],path_cost[21],ACS_selection[10],ACS_valid_o[10],ACS_path_cost[10]);
   ACS      ACS001011(validity[23],validity[22],bmc_path_0_bmc[11],bmc_path_1_bmc[11],path_cost[23],path_cost[22],ACS_selection[11],ACS_valid_o[11],ACS_path_cost[11]);
   ACS      ACS001100(validity[24],validity[25],bmc_path_0_bmc[12],bmc_path_1_bmc[12],path_cost[24],path_cost[25],ACS_selection[12],ACS_valid_o[12],ACS_path_cost[12]);
   ACS      ACS001101(validity[27],validity[26],bmc_path_0_bmc[13],bmc_path_1_bmc[13],path_cost[27],path_cost[26],ACS_selection[13],ACS_valid_o[13],ACS_path_cost[13]);
   ACS      ACS001110(validity[28],validity[29],bmc_path_0_bmc[14],bmc_path_1_bmc[14],path_cost[28],path_cost[29],ACS_selection[14],ACS_valid_o[14],ACS_path_cost[14]);
   ACS      ACS001111(validity[31],validity[30],bmc_path_0_bmc[15],bmc_path_1_bmc[15],path_cost[31],path_cost[30],ACS_selection[15],ACS_valid_o[15],ACS_path_cost[15]);

   ACS      ACS010000(validity[32],validity[33],bmc_path_0_bmc[16],bmc_path_1_bmc[16],path_cost[32],path_cost[33],ACS_selection[16],ACS_valid_o[16],ACS_path_cost[16]);
   ACS      ACS010001(validity[35],validity[34],bmc_path_0_bmc[17],bmc_path_1_bmc[17],path_cost[35],path_cost[34],ACS_selection[17],ACS_valid_o[17],ACS_path_cost[17]);
   ACS      ACS010010(validity[36],validity[37],bmc_path_0_bmc[18],bmc_path_1_bmc[18],path_cost[36],path_cost[37],ACS_selection[18],ACS_valid_o[18],ACS_path_cost[18]);
   ACS      ACS010011(validity[39],validity[38],bmc_path_0_bmc[19],bmc_path_1_bmc[19],path_cost[39],path_cost[38],ACS_selection[19],ACS_valid_o[19],ACS_path_cost[19]);
   ACS      ACS010100(validity[40],validity[41],bmc_path_0_bmc[20],bmc_path_1_bmc[20],path_cost[40],path_cost[41],ACS_selection[20],ACS_valid_o[20],ACS_path_cost[20]);
   ACS      ACS010101(validity[43],validity[42],bmc_path_0_bmc[21],bmc_path_1_bmc[21],path_cost[43],path_cost[42],ACS_selection[21],ACS_valid_o[21],ACS_path_cost[21]);
   ACS      ACS010110(validity[44],validity[45],bmc_path_0_bmc[22],bmc_path_1_bmc[22],path_cost[44],path_cost[45],ACS_selection[22],ACS_valid_o[22],ACS_path_cost[22]);
   ACS      ACS010111(validity[47],validity[46],bmc_path_0_bmc[23],bmc_path_1_bmc[23],path_cost[47],path_cost[46],ACS_selection[23],ACS_valid_o[23],ACS_path_cost[23]);

   ACS      ACS011000(validity[48],validity[49],bmc_path_0_bmc[24],bmc_path_1_bmc[24],path_cost[48],path_cost[49],ACS_selection[24],ACS_valid_o[24],ACS_path_cost[24]);
   ACS      ACS011001(validity[51],validity[50],bmc_path_0_bmc[25],bmc_path_1_bmc[25],path_cost[51],path_cost[50],ACS_selection[25],ACS_valid_o[25],ACS_path_cost[25]);
   ACS      ACS011010(validity[52],validity[53],bmc_path_0_bmc[26],bmc_path_1_bmc[26],path_cost[52],path_cost[53],ACS_selection[26],ACS_valid_o[26],ACS_path_cost[26]);
   ACS      ACS011011(validity[55],validity[54],bmc_path_0_bmc[27],bmc_path_1_bmc[27],path_cost[55],path_cost[54],ACS_selection[27],ACS_valid_o[27],ACS_path_cost[27]);
   ACS      ACS011100(validity[56],validity[57],bmc_path_0_bmc[28],bmc_path_1_bmc[28],path_cost[56],path_cost[57],ACS_selection[28],ACS_valid_o[28],ACS_path_cost[28]);
   ACS      ACS011101(validity[59],validity[58],bmc_path_0_bmc[29],bmc_path_1_bmc[29],path_cost[59],path_cost[58],ACS_selection[29],ACS_valid_o[29],ACS_path_cost[29]);
   ACS      ACS011110(validity[60],validity[61],bmc_path_0_bmc[30],bmc_path_1_bmc[30],path_cost[60],path_cost[61],ACS_selection[30],ACS_valid_o[30],ACS_path_cost[30]);
   ACS      ACS011111(validity[63],validity[62],bmc_path_0_bmc[31],bmc_path_1_bmc[31],path_cost[63],path_cost[62],ACS_selection[31],ACS_valid_o[31],ACS_path_cost[31]);

   ACS      ACS100000(validity[0],validity[1],bmc_path_0_bmc[32],bmc_path_1_bmc[32],path_cost[0],path_cost[1],ACS_selection[32],ACS_valid_o[32],ACS_path_cost[32]);
   ACS      ACS100001(validity[3],validity[2],bmc_path_0_bmc[33],bmc_path_1_bmc[33],path_cost[3],path_cost[2],ACS_selection[33],ACS_valid_o[33],ACS_path_cost[33]);
   ACS      ACS100010(validity[4],validity[5],bmc_path_0_bmc[34],bmc_path_1_bmc[34],path_cost[4],path_cost[5],ACS_selection[34],ACS_valid_o[34],ACS_path_cost[34]);
   ACS      ACS100011(validity[7],validity[6],bmc_path_0_bmc[35],bmc_path_1_bmc[35],path_cost[7],path_cost[6],ACS_selection[35],ACS_valid_o[35],ACS_path_cost[35]);
   ACS      ACS100100(validity[8],validity[9],bmc_path_0_bmc[36],bmc_path_1_bmc[36],path_cost[8],path_cost[9],ACS_selection[36],ACS_valid_o[36],ACS_path_cost[36]);
   ACS      ACS100101(validity[11],validity[10],bmc_path_0_bmc[37],bmc_path_1_bmc[37],path_cost[11],path_cost[10],ACS_selection[37],ACS_valid_o[37],ACS_path_cost[37]);
   ACS      ACS100110(validity[12],validity[13],bmc_path_0_bmc[38],bmc_path_1_bmc[38],path_cost[12],path_cost[13],ACS_selection[38],ACS_valid_o[38],ACS_path_cost[38]);
   ACS      ACS100111(validity[15],validity[14],bmc_path_0_bmc[39],bmc_path_1_bmc[39],path_cost[15],path_cost[14],ACS_selection[39],ACS_valid_o[39],ACS_path_cost[39]);

   ACS      ACS101000(validity[16],validity[17],bmc_path_0_bmc[40],bmc_path_1_bmc[40],path_cost[16],path_cost[17],ACS_selection[40],ACS_valid_o[40],ACS_path_cost[40]);
   ACS      ACS101001(validity[19],validity[18],bmc_path_0_bmc[41],bmc_path_1_bmc[41],path_cost[19],path_cost[18],ACS_selection[41],ACS_valid_o[41],ACS_path_cost[41]);
   ACS      ACS101010(validity[20],validity[21],bmc_path_0_bmc[42],bmc_path_1_bmc[42],path_cost[20],path_cost[21],ACS_selection[42],ACS_valid_o[42],ACS_path_cost[42]);
   ACS      ACS101011(validity[23],validity[22],bmc_path_0_bmc[43],bmc_path_1_bmc[43],path_cost[23],path_cost[22],ACS_selection[43],ACS_valid_o[43],ACS_path_cost[43]);
   ACS      ACS101100(validity[24],validity[25],bmc_path_0_bmc[44],bmc_path_1_bmc[44],path_cost[24],path_cost[25],ACS_selection[44],ACS_valid_o[44],ACS_path_cost[44]);
   ACS      ACS101101(validity[27],validity[26],bmc_path_0_bmc[45],bmc_path_1_bmc[45],path_cost[27],path_cost[26],ACS_selection[45],ACS_valid_o[45],ACS_path_cost[45]);
   ACS      ACS101110(validity[28],validity[29],bmc_path_0_bmc[46],bmc_path_1_bmc[46],path_cost[28],path_cost[29],ACS_selection[46],ACS_valid_o[46],ACS_path_cost[46]);
   ACS      ACS101111(validity[31],validity[30],bmc_path_0_bmc[47],bmc_path_1_bmc[47],path_cost[31],path_cost[30],ACS_selection[47],ACS_valid_o[47],ACS_path_cost[47]);

   ACS      ACS110000(validity[32],validity[33],bmc_path_0_bmc[48],bmc_path_1_bmc[48],path_cost[32],path_cost[33],ACS_selection[48],ACS_valid_o[48],ACS_path_cost[48]);
   ACS      ACS110001(validity[35],validity[34],bmc_path_0_bmc[49],bmc_path_1_bmc[49],path_cost[35],path_cost[34],ACS_selection[49],ACS_valid_o[49],ACS_path_cost[49]);
   ACS      ACS110010(validity[36],validity[37],bmc_path_0_bmc[50],bmc_path_1_bmc[50],path_cost[36],path_cost[37],ACS_selection[50],ACS_valid_o[50],ACS_path_cost[50]);
   ACS      ACS110011(validity[39],validity[38],bmc_path_0_bmc[51],bmc_path_1_bmc[51],path_cost[39],path_cost[38],ACS_selection[51],ACS_valid_o[51],ACS_path_cost[51]);
   ACS      ACS110100(validity[40],validity[41],bmc_path_0_bmc[52],bmc_path_1_bmc[52],path_cost[40],path_cost[41],ACS_selection[52],ACS_valid_o[52],ACS_path_cost[52]);
   ACS      ACS110101(validity[43],validity[42],bmc_path_0_bmc[53],bmc_path_1_bmc[53],path_cost[43],path_cost[42],ACS_selection[53],ACS_valid_o[53],ACS_path_cost[53]);
   ACS      ACS110110(validity[44],validity[45],bmc_path_0_bmc[54],bmc_path_1_bmc[54],path_cost[44],path_cost[45],ACS_selection[54],ACS_valid_o[54],ACS_path_cost[54]);
   ACS      ACS110111(validity[47],validity[46],bmc_path_0_bmc[55],bmc_path_1_bmc[55],path_cost[47],path_cost[46],ACS_selection[55],ACS_valid_o[55],ACS_path_cost[55]);

   ACS      ACS111000(validity[48],validity[49],bmc_path_0_bmc[56],bmc_path_1_bmc[56],path_cost[48],path_cost[49],ACS_selection[56],ACS_valid_o[56],ACS_path_cost[56]);
   ACS      ACS111001(validity[51],validity[50],bmc_path_0_bmc[57],bmc_path_1_bmc[57],path_cost[51],path_cost[50],ACS_selection[57],ACS_valid_o[57],ACS_path_cost[57]);
   ACS      ACS111010(validity[52],validity[53],bmc_path_0_bmc[58],bmc_path_1_bmc[58],path_cost[52],path_cost[53],ACS_selection[58],ACS_valid_o[58],ACS_path_cost[58]);
   ACS      ACS111011(validity[55],validity[54],bmc_path_0_bmc[59],bmc_path_1_bmc[59],path_cost[55],path_cost[54],ACS_selection[59],ACS_valid_o[59],ACS_path_cost[59]);
   ACS      ACS111100(validity[56],validity[57],bmc_path_0_bmc[60],bmc_path_1_bmc[60],path_cost[56],path_cost[57],ACS_selection[60],ACS_valid_o[60],ACS_path_cost[60]);
   ACS      ACS111101(validity[59],validity[58],bmc_path_0_bmc[61],bmc_path_1_bmc[61],path_cost[59],path_cost[58],ACS_selection[61],ACS_valid_o[61],ACS_path_cost[61]);
   ACS      ACS111110(validity[60],validity[61],bmc_path_0_bmc[62],bmc_path_1_bmc[62],path_cost[60],path_cost[61],ACS_selection[62],ACS_valid_o[62],ACS_path_cost[62]);
   ACS      ACS111111(validity[63],validity[62],bmc_path_0_bmc[63],bmc_path_1_bmc[63],path_cost[63],path_cost[62],ACS_selection[63],ACS_valid_o[63],ACS_path_cost[63]);

   /*
   assign selection_nets  =  {ACS111_selection,ACS110_selection,ACS101_selection,ACS100_selection,
                              ACS011_selection,ACS010_selection,ACS001_selection,ACS000_selection};
   assign validity_nets    =  {ACS111_valid_o,ACS110_valid_o,ACS101_valid_o,ACS100_valid_o,
                              ACS011_valid_o,ACS010_valid_o,ACS001_valid_o,ACS000_valid_o};
*/
   assign seletion_nets[63:0] = ACS_selection[0:63];//不知道行不行
   assign validity_nets[63:0] = ACS_valid_o[0:63];


   always @ (posedge clk or negedge rst)
   begin
      if(rst==1'b0)
      begin
         validity          <= 64'b00000001;
         selection         <= 64'b00000000;

         path_cost[0]      <= 8'd0;
         path_cost[1]      <= 8'd0;
         path_cost[2]      <= 8'd0;
         path_cost[3]      <= 8'd0;
         path_cost[4]      <= 8'd0;
         path_cost[5]      <= 8'd0;
         path_cost[6]      <= 8'd0;
         path_cost[7]      <= 8'd0;

         path_cost[8]      <= 8'd0;
         path_cost[9]      <= 8'd0;
         path_cost[10]      <= 8'd0;
         path_cost[11]      <= 8'd0;
         path_cost[12]      <= 8'd0;
         path_cost[13]      <= 8'd0;
         path_cost[14]      <= 8'd0;
         path_cost[15]      <= 8'd0;

         path_cost[16]      <= 8'd0;
         path_cost[17]      <= 8'd0;
         path_cost[18]      <= 8'd0;
         path_cost[19]      <= 8'd0;
         path_cost[20]      <= 8'd0;
         path_cost[21]      <= 8'd0;
         path_cost[22]      <= 8'd0;
         path_cost[23]      <= 8'd0;

         path_cost[24]      <= 8'd0;
         path_cost[25]      <= 8'd0;
         path_cost[26]      <= 8'd0;
         path_cost[27]      <= 8'd0;
         path_cost[28]      <= 8'd0;
         path_cost[29]      <= 8'd0;
         path_cost[30]      <= 8'd0;
         path_cost[31]      <= 8'd0;

         path_cost[32]      <= 8'd0;
         path_cost[33]      <= 8'd0;
         path_cost[34]      <= 8'd0;
         path_cost[35]      <= 8'd0;
         path_cost[36]      <= 8'd0;
         path_cost[37]      <= 8'd0;
         path_cost[38]      <= 8'd0;
         path_cost[39]      <= 8'd0;

         path_cost[40]      <= 8'd0;
         path_cost[41]      <= 8'd0;
         path_cost[42]      <= 8'd0;
         path_cost[43]      <= 8'd0;
         path_cost[44]      <= 8'd0;
         path_cost[45]      <= 8'd0;
         path_cost[46]      <= 8'd0;
         path_cost[47]      <= 8'd0;

         path_cost[48]      <= 8'd0;
         path_cost[49]      <= 8'd0;
         path_cost[50]      <= 8'd0;
         path_cost[51]      <= 8'd0;
         path_cost[52]      <= 8'd0;
         path_cost[53]      <= 8'd0;
         path_cost[54]      <= 8'd0;
         path_cost[55]      <= 8'd0;

         path_cost[56]      <= 8'd0;
         path_cost[57]      <= 8'd0;
         path_cost[58]      <= 8'd0;
         path_cost[59]      <= 8'd0;
         path_cost[60]      <= 8'd0;
         path_cost[61]      <= 8'd0;
         path_cost[62]      <= 8'd0;
         path_cost[63]      <= 8'd0;

      end
      else if(enable==1'b0)
      begin
         validity          <= 64'b00000001;
         selection         <= 64'b00000000;

         path_cost[0]      <= 8'd0;
         path_cost[1]      <= 8'd0;
         path_cost[2]      <= 8'd0;
         path_cost[3]      <= 8'd0;
         path_cost[4]      <= 8'd0;
         path_cost[5]      <= 8'd0;
         path_cost[6]      <= 8'd0;
         path_cost[7]      <= 8'd0;

         path_cost[8]      <= 8'd0;
         path_cost[9]      <= 8'd0;
         path_cost[10]      <= 8'd0;
         path_cost[11]      <= 8'd0;
         path_cost[12]      <= 8'd0;
         path_cost[13]      <= 8'd0;
         path_cost[14]      <= 8'd0;
         path_cost[15]      <= 8'd0;

         path_cost[16]      <= 8'd0;
         path_cost[17]      <= 8'd0;
         path_cost[18]      <= 8'd0;
         path_cost[19]      <= 8'd0;
         path_cost[20]      <= 8'd0;
         path_cost[21]      <= 8'd0;
         path_cost[22]      <= 8'd0;
         path_cost[23]      <= 8'd0;

         path_cost[24]      <= 8'd0;
         path_cost[25]      <= 8'd0;
         path_cost[26]      <= 8'd0;
         path_cost[27]      <= 8'd0;
         path_cost[28]      <= 8'd0;
         path_cost[29]      <= 8'd0;
         path_cost[30]      <= 8'd0;
         path_cost[31]      <= 8'd0;

         path_cost[32]      <= 8'd0;
         path_cost[33]      <= 8'd0;
         path_cost[34]      <= 8'd0;
         path_cost[35]      <= 8'd0;
         path_cost[36]      <= 8'd0;
         path_cost[37]      <= 8'd0;
         path_cost[38]      <= 8'd0;
         path_cost[39]      <= 8'd0;

         path_cost[40]      <= 8'd0;
         path_cost[41]      <= 8'd0;
         path_cost[42]      <= 8'd0;
         path_cost[43]      <= 8'd0;
         path_cost[44]      <= 8'd0;
         path_cost[45]      <= 8'd0;
         path_cost[46]      <= 8'd0;
         path_cost[47]      <= 8'd0;

         path_cost[48]      <= 8'd0;
         path_cost[49]      <= 8'd0;
         path_cost[50]      <= 8'd0;
         path_cost[51]      <= 8'd0;
         path_cost[52]      <= 8'd0;
         path_cost[53]      <= 8'd0;
         path_cost[54]      <= 8'd0;
         path_cost[55]      <= 8'd0;

         path_cost[56]      <= 8'd0;
         path_cost[57]      <= 8'd0;
         path_cost[58]      <= 8'd0;
         path_cost[59]      <= 8'd0;
         path_cost[60]      <= 8'd0;
         path_cost[61]      <= 8'd0;
         path_cost[62]      <= 8'd0;
         path_cost[63]      <= 8'd0;

      end
      else if( path_cost[0][7] && path_cost[1][7] && path_cost[2][7] && path_cost[3][7] && path_cost[4][7] && path_cost[5][7] && path_cost[6][7] && path_cost[7][7] &&
               path_cost[8][7] && path_cost[9][7] && path_cost[10][7] && path_cost[11][7] && path_cost[12][7] && path_cost[13][7] && path_cost[14][7] && path_cost[15][7] &&
               path_cost[16][7] && path_cost[17][7] && path_cost[18][7] && path_cost[19][7] && path_cost[20][7] && path_cost[21][7] && path_cost[22][7] && path_cost[23][7] &&
               path_cost[24][7] && path_cost[25][7] && path_cost[26][7] && path_cost[27][7] && path_cost[28][7] && path_cost[29][7] && path_cost[30][7] && path_cost[31][7] &&
               path_cost[32][7] && path_cost[33][7] && path_cost[34][7] && path_cost[35][7] && path_cost[36][7] && path_cost[37][7] && path_cost[38][7] && path_cost[39][7] &&
               path_cost[40][7] && path_cost[41][7] && path_cost[42][7] && path_cost[43][7] && path_cost[44][7] && path_cost[45][7] && path_cost[46][7] && path_cost[47][7] &&
               path_cost[48][7] && path_cost[49][7] && path_cost[50][7] && path_cost[51][7] && path_cost[52][7] && path_cost[53][7] && path_cost[54][7] && path_cost[55][7] &&
               path_cost[56][7] && path_cost[57][7] && path_cost[58][7] && path_cost[59][7] && path_cost[60][7] && path_cost[61][7] && path_cost[62][7] && path_cost[63][7])
      begin

         validity          <= validity_nets;
         selection         <= selection_nets;
         
         path_cost[0]      <= 8'b01111111 & ACS_path_cost[0];
         path_cost[1]      <= 8'b01111111 & ACS_path_cost[1];
         path_cost[2]      <= 8'b01111111 & ACS_path_cost[2];
         path_cost[3]      <= 8'b01111111 & ACS_path_cost[3];
         path_cost[4]      <= 8'b01111111 & ACS_path_cost[4];
         path_cost[5]      <= 8'b01111111 & ACS_path_cost[5];
         path_cost[6]      <= 8'b01111111 & ACS_path_cost[6];
         path_cost[7]      <= 8'b01111111 & ACS_path_cost[7];

         path_cost[8]      <= 8'b01111111 & ACS_path_cost[8];
         path_cost[9]      <= 8'b01111111 & ACS_path_cost[9];
         path_cost[10]      <= 8'b01111111 & ACS_path_cost[10];
         path_cost[11]      <= 8'b01111111 & ACS_path_cost[11];
         path_cost[12]      <= 8'b01111111 & ACS_path_cost[12];
         path_cost[13]      <= 8'b01111111 & ACS_path_cost[13];
         path_cost[14]      <= 8'b01111111 & ACS_path_cost[14];
         path_cost[15]      <= 8'b01111111 & ACS_path_cost[15];

         path_cost[16]      <= 8'b01111111 & ACS_path_cost[16];
         path_cost[17]      <= 8'b01111111 & ACS_path_cost[17];
         path_cost[18]      <= 8'b01111111 & ACS_path_cost[18];
         path_cost[19]      <= 8'b01111111 & ACS_path_cost[19];
         path_cost[20]      <= 8'b01111111 & ACS_path_cost[20];
         path_cost[21]      <= 8'b01111111 & ACS_path_cost[21];
         path_cost[22]      <= 8'b01111111 & ACS_path_cost[22];
         path_cost[23]      <= 8'b01111111 & ACS_path_cost[23];

         path_cost[24]      <= 8'b01111111 & ACS_path_cost[24];
         path_cost[25]      <= 8'b01111111 & ACS_path_cost[25];
         path_cost[26]      <= 8'b01111111 & ACS_path_cost[26];
         path_cost[27]      <= 8'b01111111 & ACS_path_cost[27];
         path_cost[28]      <= 8'b01111111 & ACS_path_cost[28];
         path_cost[29]      <= 8'b01111111 & ACS_path_cost[29];
         path_cost[30]      <= 8'b01111111 & ACS_path_cost[30];
         path_cost[31]      <= 8'b01111111 & ACS_path_cost[31];

         path_cost[32]      <= 8'b01111111 & ACS_path_cost[32];
         path_cost[33]      <= 8'b01111111 & ACS_path_cost[33];
         path_cost[34]      <= 8'b01111111 & ACS_path_cost[34];
         path_cost[35]      <= 8'b01111111 & ACS_path_cost[35];
         path_cost[36]      <= 8'b01111111 & ACS_path_cost[36];
         path_cost[37]      <= 8'b01111111 & ACS_path_cost[37];
         path_cost[38]      <= 8'b01111111 & ACS_path_cost[38];
         path_cost[39]      <= 8'b01111111 & ACS_path_cost[39];

         path_cost[40]      <= 8'b01111111 & ACS_path_cost[40];
         path_cost[41]      <= 8'b01111111 & ACS_path_cost[41];
         path_cost[42]      <= 8'b01111111 & ACS_path_cost[42];
         path_cost[43]      <= 8'b01111111 & ACS_path_cost[43];
         path_cost[44]      <= 8'b01111111 & ACS_path_cost[44];
         path_cost[45]      <= 8'b01111111 & ACS_path_cost[45];
         path_cost[46]      <= 8'b01111111 & ACS_path_cost[46];
         path_cost[47]      <= 8'b01111111 & ACS_path_cost[47];

         path_cost[48]      <= 8'b01111111 & ACS_path_cost[48];
         path_cost[49]      <= 8'b01111111 & ACS_path_cost[49];
         path_cost[50]      <= 8'b01111111 & ACS_path_cost[50];
         path_cost[51]      <= 8'b01111111 & ACS_path_cost[51];
         path_cost[52]      <= 8'b01111111 & ACS_path_cost[52];
         path_cost[53]      <= 8'b01111111 & ACS_path_cost[53];
         path_cost[54]      <= 8'b01111111 & ACS_path_cost[54];
         path_cost[55]      <= 8'b01111111 & ACS_path_cost[55];

         path_cost[56]      <= 8'b01111111 & ACS_path_cost[56];
         path_cost[57]      <= 8'b01111111 & ACS_path_cost[57];
         path_cost[58]      <= 8'b01111111 & ACS_path_cost[58];
         path_cost[59]      <= 8'b01111111 & ACS_path_cost[59];
         path_cost[60]      <= 8'b01111111 & ACS_path_cost[60];
         path_cost[61]      <= 8'b01111111 & ACS_path_cost[61];
         path_cost[62]      <= 8'b01111111 & ACS_path_cost[62];
         path_cost[63]      <= 8'b01111111 & ACS_path_cost[63];
      end
      else 
      begin
         validity          <= validity_nets;
         selection         <= selection_nets;

         path_cost[0]      <= 8'b01111111 & ACS_path_cost[0];
         path_cost[1]      <= 8'b01111111 & ACS_path_cost[1];
         path_cost[2]      <= 8'b01111111 & ACS_path_cost[2];
         path_cost[3]      <= 8'b01111111 & ACS_path_cost[3];
         path_cost[4]      <= 8'b01111111 & ACS_path_cost[4];
         path_cost[5]      <= 8'b01111111 & ACS_path_cost[5];
         path_cost[6]      <= 8'b01111111 & ACS_path_cost[6];
         path_cost[7]      <= 8'b01111111 & ACS_path_cost[7];

         path_cost[8]      <= 8'b01111111 & ACS_path_cost[8];
         path_cost[9]      <= 8'b01111111 & ACS_path_cost[9];
         path_cost[10]      <= 8'b01111111 & ACS_path_cost[10];
         path_cost[11]      <= 8'b01111111 & ACS_path_cost[11];
         path_cost[12]      <= 8'b01111111 & ACS_path_cost[12];
         path_cost[13]      <= 8'b01111111 & ACS_path_cost[13];
         path_cost[14]      <= 8'b01111111 & ACS_path_cost[14];
         path_cost[15]      <= 8'b01111111 & ACS_path_cost[15];

         path_cost[16]      <= 8'b01111111 & ACS_path_cost[16];
         path_cost[17]      <= 8'b01111111 & ACS_path_cost[17];
         path_cost[18]      <= 8'b01111111 & ACS_path_cost[18];
         path_cost[19]      <= 8'b01111111 & ACS_path_cost[19];
         path_cost[20]      <= 8'b01111111 & ACS_path_cost[20];
         path_cost[21]      <= 8'b01111111 & ACS_path_cost[21];
         path_cost[22]      <= 8'b01111111 & ACS_path_cost[22];
         path_cost[23]      <= 8'b01111111 & ACS_path_cost[23];

         path_cost[24]      <= 8'b01111111 & ACS_path_cost[24];
         path_cost[25]      <= 8'b01111111 & ACS_path_cost[25];
         path_cost[26]      <= 8'b01111111 & ACS_path_cost[26];
         path_cost[27]      <= 8'b01111111 & ACS_path_cost[27];
         path_cost[28]      <= 8'b01111111 & ACS_path_cost[28];
         path_cost[29]      <= 8'b01111111 & ACS_path_cost[29];
         path_cost[30]      <= 8'b01111111 & ACS_path_cost[30];
         path_cost[31]      <= 8'b01111111 & ACS_path_cost[31];

         path_cost[32]      <= 8'b01111111 & ACS_path_cost[32];
         path_cost[33]      <= 8'b01111111 & ACS_path_cost[33];
         path_cost[34]      <= 8'b01111111 & ACS_path_cost[34];
         path_cost[35]      <= 8'b01111111 & ACS_path_cost[35];
         path_cost[36]      <= 8'b01111111 & ACS_path_cost[36];
         path_cost[37]      <= 8'b01111111 & ACS_path_cost[37];
         path_cost[38]      <= 8'b01111111 & ACS_path_cost[38];
         path_cost[39]      <= 8'b01111111 & ACS_path_cost[39];

         path_cost[40]      <= 8'b01111111 & ACS_path_cost[40];
         path_cost[41]      <= 8'b01111111 & ACS_path_cost[41];
         path_cost[42]      <= 8'b01111111 & ACS_path_cost[42];
         path_cost[43]      <= 8'b01111111 & ACS_path_cost[43];
         path_cost[44]      <= 8'b01111111 & ACS_path_cost[44];
         path_cost[45]      <= 8'b01111111 & ACS_path_cost[45];
         path_cost[46]      <= 8'b01111111 & ACS_path_cost[46];
         path_cost[47]      <= 8'b01111111 & ACS_path_cost[47];

         path_cost[48]      <= 8'b01111111 & ACS_path_cost[48];
         path_cost[49]      <= 8'b01111111 & ACS_path_cost[49];
         path_cost[50]      <= 8'b01111111 & ACS_path_cost[50];
         path_cost[51]      <= 8'b01111111 & ACS_path_cost[51];
         path_cost[52]      <= 8'b01111111 & ACS_path_cost[52];
         path_cost[53]      <= 8'b01111111 & ACS_path_cost[53];
         path_cost[54]      <= 8'b01111111 & ACS_path_cost[54];
         path_cost[55]      <= 8'b01111111 & ACS_path_cost[55];

         path_cost[56]      <= 8'b01111111 & ACS_path_cost[56];
         path_cost[57]      <= 8'b01111111 & ACS_path_cost[57];
         path_cost[58]      <= 8'b01111111 & ACS_path_cost[58];
         path_cost[59]      <= 8'b01111111 & ACS_path_cost[59];
         path_cost[60]      <= 8'b01111111 & ACS_path_cost[60];
         path_cost[61]      <= 8'b01111111 & ACS_path_cost[61];
         path_cost[62]      <= 8'b01111111 & ACS_path_cost[62];
         path_cost[63]      <= 8'b01111111 & ACS_path_cost[63];
      end
   end



   always @ (posedge clk or negedge rst)
   begin
      if(rst==1'b0)
         wr_mem_counter <= 10'd0;
      else if(enable==1'b0)
         wr_mem_counter <= 10'd0;
      else
         wr_mem_counter <= wr_mem_counter + 10'd1;
   end

   always @ (posedge clk or negedge rst)
   begin
      if(rst==1'b0)
         rd_mem_counter <= 10'b1111111111;
      else if(enable==1'b0)
         wr_mem_counter <= 10'd0;
      else
         rd_mem_counter <= rd_mem_counter - 10'd1;
   end

   
   always @ (posedge clk or negedge rst)
   begin
      if(rst==1'b0)
         mem_bank <= 2'b00;
      else begin
         if(wr_mem_counter==10'b1111111111)
               mem_bank <= mem_bank + 2'b01;
      end
   end

   
   always @ (posedge clk)
   begin
      d_in_mem_A  <= selection;
      d_in_mem_B  <= selection;
      d_in_mem_C  <= selection;
      d_in_mem_D  <= selection;

   end


   always @ (posedge clk)
   begin
      case(mem_bank)
         2'b00:
         begin
            addr_mem_A        <= wr_mem_counter;
            addr_mem_B        <= rd_mem_counter;
            addr_mem_C        <= 10'd0;
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
            addr_mem_D        <= 10'd0;

            wr_mem_A          <= 1'b0;
            wr_mem_B          <= 1'b1;
            wr_mem_C          <= 1'b0;
            wr_mem_D          <= 1'b0;

         end
         2'b10:
         begin
            addr_mem_A        <= 10'd0;
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
            addr_mem_B        <= 10'd0;
            addr_mem_C        <= rd_mem_counter;
            addr_mem_D        <= wr_mem_counter;

            wr_mem_A          <= 1'b0;
            wr_mem_B          <= 1'b0;
            wr_mem_C          <= 1'b0;
            wr_mem_D          <= 1'b1;
         end
      endcase
  end

//Trelis memory module instantiation

   mem   trelis_mem_A
   (
      .clk(clk),
      .wr(wr_mem_A),
      .addr(addr_mem_A),
      .d_i(d_in_mem_A),
      .d_o(d_o_mem_A)
   );

  mem   trelis_mem_B
   (
      .clk(clk),
      .wr(wr_mem_B),
      .addr(addr_mem_B),
      .d_i(d_in_mem_B),
      .d_o(d_o_mem_B)
   );

  mem   trelis_mem_C
   (
      .clk(clk),
      .wr(wr_mem_C),
      .addr(addr_mem_C),
      .d_i(d_in_mem_C),
      .d_o(d_o_mem_C)
   );

  mem   trelis_mem_D
   (
      .clk(clk),
      .wr(wr_mem_D),
      .addr(addr_mem_D),
      .d_i(d_in_mem_D),
      .d_o(d_o_mem_D)
   );

//Trace back module operation

   always @(posedge clk)
      mem_bank_buf   <= mem_bank;
   
   always @(posedge clk)
      mem_bank_buf_buf   <= mem_bank_buf;


   always @ (posedge clk or negedge rst)
   begin
      if(rst==1'b0)
            enable_tbu_0   <= 1'b0;
      else begin
         if(mem_bank_buf_buf==2'b10)
            enable_tbu_0   <= 1'b1;
         else
            enable_tbu_0   <= enable_tbu_0;
      end   
   end

   always @ (posedge clk or negedge rst)
   begin
      if(rst==1'b0)
            enable_tbu_1   <= 1'b0;
      else begin
         if(mem_bank_buf_buf==2'b11)
            enable_tbu_1   <= 1'b1;
         else
            enable_tbu_1   <= enable_tbu_1;
      end   
   end
   
   always @ (posedge clk)
   begin
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
      .rst(rst),
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
      .rst(rst),
      .enable(enable_tbu_1),
      .selection(selection_tbu_1),
      .d_in_0(d_in_0_tbu_1),
      .d_in_1(d_in_1_tbu_1),
      .d_o(d_o_tbu_1),
      .wr_en(wr_disp_mem_1)
   );

//Display Memory modules Instantioation

   assign   d_in_disp_mem_0   =  d_o_tbu_0;
   assign   d_in_disp_mem_1   =  d_o_tbu_1;
   

  mem_disp   disp_mem_0
  (
      .clk(clk),
      .wr(wr_disp_mem_0),
      .addr(addr_disp_mem_0),
      .d_i(d_in_disp_mem_0),
      .d_o(d_o_disp_mem_0)
   );

  mem_disp   disp_mem_1
  (
      .clk(clk),
      .wr(wr_disp_mem_1),
      .addr(addr_disp_mem_1),
      .d_i(d_in_disp_mem_1),
      .d_o(d_o_disp_mem_1)
   );

// Display memory module operation
   always @ (posedge clk)
      mem_bank_buf_buf_buf <= mem_bank_buf_buf[0];

   always @ (posedge clk)
   begin
      if(rst==1'b0)
         wr_mem_counter_disp  <= 10'b0000000010;
      if(enable==1'b0)
         wr_mem_counter_disp  <= 10'b0000000010;
      else
         wr_mem_counter_disp  <= wr_mem_counter_disp - 10'd1;   
   end

   always @ (posedge clk)
   begin
      if(rst==1'b0)
         rd_mem_counter_disp  <= 10'b1111111101;
      if(enable==1'b0)
         rd_mem_counter_disp  <= 10'b1111111101;
      else
         rd_mem_counter_disp  <= rd_mem_counter_disp + 10'd1;   
   end

   
   always @ (posedge clk)
   begin
      case(mem_bank_buf_buf_buf)
         1'b0:
         begin
            addr_disp_mem_0   <= rd_mem_counter_disp; 
            addr_disp_mem_1   <= wr_mem_counter_disp;
         end
         1'b1:
         begin
            addr_disp_mem_0   <= wr_mem_counter_disp; 
            addr_disp_mem_1   <= rd_mem_counter_disp; 
         end
      endcase
   end


   always @ (posedge clk)
      mem_bank_buf_buf_buf_buf   <= mem_bank_buf_buf_buf;

   always @ (posedge clk)
      mem_bank_buf_buf_buf_buf_buf <= mem_bank_buf_buf_buf_buf;



   always @ (posedge clk)
   begin
      case(mem_bank_buf_buf_buf_buf_buf)
         1'b0:
         begin
            decoder_o_reg  <= d_o_disp_mem_0;
         end
         1'b1:
         begin
            decoder_o_reg  <= d_o_disp_mem_1;
         end
      endcase
   end

endmodule
