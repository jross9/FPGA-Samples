module testb;

	reg clk;
	always #10 
		clk = ~clk; 

	initial begin
		clk = 0;

		#0 $display("%t (clk=%d)", $time, clk);

		#10 $display("%t (clk=%d)", $time, clk);
		#10 $display("%t (clk=%d)", $time, clk);

		#10 $display("%t (clk=%d)", $time, clk);
		#10 $display("%t (clk=%d)", $time, clk);

		#10 $display("%t (clk=%d)", $time, clk);
		#10 $display("%t (clk=%d)", $time, clk);

		#10 $display("%t (clk=%d)", $time, clk);
		#10 $display("%t (clk=%d)", $time, clk);

		#10 $display("%t (clk=%d)", $time, clk);
		#10 $display("%t (clk=%d)", $time, clk);

		#10 $finish;
	end

endmodule
