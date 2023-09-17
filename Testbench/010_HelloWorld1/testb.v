module testb;

	initial begin
		#10 $display("%t Hello, World!", $time);
		 #5 $display("%t Goodbye, World!", $time);
		#10 $finish;
	end

endmodule
