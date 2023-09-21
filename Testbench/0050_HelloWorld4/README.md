# always blocks

If we simply specify `clk` in our sensitivity list, the `always` block will execute whenever there is a change in the `clk` signal.

And this is functionally equivelant to our previous example (i.e. log any change in `clk`):

```verilog
    always @(clk)
        if (clk)
            $display("%t (clk=%d) Hello, World!", $time, clk);
        else 
            $display("%t (clk=%d) Goodbye, World!", $time, clk);
```

The results continue to be the same as the previous example:

```
> icarus.bat
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