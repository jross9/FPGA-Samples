module ROM (
		input [3:0] address,  // 4-bit address input
		output reg [3:0] data // 4-bit data output
	);
	always @(*) begin
		case (address)
			4'b0000: data = 4'b1111; 
			4'b0001: data = 4'b1110; 
			4'b0010: data = 4'b1101; 
			4'b0011: data = 4'b1100;
			4'b0100: data = 4'b1011; 
			4'b0101: data = 4'b1010; 
			4'b0110: data = 4'b1001; 
			4'b0111: data = 4'b1000;
			4'b1000: data = 4'b0111; 
			4'b1001: data = 4'b0110; 
			4'b1010: data = 4'b0101; 
			4'b1011: data = 4'b0100;
			4'b1100: data = 4'b0011; 
			4'b1101: data = 4'b0010; 
			4'b1110: data = 4'b0001; 
			4'b1111: data = 4'b0000;
		endcase
	end

endmodule
