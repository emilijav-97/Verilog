module LogicUnit_tb;
parameter N = 8;
  
  reg [N-1:0] A;
  reg [N-1:0] B;
  reg [2:0] alu_control;
  
 wire [N-1:0] result;

integer i;
  
	LogicUnit uut(
                .A(A), 
                .B(B), 
                .result(result),
   				.alu_control(alu_control));
  
initial
  begin
      
    {A, B,alu_control } = 0;
      
    $monitor ("T=%0t  A=%0d , B=%0d = result=%0d, alu_control=%0d", $time, A, B, result, alu_control);
     
    for (i = 0; i < 8; i = i+1) begin
      alu_control = i;
        #100; 
         A = 8'hF6;
        B = 8'h0A;
        //alu_control = 3'b000;
        
        #100; 
        A = 8'hF;
        B = 8'h22;
        //alu_control = 3'b001;
        
        #100; 
        A = 8'd33;
    	B = 8'd55;
        //alu_control = 3'b010;
       
        #100;
        A = 8'd2;
        B = 8'd1;
        //alu_control = 3'b011;
      
    end
  end

initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
 
 end
endmodule
