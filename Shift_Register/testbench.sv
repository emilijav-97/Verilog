`timescale 1ns/1ns
module shift_register_tb;

  reg clk, rst, valid_in;
  reg [7:0] data_in;
  wire valid_fifo;
  wire [31:0] data_out;

  shift_register uut (.valid_in(valid_in),
                      .clk(clk),
                      .rst(rst),
                      .data_in(data_in),
                      .valid_fifo(valid_fifo),
                      .data_out(data_out));
               

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
		#10		valid_in = 1;
     	#12     data_in = 8'd1;
		#12     data_in = 8'd2;
      	#12     data_in = 8'd3;
      	#18     data_in = 8'd4;
      	#20		valid_in = 0;
        #22		data_in = 8'd5;
     	#24		data_in = 8'd6;
      	#26		data_in = 8'd7;
      	#28		data_in = 8'd8;
		#10	$finish;

	end
   
 initial 
  begin
   
    	$dumpfile("dump.vcd");
    	$dumpvars(1);
    end
endmodule