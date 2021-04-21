module up_counter ( output reg [7:0] out,
  					input enable, clk, rst,
 					output valid1
                  );
  
  always @(posedge clk) begin
  	if (rst) 
    	out <= 8'b0;
  	 
  
  	else if (enable) 
   		out <= out + 1;

  end
	assign valid1 = enable; 
  
  endmodule 