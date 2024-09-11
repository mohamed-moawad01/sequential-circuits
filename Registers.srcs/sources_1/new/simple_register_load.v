`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2024 05:16:37 PM
// Design Name: 
// Module Name: simple_register_load
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


module simple_register_load
#(parameter n = 4)(
input [n-1 : 0] I,
input  clk,load,
output [n-1 : 0] Q
    );
    reg [n-1 : 0] Q_reg,Q_next;
    always @(posedge clk)
    begin
    Q_reg <= Q_next;
    end
    always @(load , I)
    begin
    if(load)
    Q_next = I;
    else
    Q_next = Q_reg;
    end
    
    assign Q = Q_reg;
endmodule
