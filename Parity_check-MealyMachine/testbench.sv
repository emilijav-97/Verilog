`timescale 1ns / 1ps


//`define MOORE_BEHAV
//`define MEALY
//`define MEALY_BEHAV

module paritycheck_tb;

	// Inputs
	reg clk;
	reg rst;
	reg x;

	// Outputs
	wire z;

	// Instantiate the Unit Under Test (UUT)
	/*`ifdef MOORE
		paritycheck_moore uut (
			.clk(clk), 
			.rst(rst), 
			.x(x), 
			.z(z)
		);
	`elsif MOORE_BEHAV
		paritycheck_moore_behav uut (
			.clk(clk), 
			.rst(rst), 
			.x(x), 
			.z(z)
		); */
paritycheck_mealy uut  (
			.clk(clk), 
			.rst(rst), 
			.x(x), 
			.z(z)
		);
	/*`elsif MEALY_BEHAV
		paritycheck_mealy_behav uut (
			.clk(clk), 
			.rst(rst), 
			.x(x), 
			.z(z)
		);
	`endif*/


	initial begin
		clk = 0;
		forever
			#2 clk = ~clk;
	end

	initial begin
		
		// Initialize Inputs
		rst = 1;
		x = 0;

		// Wait 5 ns for global reset to finish
		#5;
        
		// Add stimulus here
				rst = 0;
		#4		x = 1;
		#4		x = 0;
		#4		x = 1;
		#3		x = 0;
		#1		x = 1;
		#6		x = 0;
		
		#10	$stop;

	end
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
      
endmodule


