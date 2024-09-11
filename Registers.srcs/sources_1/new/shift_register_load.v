`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2024 06:18:48 PM
// Design Name: 
// Module Name: shift_register_load
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


module shift_register_load
#(parameter n = 4)(
input SI,
input clk,
input reset_n,
input load, // 0 => shift , 1 => load
input [n-1 :0] I,
output [n-1 :0] Q,
output SO
    );
    assign Q = Q_reg;
    reg [n-1 : 0] Q_reg , Q_next;
    
    always @(posedge clk, negedge reset_n)
    begin
    if(!reset_n)
    Q_reg <= 'b0; 
    else
    Q_reg <= Q_next;
    end
    always @(SI , Q_reg , load)
    begin
    if(~load)
    Q_next = {SI,Q_reg[n-1 : 1]};
    else
    Q_next = I;
    end
    assign SO = Q_reg[0];
   assign Q = Q_reg;
    
    
endmodule
