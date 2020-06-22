module mem_disp_top(
    input  wire           clk,
    input  wire           RSTn,

    input  wire           d_in_valid,

    input  wire   [1:0]   mem_bank_buf_buf,

    input  wire           wr_disp_mem_0,
    input  wire           wr_disp_mem_1,

    input  wire           d_in_disp_mem_0,
    input  wire           d_in_disp_mem_1,

    output reg            process_en,
    output reg            d_out_valid,

    output reg            decoder_o_reg
);

reg [4:0] addr_disp_mem_0;
reg [4:0] addr_disp_mem_1;

reg       d_o_disp_mem_0;
reg       d_o_disp_mem_1;

reg       mem_bank_buf_buf_buf;
reg       mem_bank_buf_buf_buf_buf;
reg       mem_bank_buf_buf_buf_buf_buf;


reg [4:0] wr_mem_counter_disp;
reg [4:0] rd_mem_counter_disp;

reg       d_in_valid_buf;
reg       d_out_valid_buf;

reg [7:0] counter1;
reg [7:0] counter2; 


//d_out_valid and process_en signal generation
always @ (posedge clk)
    d_in_valid_buf <= d_in_valid;

always @ (posedge clk or negedge RSTn)
begin
    if(RSTn ==1'b0)
        counter1 <=  8'b0;
    else 
        if(d_in_valid==1'b1 && d_in_valid_buf==1'b0)
            counter1 <= counter1 + 1'b1;
        else 
            if(counter1 == 8'd133)//32*4 pipeline latency + 5 mem rd/wr latency
                counter1 <= 8'b0;
            else
                if(counter1 != 8'b0)
                    counter1 <= counter1 +1'b1;
                else
                    counter1 <= counter1;
end

always @ (posedge clk or negedge RSTn)
begin
    if(RSTn ==1'b0)
        counter2 <=  8'b0;
    else 
        if(d_in_valid==1'b0 && d_in_valid_buf==1'b1)
            counter2 <= counter2 + 1'b1;
        else 
            if(counter2 == 8'd133)//32*4 pipeline latency + 5 mem rd/wr latency
                counter2 <= 8'b0;
            else
                if(counter2 != 8'b0)
                    counter2 <= counter2 +1'b1;
                else
                    counter2 <= counter2;
end

always @ (posedge clk or negedge RSTn)
begin
    if(RSTn ==1'b0)
        d_out_valid <= 1'b0;
    else
        if(counter1 ==8'd133)
            d_out_valid <= 1'b1;
        else
            if(counter2==8'd133)
                d_out_valid <= 1'b0;
            else
                d_out_valid <= d_out_valid;
end

always @ (posedge clk)
    d_out_valid_buf <= d_out_valid;

always @ (posedge clk or negedge RSTn)
begin
    if(RSTn ==1'b0)
        process_en <= 1'b0;
    else 
        if(d_in_valid ==1'b1)
            process_en <= 1'b1;
        else 
            if(d_out_valid ==1'b0 && d_out_valid_buf ==1'b1)
                process_en <= 1'b0;
            else
                process_en <= process_en; 
end 


//Display Memory modules Instantioation
mem_disp   disp_mem_0
(
    .clk(clk),
    .RSTn(RSTn),
    .wr(wr_disp_mem_0),
    .addr(addr_disp_mem_0),
    .d_i(d_in_disp_mem_0),
    .d_o(d_o_disp_mem_0)
);

mem_disp   disp_mem_1
(
    .clk(clk),
    .RSTn(RSTn),
    .wr(wr_disp_mem_1),
    .addr(addr_disp_mem_1),
    .d_i(d_in_disp_mem_1),
    .d_o(d_o_disp_mem_1)
);

// Display memory module control signal generation
always @ (posedge clk)
    mem_bank_buf_buf_buf <= mem_bank_buf_buf[0];

always @ (posedge clk or negedge RSTn)
begin
    if(RSTn==1'b0)
        wr_mem_counter_disp  <= 5'b00010;
    if(process_en==1'b0 && d_in_valid==1'b0)
        wr_mem_counter_disp  <= 5'b00010;
    else
        wr_mem_counter_disp  <= wr_mem_counter_disp - 5'b1;   
end

always @ (posedge clk or negedge RSTn)
begin
    if(RSTn==1'b0)
        rd_mem_counter_disp  <= 5'b11101;
    if(process_en==1'b0 && d_in_valid==1'b0)
        rd_mem_counter_disp  <= 5'b11101;
    else
        rd_mem_counter_disp  <= rd_mem_counter_disp + 5'b1;   
end


always @ (posedge clk or negedge RSTn)
begin
    if(RSTn ==1'b0)
    begin
       addr_disp_mem_0  <= 5'b0;
       addr_disp_mem_1  <= 5'b0; 
    end
    else
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



always @ (posedge clk or negedge RSTn)
begin
    if(RSTn ==1'b0)
        decoder_o_reg <= 1'b0;
    else
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
