# always blocks

In most all hardware designs we need a clock to drive the logic of our circuit.

```verilog
    reg clk;
    always #10 
        clk = ~clk; 
```

For every 10 time units the clock flips between a logical 1 and logical 0. 

In the next couple of lines we create a always block. Here we tell it to only run on the positive edge of the clock

```verilog
    always @(posedge clk)
        $display("%t (clk=%d) Hello, World!", $time, clk);
```

And finally we have the testbench `initial` block - only ever used during simulations. 

In the initial block we need to explicitly define our signal's initial values.

```verilog
    initial begin
        clk = 0;
        #100 $finish;
    end
```

The results of our testbench now look like this: 

```
C:\Jar\FPGA\Samples\TestBench\020_HelloWorld2>icarus.bat
                  10 (clk=1) Hello, World!
                  30 (clk=1) Hello, World!
                  50 (clk=1) Hello, World!
                  70 (clk=1) Hello, World!
                  90 (clk=1) Hello, World!
testb.v:12: $finish called at 100 (1s)
```

This shows how the always block only occurs when clk has turned to 1 -- in fact on the posive edge of the signal.
