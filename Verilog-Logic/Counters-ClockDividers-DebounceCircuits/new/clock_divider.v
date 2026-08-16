`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 11:22:43 AM
// Design Name: 
// Module Name: clock_divider
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

//Will use behavioral verilog to demonstrate clock frequency
module clock_divider(
output wire [3:0] ClkOut,
input wire ClkIn
    );

parameter n = 26; //make count 6-bits for now

reg [n:0] Count; //count bit width is based on n (Yes, very cool)

//simple behavioral construct to descibe the counter
//YES TT
always@ (posedge ClkIn)
    Count <= Count + 1; //non-blocking statement

//wire up to most-significant bits
assign ClkOut [3:0] = Count [n:n-3];

endmodule
