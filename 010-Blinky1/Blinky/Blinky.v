module Blinky(
	input CLK50,
	output LED
);

	localparam DELAY = 25'd25_000_000-1;      // 1 blink a second  
	// localparam DELAY = 25'd12_500_000-1;   // 

	reg [24:0] counter;
	reg clk;

	always @(posedge CLK50) begin
		if (counter < DELAY) // delay
			counter <= counter + 1'b1;
		else begin
			counter <= 25'd0;
			clk <= ~clk;
		end
	end

	assign LED = clk;

endmodule
