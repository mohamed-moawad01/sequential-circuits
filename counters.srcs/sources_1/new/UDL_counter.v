`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2024 05:34:04 PM
// Design Name: 
// Module Name: UDL_counter
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


module UDL_counter
#(parameter n = 4)(
input clk, reset_n, up, load, enable,
input [n-1 : 0] D,
output [n-1 : 0] Q 
    );
    
    reg [n-1 : 0] Q_reg , Q_next;
    // sequential logic
    always @(posedge clk, negedge reset_n)
    begin
    if(~reset_n)
    Q_reg <= 'b0;
    else if(enable)
    Q_reg <= Q_next; 
    end
    // next state logic
    always @(up,load,Q_reg,D)
    begin
    case ({load , up})
    2'b00 : Q_next = Q_reg - 1;   
    2'b01 : Q_next = Q_reg + 1;
    2'b10 : Q_next = D; 
    2'b11 :  Q_next = D;
    default : Q_next = Q_reg;
    endcase
    end
    // output logic
    assign Q  = Q_reg;
endmodule
