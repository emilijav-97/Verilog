`include "dff.v"

`timescale 1ns / 1ps

module paritycheck_mealy (
	input		clk,
	input		rst,
	input 	x,
	output	z
	);
	
	wire		d, q;
	
	xor (d, x, q);
	
	assign z = d;

	dff DFF (
		.clk(clk),
		.rst(rst),
		.d(d),
		.q(q)
	);

endmodule
