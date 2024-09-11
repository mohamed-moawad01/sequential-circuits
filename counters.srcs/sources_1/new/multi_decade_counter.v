`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2024 07:51:32 PM
// Design Name: 
// Module Name: multi_decade_counter
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


module multi_decade_counter(
input clk, reset_n , enable , done ,
output[3 : 0] ones,tens,hundreds
    );
    wire done0,done1,done2;
    wire a0,a1,a2;
    BCD_counter D0 
    (
    .clk(clk),
    .reset_n(reset_n),
    .enable(enable),
    .done(done0),
    .Q(ones)
    
    );
    assign a0 = done0 & enable;
    BCD_counter D1
    (
    .clk(clk),
    .reset_n(reset_n),
    .enable(a0),
    .done(done0),
    .Q(ones)
    
    );
    assign a1 = done1 & a0;
    BCD_counter D2 
    (
    .clk(clk),
    .reset_n(reset_n),
    .enable(a1),
    .done(done0),
    .Q(ones)
    
    );
    
    assign a2 = a1 & done2;
    assign done = a2;
endmodule
