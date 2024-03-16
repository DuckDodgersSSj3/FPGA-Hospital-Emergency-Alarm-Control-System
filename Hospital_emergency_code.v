`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2023 02:46:01 AM
// Design Name: 
// Module Name: Hospital_emergency_code
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


module Hospital_emergency_code(
input clk,
input reset_n,
input switch_0, switch_1, switch_2, switch_3,

// uart inputs and outputs 
output tx,
output tx_full, 
//---------------------------------------
output [2:0]RGB_out

    );
    
    
    wire [3:0]s;
    wire r_setn; 
    wire en;
    wire done;
    wire wr_en; 
    wire [7:0]ROM_out_R;
    wire [7:0]ROM_out_B; 
    wire [7:0]ROM_out_P; 
    wire [7:0]ROM_out_Y;
    wire [7:0]MUX_out;
    wire [7:0]ROM_out;  
    wire wr_en_1;
    
    reg tri_en;
    reg [2:0]RGB; 
    reg [1:0]s_mux;
    
    code_fsm fsm (
        //inputs 
        .clk(clk),
        .reset_n(reset_n),
        .switch_0(switch_0), 
        .switch_1(switch_1), 
        .switch_2(switch_2), 
        .switch_3(switch_3),
        .done(done),
        //outputs 
        .en(en),
        .r_setn(r_setn)
    );
    
    assign s = ({switch_3,switch_2,switch_1,switch_0}); 
    
    always @(*)
    begin 
        RGB = 3'b000;
        case(s)
            4'b0000:begin
                        RGB = 3'b000; 
                        tri_en = 0;
                    end
            4'b0001:begin
                        RGB = 3'b100;
                        tri_en = 1;
                    end
                
            4'b0010:begin
                        RGB = 3'b001;
                        tri_en = 1;
                    end
            4'b0100:begin
                        RGB = 3'b101;
                        tri_en = 1;
                    end
            4'b1000:begin
                        RGB = 3'b110;
                        tri_en = 1;
                    end
            default:begin
                        RGB = 3'b000;
                        tri_en = 0;
                    end 
        endcase   
    end 
        
    assign RGB_out = RGB; 
    
    text_reader txt (
        //inputs 
        .clk(clk),
        .reset_n(r_setn),
        .en(en),
        //outputs 
        .done_w(wr_en_1), 
        .done_text(done), 
        .ROM_out_R(ROM_out_R),
        .ROM_out_B(ROM_out_B),
        .ROM_out_P(ROM_out_P),
        .ROM_out_Y(ROM_out_Y)
    );
    
   
    
    
    always @(*)
    begin 
        casex(RGB)
            3'b100: s_mux = 2'b00;
            3'b001: s_mux = 2'b01;
            3'b101: s_mux = 2'b10;
            3'b110: s_mux = 2'b11;
            default: s_mux = 'bx; 
        endcase   
    end 
    
    mux_4x1_nbit #(.N(8)) MUX (
        //inputs 
        .I0(ROM_out_R),
        .I1(ROM_out_B),
        .I2(ROM_out_P),
        .I3(ROM_out_Y),
        .s(s_mux),
        //Outputs 
        .f(MUX_out)
   ); 
    
    tristate_buffer #(.N(8)) tristate
    (
    .a(MUX_out),
    .en(tri_en),
    .b(ROM_out)
    
    );
    
    assign wr_en = ~tx_full & wr_en_1; 

    
     uart #(.DBIT(8), .SB_TICK(16)) uart_driver(
        .clk(clk),
        .reset_n(reset_n),
        .r_data(),
        .rd_uart(1'b0),
        .rx_empty(),
        .rx(),
        .w_data(ROM_out),
        .wr_uart(wr_en),
        .tx_full(tx_full),
        .tx(tx),
        .TIMER_FINAL_VALUE(11'd650) // baud rate = 9600 bps

    );
    
endmodule
