`timescale 1ns / 1ns
`include "d_ff.sv"

module lamp ( input B, clk, reset,
              output L, s0, s1);
  
   wire state0;
   wire state1;
  
  // next state (input) logic
  assign state0 = B;
  assign state1 = ~s1 & s0 & ~B | s1 & B | s1 & ~s0;
  
  // output logiv
  assign L = s0 ^ s1;
  
  //state register
  dff s00   (.d(state0),
             .clk(clk),
             .rst(reset),
             .q(s0));
  
  dff s01   (.d(state1),
             .clk(clk),
             .rst(reset),
             .q(s1));
endmodule
