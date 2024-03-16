`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2023 03:12:55 AM
// Design Name: 
// Module Name: text_reader
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module text_reader(
input clk,
input reset_n,
input en,

output done_w, done_text, 
output [7:0]ROM_out_R,
output [7:0]ROM_out_B,
output [7:0]ROM_out_P,
output [7:0]ROM_out_Y

    );
    
   
    wire [7:0]ROM_in;
    wire a0; 
    
    
    timer_parameter #(.FINAL_VALUE(999999)) t0 (
        //inputs 
        .clk(clk),
        .reset_n(reset_n),
        .enable(en),
        //output
        .done(done_w)
    );
     
    
    // FF Counter 
    mod_counter_parameter #(.FINAL_VALUE(254)) mc0 (
        //inputs 
        .clk(clk),
        .reset_n(reset_n),
        .enable(done_w),
        //outputs 
        .Q(ROM_in),
        .done(done_text)
    );
   
    
    synch_rom #(.FILE_NAME("morse2ascii_RED.mem")) RED (
        //inputs 
        .clk(clk),
        .addr(ROM_in),
        //outputs 
        .data(ROM_out_R)
    );
    
    synch_rom #(.FILE_NAME("morse2ascii_blue.mem")) BLUE (
        //inputs 
        .clk(clk),
        .addr(ROM_in),
        //outputs 
        .data(ROM_out_B)
    );
    
    synch_rom #(.FILE_NAME("morse2ascii_purple.mem")) PURPLE (
        //inputs 
        .clk(clk),
        .addr(ROM_in),
        //outputs 
        .data(ROM_out_P)
    );
    
    synch_rom #(.FILE_NAME("morse2ascii_YELLOW.mem")) YELLOW (
        //inputs 
        .clk(clk),
        .addr(ROM_in),
        //outputs 
        .data(ROM_out_Y)
    );

endmodule
