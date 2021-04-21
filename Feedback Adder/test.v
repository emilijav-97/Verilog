`timescale 1ns/100ps
module test;

reg [15:0] din; 
reg clk;
reg rst;
wire [15:0] dout;

feedback dut(.din(din),
					.dout(dout),
					.clk(clk),
					.rst(rst));
	

initial begin
$dumpvars(1, test);		
clk = 0;
rst = 1;

end

always #50 clk = ~clk;

always @(din or dout or clk ) begin
#25
rst = 0;
#26
din = 16'd20;

#51 
din = 16'd5;

#101 
din = 16'd4;
#151 
rst = 1;
#201 
din = 16'd3;
#251 
rst = 0;
#301 
din = 16'd8;

#351 $finish;

end

 
	endmodule
	