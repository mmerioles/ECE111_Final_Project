module encoder_tb;

   bit         clk;
   bit         rst;
   bit         d_in;
   bit         enable_i;
   wire        valid_o;
   wire  [1:0] d_out;
   logic [1:0] ans[40];
   int         case_count, good, bad; 

   encoder DUT   (
      .clk,
      .rst,
	  .enable_i,
      .d_in,
	  .valid_o,
      .d_out
   );

   always begin
      #10   clk = 1'b1;
      #5    if(d_out==ans[case_count]) begin $displayb("yaa",,,,d_in,,,,d_out,,,ans[case_count]);
                good++;
			end
	        else begin  $displayb("boo",,,,d_in,,,,d_out,,,ans[case_count]);
			    bad++;
			end
      #5    clk = 1'b0;
	        case_count++;
   end
   
   initial  begin
      $readmemb("encoder_soln.txt",ans);
      $display("din dout");


      #110 rst      = 1'b1;
	       enable_i = 1'b1;
      #60  d_in  =  1'b1;
      #20  d_in  =  1'b0;
      #20  d_in  =  1'b0;
      #20  d_in  =  1'b0;
      #20  d_in  =  1'b1;
      #20  d_in  =  1'b0;
      #20  d_in  =  1'b0;
      #20  d_in  =  1'b1;
      #20  d_in  =  1'b1;   
      #20  d_in  =  1'b0;    
      #460 $display("good = %d, bad = %d",good,bad);      
      $stop;
      
   end
endmodule
