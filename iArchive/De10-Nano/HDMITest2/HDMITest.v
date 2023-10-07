 module HDMITest(

		///////// CLOCK ///////// 
		input              FPGA_CLK1_50,

		///////// HDMI /////////
		inout              HDMI_I2C_SCL,
		inout              HDMI_I2C_SDA,
		inout              HDMI_I2S,
		inout              HDMI_LRCLK,
		inout              HDMI_MCLK,
		inout              HDMI_SCLK,
		output             HDMI_TX_CLK,
		output      [23:0] HDMI_TX_D,
		output             HDMI_TX_DE,
		output             HDMI_TX_HS,
		input              HDMI_TX_INT,
		output             HDMI_TX_VS,

		///////// KEY /////////
		input       [1:0]  KEY,

		///////// LED /////////
		output      [7:0]  LED
	);
	
	wire hdmi_clk;
	wire reset_n;
	wire next_frame;
	reg [31:0] ctr = 32'h0;
	reg [7:0] heartbeat = 1;

	wire [7:0] red;
	wire [7:0] green;
	wire [7:0] blue;

	reg [7:0] r_red;
	reg [7:0] r_green;
	reg [7:0] r_blue;
	
	wire [11:0] x;
	wire [11:0] y;

	assign red = r_red;
	assign green = r_green;
	assign blue = r_blue;
	
	assign LED = heartbeat;
	assign HDMI_TX_CLK = hdmi_clk;

	soc_system sys(
		.clk_clk(FPGA_CLK1_50),
		.hdmi_clk(hdmi_clk),
		.reset_reset_n(KEY[0]),
		.reset_n(reset_n));	

	video vid(
		.hdmi_clk(hdmi_clk),
		.reset_n(reset_n),
		.vga_de(HDMI_TX_DE),
		.vga_hs(HDMI_TX_HS),
		.vga_vs(HDMI_TX_VS),
		.next_frame(next_frame),
		.RED(red),
		.GREEN(green),
		.BLUE(blue),
		.vga_r(HDMI_TX_D[23:16]),
		.vga_g(HDMI_TX_D[15:8]),
		.vga_b(HDMI_TX_D[7:0]),
		.X(x),
		.Y(y)
		);

	I2C_HDMI_Config u_I2C_HDMI_Config (
		.iCLK(FPGA_CLK1_50),
		.iRST_N(reset_n),
		.I2C_SCLK(HDMI_I2C_SCL),
		.I2C_SDAT(HDMI_I2C_SDA),
		.HDMI_TX_INT(HDMI_TX_INT));
		
	always @(posedge hdmi_clk)
	begin
		integer h;
		integer v;
		
		r_red   <= 8'h00;
		r_green <= 8'h00;
		r_blue  <= 8'h00;
		
	   for (h = 0; h < 1920; h = h + 25) begin
			if (x == h) begin
				r_red   <= 8'h00;
				r_green <= 8'hFF;
				r_blue  <= 8'h00;
			end 
		end

		for (v = 0; v < 1080; v = v + 25) begin
			if (y == v) begin
				r_red   <= 8'hFF;
				r_green <= 8'h00;
				r_blue  <= 8'h00;
			end 
		end

		
	end
 
	always@(posedge next_frame or negedge reset_n)
	begin
		if(!reset_n) begin
			heartbeat <= 0;
			ctr <= 8'b0;
		end else begin
			if(ctr == 8'd60) begin
				heartbeat <= heartbeat + 8'b1;
				ctr <= 0;
			end else
				ctr <= ctr + 1;
		end
	end

endmodule
