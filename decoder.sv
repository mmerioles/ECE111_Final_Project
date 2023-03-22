module decoder
(
   input             clk,
   input             rst,
   input             enable,
   input [1:0]       d_in,
   output logic      d_out);

//   logic             decoder_o_reg;
		
//bmc module signals
   wire  [1:0]       bmc000_path_0_bmc;
   wire  [1:0]       bmc001_path_0_bmc;
   wire  [1:0]       bmc010_path_0_bmc;
   wire  [1:0]       bmc011_path_0_bmc;
   wire  [1:0]       bmc100_path_0_bmc;
   wire  [1:0]       bmc101_path_0_bmc;
   wire  [1:0]       bmc110_path_0_bmc;
   wire  [1:0]       bmc111_path_0_bmc;

   wire  [1:0]       bmc000_path_1_bmc;
   wire  [1:0]       bmc001_path_1_bmc;
   wire  [1:0]       bmc010_path_1_bmc;
   wire  [1:0]       bmc011_path_1_bmc;
   wire  [1:0]       bmc100_path_1_bmc;
   wire  [1:0]       bmc101_path_1_bmc;
   wire  [1:0]       bmc110_path_1_bmc;
   wire  [1:0]       bmc111_path_1_bmc;

//ACS modules signals
   logic   [7:0]       validity;
   logic   [7:0]       selection;
   logic   [7:0]       path_cost   [8];
   wire    [7:0]       validity_nets;
   wire    [7:0]       selection_nets;

   wire              ACS000_selection;
   wire              ACS001_selection;
   wire              ACS010_selection;
   wire              ACS011_selection;
   wire              ACS100_selection;
   wire              ACS101_selection;
   wire              ACS110_selection;
   wire              ACS111_selection;

   wire              ACS000_valid_o;
   wire              ACS001_valid_o;
   wire              ACS010_valid_o;
   wire              ACS011_valid_o;
   wire              ACS100_valid_o;
   wire              ACS101_valid_o;
   wire              ACS110_valid_o;
   wire              ACS111_valid_o;

   wire  [7:0]       ACS000_path_cost;
   wire  [7:0]       ACS001_path_cost;
   wire  [7:0]       ACS010_path_cost;
   wire  [7:0]       ACS011_path_cost;
   wire  [7:0]       ACS100_path_cost;
   wire  [7:0]       ACS101_path_cost;
   wire  [7:0]       ACS110_path_cost;
   wire  [7:0]       ACS111_path_cost;

//Trelis memory write operation
   logic   [1:0]       mem_bank;
   logic   [1:0]       mem_bank_buf;
   logic   [1:0]       mem_bank_buf_buf;
   logic               mem_bank_buf_buf_buf;
   logic               mem_bank_buf_buf_buf_buf;
   logic               mem_bank_buf_buf_buf_buf_buf;
   logic   [9:0]       wr_mem_counter;
   logic   [9:0]       rd_mem_counter;

   logic   [9:0]       addr_mem_A;
   logic   [9:0]       addr_mem_B;
   logic   [9:0]       addr_mem_C;
   logic   [9:0]       addr_mem_D;

   logic               wr_mem_A;
   logic               wr_mem_B;
   logic               wr_mem_C;
   logic               wr_mem_D;

   logic   [7:0]       d_in_mem_A;
   logic   [7:0]       d_in_mem_B;
   logic   [7:0]       d_in_mem_C;
   logic   [7:0]       d_in_mem_D;

   wire    [7:0]       d_o_mem_A;
   wire    [7:0]       d_o_mem_B;
   wire    [7:0]       d_o_mem_C;
   wire    [7:0]       d_o_mem_D;
		  
