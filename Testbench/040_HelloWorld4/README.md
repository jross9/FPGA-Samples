# always blocks

We can combine multiple constraints in a single always block … this is functionally the same as the previous example:

```verilog
    always @(posedge clk or negedge clk)
        if (clk)
            $display("%t (clk=%d) Hello, World!", $time, clk);
        else 
            $display("%t (clk=%d) Goodbye, World!", $time, clk);
```

The results continue to be the same:

```
C:\Jar\FPGA\Samples\Testbench\040_HelloWorld4>icarus
                   0 (clk=0) Goodbye, World!
                  10 (clk=1) Hello, World!
                  20 (clk=0) Goodbye, World!
                  30 (clk=1) Hello, World!
                  40 (clk=0) Goodbye, World!
                  50 (clk=1) Hello, World!
                  60 (clk=0) Goodbye, World!
                  70 (clk=1) Hello, World!
                  80 (clk=0) Goodbye, World!
                  90 (clk=1) Hello, World!
testb.v:15: $finish called at 100 (1s)
                 100 (clk=0) Goodbye, World!