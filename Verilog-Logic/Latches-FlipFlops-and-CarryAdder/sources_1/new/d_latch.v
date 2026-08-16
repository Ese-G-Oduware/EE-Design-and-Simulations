`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 11:05:23 AM
// Design Name: 
// Module Name: d_latch
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


module d_latch(
//post list
output wire notQ, Q,
input wire En, D
    );

//intermediate wires
wire nandDEN, nandDnEN, notD;

not #2 not0 (notD, D);//inverts D

nand #2 nand0 (nandDEN, D, En);//this is the nand of D and enable
nand #2 nand1 (nandDnEN, notD, En);//this nands D not and Enable
//D-latch implementation
nand #2 nand3 (notQ, Q, nandDnEN);
nand #2 nand4 (Q, notQ, nandDEN);

endmodule
