
module DE1SoC (

		/// CLOCK
		input CLOCK_50,

		/// SEG7
		output [6:0] HEX0,
		output [6:0] HEX1,
		output [6:0] HEX2,
		output [6:0] HEX3,
		output [6:0] HEX4,
		output [6:0] HEX5,

		/// LED 
		output LEDR9,

		/// VGA
		output VGA_CLK,
		output VGA_HS,
		output VGA_VS,
		output [7:0] VGA_G,
		output [7:0] VGA_B,
		output [7:0] VGA_R,
		output VGA_BLANK_N
	);

	assign HEX0 = 7'b1111111;
	assign HEX1 = 7'b1111111;
	assign HEX2 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	assign HEX5 = 7'b1111111;

	localparam DELAY = 25'd25_000_000-1; // 1/2s delay
	reg [24:0] counter;
	reg count_clk;
	always @(posedge CLOCK_50) begin
		if (counter < DELAY)
			counter <= counter + 1'b1;
		else begin
			counter <= 25'd0;
			count_clk <= ~count_clk;
		end
	end

	assign LEDR9 = count_clk;
	
	reg vga_clk;
	always @(posedge CLOCK_50)
		vga_clk <= ~vga_clk;
	
	video_sync_generator vs_gen (
		.vga_clk(vga_clk),      // input vga_clk;
		.reset(1'b0),           // input reset;
		.blank_n(VGA_BLANK_N),  // output reg blank_n;
		.HS(VGA_HS),            // output reg HS;
		.VS(VGA_VS)             // output reg VS;
	);

	assign VGA_CLK = vga_clk;
	
	assign VGA_R = (VGA_BLANK_N) ? 8'd64 : 8'd0;
	assign VGA_B = (VGA_BLANK_N) ? 8'd128 : 8'd0;
	assign VGA_G = (VGA_BLANK_N) ? 8'd128 : 8'd0; 

endmodule
