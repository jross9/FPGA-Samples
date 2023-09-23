
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

endmodule
