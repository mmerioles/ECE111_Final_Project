module ACS		                        // add-compare-select
(
   input       path_0_valid,
   input       path_1_valid,
   input [1:0] path_0_bmc,	            // branch metric computation
   input [1:0] path_1_bmc,				
   input [7:0] path_0_pmc,				// path metric computation
   input [7:0] path_1_pmc,

   output logic        selection,
   output logic        valid_o,
   output      [7:0] path_cost);  

   wire  [7:0] path_cost_0;			   // branch metric + path metric
   wire  [7:0] path_cost_1;
//andres was here
/* Fill in the guts per ACS instructions */
always_comb begin
/* 	for(int i = 0; i < 8; i++) begin
		path_cost_0[i] <= path_0_pmc[i] + path_0_bmc[i];
		path_cost_1[i] <= path_1_pmc[i] + path_1_bmc[i];
	end */
	path_cost_0 <= path_0_pmc + path_0_bmc;
	path_cost_1 <= path_1_pmc + path_1_bmc;
	case({path_0_valid, path_1_valid})
		00: begin
			selection <= 0;
			valid_o <= 0;
			end
		01: begin
			selection <= 1;
			valid_o <= 1;
			end
		10: begin
			selection <= 0;
			valid_o <= 1;
			end
		11: begin
			valid_o <= 1;
			if(path_cost_0 > path_cost_1)
				selection <= 1;
			else
				selection <= 0;
			end
	endcase
end
	
assign path_cost = selection ? path_cost_1 : path_cost_0;

endmodule
