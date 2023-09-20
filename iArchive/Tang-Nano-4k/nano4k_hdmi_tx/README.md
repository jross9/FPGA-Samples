
### [nano4k_hdmi_tx](https://github.com/verilog-indeed/nano4k_hdmi_tx)

We have lots to dissect and understand from this example! It’s a good one! Will be coming back to it and making observations and notes. 

------

# nano4k_hdmi_tx
Open-source HDMI/DVI transmitter for the Gowin GW1NSR-powered Tang Nano 4K

Defaults to a 720x480@60Hz resolution, 24-bit color, currently transmitts a forwards-compatible DVI signal.

RTL written in Verilog with some help from Gowin's OSER10 blocks, includes demonstrations of various graphics:

## PAL bar test 
Set "pattern_generator_top.v" as top module.

![PAL bar test](media/pal_bar_test.jpg)

## Bouncy box
Set "bouncy_box_top.v" as top module.

![Bouncy box test](media/bouncy.gif)

## SRAM Framebuffer
Set "sram_framebuffer_test_top.v" as top module.

![Come to /r/GowinFPGA!](media/subreddit.jpg)