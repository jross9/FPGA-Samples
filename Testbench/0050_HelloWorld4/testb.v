module testb;

	reg clk;
	always #10 
		clk = ~clk; 

	always @(clk)
		if (clk)
			$display("%t (clk=%d) Hello, World!", $time, clk);
		else 
			$display("%t (clk=%d) Goodbye, World!", $time, clk);

	initial begin
		clk = 0;
		#100 $finish;
	end

endmodule