//Trace back module signals
   logic               selection_tbu_0;
   logic               selection_tbu_1;

   logic   [7:0]       d_in_0_tbu_0;
   logic   [7:0]       d_in_1_tbu_0;
   logic   [7:0]       d_in_0_tbu_1;
   logic   [7:0]       d_in_1_tbu_1;

   wire                d_o_tbu_0;
   wire                d_o_tbu_1;

   logic               enable_tbu_0;
   logic               enable_tbu_1;

//Display memory operations 
   wire                wr_disp_mem_0;
   wire                wr_disp_mem_1;

   wire                d_in_disp_mem_0;
   wire                d_in_disp_mem_1;

   logic   [9:0]       wr_mem_counter_disp;
   logic   [9:0]       rd_mem_counter_disp;

   logic   [9:0]       addr_disp_mem_0;
   logic   [9:0]       addr_disp_mem_1;

//Branch matrc calculation modules

   bmc000   bmc000_inst(d_in,bmc000_path_0_bmc,bmc000_path_1_bmc);
/*  similarly for bmc001 through 111
*/


//Add Compare Select Modules
   ACS      ACS000(validity[0],validity[1],bmc000_path_0_bmc,bmc000_path_1_bmc,path_cost[0],path_cost[1],ACS000_selection,ACS000_valid_o,ACS000_path_cost);
   ACS      ACS001(validity[3],validity[2],bmc001_path_0_bmc,bmc001_path_1_bmc,path_cost[3],path_cost[2],ACS001_selection,ACS001_valid_o,ACS001_path_cost);
   ACS      ACS010(validity[4],validity[5],bmc010_path_0_bmc,bmc010_path_1_bmc,path_cost[4],path_cost[5],ACS010_selection,ACS010_valid_o,ACS010_path_cost);
   ACS      ACS011(validity[7],validity[6],bmc011_path_0_bmc,bmc011_path_1_bmc,path_cost[7],path_cost[6],ACS011_selection,ACS011_valid_o,ACS011_path_cost);
   ACS      ACS100(validity[1],validity[0],bmc100_path_0_bmc,bmc100_path_1_bmc,path_cost[1],path_cost[0],ACS100_selection,ACS100_valid_o,ACS100_path_cost);
   ACS      ACS101(validity[2],validity[3],bmc101_path_0_bmc,bmc101_path_1_bmc,path_cost[2],path_cost[3],ACS101_selection,ACS101_valid_o,ACS101_path_cost);
   ACS      ACS110(validity[5],validity[4],bmc110_path_0_bmc,bmc110_path_1_bmc,path_cost[5],path_cost[4],ACS110_selection,ACS110_valid_o,ACS110_path_cost);
   ACS      ACS111(validity[6],validity[7],bmc111_path_0_bmc,bmc111_path_1_bmc,path_cost[6],path_cost[7],ACS111_selection,ACS111_valid_o,ACS111_path_cost);
   
   assign selection_nets  =  {ACS111_selection,ACS110_selection,ACS101_selection,ACS100_selection,
                              ACS011_selection,ACS010_selection,ACS001_selection,ACS000_selection};
   assign validity_nets    =  {ACS111_valid_o,ACS110_valid_o,ACS101_valid_o,ACS100_valid_o,
                              ACS011_valid_o,ACS010_valid_o,ACS001_valid_o,ACS000_valid_o};


   always @ (posedge clk, negedge rst) begin
      if(!rst)  begin
         validity          <= 8'b00000001;
         selection         <= 8'b00000000;
/* clear all 8 path costs
         path_cost[i]      <= 8'd0;
*/
      end
      else if(!enable)   begin
         validity          <= 8'b00000001;
         selection         <= 8'b00000000;
/* clear all 8 path costs
         path_cost[i]      <= 8'd0;
*/
      end
      else if( path_cost[0][7] && path_cost[1][7] && path_cost[2][7] && path_cost[3][7] &&
             path_cost[4][7] && path_cost[5][7] && path_cost[6][7] && path_cost[7][7] )
      begin

         validity          <= validity_nets;
         selection         <= selection_nets;
         
         path_cost[0]      <= 8'b01111111 & ACS000_path_cost;
