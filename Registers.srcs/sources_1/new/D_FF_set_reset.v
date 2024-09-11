`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2024 03:39:40 AM
// Design Name: 
// Module Name: D_FF_set_reset
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


module D_FF_set_reset(
input D, clk, reset_n,set_n,
output reg Q
    );
    always @(negedge clk,negedge reset_n )
    begin
    if(~reset_n)
    Q <= 1'b0;
    else
    if(~set_n)
    Q <= 1'b1;
    else 
    Q <= D;
    end
endmodule
