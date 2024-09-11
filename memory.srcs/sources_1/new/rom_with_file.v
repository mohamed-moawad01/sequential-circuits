`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2024 09:32:12 AM
// Design Name: 
// Module Name: rom_with_file
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


module rom_with_file
#(parameter ADDR_WIDTH = 3 , DATA_WIDTH = 2)
(
input [ADDR_WIDTH - 1 : 0] addr,
output [DATA_WIDTH - 1 : 0] data
);
reg [DATA_WIDTH - 1 : 0] ROM [0 : 2**ADDR_WIDTH - 1] ;
initial
$readmemb("data.mem",ROM);

assign data = ROM [addr] ; 
endmodule
