module testb;

	reg clk;
	always #10 
		clk = ~clk; 

	reg [1:0] count;

	always @(posedge clk) begin
		count <= count + 1'b1;
		$display("%t (%h) %h", $time, clk, count);
	end

	initial begin
		clk = 0;
		count = 0;
		#80 $display("-------------------------");
		#80 $finish;
	end

endmodule
