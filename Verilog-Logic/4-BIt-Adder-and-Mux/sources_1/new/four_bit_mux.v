`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2025 04:40:54 PM
// Design Name: 
// Module Name: four_bit_mux
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


module four_bit_mux(Y,A,B,S);//output and input ports
input wire [3:0]A,B;
input wire S;
output wire [3:0] Y;
// instantiates user defined modules
two_one_mux MUX0(Y[0], A[0], B[0], S);
two_one_mux MUX1(Y[1], A[1], B[1], S);
two_one_mux MUX2(Y[2], A[2], B[2], S);
two_one_mux MUX3(Y[3], A[3], B[3], S);
           
endmodule
