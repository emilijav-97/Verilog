module half_adder_tb;
  
  reg A, B;
  wire S, C;
  integer i;
  
  half_adder uut (.A(A),
                  .B(B),
                  .S(S),
                  .C(C));
  
  
  initial
    begin
      
      {A, B} = 0;
      
      $monitor ("T=%0t  A=%0b , B=%0b = SUM=%0b, COUT=%0b", $time, A, B, S, C);
     
      for (i = 0; i < 10; i = i+1) begin
        #1 A <= $random;
           B <= $random;
        
      end
    end
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
endmodule