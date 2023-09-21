module testb;

	reg clk;
	always #10 
		clk = ~clk; 

	reg [7:0] D;

	wire [7:0] DOut;
	wire [15:0] ADDR;
	wire RnW;
	wire E;
	wire Q;
	wire BS;
	wire BA;
	wire [111:0] RegData;

	// wire nHALT;
	// wire nRESET;

	mc6809 cpu (
		.D(D),				//  input  [7:0] D,

		.DOut(DOut),		// output  [7:0] DOut,
		.ADDR(ADDR),		// output  [15:0] ADDR,
		.RnW(RnW),			// output  RnW,
		.E(E),				// output  E,
		.Q(Q),				// output  Q,
		.BS(BS),			// output  BS,
		.BA(BA),			// output  BA,

		.nIRQ(1'b1),		//  input  nIRQ,
		.nFIRQ(1'b1),		//  input  nFIRQ,
		.nNMI(1'b1),		//  input  nNMI,

		.EXTAL(clk),		//  input  EXTAL,
		// .XTAL(),			//  input  XTAL,

		.nHALT(1'b1),		//  input  nHALT,
		.nRESET(1'b1),		//  input  nRESET,

		.MRDY(1'b1),		//  input  MRDY,
		.nDMABREQ(1'b1),	//  input  nDMABREQ, 

		.RegData(RegData)		// output  [111:0] RegData
	);

	always @(posedge clk) begin
		$display("%t (%h) %h %h", $time, ADDR, DOut, D);
	end

	initial begin
		clk = 0;
		D = 8'h12;                  // NOP instruction!
		#810 $finish;
		// #570_890 $finish;        // address will reach $2001
		// #9_746_410 $finish;      // address will roll over back to $0000

	end

endmodule
