module feedback( input [15:0] din,
						output [15:0] dout, 
						input	rst, 
						input	clk);

wire [15:0] a;
reg [15:0] register;

assign dout = register;
assign a = din + register;

always @(posedge clk)
begin
if (rst == 1)
register <= 0;
else 
register <= a;

end


endmodule
 