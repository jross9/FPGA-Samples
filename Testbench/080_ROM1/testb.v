module testb;

	reg clk;
	always #10 
		clk = ~clk; 

	reg [3:0] address;
	wire [3:0] data;

	ROM rom (
		.address(address),
		.data(data)
	);

	always @(posedge clk) begin
		address <= address + 1'b1;
		$display("%t %h %h", $time, address, data);
	end

	initial begin
		clk = 0;
		address = 0;
		#320 $display("-------------------------");
		#320 $finish;
	end

endmodule
