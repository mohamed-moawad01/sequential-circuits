`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2024 08:57:35 AM
// Design Name: 
// Module Name: bram_simple_synch_dual_ports
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


module bram_simple_synch_dual_ports
#(parameter ADDR_WIDTH = 10 , DATA_WIDTH = 8)
(
input clk , 
input we , 
input [ADDR_WIDTH - 1 : 0] addr_r , addr_w ,
input [DATA_WIDTH - 1 : 0] din ,
output reg [DATA_WIDTH - 1 : 0] dout 
);

reg [DATA_WIDTH - 1 : 0] memory [0 : 2**ADDR_WIDTH - 1];
always @(posedge clk)
begin
if(we)
memory[addr_w] <= din;
dout <= memory[addr_r] ;

end

endmodule
