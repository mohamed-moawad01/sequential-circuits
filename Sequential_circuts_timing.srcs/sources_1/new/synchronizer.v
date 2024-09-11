`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2024 02:53:15 AM
// Design Name: 
// Module Name: synchronizer
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


module synchronizer
#(parameter stages = 2)(
input clk , reset_n , D ,
output Q
    );
    reg [stages-1 : 0] Q_reg;
    always @(posedge clk , negedge reset_n)
    begin
    if(~reset_n)
    Q_reg <= 1'b0;
    else
    Q_reg <= {D , Q_reg[stage-1:1]};
    end
    assign Q = Q_reg[0];
endmodule
