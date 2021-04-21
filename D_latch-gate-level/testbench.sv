module D_latch_gate_tb;
  
  reg 	D;
  reg   C;
  wire	Q;
  wire	Qbar;
  
  D_latch_gate uut (
    				 .D(D),
                     .Q(Q),
                     .C(C),
                     .Qbar(Qbar));
  
  initial
    begin
       
    C = 1;
    D = 1;
      
      $monitor ("T=%0t-->    C=%0d\t D=%0d\t Q=%0d, Qbar=%0d", $time, C, D, Q, Qbar);
     
    #100 C = 0;
    #100 D = 1;
    
    #100 C = 1;
    #100 D = 0;
      
    #100 C = 0;
    #100 D = 0;
      
    #100 C = 1;
    #100 D = 1;
  
    #100 ;

    end
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
endmodule
