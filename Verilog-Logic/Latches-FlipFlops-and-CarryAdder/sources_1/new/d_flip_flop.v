`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 11:22:40 AM
// Design Name: 
// Module Name: d_flip_flop
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


module d_flip_flop(
//declare all ports 
output wire Q, notQ,  //outputs of slave latch
input wire Clk, D
    );
//intermediate nets
wire notClk, notNotClk;
wire Qm; //output of master latch
//not Qm is used in instantiation but is left unconnected
wire notQm;

//not gates
not not0 (notClk, Clk);
not not1 (notNotClk, notClk);

//D-latches implementation
d_latch dl1 (notQm, Qm, notClk, D); 
d_latch dl2 (notQ, Q, notNotClk, Qm);

endmodule
