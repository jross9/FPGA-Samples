# always blocks

Always blocks 

Here, we create an `always` block and tell it to only run only the positive edge of the clock

```verilog
    always @(posedge clk)
        $display("%t (clk=%d) Hello, World!", $time, clk);
```

We have the testbench `initial` block - only ever used during simulations. 

In the initial block we need to explicitly define our signal's initial values.

```verilog
    initial begin
        clk = 0;
        #100 $finish;
    end
```

The results of our testbench now look like this: 

```
> icarus.bat
                  10 (clk=1) Hello, World!
                  30 (clk=1) Hello, World!
                  50 (clk=1) Hello, World!
                  70 (clk=1) Hello, World!
                  90 (clk=1) Hello, World!
testb.v:12: $finish called at 100 (1s)
```

This shows how the always block only occurs when clk has turned to 1 -- in fact on the positive edge of the signal.
