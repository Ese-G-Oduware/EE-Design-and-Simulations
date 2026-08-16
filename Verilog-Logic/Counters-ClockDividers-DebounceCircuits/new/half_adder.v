`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 11:33:33 AM
// Design Name: 
// Module Name: half_adder
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


module half_adder(
output wire S, Cout, 
input wire A, B
    );

//S is the SUM which is the XOR of A and B
assign S = A ^ B; 
// Cout is the carry out of the binary sum, which is the AND of A and B
assign Cout = A & B; 

endmodule
