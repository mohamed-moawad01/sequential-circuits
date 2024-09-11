`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2024 04:34:21 AM
// Design Name: 
// Module Name: mealy_011_detector
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


module mealy_011_detector(
input clk , reset_n , x ,
output y
    );
    reg [1 : 0] state_reg , state_next;
    always @(posedge clk , negedge reset_n)
    begin
    if(~reset_n)
    state_reg <= 'b0;
    else
    state_reg <= state_next; 
    end
    
    always @(*)
    begin
    state_next[1] = X & ( ~state_reg[1] ) & (state_reg[0]);
    state_next[0] = (~state_reg[1] & ~x) | (~state_reg[0] & ~x);
    end
    assign y = state_reg[1] & ~state_reg[0] & x;
    
endmodule
