`timescale 1ns/1ns
//SIPO reg has been used to count 4 counter outputs.

module shift_register (
						input clk, rst,
  						input [7:0] data_in,
                        input valid_in,
  						output reg [31:0] data_out,
                        output valid_fifo
						);
  
  always @(posedge clk) begin
    
	if (rst)
    	data_out <= 32'b0;
  	else if (valid_in)
    	data_out <= {4{data_in}};
   else
     	data_out <= 32'b0;
	end

assign valid_fifo = data_out; 
  
endmodule

