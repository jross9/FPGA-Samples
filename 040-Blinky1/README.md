# Blinky

Simple example of an LED blinking on various boards.  

Shows several concepts: 

* How to organize a project w/ several different development boards
* How the "Blinky_Top.v" module in each of the boards folder contains the specific I/Os for that board. 
* How to instantiate a Verilog Module.  The single module that is shared amongst all the development boards.
* How the Tang boards instantiate a separate PLL clock to get the 50MHz clock (well, close 50.1xx MHz, we'll get into PLLs at a later time). Which is board specific, therefore it is in the board folder. 

Just those concepts are not easy to grasp until you have done it several times and it begins to make sense. 
