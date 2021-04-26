
module memory(
  output reg [32:0] data_out,
    input [7:0] address,
    input [32:0] data_in, 
    input write_enable,
    input clk
);
  reg [64:0] memory [0:32];

    always @(posedge clk) begin
        if (write_enable) begin
            memory[address] <= data_in;
        end
        	data_out <= memory[address];
    end

endmodule