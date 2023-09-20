module testb;

	initial begin
		#0 $display("%t", $time);
		#3 $display("%t ---------------", $time);
		#2 $display("%t Hello, World!", $time);
		#5 $display("%t Goodbye, World!", $time);
		#3 $display("%t ---------------", $time);
		#2 $finish;
	end

endmodule
