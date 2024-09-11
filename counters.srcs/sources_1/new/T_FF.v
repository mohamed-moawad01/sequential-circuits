`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2024 12:32:55 AM
// Design Name: 
// Module Name: T_FF
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


module T_FF(
input T, clk, reset_n,
output Q
    );
    
    reg Q_reg;
    wire Q_next;
    
    assign Q = Q_reg;
    
    always @(posedge clk ,negedge reset_n)
    begin
    
    if(!reset_n)
    Q_reg <= 1'b0 ;
    else
     #2 Q_reg <= Q_next;
    
    end
    assign Q_next = T? ~Q_reg : Q_reg;
    
endmodule
