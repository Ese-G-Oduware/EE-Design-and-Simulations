`timescale 1ns / 1ps
`default_nettype wire
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2025 05:04:37 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
input A,
input B, 
input Cin,
output Cout, 
output S
    );
//internal nets
wire andBCin, andACin, xorAB;
// gate level activity
assign #6 S = A ^ B ^ Cin;
assign #4 andAB = A & B;
assign #4 xorAB = A ^ B;
assign #8 Cout = andAB |(Cin & xorAB);

endmodule
