# always blocks

We add an always block that only occurs on the `negedge` (negative edge) of the clock: 

```verilog
	always @(posedge clk)
		$display("%t (clk=%d) Hello, World!", $time, clk);

	always @(negedge clk)
		$display("%t (clk=%d) Goodbye, World!", $time, clk);
```

Now the results of our testbench look like this: 

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
                 100 (clk=0) Goodbye, World!```
