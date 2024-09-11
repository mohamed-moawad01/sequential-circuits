`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2024 03:34:03 AM
// Design Name: 
// Module Name: LFSR
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


module LFSR
#(parameter n = 4)(
input clk , reset_n , 
output [1 : n] Q
    );
    reg [1 : n] Q_reg , Q_next;
    wire taps;
    always @(posedge clk , negedge reset_n)
    begin
    if(~reset_n)
    Q_reg <= 'd1; //because we cant start from 0
    else
    Q_reg <= Q_next;
    end
    
    always @(Q_reg)
    begin
    Q_next ={taps , Q_reg[1 : n-1]}; //typical implemintation of shift register
    end    
    
    assign Q = Q_reg;
    assign taps = Q_reg[3] ^ Q_reg[2];
endmodule
