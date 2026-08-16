`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2025 05:31:01 PM
// Design Name: 
// Module Name: add_sub
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


module add_sub(
output wire [3:0] Sum,
output wire     Overflow,
input wire  [3:0]  opA,opB,
input wire opSel);

//declare internal nets
wire [3:0] notB;
wire c0,c1,c2,c3;

//complement logic
assign notB[0] = opB[0] ^ opSel;
assign notB[1] = opB[1] ^ opSel;
assign notB[2] = opB[2] ^ opSel;
assign notB[3] = opB[3] ^ opSel;

full_adder fa0(opA[0],notB[0], opSel, c0, Sum[0]);
full_adder fa1(opA[1],notB[1], c0, c1, Sum[1]);
full_adder fa2(opA[2],notB[2], c1, c2, Sum[2]);
full_adder fa3(opA[3],notB[3], c2, c3, Sum[3]);

//Checks for overflow
assign Overflow = c2 ^ c3;

endmodule
