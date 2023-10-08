module Blinky_Top (
		input CLK27,
		output LED6
	);

	wire CLOCK_50;
	Gowin_rPLL pll(
		.clkout(CLOCK_50),
		.clkin(CLK27)
	);

	Blinky blinky (
		.CLK50(CLOCK_50),  // input CLK50,
		.LED(LED6)          // output LED
	);

endmodule 