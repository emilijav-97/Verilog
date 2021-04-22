module up_counter ( input enable, clk, rst,
                    output reg [7:0] out,
                    output valid1);
  
 
  always @(posedge clk) begin
    
 	if (rst) 
    	out <= 8'b0 ;
    
    else if (enable) 
   		out <= out + 1;
  
   assign valid1 = enable; 
    
  endmodule 