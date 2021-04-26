
module memory_test;
  
  reg clk, write_enable;
  reg [32:0] data_in;
  reg [7:0] address;
  wire [32:0] data_out;
  wire [64:0] memory [0:32];
  
  memory uut (
              .clk(clk),
              .write_enable(write_enable),
              .data_in(data_in),
              .address(address),
              .data_out(data_out));
  
  initial begin
		clk = 0;
		forever #3 clk = ~clk;
	end

  
  initial #150 $finish;
  integer  i;
  initial begin  
	for(i = 0; i < 10; i = i + 1) begin
		write_enable = 1;
        #5 address = i; 
        #1 data_in = $random;
	end  
   
   for(i = 0; i < 10; i = i + 1) begin
		write_enable = 0;
        #5 address = i; 
	end  
	end
  
/*More specific addresses
	initial begin
		#5 write_enable = 0;
		#5		write_enable = 1;
     	#5 address = 8'd10; data_in = $random;
  		#5 address = 8'd22; data_in = $random;
      	#5 address = 8'd25; data_in =$random;
		#5 address = 8'd225; data_in =$random;
  		#5 address = 8'd05; data_in =$random;
		#5 address = 8'd7; data_in =$random;
  

        #5 write_enable = 0;
  		#5 address = 8'd10;
  		#5 address = 8'd22;
  		#5 address = 8'd25;
  		#5 address = 8'd225;
  		#5 address = 8'd05;
      
	#10	$finish;
	end
----------------------------------------------------*/
  initial 
  begin
   
    	$dumpfile("dump.vcd");
    	$dumpvars(1);
    end
endmodule