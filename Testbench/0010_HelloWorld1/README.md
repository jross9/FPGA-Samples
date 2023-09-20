# Time Units

In a testbench, we have time units. 

In this example we show how time is measured in units. 

We define time in units denoted by the hash '#' then a number which represents the amount of time that will pass until the next one. 

The `initial` block is where run the test. You must initialize the data you are testing and setup the timing. This code is for the testbench only. I do not recommend initial blocks in synthesizeable code. 

For example: 

```verilog
module testb;

    initial begin
        #0 $display("%t", $time);
        #3 $display("%t ---------------", $time);
        #2 $display("%t Hello, World!", $time);
        #5 $display("%t Goodbye, World!", $time);
        #3 $display("%t ---------------", $time);
        #2 $finish;
    end

endmodule
```
we run the icarus.bat file and our output looks like this:

```
> icarus.bat
                   0
                   3 ---------------
                   5 Hello, World!
                  10 Goodbye, World!
                  13 ---------------
testb.v:9: $finish called at 15 (1s)
```

This example shows how 15 time units went by in our simple testbench. 
