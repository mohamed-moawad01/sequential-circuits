`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2024 03:06:20 AM
// Design Name: 
// Module Name: fsm_counter
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


module fsm_counter(
input en , clk ,reset_n ,
output [2 : 0] num
    );
    reg [2 : 0] state_reg , state_next;
    localparam s0 = 0 ,s1 = 1 , s2 = 2 , s3 = 3 , s4 = 4 , s5 = 5 , s6 = 6 , s7 = 7; 
    always @(posedge clk , negedge reset_n)
    begin
    if(~reset_n)
    state_reg <= s0;
    else if(en)
    state_reg <=  state_next;
    end
    always @(*)
    begin
    case(state_reg)
    s0 : state_next = s1;
    s1 : state_next = s2;
    s2 : state_next = s3;
    s3 : state_next = s4;
    s4 : state_next = s5;
    s5 : state_next = s6;
    s6 : state_next = s7;
    s7 : state_next = s0;
    default : state_next = state_reg;
    endcase
    end
    assign num = state_reg;
endmodule
