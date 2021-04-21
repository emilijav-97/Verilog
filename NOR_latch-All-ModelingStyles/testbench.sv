module rs_nor_cl_tb; // currently set for behavioral model of gated latch
  
  reg 	S;
  reg   C;
  reg 	R;
  wire	Q;
  wire	Qbar;
  
  rs_nor_cl uut (
                  .S(S),
                  .R(R),
                  .Q(Q),
                  .C(C),
                  .Qbar(Qbar));
  
  initial
    begin
       
    S = 1;
    R = 1;
      
      $monitor ("T=%0t-->    C=%0d\t S=%0d R=%0d\t Q=%0d, Qbar=%0d", $time, C, S, R, Q, Qbar);
     
    #100 S = 0;
    #100 C = 1;
      
    #100 S = 1;
    #100 R = 0;
    #100 R = 1;
    #100 C = 1;
      
    #100 S = 0;
    #100 R = 0;
    #100 C = 0;
    #100 S = 1;
         R = 1;
    #100 S = 1;
         R = 0;
      
    #100 C = 0;
    #100 S = 0;
         R = 0;
    #100 ;

    end
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
endmodule
