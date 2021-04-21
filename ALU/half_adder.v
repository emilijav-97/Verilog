/*---------------------------------------------------
Half adder
----------------------------------------------------*/
module half_adder (
  					input A, B,
  					output sum, carry_out
				   );
  
//This time I will be using Data Flow mod.
 assign sum = A ^ B;
 assign carry_out = A & B;
  
endmodule