`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2024 09:52:04 AM
// Design Name: 
// Module Name: synch_rom
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


module synch_rom
#(parameter ADDR_WIDTH = 3 , DATA_WIDTH = 2)
(
input clk ,
input [ADDR_WIDTH - 1 : 0] addr,
output reg [DATA_WIDTH - 1 : 0] data
);
(*rom_style = "block"*)reg [DATA_WIDTH - 1 : 0] ROM [0 : 2**ADDR_WIDTH - 1] ;
initial
$readmemb("data.mem",ROM);
always @(posedge clk)
begin
data <= ROM [addr] ; 
end
endmodule
