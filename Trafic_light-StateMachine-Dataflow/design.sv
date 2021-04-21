`include "d_ff.v"

module traffic_light_dataflow( input m, clk, s0, s1, s2,
                               output r1, r2, y1, y2, g1, g2);

  wire s0_out, s1_out, s2_out; // outputs from input logic
  wire s0_dout, s1_dout, s2_dout; //outputs from register
  
// Input logic first
  assign s0_out = (~s0 && s1 && s2) || (s0 && ~s1 && ~s2 && ~m);
  assign s1_out = (~s0 && ~s1 && s2) || (~s0 && s1 && s2);
  assign s2_out = (~s0 && ~s1 && ~s2) || (~s0 && ~s1 && s2 && ~m) || (~s0 && s1 && ~s2) || (s0 && ~s1 && ~s2 && ~m);
  
// Register inputs/outouts
  d_ff inst0(.clk(clk), 
             .d(s0_out), 
             .q(s0_dout));
  
  d_ff inst1(.clk(clk), 
             .d(s1_out), 
             .q(s1_dout));
  
 d_ff inst2(.clk(clk), 
            .d(s2_out), 
            .q(s2_dout));
  
//Output logic
  
  assign r1 = (~s1_dout && s2_dout) || (~s0_dout && s2_dout);
  assign r2 = (s0_dout && ~s1_dout) || (~s0_dout && ~s1_dout);
  assign y1 = ~s1_dout && ~s2_dout && s0_dout; //can't fix this
  assign y2 = ~s0_dout && ~s1_dout && s2_dout;
  assign g1 = (~s0_dout && s1_dout && s2_dout);
  assign g2 = (~s0_dout && ~s1_dout && ~s2_dout);
    
endmodule
    