`timescale 1ns / 1ps

module dff (
	input			clk,
	input			rst,
	input			d,
	output reg	    q
	);

	always @(posedge clk or posedge rst)
		if(rst)
			q <= 1'b0;
		else
			q <= d;

endmodule
