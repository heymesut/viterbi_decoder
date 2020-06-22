module BMC_ACS_top(
    input   wire       clk,
    input   wire       RSTn,
    input   wire       d_in_valid,
    input   wire [1:0] d_in,

    output  reg [63:0] selection    
);

//bmc module signals
wire  [1:0]       bmc_path_0_bmc [0:63];
wire  [1:0]       bmc_path_1_bmc [0:63];

//ACS modules signals
reg   [63:0]       validity;
reg   [7:0]        path_cost   [0:63];
wire  [63:0]       ACS_selection;
wire  [63:0]       ACS_valid_o;
wire  [7:0]        ACS_path_cost [0:63];


//Branch metric calculation modules
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


//store path metric 
always @ (posedge clk or negedge RSTn)
begin
    if(RSTn==1'b0)
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

        path_cost[8]       <= 8'd0;
        path_cost[9]       <= 8'd0;
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
    else if(d_in_valid==1'b0)
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

        path_cost[8]       <= 8'd0;
        path_cost[9]       <= 8'd0;
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

        validity          <= ACS_valid_o;
        selection         <= ACS_selection;
        
        path_cost[0]      <= 8'b01111111 & ACS_path_cost[0];
        path_cost[1]      <= 8'b01111111 & ACS_path_cost[1];
        path_cost[2]      <= 8'b01111111 & ACS_path_cost[2];
        path_cost[3]      <= 8'b01111111 & ACS_path_cost[3];
        path_cost[4]      <= 8'b01111111 & ACS_path_cost[4];
        path_cost[5]      <= 8'b01111111 & ACS_path_cost[5];
        path_cost[6]      <= 8'b01111111 & ACS_path_cost[6];
        path_cost[7]      <= 8'b01111111 & ACS_path_cost[7];

        path_cost[8]       <= 8'b01111111 & ACS_path_cost[8];
        path_cost[9]       <= 8'b01111111 & ACS_path_cost[9];
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
        validity          <= ACS_valid_o;
        selection         <= ACS_selection;

        path_cost[0]      <=  ACS_path_cost[0];
        path_cost[1]      <=  ACS_path_cost[1];
        path_cost[2]      <=  ACS_path_cost[2];
        path_cost[3]      <=  ACS_path_cost[3];
        path_cost[4]      <=  ACS_path_cost[4];
        path_cost[5]      <=  ACS_path_cost[5];
        path_cost[6]      <=  ACS_path_cost[6];
        path_cost[7]      <=  ACS_path_cost[7];

        path_cost[8]       <=  ACS_path_cost[8];
        path_cost[9]       <=  ACS_path_cost[9];
        path_cost[10]      <=  ACS_path_cost[10];
        path_cost[11]      <=  ACS_path_cost[11];
        path_cost[12]      <=  ACS_path_cost[12];
        path_cost[13]      <=  ACS_path_cost[13];
        path_cost[14]      <=  ACS_path_cost[14];
        path_cost[15]      <=  ACS_path_cost[15];

        path_cost[16]      <=  ACS_path_cost[16];
        path_cost[17]      <=  ACS_path_cost[17];
        path_cost[18]      <=  ACS_path_cost[18];
        path_cost[19]      <=  ACS_path_cost[19];
        path_cost[20]      <=  ACS_path_cost[20];
        path_cost[21]      <=  ACS_path_cost[21];
        path_cost[22]      <=  ACS_path_cost[22];
        path_cost[23]      <=  ACS_path_cost[23];

        path_cost[24]      <=  ACS_path_cost[24];
        path_cost[25]      <=  ACS_path_cost[25];
        path_cost[26]      <=  ACS_path_cost[26];
        path_cost[27]      <=  ACS_path_cost[27];
        path_cost[28]      <=  ACS_path_cost[28];
        path_cost[29]      <=  ACS_path_cost[29];
        path_cost[30]      <=  ACS_path_cost[30];
        path_cost[31]      <=  ACS_path_cost[31];

        path_cost[32]      <=  ACS_path_cost[32];
        path_cost[33]      <=  ACS_path_cost[33];
        path_cost[34]      <=  ACS_path_cost[34];
        path_cost[35]      <=  ACS_path_cost[35];
        path_cost[36]      <=  ACS_path_cost[36];
        path_cost[37]      <=  ACS_path_cost[37];
        path_cost[38]      <=  ACS_path_cost[38];
        path_cost[39]      <=  ACS_path_cost[39];

        path_cost[40]      <=  ACS_path_cost[40];
        path_cost[41]      <=  ACS_path_cost[41];
        path_cost[42]      <=  ACS_path_cost[42];
        path_cost[43]      <=  ACS_path_cost[43];
        path_cost[44]      <=  ACS_path_cost[44];
        path_cost[45]      <=  ACS_path_cost[45];
        path_cost[46]      <=  ACS_path_cost[46];
        path_cost[47]      <=  ACS_path_cost[47];

        path_cost[48]      <=  ACS_path_cost[48];
        path_cost[49]      <=  ACS_path_cost[49];
        path_cost[50]      <=  ACS_path_cost[50];
        path_cost[51]      <=  ACS_path_cost[51];
        path_cost[52]      <=  ACS_path_cost[52];
        path_cost[53]      <=  ACS_path_cost[53];
        path_cost[54]      <=  ACS_path_cost[54];
        path_cost[55]      <=  ACS_path_cost[55];

        path_cost[56]      <=  ACS_path_cost[56];
        path_cost[57]      <=  ACS_path_cost[57];
        path_cost[58]      <=  ACS_path_cost[58];
        path_cost[59]      <=  ACS_path_cost[59];
        path_cost[60]      <=  ACS_path_cost[60];
        path_cost[61]      <=  ACS_path_cost[61];
        path_cost[62]      <=  ACS_path_cost[62];
        path_cost[63]      <=  ACS_path_cost[63];
    end
end

endmodule