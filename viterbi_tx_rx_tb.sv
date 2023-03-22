// test bench
module viterbi_tx_rx_tb();
   bit clk;
   bit rst;
   bit encoder_i;		   // original data
   bit enc_i_hist[2048];   // history thereof
   bit enable_encoder_i;
   wire decoder_o;		   // decoded data
   bit dec_o_hist[2048];   // history thereof
   bit disp;
   int good, bad; 		   // scoreboard

// this module contains conv. encode and Vit decode
   viterbi_tx_rx vtr(
      .clk,
      .rst,
      .encoder_i,		    // original data
      .enable_encoder_i,
      .decoder_o    );		// decoded data

   always begin
      #50   clk   = 1;
      #50  clk    = 0;
   end
   int i, j, k, l;

   always @(posedge clk) begin
	 enc_i_hist[i] <= encoder_i;
	 i <= i+1;
	 l <= l+1;
   end
   initial begin   
	 #410400;
	 forever @(posedge clk) begin
	   dec_o_hist[k] <= decoder_o;
	   k<=k+1;
     end
   end

   initial begin
      clk      =  1'b1;
      #1000
      rst       =  1'b1;
      enable_encoder_i  =  1'b1;
      #100
      encoder_i=  1'b1; 
      #100
      encoder_i=  1'b0;   
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b1;  
      
      #100
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;       
      #100
      encoder_i=  1'b0;   
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b0;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b1;  
      #100
      encoder_i=  1'b1; 

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;
      #1000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;


      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;


      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;


      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;


      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;


      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;
      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #10000
      encoder_i=  1'b0;
      #100
      encoder_i=  1'b1;

      #1000000                      	    
      for(j=0; j<256; j=j+1) 		// checker & scoreboard
        if(enc_i_hist[j]==dec_o_hist[j]) begin 
          $displayb("yaa! in = %b, out = %b",enc_i_hist[j],dec_o_hist[j]);
          good++;
		end
		else begin
          $displayb("boo! in = %b, out = %b",enc_i_hist[j],dec_o_hist[j]);
          bad++;
		end
	  $display("good = %d, bad = %d",good,bad);
	  disp = 1;

      $stop;
   end

endmodule
