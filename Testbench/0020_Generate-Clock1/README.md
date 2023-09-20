# clock signal

In all hardware designs we need clocks to drive the sequential logic of our circuit.  Usually your clock signal will come from the hardware board you are developing for.  But in a testbench you generate a clock like this

```verilog
    reg clk;
    always #10 
        clk = ~clk; 
```

For every 10 time units the clock flips between a logical 1 and logical 0 and back. 

In the initial block we run the entire test, which is simply showing us the value of the clock signal.

```verilog
    initial begin
        clk = 0;

        #0 $display("%t (clk=%d)", $time, clk);

        #10 $display("%t (clk=%d)", $time, clk);
        #10 $display("%t (clk=%d)", $time, clk);

        #10 $display("%t (clk=%d)", $time, clk);
        #10 $display("%t (clk=%d)", $time, clk);

        #10 $display("%t (clk=%d)", $time, clk);
        #10 $display("%t (clk=%d)", $time, clk);

        #10 $display("%t (clk=%d)", $time, clk);
        #10 $display("%t (clk=%d)", $time, clk);

        #10 $display("%t (clk=%d)", $time, clk);
        #10 $display("%t (clk=%d)", $time, clk);

        #10 $finish;
    end

```

The results of our testbench look like this: 

```
>icarus.bat
                   0 (clk=0)
                  10 (clk=1)
                  20 (clk=0)
                  30 (clk=1)
                  40 (clk=0)
                  50 (clk=1)
                  60 (clk=0)
                  70 (clk=1)
                  80 (clk=0)
                  90 (clk=1)
                 100 (clk=0)
testb.v:27: $finish called at 110 (1s)``

which shows the clock alternating between 0 and 1