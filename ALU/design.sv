

`include "n_adder.v"
module LogicUnit #(parameter N = 4) (input [N-1:0] A, B,
                                     input [N-1:0] sum,
                  					 input[1:0] alu_control, 
    								 output [N-1:0] result);
  
  reg [N-1:0] result1;
  
  
  N_adder inst(.sum(sum),
               .alu_control(alu_control));
  

  always @* begin
  case(alu_control)
    2'b00: result1 = A + B;
    2'b01: result1 = A - B;
    2'b10: result1 = A & B;
    2'b11: result1 = A | B;
    default: ;
  endcase
end 
  assign result = result1;
  
endmodule