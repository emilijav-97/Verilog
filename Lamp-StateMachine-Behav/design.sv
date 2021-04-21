/*---------------------------------------------
State machine representing the 4 state Lamp
----------------------------------------------*/
//Behavioral model
`timescale 1ns / 1ns
module lamp_behav ( input button , clk, rst,
                      output reg L);
                     // output reg [3:0] L2);
	
  localparam S0 = 2'b00;
  localparam S1 = 2'b01; 
  localparam S2 = 2'b10; 
  localparam S3 = 2'b11;
  
  reg [1:0] state, nextstate;

  // state register
  always @(posedge clk or posedge rst) begin
      if (rst)
 		state = S0;
	else
 		state = nextstate;
  	end
  
  // transitions table
  always @(state or button) begin 
      case (state)
        S0: 
          if (button)
            nextstate = S1;
       else 
            nextstate = S0;
        
        S1: 
          if (!button) 
            nextstate = S2;
        else 
            nextstate = S1;
       
        S2: 
          if (!button)
            nextstate = S2;
        else if (button)
            nextstate = S3;
        
        S3:
          if (button)
            nextstate = S3;
          else 
            nextstate = S0;
        
        default : nextstate = S0;
        endcase
      end
  
  	// output logic
	always @(state) begin
		case(state)
			S0:
				L = 0;
			S1:
				L = 1;
            S2:
                L = 1;
            S3:
                L = 0;
		endcase
	end 
	//assign L = (state == S1  ||  state == S2);

endmodule