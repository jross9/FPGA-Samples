@echo off
iverilog -o test.vvp testb.v 
vvp test.vvp
