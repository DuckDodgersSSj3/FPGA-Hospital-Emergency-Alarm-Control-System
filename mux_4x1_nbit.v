`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2023 04:15:09 AM
// Design Name: 
// Module Name: mux_4x1_nbit
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


module mux_4x1_nbit
    #(parameter N = 6 )
(
    input [N - 1: 0] I0,I1,I2,I3,
    input [1:0] s,
    output reg [N - 1: 0] f
    );
    
    // case (Multiplexing Networks)
    always @(*)
    begin
        case(s)
            2'b00: f = I0;
            2'b01: f = I1;
            2'b10: f = I2;
            2'b11: f = I3;
            default: f = 'bx;
        endcase
    end
endmodule
