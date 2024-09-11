`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2024 06:05:55 PM
// Design Name: 
// Module Name: mod_counter_hardcoded
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


module mod_counter_hardcoded
#(parameter n = 4)(
input clk, reset_n, enable,
output [n-1 : 0] Q
    );
    reg [n-1 : 0] Q_reg, Q_next;
    wire done;
    // sequential logic
    always @(posedge clk , negedge reset_n)
    begin
    if(~reset_n)
    Q_reg <= 'b0;
    else if(enable)
    Q_reg <= Q_next;
    end
    //next state logic
    assign done = (Q_reg == 10);
    always @(Q_reg)
    begin
    if(done)
    Q_next = 'b0;
    else
    Q_next = Q_reg + 1;
    end
    
    assign Q = Q_reg;
    
endmodule
