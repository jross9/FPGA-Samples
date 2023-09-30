module Blinky_Top (
		input CLK27,    // clk input
		output LED6    // LED6 pin
	);

	wire CLOCK_50;
	Gowin_rPLL pll(
		.clkout(CLOCK_50), // output clkout
		.clkin(CLK27)        // input clkin
	);

	Blinky blinky (
		.CLK50(CLOCK_50),  // input CLK50,
		.LED(LED6)          // output LED6
	);

endmodule
