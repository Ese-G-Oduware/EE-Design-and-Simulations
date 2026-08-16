`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 03:20:35 PM
// Design Name: 
// Module Name: four_two_encoder
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


module four_two_encoder(
input wire [3:0] W, 
output wire zero, 
//Y is a 2 bit output of type reg
output reg [1:0] Y);

assign zero = (W == 4'b0000);

always@(W)
    begin
        case(W) 
            4'b0001: Y = 2'b00;
            4'b0010: Y = 2'b01;
            4'b0100:Y = 2'b10;
            4'b1000: Y = 2'b11;
            default: Y =2'bXX;
         endcase
     end

endmodule
