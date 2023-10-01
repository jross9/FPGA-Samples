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
