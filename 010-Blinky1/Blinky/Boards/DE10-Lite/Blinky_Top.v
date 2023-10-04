module Blinky_Top (
		input CLOCK_50,
		output LEDR9
	);

	Blinky blinky (
		.CLK50(CLOCK_50), // input CLK50,
		.LED(LEDR9)       // output LED
	);

endmodule // Blinky_Top
