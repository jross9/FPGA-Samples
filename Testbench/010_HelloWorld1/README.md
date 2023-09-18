# Time Units

The way I understand it, in a testbench, the time units are somewhat arbitrary.  I will revisit the time units in simulations at a later date. 

In this example we show how time is measured in units. We define time in units denoted by a ‘#’ then a number which represents the amount of time that will pass until the next one. 

For example: 

```verilog
module testb;

    initial begin
        #10 $display("%t Hello, World!", $time);
         #5 $display("%t Goodbye, World!", $time);
        #10 $finish;
    end

endmodule
```
we run the icarus.bat file and our output then looks like this:

```
C:\Jar\FPGA\Samples\TestBench\010_HelloWorld1>icarus.bat
                  10 Hello, World!
                  15 Goodbye, World!
testb.v:6: $finish called at 25 (1s)
```

This example shows how 25 time units went by in our simple test bench. 
