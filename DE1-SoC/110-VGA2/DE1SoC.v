
module DE1SoC (
		//////////// CLOCK //////////
		input 		          		CLOCK_50,

		//////////// SEG7 //////////
		output		     [6:0]		HEX0,
		output		     [6:0]		HEX1,
		output		     [6:0]		HEX2,
		output		     [6:0]		HEX3,
		output		     [6:0]		HEX4,
		output		     [6:0]		HEX5,

		//////////// KEY //////////
		input 		     [3:0]		KEY,

		//////////// LED //////////
		output		     [9:0]		LEDR,

		//////////// SW //////////
		input 		     [9:0]		SW,

		//////////// VGA //////////
		output		          		VGA_BLANK_N,
		output		     [7:0]		VGA_B,
		output		          		VGA_CLK,
		output		     [7:0]		VGA_G,
		output		          		VGA_HS,
		output		     [7:0]		VGA_R,
		output		          		VGA_SYNC_N,
		output		          		VGA_VS
	);

	assign HEX0 = 7'b1111111;
	assign HEX1 = 7'b1111111;
	assign HEX2 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	assign HEX5 = 7'b1111111;

	// localparam DELAY = 26'd50_000_000-1;  //  1s delay
	// localparam DELAY = 26'd25_000_000-1;     //  1/2s delay
	localparam DELAY = 26'd12_500_000-1;     //  1/4s delay

	reg [25:0] counter; // 26 bits (2 ^ 26 = 67_108_864)
	reg clk;

	always @(posedge CLOCK_50) begin
		if (counter < DELAY) // delay
			counter <= counter + 1'b1;
		else begin
			counter <= 26'd0;
			clk <= ~clk;
		end
	end

	assign LEDR[9] = clk;
	
	reg vga_clk;
	always @(posedge CLOCK_50)
		vga_clk <= ~vga_clk;
	
	wire [9:0] next_x;
	wire [9:0] next_y;

	vga_driver vga (
		.clock(vga_clk),		 // input wire clock,     // 25 MHz
		.reset(1'b0),		     // input wire reset,     // Active high
		.color_in(SW[7:0]),      // input [7:0] color_in, // Pixel color data (RRRGGGBB)
		.next_x(next_x),         // output [9:0] next_x,  // x-coordinate of NEXT pixel that will be drawn
		.next_y(next_y),         // output [9:0] next_y,  // y-coordinate of NEXT pixel that will be drawn
		.hsync(VGA_HS),          // output wire hsync,    // HSYNC (to VGA connector)
		.vsync(VGA_VS),          // output wire vsync,    // VSYNC (to VGA connctor)
		.red(VGA_R),             // output [7:0] red,     // RED (to resistor DAC VGA connector)
		.green(VGA_G),           // output [7:0] green,   // GREEN (to resistor DAC to VGA connector)
		.blue(VGA_B),            // output [7:0] blue,    // BLUE (to resistor DAC to VGA connector)
		.sync(VGA_SYNC_N),       // output sync,          // SYNC to VGA connector
		.clk(VGA_CLK),           // output clk,           // CLK to VGA connector
		.blank(VGA_BLANK_N)      // output blank          // BLANK to VGA connector
	);

	// assign VGA_R = (VGA_BLANK_N) ? 8'd64 : 8'd0;
	// assign VGA_B = (VGA_BLANK_N) ? 8'd128 : 8'd0;
	// assign VGA_G = (VGA_BLANK_N) ? 8'd128 : 8'd0; 

endmodule
