module tbu(
   input  wire         clk,
   input  wire         RSTn,
   input  wire         enable,
   input  wire         selection,
   input  wire  [63:0] d_in_0,
   input  wire  [63:0] d_in_1,
   output reg          d_o,
   output reg          wr_en
);

reg         d_o_reg;
reg         wr_en_reg;

reg   [5:0] pstate;
reg   [5:0] nstate;

reg         selection_buf;

always @(posedge clk or negedge RSTn)
begin
   if(RSTn ==1'b0)
   begin
      selection_buf <= 1'b0;
      wr_en         <= 1'b0;
      d_o           <= 1'b0;   
   end
   else
   begin
      selection_buf  <= selection;
      wr_en          <= wr_en_reg;
      d_o            <= d_o_reg;
   end
end

always @(posedge clk or negedge RSTn)
begin
   if(RSTn==1'b0)
      pstate   <= 6'b000;
   else if(enable==1'b0)
      pstate   <= 6'b000;
   else if(selection_buf==1'b1 && selection==1'b0)
      pstate   <= 6'b000;
   else
      pstate   <= nstate;
end


always @(*)
begin
   case (pstate)
      6'd0:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[0])
               nstate   =  6'd1;
            else
               nstate   =  6'd0;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[0])
               nstate   =  6'd1;
            else
               nstate   =  6'd0;
         end
      end

      6'd1:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[1])
               nstate   =  6'd2;
            else
               nstate   =  6'd3;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[1])
               nstate   =  6'd2;
            else
               nstate   =  6'd3;
         end
      end

      6'd2:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[2])
               nstate   =  6'd5;
            else
               nstate   =  6'd4;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[2])
               nstate   =  6'd5;
            else
               nstate   =  6'd4;
         end
      end

      6'd3:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[3])
               nstate   =  6'd6;
            else
               nstate   =  6'd7;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[3])
               nstate   =  6'd6;
            else
               nstate   =  6'd7;
         end
      end

      6'd4:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[4])
               nstate   =  6'd9;
            else
               nstate   =  6'd8;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[4])
               nstate   =  6'd9;
            else
               nstate   =  6'd8;
         end
      end

      6'd5:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[5])
               nstate   =  6'd10;
            else
               nstate   =  6'd11;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[5])
               nstate   =  6'd10;
            else
               nstate   =  6'd11;
         end
      end

      6'd6:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[6])
               nstate   =  6'd13;
            else
               nstate   =  6'd12;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[6])
               nstate   =  6'd13;
            else
               nstate   =  6'd12;
         end
      end

      6'd7:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[7])
               nstate   =  6'd14;
            else
               nstate   =  6'd15;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[7])
               nstate   =  6'd14;
            else
               nstate   =  6'd15;
         end
      end

      6'd8:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[8])
               nstate   =  6'd17;
            else
               nstate   =  6'd16;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[8])
               nstate   =  6'd17;
            else
               nstate   =  6'd16;
         end
      end

      6'd9:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[9])
               nstate   =  6'd18;
            else
               nstate   =  6'd19;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[9])
               nstate   =  6'd18;
            else
               nstate   =  6'd19;
         end
      end


      6'd10:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[10])
               nstate   =  6'd21;
            else
               nstate   =  6'd20;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[10])
               nstate   =  6'd21;
            else
               nstate   =  6'd20;
         end
      end

      6'd11:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[11])
               nstate   =  6'd22;
            else
               nstate   =  6'd23;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[11])
               nstate   =  6'd22;
            else
               nstate   =  6'd23;
         end
      end

      6'd12:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[12])
               nstate   =  6'd25;
            else
               nstate   =  6'd24;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[12])
               nstate   =  6'd25;
            else
               nstate   =  6'd24;
         end
      end

      6'd13:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[13])
               nstate   =  6'd26;
            else
               nstate   =  6'd27;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[13])
               nstate   =  6'd26;
            else
               nstate   =  6'd27;
         end
      end

      6'd14:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[14])
               nstate   =  6'd29;
            else
               nstate   =  6'd28;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[14])
               nstate   =  6'd29;
            else
               nstate   =  6'd28;
         end
      end

      6'd15:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[15])
               nstate   =  6'd30;
            else
               nstate   =  6'd31;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[15])
               nstate   =  6'd30;
            else
               nstate   =  6'd31;
         end
      end

      6'd16:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[16])
               nstate   =  6'd33;
            else
               nstate   =  6'd32;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[16])
               nstate   =  6'd33;
            else
               nstate   =  6'd32;
         end
      end

      6'd17:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[17])
               nstate   =  6'd34;
            else
               nstate   =  6'd35;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[17])
               nstate   =  6'd34;
            else
               nstate   =  6'd35;
         end
      end

      6'd18:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[18])
               nstate   =  6'd37;
            else
               nstate   =  6'd36;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[18])
               nstate   =  6'd37;
            else
               nstate   =  6'd36;
         end
      end

      6'd19:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[19])
               nstate   =  6'd38;
            else
               nstate   =  6'd39;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[19])
               nstate   =  6'd38;
            else
               nstate   =  6'd39;
         end
      end

      6'd20:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[20])
               nstate   =  6'd41;
            else
               nstate   =  6'd40;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[20])
               nstate   =  6'd41;
            else
               nstate   =  6'd40;
         end
      end

      6'd21:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[21])
               nstate   =  6'd42;
            else
               nstate   =  6'd43;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[21])
               nstate   =  6'd42;
            else
               nstate   =  6'd43;
         end
      end

      6'd22:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[22])
               nstate   =  6'd45;
            else
               nstate   =  6'd44;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[22])
               nstate   =  6'd45;
            else
               nstate   =  6'd44;
         end
      end

      6'd23:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[23])
               nstate   =  6'd46;
            else
               nstate   =  6'd47;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[23])
               nstate   =  6'd46;
            else
               nstate   =  6'd47;
         end
      end

      6'd24:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[24])
               nstate   =  6'd49;
            else
               nstate   =  6'd48;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[24])
               nstate   =  6'd49;
            else
               nstate   =  6'd48;
         end
      end


      6'd25:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[25])
               nstate   =  6'd50;
            else
               nstate   =  6'd51;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[25])
               nstate   =  6'd50;
            else
               nstate   =  6'd51;
         end
      end

      6'd26:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[26])
               nstate   =  6'd53;
            else
               nstate   =  6'd52;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[26])
               nstate   =  6'd53;
            else
               nstate   =  6'd52;
         end
      end

      6'd27:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[27])
               nstate   =  6'd54;
            else
               nstate   =  6'd55;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[27])
               nstate   =  6'd54;
            else
               nstate   =  6'd55;
         end
      end

      6'd28:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[28])
               nstate   =  6'd57;
            else
               nstate   =  6'd56;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[28])
               nstate   =  6'd57;
            else
               nstate   =  6'd56;
         end
      end

      6'd29:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[29])
               nstate   =  6'd58;
            else
               nstate   =  6'd59;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[29])
               nstate   =  6'd58;
            else
               nstate   =  6'd59;
         end
      end

      6'd30:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[30])
               nstate   =  6'd61;
            else
               nstate   =  6'd60;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[30])
               nstate   =  6'd61;
            else
               nstate   =  6'd60;
         end
      end

      6'd31:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[31])
               nstate   =  6'd62;
            else
               nstate   =  6'd63;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[31])
               nstate   =  6'd62;
            else
               nstate   =  6'd63;
         end
      end

      6'd32:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[32])
               nstate   =  6'd1;
            else
               nstate   =  6'd0;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[32])
               nstate   =  6'd1;
            else
               nstate   =  6'd0;
         end
      end

      6'd33:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[33])
               nstate   =  6'd2;
            else
               nstate   =  6'd3;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[33])
               nstate   =  6'd2;
            else
               nstate   =  6'd3;
         end
      end

      6'd34:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[34])
               nstate   =  6'd5;
            else
               nstate   =  6'd4;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[34])
               nstate   =  6'd5;
            else
               nstate   =  6'd4;
         end
      end

      6'd35:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[35])
               nstate   =  6'd6;
            else
               nstate   =  6'd7;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[35])
               nstate   =  6'd6;
            else
               nstate   =  6'd7;
         end
      end

      6'd36:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[36])
               nstate   =  6'd9;
            else
               nstate   =  6'd8;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[36])
               nstate   =  6'd9;
            else
               nstate   =  6'd8;
         end
      end

      6'd37:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[37])
               nstate   =  6'd10;
            else
               nstate   =  6'd11;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[37])
               nstate   =  6'd10;
            else
               nstate   =  6'd11;
         end
      end

      6'd38:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[38])
               nstate   =  6'd13;
            else
               nstate   =  6'd12;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[38])
               nstate   =  6'd13;
            else
               nstate   =  6'd12;
         end
      end

      6'd39:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[39])
               nstate   =  6'd14;
            else
               nstate   =  6'd15;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[39])
               nstate   =  6'd14;
            else
               nstate   =  6'd15;
         end
      end

      6'd40:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[40])
               nstate   =  6'd17;
            else
               nstate   =  6'd16;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[40])
               nstate   =  6'd17;
            else
               nstate   =  6'd16;
         end
      end

      6'd41:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[41])
               nstate   =  6'd18;
            else
               nstate   =  6'd19;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[41])
               nstate   =  6'd18;
            else
               nstate   =  6'd19;
         end
      end


      6'd42:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[42])
               nstate   =  6'd21;
            else
               nstate   =  6'd20;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[42])
               nstate   =  6'd21;
            else
               nstate   =  6'd20;
         end
      end

      6'd43:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[43])
               nstate   =  6'd22;
            else
               nstate   =  6'd23;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[43])
               nstate   =  6'd22;
            else
               nstate   =  6'd23;
         end
      end

      6'd44:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[44])
               nstate   =  6'd25;
            else
               nstate   =  6'd24;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[44])
               nstate   =  6'd25;
            else
               nstate   =  6'd24;
         end
      end

      6'd45:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[45])
               nstate   =  6'd26;
            else
               nstate   =  6'd27;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[45])
               nstate   =  6'd26;
            else
               nstate   =  6'd27;
         end
      end

      6'd46:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[46])
               nstate   =  6'd29;
            else
               nstate   =  6'd28;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[46])
               nstate   =  6'd29;
            else
               nstate   =  6'd28;
         end
      end

      6'd47:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[47])
               nstate   =  6'd30;
            else
               nstate   =  6'd31;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[47])
               nstate   =  6'd30;
            else
               nstate   =  6'd31;
         end
      end

      6'd48:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[48])
               nstate   =  6'd33;
            else
               nstate   =  6'd32;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[48])
               nstate   =  6'd33;
            else
               nstate   =  6'd32;
         end
      end

      6'd49:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[49])
               nstate   =  6'd34;
            else
               nstate   =  6'd35;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[49])
               nstate   =  6'd34;
            else
               nstate   =  6'd35;
         end
      end

      6'd50:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[50])
               nstate   =  6'd37;
            else
               nstate   =  6'd36;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[50])
               nstate   =  6'd37;
            else
               nstate   =  6'd36;
         end
      end

      6'd51:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[51])
               nstate   =  6'd38;
            else
               nstate   =  6'd39;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[51])
               nstate   =  6'd38;
            else
               nstate   =  6'd39;
         end
      end

      6'd52:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[52])
               nstate   =  6'd41;
            else
               nstate   =  6'd40;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[52])
               nstate   =  6'd41;
            else
               nstate   =  6'd40;
         end
      end

      6'd53:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[53])
               nstate   =  6'd42;
            else
               nstate   =  6'd43;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[53])
               nstate   =  6'd42;
            else
               nstate   =  6'd43;
         end
      end

      6'd54:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[54])
               nstate   =  6'd45;
            else
               nstate   =  6'd44;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[54])
               nstate   =  6'd45;
            else
               nstate   =  6'd44;
         end
      end

      6'd55:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[55])
               nstate   =  6'd46;
            else
               nstate   =  6'd47;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[55])
               nstate   =  6'd46;
            else
               nstate   =  6'd47;
         end
      end

      6'd56:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[56])
               nstate   =  6'd49;
            else
               nstate   =  6'd48;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[56])
               nstate   =  6'd49;
            else
               nstate   =  6'd48;
         end
      end


      6'd57:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[57])
               nstate   =  6'd50;
            else
               nstate   =  6'd51;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[57])
               nstate   =  6'd50;
            else
               nstate   =  6'd51;
         end
      end

      6'd58:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[58])
               nstate   =  6'd53;
            else
               nstate   =  6'd52;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[58])
               nstate   =  6'd53;
            else
               nstate   =  6'd52;
         end
      end

      6'd59:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[59])
               nstate   =  6'd54;
            else
               nstate   =  6'd55;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[59])
               nstate   =  6'd54;
            else
               nstate   =  6'd55;
         end
      end

      6'd60:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[60])
               nstate   =  6'd57;
            else
               nstate   =  6'd56;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[60])
               nstate   =  6'd57;
            else
               nstate   =  6'd56;
         end
      end

      6'd61:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[61])
               nstate   =  6'd58;
            else
               nstate   =  6'd59;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[61])
               nstate   =  6'd58;
            else
               nstate   =  6'd59;
         end
      end

      6'd62:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[62])
               nstate   =  6'd61;
            else
               nstate   =  6'd60;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[62])
               nstate   =  6'd61;
            else
               nstate   =  6'd60;
         end
      end

      6'd63:
      begin
         if(selection==1'b0)
         begin
            d_o_reg   =  1'b0;
            wr_en_reg =  1'b0;
            if(d_in_0[63])
               nstate   =  6'd62;
            else
               nstate   =  6'd63;
         end
         else
         begin
            d_o_reg   =  pstate[5];  
            wr_en_reg =  1'b1;
            if(d_in_1[63])
               nstate   =  6'd62;
            else
               nstate   =  6'd63;
         end
      end
























   endcase
end

endmodule
