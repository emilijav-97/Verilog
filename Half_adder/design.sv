/*---------------------------------------------------
Half adder
----------------------------------------------------*/
module half_adder (
  					input A, B,
  					output S, C
				   );
  
 //Desing logic in gate level modelinf//
  xor (S, A, B);
  and (C, A, B);
  
endmodule