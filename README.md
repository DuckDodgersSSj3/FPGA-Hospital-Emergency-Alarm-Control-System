# FPGA Hospital Emergency Alarm Control System 
## By Brett Anley & Nicolas Munoz 

### Hospital Emergency Codes 
The Hospital Association of Southern California (HASC) Safety and Security Committee and AllHealth Security Services define Health Care Emergency Codes used in Project 
- Code RED : Fire 
- Code BLUE : Adult medical emergency 
- Code PURPLE : Child abduction 
- Code YELLOW : Bomb threat 

### What?
- Collaborate in a two-person project to design digital hardware using Verilog for implementation on the Nexys A7, aimed at creating a hospital emergency alarm control system

### How?
- Leveraged a finite state machine, synchronous ROM, UART Protocol, and other digital components in sculpted Verilog program
- Utilized four switches to select hospital emergency alarm codes: Red, Blue, Purple, and Yellow
- Configured RGB LED to match alarm code color and displayed emergency code description repeatedly on Tera Term

### Results 
- Developed and implemented a successful Verilog program for the hospital emergency alarm control system
- Conducted thorough testing to validate accurate transmission and display of code messages on the Tera Term terminal


### FSM Design 
![FSM](https://github.com/DuckDodgersSSj3/FPGA-Hospital-Emergency-Alarm-Control-System/assets/123620551/8254ff64-e4d9-4293-96f1-bfdf24ab1198)


### Nexys A7 - Used to Implement Verilog Program
![Nexys A7](https://github.com/DuckDodgersSSj3/FPGA-Hospital-Emergency-Alarm-Control-System/assets/123620551/f0d3d35b-063f-4763-be18-01c3a3cf096a)

### Schematic of designed hardware using Verilog
![Schematic ](https://github.com/DuckDodgersSSj3/FPGA-Hospital-Emergency-Alarm-Control-System/assets/123620551/73a25816-51f1-438e-856c-bb3ccb5f267d)

### Tera Term terminal display of each emergency code
![Alarm Codeds ](https://github.com/DuckDodgersSSj3/FPGA-Hospital-Emergency-Alarm-Control-System/assets/123620551/ee554387-31d3-4c46-b8c0-122be8036f92)
