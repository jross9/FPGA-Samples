module Blinky_Top (
		input CLK27,    // clk input
		output LED    // LED pin
	);

	wire CLOCK_50;
	Gowin_PLLVR pll(
		.clkout(CLOCK_50), // output clkout
		.clkin(CLK27)        // input clkin
	);

	Blinky blinky (
		.CLK50(CLOCK_50),  // input CLK50,
		.LED(LED)          // output LED
	);

endmodule
