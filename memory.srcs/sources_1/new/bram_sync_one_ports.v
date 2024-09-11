`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2024 09:19:37 AM
// Design Name: 
// Module Name: bram_sync_one_ports
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


module bram_sync_one_ports
#(parameter ADDR_WIDTH = 10 , DATA_WIDTH = 8)
(
input clk , 
input we_a ,
input [ADDR_WIDTH - 1 : 0] addr_a ,
input [DATA_WIDTH - 1 : 0] din_a ,
output reg [DATA_WIDTH - 1 : 0] dout_a 
);
reg [DATA_WIDTH - 1 : 0] memory [0 : 2**ADDR_WIDTH - 1] ;
always @(posedge clk)
begin
if(we_a)
memory[addr_a] <= din_a ;
dout_a <= memory[addr_a] ; 
end
endmodule
