`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2024 02:19:57 AM
// Design Name: 
// Module Name: mealy_101_detector
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


module mealy_101_detector(
input clk , reset_n , x ,
output y 
    );
    reg [1:0] state_reg , state_next;
    localparam s0 = 0;
    localparam s1 = 1;
    localparam s2 = 2;
    always @(posedge clk , negedge reset_n)
    begin
    if(~reset_n)
    state_reg <= s0;
    else
    state_reg <= state_next; 
    end
    always @(*)
    begin
    case(state_reg)
    s0 : if(x)
           state_next = s1;
           else
           state_next = s0;
    s1 : if(x)
           state_next = s1;
           else
           state_next = s2;
    s2 : if(x)
           state_next = s1;
           else
           state_next = s0;
    default : state_next = state_reg;
    endcase
    end
    assign y = (state_reg == s2) & x;
endmodule
