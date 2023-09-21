# RAM.v
Our RAM modules has 4 inputs
```verilog
module RAM(
		input clk,            // Clock input
		input wren,           // Write enable signal input
		input [3:0] address,  // 4-bit address input
		input [3:0] data,     // 4-bit data input for write
		output [3:0] q        // 4-bit data output for read
	);
```
We define the memory registers:

```verilog
	reg [3:0] memory [15:0]; // 16 locations of 4-bit data
```
In the always block on the positive edge of the clock we check the write enable:
```verilog
	always @(posedge clk) begin
		if (wren)
			memory[address] <= data;
	end
```
Regardless we will read the memory that is there an put it in q (why not just do this on reads? !wren good question)
```verilog
	assign q = memory[address];
```

# testb.v 

we define 4 variables write_enable and address must be registers becuase ... (again good question! will return to it)

```verilog
	reg write_enable;
	reg [3:0] address;
	wire [3:0] data_in;
	wire [3:0] data_out;
```
Instantiate our RAM module

```verilog
	RAM ram (
		.clk(clk),
		.wren(write_enable),
		.address(address),
		.data(data_in),
		.q(data_out)
	);
```
our address counter, just like the ROM example
```verilog
	always @(posedge clk) begin
		address <= address + 1'b1;
		$display("%t %h %h %h %h", $time, clk, address, data_in, data_out);
	end
```
make data_in be the complement of the address
```verilog
	assign data_in = ~address;
```

The results are:
```
> icarus.bat
                  10 1 0 f x
                  30 1 1 e x
                  50 1 2 d x
                  70 1 3 c x
                  90 1 4 b x
                 110 1 5 a x
                 130 1 6 9 x
                 150 1 7 8 x
                 170 1 8 7 x
                 190 1 9 6 x
                 210 1 a 5 x
                 230 1 b 4 x
                 250 1 c 3 x
                 270 1 d 2 x
                 290 1 e 1 x
                 310 1 f 0 x
-------------------------
                 330 1 0 f f
                 350 1 1 e e
                 370 1 2 d d
                 390 1 3 c c
                 410 1 4 b b
                 430 1 5 a a
                 450 1 6 9 9
                 470 1 7 8 8
                 490 1 8 7 7
                 510 1 9 6 6
                 530 1 a 5 5
                 550 1 b 4 4
                 570 1 c 3 3
                 590 1 d 2 2
                 610 1 e 1 1
                 630 1 f 0 0
testb.v:33: $finish called at 640 (1s)```