/*  likewise for path_cost[1:7] and ACS001:111_path_cost
*/
      end
      else   begin
         validity          <= validity_nets;
         selection         <= selection_nets;

         path_cost[0]      <= ACS000_path_cost;
/* likewise for 1:7
*/
      end
   end

   always @ (posedge clk, negedge rst) begin
      if(!rst)
         wr_mem_counter <= 10'd0;
      else if(!enable)
         wr_mem_counter <= 10'd0;
      else
         wr_mem_counter <= wr_mem_counter + 10'd1;
   end

   always @ (posedge clk, negedge rst) begin
      if(!rst)
         rd_mem_counter <= // -1   how do you handle this in 10 bit binary?
      else if(enable)
         rd_mem_counter <= rd_mem_counter - 10'd1;
   end

   always @ (posedge clk, negedge rst)
      if(!rst)
         mem_bank <= 2'b00;
      else begin
         if(wr_mem_counter==10'b1111111111)
               mem_bank <= mem_bank + 2'b01;
      end

   always @ (posedge clk)    begin
      d_in_mem_A  <= selection;
      d_in_mem_B  <= selection;
      d_in_mem_C  <= selection;
      d_in_mem_D  <= selection;
   end

   always @ (posedge clk)     begin
      case(mem_bank)
         2'b00:         begin
            addr_mem_A        <= wr_mem_counter;
            addr_mem_B        <= rd_mem_counter;
            addr_mem_C        <= 10'd0;
            addr_mem_D        <= rd_mem_counter;

            wr_mem_A          <= 1'b1;
/* other wr_mems = 0
*/	        
         end
         2'b01:         begin
            addr_mem_A        <= rd_mem_counter;
            addr_mem_B        <= wr_mem_counter;
            addr_mem_C        <= rd_mem_counter;
            addr_mem_D        <= 10'd0;

            wr_mem_B          <= 1'b1;
/* other wr_mems = 0
*/	        
         end		       
         2'b10:    begin
            addr_mem_A        <= 10'd0;
            addr_mem_B        <= rd_mem_counter;
            addr_mem_C        <= wr_mem_counter;
            addr_mem_D        <= rd_mem_counter;

            wr_mem_C       <= 1'b1;
/* other wr_mems = 0
*/	        
         end
         2'b11:     begin
            addr_mem_A        <= rd_mem_counter;
            addr_mem_B        <= 10'd0;
            addr_mem_C        <= rd_mem_counter;
            addr_mem_D        <= wr_mem_counter;

            wr_mem_D       <= 1'b1;
/* other wr_mems = 0
*/	        
         end		       
      endcase
  end

//Trelis memory module instantiation

   mem   trelis_mem_A
   (
      .clk,
      .wr(wr_mem_A),
      .addr(addr_mem_A),
      .d_i(d_in_mem_A),
      .d_o(d_o_mem_A)
   );
/* likewise for trelis_memB, C, D
*/

//Trace back module operation

   always @(posedge clk)
      mem_bank_buf   <= mem_bank;
   
   always @(posedge clk)
      mem_bank_buf_buf   <= mem_bank_buf;

   always @ (posedge clk, negedge rst)
      if(!rst)
            enable_tbu_0   <= 1'b0;
      else begin
         if(mem_bank_buf_buf==2'b10)
            enable_tbu_0   <= 1'b1;
         else
            enable_tbu_0   <= enable_tbu_0;
      end   

   always @ (posedge clk, negedge rst)
      if(!rst)
            enable_tbu_1   <= 1'b0;
      else begin
         if(mem_bank_buf_buf==2'b11)
            enable_tbu_1   <= 1'b1;
         else
            enable_tbu_1   <= enable_tbu_1;
      end   
   
   always @ (posedge clk)
      case(mem_bank_buf_buf)
         2'b00:	  begin
            d_in_0_tbu_0   <= d_o_mem_D;
            d_in_1_tbu_0   <= d_o_mem_C;
            
            d_in_0_tbu_1   <= d_o_mem_C;
            d_in_1_tbu_1   <= d_o_mem_B;

            selection_tbu_0<= 1'b0;
            selection_tbu_1<= 1'b1;

         end
         2'b01:	   begin
            d_in_0_tbu_0   <= d_o_mem_D;
            d_in_1_tbu_0   <= d_o_mem_C;
            
            d_in_0_tbu_1   <= d_o_mem_A;
            d_in_1_tbu_1   <= d_o_mem_D;
            
            selection_tbu_0<= 1'b1;
            selection_tbu_1<= 1'b0;
         end
         2'b10:	   begin
            d_in_0_tbu_0   <= d_o_mem_B;
            d_in_1_tbu_0   <= d_o_mem_A;
            
            d_in_0_tbu_1   <= d_o_mem_A;
            d_in_1_tbu_1   <= d_o_mem_D;

            selection_tbu_0<= 1'b0;
            selection_tbu_1<= 1'b1;
         end
         2'b11:	  begin
            d_in_0_tbu_0   <= d_o_mem_B;
            d_in_1_tbu_0   <= d_o_mem_A;
            
            d_in_0_tbu_1   <= d_o_mem_C;
            d_in_1_tbu_1   <= d_o_mem_B;

            selection_tbu_0<= 1'b1;
            selection_tbu_1<= 1'b0;
         end
      endcase

//Trace-Back modules instantiation

   tbu tbu_0   (
      .clk,
      .rst,
      .enable(enable_tbu_0),
      .selection(selection_tbu_0),
      .d_in_0(d_in_0_tbu_0),
      .d_in_1(d_in_1_tbu_0),
      .d_o(d_o_tbu_0),
      .wr_en(wr_disp_mem_0)
   );

/* analogous for tbu_1
*/

//Display Memory modules Instantioation

   assign   d_in_disp_mem_0   =  d_o_tbu_0;
   assign   d_in_disp_mem_1   =  d_o_tbu_1;

  mem_disp   disp_mem_0
  (
      .clk              ,
      .wr(wr_disp_mem_0),
      .addr(addr_disp_mem_0),
      .d_i(d_in_disp_mem_0),
      .d_o(d_o_disp_mem_0)
   );
/* analogous for disp_mem_1
*/

// Display memory module operation
   always @ (posedge clk)
      mem_bank_buf_buf_buf <= mem_bank_buf_buf[0];

   always @ (posedge clk)
      if(!rst)
         wr_mem_counter_disp  <= 10'b0000000010;
      else if(!enable)
         wr_mem_counter_disp  <= 10'b0000000010;
      else
         wr_mem_counter_disp  <= wr_mem_counter_disp - 10'd1;   

   always @ (posedge clk)
      if(!rst)
         rd_mem_counter_disp  <= 10'b1111111101;
      else if(!enable)
         rd_mem_counter_disp  <= 10'b1111111101;
      else
         rd_mem_counter_disp  <= rd_mem_counter_disp + 10'd1;   
   
   always @ (posedge clk)
      case(mem_bank_buf_buf_buf)
         1'b0:
         begin
            addr_disp_mem_0   <= rd_mem_counter_disp; 
            addr_disp_mem_1   <= wr_mem_counter_disp;
         end
         1'b1:	 swap rd and wr 
      endcase

   always @ (posedge clk) begin
      mem_bank_buf_buf_buf_buf     <= mem_bank_buf_buf_buf;
      mem_bank_buf_buf_buf_buf_buf <= mem_bank_buf_buf_buf_buf;
   end

   always @ (posedge clk)
/*  d_out = d_o_disp_mem_i 
    i = mem_bank_buf_buf_buf_buf_buf 
*/

endmodule
