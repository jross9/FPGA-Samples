module RAM(
		input clk,            // Clock input
		input wren,           // Write enable signal
		input [3:0] address,  // 4-bit address input
		input [3:0] data,     // 4-bit data input for write
		output [3:0] q        // 4-bit data output for read
	);

	reg [3:0] memory [15:0];  // 16 locations of 4-bit data

	always @(posedge clk) begin
		if (wren)
			memory[address] <= data;
	end

	assign q = memory[address]; 

endmodule
