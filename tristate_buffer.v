`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2023 02:11:41 PM
// Design Name: 
// Module Name: tristate_buffer
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


module tristate_buffer
    #(parameter N = 8)(
    input [N-1:0] a,
    input en,
    output [N-1:0] b
    );
    
    assign b = (en) ? a : 'bz;

    
endmodule
