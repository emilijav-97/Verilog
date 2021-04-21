module traffic_light_dataflow_tb;
  
  reg clk;
  reg m;
  reg s0;
  reg s1; 
  reg s2;
  
  wire r1;
  wire r2;
  wire y1;
  wire y2;
  wire g1;
  wire g2;
  integer i = 0;
  
  traffic_light_dataflow uut(.clk(clk), 
                             .m(m), 
                             .s0(s0), 
                             .s1(s1), 
                             .s2(s2),
                             .r1(r1),
                             .r2(r2),
                             .y1(y1),
                             .y2(y2), 
                             .g1(g1), 
                             .g2(g2));
  

  
  initial begin
	clk = 0;
	forever #2 clk = ~clk;
  end

  
  initial begin
    
    while(i < (50)) begin
      
      {m, s0, s1, s2} = i;
      
      i = i+1;
      
      #10;
    
    end
    
    #50 $finish;
    
  end
  
 initial begin 
    $dumpfile("dump.vcd"); $dumpvars(1);
  end
  
endmodule
