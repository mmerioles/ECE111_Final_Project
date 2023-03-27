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


   logic  [7:0] path_cost_0;			   // branch metric + path metric
   logic  [7:0] path_cost_1;
	
	logic [7:0] path_temp;

/* Fill in the guts per ACS instructions */
always_comb begin

	path_cost_0 <= path_0_pmc + path_0_bmc;
	path_cost_1 <= path_1_pmc + path_1_bmc;

	case({path_0_valid, path_1_valid})
		00: begin
			selection <= 0;
			valid_o <= 0;
			path_temp <= 0;
			end
		01: begin
			selection <= 1;
			valid_o <= 1;
			path_temp <= path_cost_1;
			end
		10: begin
			selection <= 0;
			valid_o <= 1;
			path_temp <= path_cost_0;
			end
		11: begin
			if(path_cost_0 > path_cost_1) begin
				selection <= 1;
				valid_o <= 1;
				path_temp <= path_cost_1;
			end else begin
				selection <= 0;
				valid_o <= 1;
				path_temp <= path_cost_0;
				end
			end
		default: begin
			selection <= 0;
			valid_o <= 0;
			path_temp <= 0;
			end
	endcase
end

assign path_cost = path_temp;

endmodule
