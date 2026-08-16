`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 11:46:18 AM
// Design Name: 
// Module Name: d_latch_behavioral
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


module d_latch_behavioral(
output reg Q, //driven with a behavioutal statement
output wire notQ, //driven with dataflow statement
input wire D, En //wire can driver egs
    );
//Behaiviour od D-latch
always@(En or D)
    if(En) //if En != 1'b0 
        Q = D;
assign notQ = ~Q;//regs can drive wires

endmodule
