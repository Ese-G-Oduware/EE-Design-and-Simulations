`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 03:35:09 PM
// Design Name: 
// Module Name: four_bit_alu
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


module four_bit_alu(
output wire [3:0] Result,
output wire Overflow,
input wire [3:0] opA, opB,
input wire [1:0] ctrl
    );

// declare internal nets
wire [3:0] Sum_result, and_result;
wire check_overflow;

//Ctrl Operation
/*
---------
0   0 AND
1   0 AND
0   1 ADD
1   1 SUB
*/

assign and_result = opA & opB;//just anding stuff
add_sub AS(Sum_result, check_overflow, opA, opB, ctrl[1]);//using add and sub
four_bit_mux M(Result, and_result , Sum_result , ctrl[0]);// connecting to fourbit adder

assign Overflow = check_overflow & ctrl[0];

endmodule
