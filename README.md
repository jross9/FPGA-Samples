# FPGA Samples

We all learn through examples. It's kind of like training an AI -- only after we have seen enough concrete examples of a concept do we begin to fully understand it. 

This is my site of FPGA / HDL examples.

-----

I need to change the way I am doing this; instead of categorizing by development board and have duplicate projects under those boards, I need to categorize by example and under each example have project / build files by development boards.  

So instead of having
```
DE1 
|
|-- Blinky

DE2
|
|-- Blinky
```
I will have
```
Blinky
|
|-- Common
|   |-- Common source files to project
|   |-- Blinky.v ... etc
|
|-- DE1
|   |-- Top_Level.v
|   |-- DE1 project files (*.qpf|*.qsf ... etc)
|
|-- DE2
|   |-- Top_Level.v
|   |-- DE2 project files (*.qpf|*.qsf ... etc)
```
-----

I have quite the collection of FPGA development boards:

* 1 x DE0
* 2 x DE0-Nano 
* 1 x DE0-Nano-SoC
* 2 x [DE1](DE1)
* 1 x [DE1-SoC](DE1-SoC)
* 2 x DE2
* 1 x DE2-70
* 1 x DE10-Nano
* 1 x QMTech Cyclone IV EP4CE15 
* 2 x Cyclone II EP2C5T144 generic boards
* 1 x Tang Nano 4k
* 2 x Tang Nano 9k
* 1 x Tang Nano 20k

And I have one on the way from eBay ...  Altera Cyclone II FPGA Starter Development Kit (which I believe is just a DE1 that was sold by Altera w/ the Altera brand? Paid $40 + ($20 s/h & taxes), impulse buy but pretty good price!) 

-----

Some good sites are:

* [ASIC-WORLD: Verilog](https://www.asic-world.com/verilog/index.html)
* [HDLBits](https://hdlbits.01xz.net/wiki/Main_Page)