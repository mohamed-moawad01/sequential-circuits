`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2024 05:27:54 PM
// Design Name: 
// Module Name: shift_register
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


module shift_register
#(parameter n = 4)(
input clk ,SI,
output [n-1 : 0]Q,
output SO
    );
    
    reg [n-1 : 0] Q_reg, Q_next ; 
    
    always @(posedge clk)
    begin
    Q_reg <= Q_next;
    end  
    always @(SI,Q_reg)
    begin
    Q_next = {SI,Q_reg[n-1: 1]};
    end
    assign S0 = Q_reg[0]; 
    assign Q = Q_reg;
endmodule
