`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2023 02:47:47 AM
// Design Name: 
// Module Name: code_fsm
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


module code_fsm(
input clk,
input reset_n,
input switch_0, switch_1, switch_2, switch_3,
input done,

output en,
output r_setn
    );
    
    reg [3:0] state_reg, state_next; // Need have enough bits of reg to fit 
                                     // the amount of states 
    localparam s0 = 0;
    localparam s1 = 1;
    localparam s2 = 2;
    localparam s3 = 3;
    localparam s4 = 4;
    localparam s5 = 5;
    localparam s6 = 6;
    localparam s7 = 7;
    localparam s8 = 8;
   
  
    
    // State register
    always @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            state_reg <= s0;
        else
            state_reg <= state_next;
    end
    
    // Next state logic
    always @(*)
    begin
        state_next = state_reg; // Need this; is very important 
                                // this sets the state_next if the state_next is not 
                                // writen in the code 
                                // This is different from the default code at bottom of code 
        case(state_reg)
            s0: if(switch_0)
                   state_next = s1;
                else if(switch_1)
                    state_next = s3;
                else if(switch_2)
                    state_next = s5;
                else if(switch_3)
                    state_next = s7;
                else 
                    state_next = s0;  
                           
            s1: if(done)
                    state_next = s2;
                else 
                    state_next = s1;
            
            s2: state_next = s0;
                
            s3: if(done)
                    state_next = s4;
                else 
                    state_next = s3;
            
            s4: state_next = s0;
                 
            s5: if(done)
                    state_next = s6;
                else 
                    state_next = s5;
                    
            s6: state_next = s0;
            
            s7: if(done)
                    state_next = s8;
                else 
                    state_next = s7;
             
            s8: state_next = s0;
                         
            default: state_next = state_reg;            
        endcase
    end
    
    // Output logic
   assign en = (state_reg == s1) | (state_reg == s3) | (state_reg == s5) | (state_reg == s7);
   
   assign r_setn = (state_reg == s0) | (state_reg == s1) | (state_reg == s3) | (state_reg == s5) | (state_reg == s7);
   
endmodule
