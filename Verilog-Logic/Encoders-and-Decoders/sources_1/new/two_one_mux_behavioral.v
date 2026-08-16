`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 02:00:12 PM
// Design Name: 
// Module Name: two_one_mux_behavioral
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


module two_one_mux(Y, A, B, S);//define the module name and its interface

//decalre output and input ports
output reg Y;//declare inputs of type wire
//wires can drive regs in behavioural statements

input wire A, B, S; //declare inputs of type wire
//wires can drive regs in behavioural statements

always@(A or B or S)//always block which triggers whenever A, B, or S changes
    begin //block constructs together
        //1'b0 represents a 1 bit binary value of zero
        if(S == 1'b0)// == represents equality
            Y = A;//drive Y with A 
        else
            Y = B; //instead drive Y with B
    end

endmodule //designate end of module
