`timescale 1ns / 1ns

module lamp_TB;
  
  reg B;
  reg clk;
  reg reset;
  
  wire L;
  wire s0;
  wire s1;
  
  lamp dut (.B(B),
            .clk(clk),
            .reset(reset),
            .L(L),
            .s0(s0),
            .s1(s1));
               
  
 	initial begin
		clk = 0;
		forever
		#3 clk = ~clk;
	end


  always #11 B = ~B;

  
  initial begin
	         reset = 1;
		     B = 0;
             
	    #7   reset = 0;

		#100	$finish;
	end
     
  initial begin 
    $dumpfile("dump.vcd"); 
    $dumpvars(1);
  end
  
endmodule