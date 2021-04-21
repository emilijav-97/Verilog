
`include "n_adder.v"
module LogicUnit #(parameter N = 8) (input [N-1:0] A, B,
                                     input [N-1:0] sum,
                  					input[1:0] alu_control, 
                                     output [N-1:0] result);
  
  reg [N-1:0] result1;
  ;
  
  N_adder inst(.sum(sum),
               .alu_control(alu_control));
  

  always @* begin
 
    case(alu_control)
        3'b000: 
           result1 = A & B; 
        3'b001: 
           result1 = A | B;
        3'b010: 
           result1 = A + B;
        3'b011: 
           result1 = 8'bZ;
        3'b100: 
          result1 = A & (~B);
        3'b101: 
           result1 = A | (~B);
        3'b110: 
           result1 = A - B;
        3'b111: 
          result1 = (A < B);
        
  endcase
end 
  assign result = result1;
  
endmodule
