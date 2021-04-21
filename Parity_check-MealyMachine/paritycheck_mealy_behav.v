`timescale 1ns / 1ps

module paritycheck_mealy_behav (
	input			clk,
	input			rst,
	input 		x,
	output reg	z
	);

	localparam ST_EVEN = 1'b0;
	localparam ST_ODD = 1'b1;
	
	reg state_curr, state_next;

	always @(posedge clk or posedge rst)
		if (rst)
			state_curr = ST_EVEN;
		else
			state_curr = state_next;

	always @(state_curr or x) begin
		z = 1'b0;
		case(state_curr)
		ST_EVEN:
			if(x) begin
				z = 1;
				state_next = ST_ODD;
				end
			else
				state_next = ST_EVEN;
		ST_ODD:
			if(x)
				state_next = ST_EVEN;
			else begin
				z = 1;
				state_next = ST_ODD;
			end
		default:
			state_next = ST_EVEN;
		endcase
	end 

endmodule
