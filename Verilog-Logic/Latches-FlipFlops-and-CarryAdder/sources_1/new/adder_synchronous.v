`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 01:55:05 PM
// Design Name: 
// Module Name: adder_synchronous
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


module adder_synchronous(
//Reg beacuse they need to be able to hold state
output reg Carry_reg,
output reg [1:0] Sum_reg,
//inputs are wires
input wire Clk,
input wire [1:0] A,B
    );
//intermesiate nets
reg [1:0] Areg, Breg; //2-bit registers
wire Carry;
wire [1:0] Sum;

//2-bit adder implementation
adder_2bit ad (Areg, Breg, Sum, Carry);

//behavioural block to describe 2_bit registers
always@ (posedge Clk)
    begin
        Areg <= A; //2 state ments should happen concurrently 
        Breg <=B;  
    end
//register for the result
always@ (posedge Clk)
    begin
        Carry_reg <= Carry;
        Sum_reg   <= Sum;
    end
endmodule
