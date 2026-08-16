`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 10:25:27 AM
// Design Name: 
// Module Name: sr_latch
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


module sr_latch(
//port list
output wire Q, notQ,
input wire En, S, R
    );
//intermediate nets
//nandSEN is the output of NAND(S,En)
//nandREN is the output of NAND(R,En)
wire nandSEN, nandREN;

//delay of nand is 2ns
nand #4 nand1 (nandSEN, S, En); 
nand #4 nand2 (nandREN, R, En);
//This is the D-latch implementation
nand #4 nand0 (Q, nandSEN, notQ);
nand #4 nand3 (notQ, nandREN, Q);

endmodule
