`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 02:24:49 PM
// Design Name: 
// Module Name: four_bit_mux_behavioural
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


module four_bit_mux(Y, A, B, S);//define the module name and its interface
//decalre output and input ports
output reg [3:0] Y;//outputs a 4bit wide reg
//wires can drive regs in behavioural statements

input wire [3:0] A, B; //A and B are 4bit wide wires
input wire S; //declare inputs of type wire, select still 1 bit wide
//wires can drive regs in behavioural statements

always@(A or B or S)//always block which triggers whenever A, B, or S changes
    begin //block constructs together
        //1'b0 represents a 1 bit binary value of zero
        if(S == 1'b0)// == represents equality
            Y = A;//drive Y with A 
        else
            Y = B; //instead drive Y with B
    end
endmodule//designate end of module
