// figure out what this encoder does -- differs a bit from Homework 7
module encoder                    // use this one
(  input             clk,
   input             rst,
   input             enable_i,
   input             d_in,
   output logic      valid_o,
   output      [1:0] d_out);
   
   logic       [2:0] cstate;
   logic       [2:0] nstate;
   
   logic       [1:0] d_out_reg;

   assign   d_out    =  (enable_i)? d_out_reg:2'b00;

   always_comb begin
     valid_o = enable_i;
	  nstate = {cstate[0] ^ cstate[1] ^ d_in, cstate[2:1]};
	  d_out_reg = {cstate[1] ^ cstate[2] ^ d_in, d_in};
//	  if(d_in)
//		case(cstate)
//			0:	begin
//			   nstate = 4;
//				d_out_reg = 2'b11;
//				end
//			1:	begin
//				nstate = 0;
//				d_out_reg = 2'b11;
//				end
//			2:	begin
//				nstate = 1;
//				d_out_reg = 2'b01;
//				end
//			3:	begin
//				nstate = 5;
//				d_out_reg = 2'b01;
//				end
//			4:	begin
//				nstate = 6;
//				d_out_reg = 2'b01;
//				end
//			5:	begin
//				nstate = 2;
//				d_out_reg = 2'b01;
//				end
//			6:	begin
//				nstate = 3;
//				d_out_reg = 2'b11;
//				end
//			7:	begin
//				nstate = 37;
//				d_out_reg = 2'b11;
//				end
//		endcase
//	  else
//		case(cstate)
//			0:	begin
//			   nstate = 0;
//				d_out_reg = 2'b00;
//				end
//			1:	begin
//				nstate = 4;
//				d_out_reg = 2'b00;
//				end
//			2:	begin
//				nstate = 5;
//				d_out_reg = 2'b10;
//				end
//			3:	begin
//				nstate = 1;
//				d_out_reg = 2'b10;
//				end
//			4:	begin
//				nstate = 2;
//				d_out_reg = 2'b10;
//				end
//			5:	begin
//				nstate = 6;
//				d_out_reg = 2'b10;
//				end
//			6:	begin
//				nstate = 7;
//				d_out_reg = 2'b00;
//				end
//			7:	begin
//				nstate = 3;
//				d_out_reg = 2'b00;
//				end
//		endcase
   end								   

   always @ (posedge clk,negedge rst)   begin
//      $display("data in=%d state=%b%b%b data out=%b%b",d_in,reg_1,reg_2,reg_3,d_out_reg[1],d_out_reg[0]);
      if(!rst)
         cstate   <= 3'b000;
      else if(!enable_i)
         cstate   <= 3'b000;
      else
         cstate   <= nstate;
   end

endmodule
