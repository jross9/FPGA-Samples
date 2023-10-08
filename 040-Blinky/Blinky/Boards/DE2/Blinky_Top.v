module Blinky_Top (
		input CLOCK_50,
		output LEDR17
	);

	Blinky blinky (
		.CLK50(CLOCK_50),  // input CLK50,
		.LED(LEDR17)       // output LED
	);

endmodule // Blinky_Top
