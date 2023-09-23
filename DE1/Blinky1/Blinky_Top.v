module Blinky_Top(
	input CLOCK_50,
	output LEDG7
);

	localparam DELAY = 25'd25_000_000-1;     //  1/2s delay

	reg [24:0] counter;
	reg clk;

	always @(posedge CLOCK_50) begin
		if (counter < DELAY) // delay
			counter <= counter + 1'b1;
		else begin
			counter <= 25'd0;
			clk <= ~clk;
		end
	end

	assign LEDG7 = clk;

endmodule
