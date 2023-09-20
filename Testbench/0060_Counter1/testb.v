module testb;

	reg clk;
	always #10 
		clk = ~clk; 

	reg [1:0] count;

	always @(posedge clk) begin
		count <= count + 1'b1;
	end

	initial begin
		// -------------------------------------------
		clk = 0;
		count = 0;
		// -------------------------------------------
		#0 $display("%t (%h) %h", $time, clk, count);
		#10 $display("%t (%h) %h", $time, clk, count);
		#10 $display("%t (%h) %h", $time, clk, count);
		#10 $display("%t (%h) %h", $time, clk, count);
		#10 $display("%t (%h) %h", $time, clk, count);
		#10 $display("%t (%h) %h", $time, clk, count);
		#10 $display("%t (%h) %h", $time, clk, count);
		#10 $display("%t (%h) %h", $time, clk, count);
		#10 $display("%t (%h) %h", $time, clk, count);
		#10 $display("%t (%h) %h", $time, clk, count);
		#10 $display("%t (%h) %h", $time, clk, count);
		#10 $display("%t (%h) %h", $time, clk, count);
		#10 $display("%t (%h) %h", $time, clk, count);
		#10 $display("%t (%h) %h", $time, clk, count);
		#10 $display("%t (%h) %h", $time, clk, count);
		#10 $display("%t (%h) %h", $time, clk, count);
		// -------------------------------------------
		#10 $finish;
	end

endmodule
