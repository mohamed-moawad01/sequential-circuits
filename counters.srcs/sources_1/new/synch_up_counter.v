`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2024 05:37:09 PM
// Design Name: 
// Module Name: synch_up_counter
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


module synch_up_counter(
    input clk,
    input reset_n,
    output [3:0] Q
    );
        
     wire q0,q1,q2,q3;

     assign q0 = 1'b1;

     T_FF FF0 
     (
     .clk(clk),
     .reset_n(reset_n),
     .T(q0),
     .Q (Q[0])
     );
     assign q1 = Q[0] & q0;
     T_FF FF1 
     (
     .clk(clk),
     .reset_n(reset_n),
     .T(q1),
     .Q(Q[1])
     ); 
     assign q2 = Q[1] & q1;
     T_FF FF2
     (
     .clk(clk),
     .reset_n(reset_n),
     .T(q2),
     .Q(Q[2])
     ); 
     assign q3 = q2 & Q[2];
     T_FF FF3
     (
     .clk(clk),
     .reset_n(reset_n),
     .T(q3),
     .Q(Q[3])
     ); 
    
endmodule
