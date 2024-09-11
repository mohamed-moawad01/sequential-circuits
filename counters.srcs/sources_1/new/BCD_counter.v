`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2024 07:47:40 PM
// Design Name: 
// Module Name: BCD_counter
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


module BCD_counter(

input clk, reset_n, enable,done,
output [3 : 0] Q
    );
    reg [3 : 0] Q_reg, Q_next;
    // sequential logic
    always @(posedge clk , negedge reset_n)
    begin
    if(~reset_n)
    Q_reg <= 'b0;
    else if(enable)
    Q_reg <= Q_next;
    end
    //next state logic
    assign done = (Q_reg == 9);
    always @(Q_reg)
    begin
    if(done)
    Q_next = 'b0;
    else
    Q_next = Q_reg + 1;
    end
    
    assign Q = Q_reg;
    
endmodule
