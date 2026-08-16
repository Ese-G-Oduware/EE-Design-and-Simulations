`timescale 1ns / 1ps
`default_nettype wire
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2025 03:26:53 PM
// Design Name: 
// Module Name: two_one_mux
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


module two_one_mux(
output Y,
input A,
input B,    
input S);
    //Conditional expression, basically if the select bit is 1 then B, otherwise A.
    assign Y= (S == 1'b1) ? B:A;
endmodule
