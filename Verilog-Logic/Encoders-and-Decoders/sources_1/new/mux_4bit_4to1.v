`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 02:38:20 PM
// Design Name: 
// Module Name: mux_4bit_4to1
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


module mux_4bit_4to1(Y, A, B, C, D, S);

//declare output and input ports
output reg [3:0]Y; //output 4-bit wide reg
input wire [3:0] A, B, C, D; //4-bit input wires 
//selects a 2 bit wire
input wire [1:0] S;

always@(*)// * means trigger when anything changes
    //we do not use beginning and end due to case statement
    case(S)//selection based on S 
    2'b00: Y = A; //when S == 2'b00 
    2'b01: Y = B; 
    2'b10: Y = C; 
    2'b11: Y = D;//when S == 2'b11
    endcase //designates the end of the case statement
    
endmodule
