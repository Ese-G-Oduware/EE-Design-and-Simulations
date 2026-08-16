`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 12:03:51 PM
// Design Name: 
// Module Name: carrylook_ahead_4bit
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

//this is the top-level module for a 4-bit carry look-ahead adder
module carrylook_ahead_4bit(
Cout, S, X, Y, Cin
    );
//ports are wires as this is structural verilog
output wire Cout; //C4 for a 4-bit adder
output wire [3:0]S; //final 4-bit sum vector
input wire[3:0] X, Y; //the 4-bit addends
input wire Cin;// input carry!!

//internal wires
wire [3:0] G,P;//generate and propagate  
wire [4:1] Carry_Look;//carry look ahead unit
wire[3:0] Sum; //4bit vector needed for summation

generate_propagate_unit GPU ( .G(G), .P(P), .X(X), .Y(Y));
carrylook_ahead_unit CLU (.C(Carry_Look), .G(G), .P(P), .C0(Cin));

//Summation unit
assign Sum[3] = Carry_Look[3];
assign Sum[2] = Carry_Look[2];
assign Sum[1] = Carry_Look[1];
assign Sum[0] = Cin;//input carry(Cin) is C0

summation_unit SUM( .S(S), .P(P), .C(Sum));

assign Cout = Carry_Look[4];//carry out of final bit

endmodule
