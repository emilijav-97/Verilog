
module traffic_light_behav_test;
  
  reg m;
  reg clk;
  reg rst;
  wire r1;
  wire  r2;
  wire y1;
  wire y2;
  wire g1;
  wire g2;
  integer i = 0;
  
  traffic_light_behav uut (.m(m),
                     .clk(clk),
                     .rst(rst),
                     .r1(r1),
                     .r2(r2),
                     .y1(y1),
                     .y2(y2),
                     .g1(g1),
                     .g2(g2));
                    
  
 	initial begin
		clk = 0;
		forever
		#10 clk = ~clk;
	end

  
  initial begin
   // $monitor ("T=%0t  Button=%0b , rst=%0b == L=0%b, ", $time, button, rst, L);


	#5 rst = 1;
    #5 rst = 0;
	while(i < 20) begin
      
      m = i;
      i = i+1;
      #10;
    
    end
    
    #50 $finish;
    
   end
     
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars(1);
  end
  
endmodule