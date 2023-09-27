module testb;

	reg clk;
	always #10 
		clk = ~clk; 

	reg write_enable;
	reg [3:0] address;
	wire [3:0] data_in;
	wire [3:0] data_out;

	RAM ram (
		.clk(clk),
		.wren(write_enable),
		.address(address),
		.data(data_in),
		.q(data_out)
	);

	ROM rom (
		.address(address),
		.data(data)
	);

	always @(posedge clk) begin
		address <= address + 1'b1;
		$display("%t %h %h %h %h", $time, clk, address, data_in, data_out);
	end

	assign data_in = ~address;

	initial begin
		clk = 0;
		address = 0;
		write_enable = 1'b1;
		#320 write_enable = 1'b0;
			 $display("-------------------------");
		#320 $finish;
	end

endmodule
