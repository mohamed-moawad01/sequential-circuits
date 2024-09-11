`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2024 10:32:56 PM
// Design Name: 
// Module Name: univ_shift_reg
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


module univ_shift_reg
#(parameter n = 4)(
input clk , reset_n,
input MSB_in , LSB_in,
input [n-1 : 0] I,
input [1 : 0] s,
output [n-1 : 0] Q
    );
    
    reg [n-1 : 0] Q_next , Q_reg;
    
    assign Q = Q_reg;
    
    always @( posedge clk , negedge reset_n )
    begin
    
    if(~reset_n)
    Q_reg <= 'b0; 
    else
    Q_reg <= Q_next;
    end
    
    always @(s,Q_reg,I,MSB_in,LSB_in)
    begin
    
    case(s)
    2'b00 : Q_next = Q_reg;
    2'b01 : Q_next = {MSB_in, Q_reg[n-1:1]};
    2'b10 : Q_next = {Q_reg[n-2 : 0],LSB_in};
    2'b11 : Q_next = I;
    default: Q_next = Q_reg;
    
    endcase
    
    end
    
endmodule
