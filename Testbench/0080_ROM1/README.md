# ROM.v
Here we are going to make a ROM. A 4 bit ROM w/ 16 addresses. Our ROM module will have two inputs:
```verilog
module ROM (
        input [3:0] address,  // 4-bit address input
        output reg [3:0] data // 4-bit data output
    );
```
an input address and an output data

this shows a new type of always: 'a combinational always block' where output(s) depend solely on the current values of the input signals and there is no notion of clocking or sequential behavior. 

```verilog
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
```
So that is our ROM module, it's in the file ROM.v

## testb.v 

After we create the clocking we have to define address and data variables

```verilog
    reg [3:0] address;
    wire [3:0] data;
```
Now this is an important concept, which you will get the hang of after you have seen it enough and get the hang of it.

We instantiate our ROM module which resides in ROM.v

```verilog
    ROM rom (
        .address(address),
        .data(data)
    );
```
Our address is simply a counter, like in our last example.  

```verilog
    always @(posedge clk) begin
        address <= address + 1'b1;
        $display("%t %h %h", $time, address, data);
    end
```
We do this in the `initial` block:

```verilog
    initial begin
        clk = 0;
        address = 0;
        #320 $display("-------------------------");
        #320 $finish;
    end
```
The results are:
```
> icarus.bat
                  10 0 f
                  30 1 e
                  50 2 d
                  70 3 c
                  90 4 b
                 110 5 a
                 130 6 9
                 150 7 8
                 170 8 7
                 190 9 6
                 210 a 5
                 230 b 4
                 250 c 3
                 270 d 2
                 290 e 1
                 310 f 0
-------------------------
                 330 0 f
                 350 1 e
                 370 2 d
                 390 3 c
                 410 4 b
                 430 5 a
                 450 6 9
                 470 7 8
                 490 8 7
                 510 9 6
                 530 a 5
                 550 b 4
                 570 c 3
                 590 d 2
                 610 e 1
                 630 f 0
testb.v:24: $finish called at 640 (1s)
```
