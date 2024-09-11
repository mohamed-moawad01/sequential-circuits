`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2024 04:51:00 PM
// Design Name: 
// Module Name: up_counter
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


module up_counter
#(parameter n = 4)(
input clk,
input reset_n,
output [n-1 : 0] Q
    );
    reg [n-1 : 0] Q_next , Q_reg;
    always @(posedge clk , negedge reset_n)
    begin
    if(~reset_n)
    Q_reg <= 'b0;
    else
    Q_reg <= Q_next; 
    end
    
    always @(Q_reg)
    begin
    Q_next = Q_reg + 1;
    end
    assign Q = Q_reg;
endmodule
