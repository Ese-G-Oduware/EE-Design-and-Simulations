`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 12:13:14 PM
// Design Name: 
// Module Name: adder_2bit
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


module adder_2bit(
//describing input and output wires for a 2 bit ripple carry adder
input wire [1:0] A, B, 
output wire [1:0] Sum,
output wire Carry
    );
//intermediate wires
wire C0;

//Full Adder implementation
full_adder fa0 (A[0], B[0], 1'b0, C0, Sum[0]);
full_adder fa1 (A[1],B[1], C0, Carry, Sum[1]);

endmodule
