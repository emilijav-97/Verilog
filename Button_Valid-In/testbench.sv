`timescale 1ns/1ns
module valid_in_tb;

  reg clk, rst, button;
  wire [7:0] valid_in;

  valid_in uut (.valid_in(valid_in),
                .clk(clk),
                .rst(rst),
                .button(button));

	initial begin
		clk = 0;
		forever
		#2 clk = ~clk;
	end

	initial begin
		
		// Initialize Inputs
		rst = 1;
		

		// Wait 5 ns for global reset to finish
		#5;
        
		// Add stimulus here
				rst = 0;
		#5		button = 1;
		#6		button = 0;
		#8		button = 1;
		#7		button = 0;
		#2		button = 1;
		#5		button = 0;
		#4		button = 0;
		#1		button = 1;
		#9		button = 0;
		#10	$stop;

	end
   
  initial 
  begin
   
    	$dumpfile("dump.vcd");
    	$dumpvars(1);
    end
endmodule
