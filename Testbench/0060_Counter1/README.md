# counter

In the next two examples we are going to create a very simple counter. 

We are going to count from 0 to 3.  (0, 1, 2, 3)

So, we need we need a two bit register to hold our counter. 

```verilog
    reg [1:0] count;
```
We increment the counter on the positive edge of the clock!

```verilog
    always @(posedge clk) begin
        count <= count + 1'b1;
    end
```

To log the time and see what our counter is doing we do this in the `initial` block:

```verilog
    initial begin
        // -------------------------------------------
        clk = 0;
        count = 0;
        // -------------------------------------------
        #0 $display("%t (%h) %h", $time, clk, count);
        #10 $display("%t (%h) %h", $time, clk, count);
        #10 $display("%t (%h) %h", $time, clk, count);
        #10 $display("%t (%h) %h", $time, clk, count);
        #10 $display("%t (%h) %h", $time, clk, count);
        #10 $display("%t (%h) %h", $time, clk, count);
        #10 $display("%t (%h) %h", $time, clk, count);
        #10 $display("%t (%h) %h", $time, clk, count);
        #10 $display("%t (%h) %h", $time, clk, count);
        #10 $display("%t (%h) %h", $time, clk, count);
        #10 $display("%t (%h) %h", $time, clk, count);
        #10 $display("%t (%h) %h", $time, clk, count);
        #10 $display("%t (%h) %h", $time, clk, count);
        #10 $display("%t (%h) %h", $time, clk, count);
        #10 $display("%t (%h) %h", $time, clk, count);
        #10 $display("%t (%h) %h", $time, clk, count);
        #10 $display("%t (%h) %h", $time, clk, count);
        // -------------------------------------------
        #10 $finish;
    end
```
The results are:
```
> icarus.bat
                   0 (0) 0
                  10 (1) 0
                  20 (0) 1
                  30 (1) 1
                  40 (0) 2
                  50 (1) 2
                  60 (0) 3
                  70 (1) 3
                  80 (0) 0
                  90 (1) 0
                 100 (0) 1
                 110 (1) 1
                 120 (0) 2
                 130 (1) 2
                 140 (0) 3
                 150 (1) 3
testb.v:35: $finish called at 160 (1s)