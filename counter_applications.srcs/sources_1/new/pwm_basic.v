`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2024 02:28:06 AM
// Design Name: 
// Module Name: pwm_basic
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


module pwm_basic
#(parameter R = 8)(
input clk , reset_n ,
input [R-1 : 0] duty,
output pwm_out
    );
    reg [R-1 : 0] Q_reg , Q_next;
    always @(posedge clk , negedge reset_n)
    begin
    if(~reset_n)
    Q_reg <= 'b0;
    else
    Q_reg <= Q_next; 
    end 
    always @(Q_reg )
    begin
    Q_next = Q_reg + 1;
    end
    //output logic
    assign pwm_out = (Q_reg < duty);
    
endmodule
