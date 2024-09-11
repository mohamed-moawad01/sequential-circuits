`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2024 02:21:06 AM
// Design Name: 
// Module Name: D_FF_reset
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


module D_FF_reset(
input D, clk,
input reset_n, //asynchronous 
input clear_n, //synchronous 
output reg Q
    );
    
   /* always @(negedge clk , negedge reset_n) 
    begin
    if(!reset_n)
    Q <= 1'b0;
    else
    Q <= D;
    end*/
  always @(posedge clk)
    begin
    if(~clear_n)
    Q <= 1'b0;
    else
    Q <= D;
    end
    
endmodule
