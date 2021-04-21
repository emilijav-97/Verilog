
module traffic_light_behav ( input m, clk, rst,
                             output reg r1, r2, y1, y2, g1, g2);
  
  localparam state_0 = 3'b000;
  localparam state_1 = 3'b001;
  localparam state_2 = 3'b010;
  localparam state_3 = 3'b011;
  localparam state_4 = 3'b100;
  localparam state_5 = 3'b101;

  reg [2:0] CurrentState, NextState;


  always @(posedge clk or posedge rst) begin
    if (rst) 
      CurrentState = state_0;
 	else 
      CurrentState = NextState;
   end
  
/*----------------------------------------------------------
One way to represent outputs
-----------------------------------------------------------*/
  
  always @(posedge clk) begin
    if (CurrentState == state_0) 
      begin
   		r1 = 1;
        r2 = 0;
        y1 = 0;
        y2 = 0;
        g1 = 0;
        g2 = 1;
      end
  
   else if (CurrentState == state_1) 
      begin
   		r1 = 1;
        r2 = 0;
        y1 = 0;
        y2 = 1;
        g1 = 0;
        g2 = 0;
      end
  
 else if (CurrentState == state_2) 
      begin
   		 r1 = 1;
         r2 = 1;
         y1 = 0;
         y2 = 0;
         g1 = 0;
         g2 = 0;
      end
  
 else if (CurrentState == state_3) 
      begin
         r1 = 0;
         r2 = 1;
         y1 = 0;
         y2 = 0;
   		 g1 = 1;
         g2 = 0;
         
      end
  
 else if (CurrentState == state_4) 
      begin
          r1 = 0;
          r2 = 1;
   		  y1 = 1;
          y2 = 0;
          g1 = 0;
          g2 = 0;
          
      end
  
  else if (CurrentState == state_5) 
      begin
   		 r1 = 1;
         r2 = 1;
         y1 = 0;
         y2 = 0;
         g1 = 0;
         g2 = 0;
      end
  end
  
/*--------------------------------------------------------------------
Second way to represent outputs //all outputs should get wither 1 or 0
--------------------------------------------------------------------*/ 
  
 /* always @(CurrentState) begin
		case(CurrentState)
			state_0: begin
				r1 = 1;
          		g2 = 1;
                
            end
			state_1: begin
				r1 = 1;
          		y2 = 1;
            end
            state_2: begin
                r1 = 1;
          		r2 = 1;
            end
            state_3: begin
                g1 = 1;
          		r2 = 1;
            end
          	state_4: begin
                y1 = 1;
          	    r2 = 1;
            end
            state_5: begin
                r1 = 1;
          	    r2 = 1;
            end
        endcase
	end  */
  
  
  always @(CurrentState or m) 
    begin
		NextState = CurrentState;
      	case (CurrentState)
          
	state_0 : 
		if (m) 
          NextState = state_1;
	
   state_1 : 
      if (m)
        NextState = state_3;
      else if (!m)  
        NextState = state_2;
  
   state_2: 
      if (m) 
        NextState = state_3;
    
   state_3 :
      if (m) 
        NextState = state_4;
   
   state_4 :
     if (m) 
       NextState = state_0;
     else if (!m) 
       NextState = state_5;
   
   state_5 : 
     if (m)
       NextState = state_0;
   
	endcase
	end
  
/*----------------------------------------------------------
Third  way to represent outputs 
-----------------------------------------------------------*/
  
  /* assign r1 = (CurrentState == state_0) | (CurrentState == state_1) |(CurrentState == state_2) | (CurrentState == state_5);
  assign r2 = (CurrentState == state_2) | (CurrentState == state_3) | (CurrentState == state_4) | (CurrentState == state_5);
  assign y1 = (CurrentState == state_4);
  assign y2 = (CurrentState == state_1);
  assign g1 = (CurrentState == state_3);
  assign g2 = (CurrentState == state_0);*/

endmodule

  
  