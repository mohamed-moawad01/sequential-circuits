`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2024 04:43:42 PM
// Design Name: 
// Module Name: simple_register
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


module simple_register
#(parameter n = 4)(
input [n-1 : 0]I,
input clk,
output [n-1 : 0]Q
    );
    reg [n-1 : 0] Q_reg,Q_next;
    always @(posedge clk)
    begin
    Q_reg <= Q_next;
    end
    always @(I)
    begin
    Q_next = I;
    end
    assign Q = Q_reg;

    
endmodule