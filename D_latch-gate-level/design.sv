/*-----------------------------------------------------------
D latch gate level
-----------------------------------------------------------*/

module D_latch_gate (    input  C, D,
                         output Q, Qbar);
   
  wire x, y, Dbar;
   
  not  (Dbar, D);
  nand (x, D, C);
  nand (y, Dbar, C);
  nand (Q, x, Qbar);
  nand (Qbar, y, Q);
   
endmodule 





