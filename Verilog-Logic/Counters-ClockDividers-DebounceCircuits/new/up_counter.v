`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 11:38:43 AM
// Design Name: 
// Module Name: up_counter
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

//module describes a 3-bit up-dog using half-adder modules 
module up_counter(
Count, Carry2, En, Clk, Rst
    );
//Count output must be reg
output reg[2:0] Count;
output wire Carry2;
//input wires
input wire En, Clk, Rst;
//intermediate nets
wire [2:0] Carry, Sum;

//Create and instatiate a wrapper for the 3-bit counter first
Threebit_counter UC1 (Sum, Carry2, Count, En);
//describe positive edge triggered flip=flops for count
// Including a positive edge Rst in the sensitivity list
//implying a synchronous reset
always@ (posedge Clk or posedge Rst)
    if(Rst)
        Count <= 0;//reset count
    else //else latch the sum
        Count <= Sum;
endmodule

//OOOHHH I dint know you could have one module in a single file, thats cool

module Threebit_counter(Sum, Carry2, Count, En);
//declaring variables
input wire En;  
input wire [2:0] Count; 
output wire [2:0] Sum;  
output wire Carry2;  
wire [2:0] Carry;

//Half adders
half_adder ha0 (Sum[0], Carry[0], En, Count[0]);
half_adder ha1 (Sum[1], Carry[1], Carry[0], Count[1]);
half_adder ha2 (Sum[2], Carry[2], Carry[1], Count[2]);
half_adder ha3 (Sum[3], Carry[3], Carry[2], Count[3]);

//wiring up Carry_2
assign Carry2 = Carry[2];

endmodule
