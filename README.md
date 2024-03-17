# FPGA Hospital Emergency Alarm Control System 
## By Brett Anley & Nicolas Munoz 

### Hospital Emergency Codes 
The Hospital Association of Southern California (HASC) Safety and Security Committee and AllHealth Security Services define Health Care Emergency Codes used in Project 
- Code RED : Fire 
- Code BLUE : Adult medical emergency 
- Code PURPLE : Child abduction 
- Code YELLOW : Bomb threat 

### What?
- Collaborated in a two-person project to design digital hardware, using Verilog, to be implemented on the Nexys A7
- Utilized four switches to select hospital emergency alarm codes: Red, Blue, Purple, and Yellow
- Configured RGB LED to match alarm code color and displayed emergency code description repeatedly on Tera Term

### How?
- Leveraged a finite state machine, synchronous ROM, UART Protocol, and other digital components in sculpted Verilog program

### Results 
- Developed and implemented a successful Verilog program for the hospital emergency alarm control system
- Conducted thorough testing to validate accurate transmission and display of code messages on the Tera Term terminal

### FSM Design 
![FSM](https://github.com/Spring-2023-Classes/sp23-final-project-nico-brett/assets/123620551/e0fb838c-bc97-4e00-bab6-ce8d6c9350e6)

### Nexys A7 - Used to Implement Verilog Program
![Nexys A7](https://github.com/DuckDodgersSSj3/FPGA-Hospital-Emergency-Alarm-Control-System/assets/123620551/f0d3d35b-063f-4763-be18-01c3a3cf096a)

### Schematic of designed hardware using Verilog
![Schematic ](https://github.com/DuckDodgersSSj3/FPGA-Hospital-Emergency-Alarm-Control-System/assets/123620551/73a25816-51f1-438e-856c-bb3ccb5f267d)

### Tera Term terminal display of each emergency code
![Alarm Codeds ](https://github.com/DuckDodgersSSj3/FPGA-Hospital-Emergency-Alarm-Control-System/assets/123620551/ee554387-31d3-4c46-b8c0-122be8036f92)
