`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 03:30:25 PM
// Design Name: 
// Module Name: priority_encoder
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


module priority_encoder(
input wire [3:0] W, 
output wire zero, 
//Y is a 2 bit output of type reg
output reg [1:0] Y);

assign zero = (W == 4'b0000);

always@(W)
    begin
        casex(W) 
            4'b0001: Y = 2'b00;
            4'b001X: Y = 2'b01;
            4'b01XX:Y = 2'b10;
            4'b1XXX: Y = 2'b11;
            default: Y =2'bXX;
         endcase
     end
endmodule
