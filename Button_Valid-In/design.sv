`timescale 1ns/1ns

module valid_in (valid_in, clk, rst, button);
	input clk;
	input rst;
	input button;
	output [7:0] valid_in;

  	reg[7:0] valid_in;
  
always @(posedge clk)
	begin
		if(rst)
			valid_in <= 0;
		else
			valid_in <= button;
			
	end
endmodule 
