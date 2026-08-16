`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 12:27:50 PM
// Design Name: 
// Module Name: top_level
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


module top_level(
LEDs, SWs, BTNs, FastClk
    );
//all ports will ve wires
output wire [3:0] LEDs;
input wire [1:0] SWs; //switches
input wire [1:0] BTNs; // buttons
input wire FastClk;

//intermediate nets
wire [3:0] Clocks;
reg Slow_Clk; //will use an always block for mux

//behavioral descriotion of a 4-bit mux
always@(*)// combinatorial logic
    case (SWs) //SWs is a 2-bit bus
        2'b00 : Slow_Clk = Clocks[0];// use blocking statements for combinational logic
        2'b01 : Slow_Clk = Clocks[1];
        2'b10 : Slow_Clk = Clocks[2];
        2'b11 : Slow_Clk = Clocks[3];
    endcase
//instantiate up_counter
up_counter uc0 (LEDs[2:0], LEDs[3], BTNs[0], Slow_Clk, BTNs[1]);
//instantiate clock divider
clock_divider clk_div0(
    .ClkOut (Clocks),
    .ClkIn (FastClk)
);
endmodule
