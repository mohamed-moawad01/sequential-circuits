`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2024 07:26:12 PM
// Design Name: 
// Module Name: mod_counter_input
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


module mod_counter_input
#(parameter n = 4)(
input clk,reset_n,enable,
input [n-1 : 0] final_value,
input [n-1 : 0] Q
    );
    reg [n-1 : 0] Q_reg,Q_next;
    
    always @(posedge clk , negedge reset_n)
    begin
    if(~reset_n)
    Q_reg <= 'b0;
    else if(enable)
    Q_reg <= Q_next;
    end
    always @(Q_reg)
    begin
    if (Q_reg == final_value)
    Q_next = 'b0;
    else
    Q_next = Q_reg + 1;
    end
    assign Q = Q_reg;
endmodule
