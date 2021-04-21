/*---------------------------------------------------
Full adder
----------------------------------------------------*/
`include "half_adder.v" 
module full_adder (
  					input A, B, carry_in,
  					output sum, carry_out
				   );
  
  half_adder u1 (.A(A),
                 .B(B),
                 .sum(sum),
                 .carry_out(carry_out));
  
//This time I will be using Data Flow mode.
  assign sum = A ^ B ^ carry_in;
  assign carry_out = (A & B) | (B & carry_in) | (A & carry_in);
  
endmodule