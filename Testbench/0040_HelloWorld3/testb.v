module testb;

	reg clk;
	always #10 
		clk = ~clk; 

	always @(posedge clk)
		$display("%t (clk=%d) Hello, World!", $time, clk);

	always @(negedge clk)
		$display("%t (clk=%d) Goodbye, World!", $time, clk);

	initial begin
		clk = 0;
		#100 $finish;
	end

endmodule
