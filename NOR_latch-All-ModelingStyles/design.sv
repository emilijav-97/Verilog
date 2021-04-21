/*-----------------------------------------------------------
RS NOR latch
-----------------------------------------------------------*/
module rs_nor ( input S, R,
                output Q, Qbar);
  
   nor (Q, R, Qbar);
   nor (Qbar, S, Q);
 


endmodule

/*-----------------------------------------------------------
RS NOR latch (gated latch)
-----------------------------------------------------------*/


module rs_nor_cl (  input S, R, C,
           			output reg Q, Qbar);

   always @*
     
      if(C)
        begin
         Q    <= (~R & Q) | S;
         Qbar <= (~S & Q) | R;
        end
  
  endmodule 

/*---------------------------------------------------------
Gate level representation 
-------------------------------------------------------*/
  		
 module rs_nor_cl_gate (  input  S, R, C,
          				  output Q, Qbar);
   
   wire x, y;
   
   and (x, S, C);
   and (y, R, C);
   nor (Q, x, Qbar);
   nor (Qbar, y, Q);
   
endmodule 