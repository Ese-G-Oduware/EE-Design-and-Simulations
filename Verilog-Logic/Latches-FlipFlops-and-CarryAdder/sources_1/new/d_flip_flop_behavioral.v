`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 11:56:15 AM
// Design Name: 
// Module Name: d_flip_flop_behavioral
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


module d_flip_flop_behavioral(
output reg Q,
output wire notQ,
input wire D,  
input wire Clk //clock signal
    );
//Behavioural D-flip-flop
//posedge means rising(positive) edge
always@ (posedge Clk)//when Clk goes High we trigger
    Q <= D; //non-blocking assognment statement
assign notQ = ~Q;

endmodule
