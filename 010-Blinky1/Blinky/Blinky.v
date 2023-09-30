module Blinky(
	input CLK50,  // 50 MHz Clock
	output LED    // LED to blink
);

	localparam DELAY = 25'd25_000_000-1;      // 1 blink a second  
	// localparam DELAY = 25'd12_500_000-1;   // 2 blinks a second

	reg [24:0] counter;
	reg clk;

	always @(posedge CLK50) begin
		if (counter < DELAY) 
			counter <= counter + 1'b1;
		else begin
			counter <= 25'd0;
			clk <= ~clk;
		end
	end

	assign LED = clk;

endmodule
