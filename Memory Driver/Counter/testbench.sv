`timescale 1ns/1ns
module up_counter_tb;

  reg clk, rst, enable;
  wire [7:0] out;

  up_counter uut (.enable(enable),
                .clk(clk),
                .rst(rst),
                .out(out),
                .valid1(valid1));

	initial begin
		clk = 0;
	forever #2 clk = ~clk;
		end

	initial begin
		
		// Initialize Inputs
		rst = 1;
		

		// Wait 5 ns for global reset to finish
		#5;
        
		// Add stimulus here
				rst = 0;
		#5		enable = 1;
		#6		enable = 1;
		#8		enable = 1;
		#7		enable = 1;
		#2		enable = 1;
		#5		enable = 0;
		#4		enable = 0;
		#1		enable = 1;
		#9		enable = 0;
		#10	$stop;

	end
   
  initial 
  begin
   
    	$dumpfile("dump.vcd");
    	$dumpvars(1);
    end
endmodule