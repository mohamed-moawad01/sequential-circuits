`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2024 01:22:15 AM
// Design Name: 
// Module Name: asynch_up_counter
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


module asynch_up_counter(
input clk,reset_n,
output [3 : 0]Q
    );
    T_FF FF0 
    (
    .T(1'b1),
    .clk(clk),
    .reset_n(reset_n),
    .Q(Q[0])
    );
    T_FF FF1 
    (
    .T(1'b1),
    .clk(~Q[0]),
    .reset_n(reset_n),
    .Q(Q[1])
    );
    T_FF FF2 
    (
    .T(1'b1),
    .clk(~Q[1]),
    .reset_n(reset_n),
    .Q(Q[2])
    );
    T_FF FF3 
    (
    .T(1'b1),
    .clk(~Q[2]),
    .reset_n(reset_n),
    .Q(Q[3])
    );
    
endmodule
