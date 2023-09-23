
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
	
	wire [9:0] x;
	wire [9:0] y;

	vga_driver vga (
		.clock(vga_clk),		    // input wire clock,     // 25 MHz
		.reset(1'b0),		       // input wire reset,     // Active high
		.next_x(x),         		 // output [9:0] next_x,  // x-coordinate of NEXT pixel that will be drawn
		.next_y(y),              // output [9:0] next_y,  // y-coordinate of NEXT pixel that will be drawn
		.hsync(VGA_HS),          // output wire hsync,    // HSYNC (to VGA connector)
		.vsync(VGA_VS),          // output wire vsync,    // VSYNC (to VGA connctor)
		.sync(VGA_SYNC_N),       // output sync,          // SYNC to VGA connector
		.clk(VGA_CLK),           // output clk,           // CLK to VGA connector
		.blank(VGA_BLANK_N)      // output blank          // BLANK to VGA connector
	);
	
	reg [7:0] red;
	reg [7:0] green;
	reg [7:0] blue;
	
	always @(*) begin
		if (VGA_BLANK_N) begin
			
			if (x == 10'd0 || y == 10'd0) begin
				red = 8'd0;
				green = SW[7:0];
				blue = 8'd0;
			end else if (x == 10'd10 || y == 10'd10) begin
				red = 8'd0;
				green = SW[7:0];
				blue = 8'd0;
			end else if (x == 10'd20 || y == 10'd20) begin
				red = SW[7:0];
				green = 8'd0;
				blue = 8'd0;
			end else if (x == 10'd30 || y == 10'd30) begin
				red = 8'd0;
				green = 8'd0;
				blue = SW[7:0];
			
			end else if (x == 10'd40 || y == 10'd40) begin
				red = 8'd0;
				green = SW[7:0];
				blue = 8'd0;
			end else if (x == 10'd50 || y == 10'd50) begin
				red = SW[7:0];
				green = 8'd0;
				blue = 8'd0;
			end else if (x == 10'd60 || y == 10'd60) begin
				red = 8'd0;
				green = 8'd0;
				blue = SW[7:0];
			
			end else if (x == 10'd70 || y == 10'd70) begin
				red = 8'd0;
				green = SW[7:0];
				blue = 8'd0;
			end else if (x == 10'd80 || y == 10'd80) begin
				red = SW[7:0];
				green = 8'd0;
				blue = 8'd0;
			end else if (x == 10'd90 || y == 10'd90) begin
				red = 8'd0;
				green = 8'd0;
				blue = SW[7:0];

			end else if (x == 10'd100 || y == 10'd100) begin
				red = 8'd0;
				green = SW[7:0];
				blue = 8'd0;
			end else if (x == 10'd110 || y == 10'd110) begin
				red = SW[7:0];
				green = 8'd0;
				blue = 8'd0;
			end else if (x == 10'd120 || y == 10'd120) begin
				red = 8'd0;
				green = 8'd0;
				blue = SW[7:0];

			end else if (x == 10'd130 || y == 10'd130) begin
				red = 8'd0;
				green = SW[7:0];
				blue = 8'd0;
			end else if (x == 10'd140 || y == 10'd140) begin
				red = SW[7:0];
				green = 8'd0;
				blue = 8'd0;
			end else if (x == 10'd150 || y == 10'd150) begin
				red = 8'd0;
				green = 8'd0;
				blue = SW[7:0];
				
			// ----------------------------				

			end else if (x == 10'd490 || y == 10'd330) begin
				red = 8'd0;
				green = 8'd0;
				blue = SW[7:0];

			end else if (x == 10'd500 || y == 10'd340) begin
				red = 8'd0;
				green = SW[7:0];
				blue = 8'd0;
			end else if (x == 10'd510 || y == 10'd350) begin
				red = SW[7:0];
				green = 8'd0;
				blue = 8'd0;
			end else if (x == 10'd520 || y == 10'd360) begin
				red = 8'd0;
				green = 8'd0;
				blue = SW[7:0];

			end else if (x == 10'd530 || y == 10'd370) begin
				red = 8'd0;
				green = SW[7:0];
				blue = 8'd0;
			end else if (x == 10'd540 || y == 10'd380) begin
				red = SW[7:0];
				green = 8'd0;
				blue = 8'd0;
			end else if (x == 10'd550 || y == 10'd390) begin
				red = 8'd0;
				green = 8'd0;
				blue = SW[7:0];

			end else if (x == 10'd560 || y == 10'd400) begin
				red = 8'd0;
				green = SW[7:0];
				blue = 8'd0;
			end else if (x == 10'd570 || y == 10'd410) begin
				red = SW[7:0];
				green = 8'd0;
				blue = 8'd0;
			end else if (x == 10'd580 || y == 10'd420) begin
				red = 8'd0;
				green = 8'd0;
				blue = SW[7:0];
				
	
			end else if (x == 10'd590 || y == 10'd430) begin
				red = 8'd0;
				green = SW[7:0];
				blue = 8'd0;
			end else if (x == 10'd600 || y == 10'd440) begin
				red = SW[7:0];
				green = 8'd0;
				blue = 8'd0;
			end else if (x == 10'd610 || y == 10'd450) begin
				red = 8'd0;
				green = 8'd0;
				blue = SW[7:0];

			end else if (x == 10'd620 || y == 10'd460) begin
				red = 8'd0;
				green = SW[7:0];
				blue = 8'd0;
			end else if (x == 10'd630 || y == 10'd470) begin
				red = SW[7:0];
				green = 8'd0;
				blue = 8'd0;
			end else if (x == 10'd639 || y == 10'd479) begin
				red = 8'd0;
				green = 8'd0;
				blue = SW[7:0];
	
			end else begin
				red = 8'd0;
				green = 8'd0;
				blue = 8'd0;
			end
		
		
		end else begin
			red = 8'd0;
			green = 8'd0;
			blue = 8'd0;
		end
	end
		
	assign VGA_R = red;    // (VGA_BLANK_N) ? 8'd0 : 8'd0;
	assign VGA_G = green;  // (VGA_BLANK_N) ? SW[7:0] : 8'd0; 
	assign VGA_B = blue;   // (VGA_BLANK_N) ? 8'd0 : 8'd0;

endmodule
