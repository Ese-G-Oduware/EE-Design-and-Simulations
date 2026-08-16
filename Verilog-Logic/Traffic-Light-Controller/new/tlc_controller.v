`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2025 03:14:42 AM
// Design Name: 
// Module Name: tlc_controller
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


module tlc_controller(
output wire[1:0] highwaySignal, farmSignal, //connected to LEDs
output wire[3:0] JB,
input wire Clk,
//the button provide input to the top level circuit
input wire Rst,//use as reset
input wire farmSensor
    );
    
//intermediate nests
wire RstSync, RstCount;
reg[30:0] Count;

assign JB[3] = RstCount;

//synchronize button inputs
synchronizer syncRst (RstSync, Rst, Clk);

//instantiate FSM
tlc_fsm FSM(
    .state(JB[2:0]), //wire state up to JB for debug
    .RstCount(RstCount),
    .highwaySignal(highwaySignal),
    .farmSignal(farmSignal),
    .Count(Count),
    .Clk(Clk),
    .Rst(Rst),
    .farmSensor(farmSensor)
 );
 
 //desrcibing Counter with synchronous reset
 
 always@(posedge Clk)begin
    if(RstSync)
        Count <= 31'd0;
    else if(RstCount)
        Count <= 31'd0;
    else
        Count <= Count +31'd1;
end

endmodule//ka-boom-chow-how
