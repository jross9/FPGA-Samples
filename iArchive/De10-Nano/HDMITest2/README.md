# HDMITest2

A modification of:

[https://github.com/dreambbqchild/HDMITest](https://github.com/dreambbqchild/HDMITest)

This time I input the RGB color pixel data from the calling module:

```verilog
    input [7:0] RED,
    input [7:0] GREEN,
    input [7:0] BLUE,
```

And I output the current pixel location:

```verilog
    output [11:0] X,
    output [11:0] Y
```

This tells me there are errors in the logic somewhere since we should not have to subtract two for vertical start Y to be = 0

```verilog
    assign X = h_count - h_start-1;
    assign Y = v_count - v_start-2;
```

I need to understand this:

```verilog
    vga_de      <=  pre_vga_de;
    pre_vga_de  <=  v_act && h_act;
```

Here we set the pixel data

```verilog
    if(h_act_d && v_act_d)
        {vga_r, vga_g, vga_b} <= {RED, GREEN, BLUE};
    else
        {vga_r, vga_g, vga_b} <= {8'h00,8'h00,8'h00};
```
