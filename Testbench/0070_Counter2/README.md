# counter

This time we log our results in the `always` block 
```verilog
    always @(posedge clk) begin
        count <= count + 1'b1;
        $display("%t (%h) %h", $time, clk, count);
    end
```
To log the time and see what our counter is doing we do this in the `initial` block:
```verilog
    initial begin
        clk = 0;
        count = 0;
        #80 $display("-------------------------");
        #80 $finish;
    end
```
The results are:
```
> icarus.bat
                  10 (1) 0
                  30 (1) 1
                  50 (1) 2
                  70 (1) 3
-------------------------
                  90 (1) 0
                 110 (1) 1
                 130 (1) 2
                 150 (1) 3
testb.v:18: $finish called at 160 (1s)
```