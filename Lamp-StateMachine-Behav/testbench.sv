`timescale 1ns / 1ns
module lamp_behav_test;
  
  reg button;
  reg clk;
  reg rst;
  wire L;
  //wire L2;
  integer i = 0;
  
  lamp_behav uut (.button(button),
                     .clk(clk),
                     .rst(rst),
                     .L(L));
  
 	initial begin
		clk = 0;
		forever #3 clk = ~clk;
	end

  
  initial begin
    $monitor ("T=%0t  Button=%0b , rst=%0b == L=0%b, ", $time, button, rst, L);
    
    button = 0;
	#5 rst = 1;
    #5 rst = 0;
	
    repeat(5)
		#9 button = ~button;
    
    #50 $finish;
    
   end
     
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars(1);
  end
  
endmodule