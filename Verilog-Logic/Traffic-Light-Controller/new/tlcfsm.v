`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2025 02:02:04 AM
// Design Name: 
// Module Name: tlcfsm
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


module tlc_fsm(
output reg[2:0] state, //output for debugging, 6 states require 3 bits
output reg RstCount, // will use an always block
output reg[1:0] highwaySignal, farmSignal,
input wire farmSensor,
input wire [30:0] Count, 
input wire Clk, Rst //clock and reset
    );
 
//using parameter
parameter S0 = 3'b000, // 1s delay
          S1 = 3'b001, //30s delay
          S2 = 3'b010, // 3s delay
          S3 = 3'b011, // 1s delay
          S4 = 3'b100, //15s delay
          S5 = 3'b101;// 3s delay
          
//intermediate nets
reg[2:0] nextState;

//for traffic lights
parameter red = 2'b01,
          yellow = 2'b10,
          green = 2'b11;   
//delay values 
parameter Delay1 = 31'd50000000,//1s
          Delay30 = 31'd1500000000,//30s
          Delay3 = 31'd150000000,//3s
          Delay18 = 31'd900000000;  //15s   change to 18s which is 900000000

//Current state (count) and output for RstCount
always@(*)begin
    case(state)
        S0:begin
            if(Count >= Delay1)begin//stay in S0 until 1 second passes
                nextState = S1;
                RstCount = 1'b1;
            end
            else begin
                nextState = S0;
                RstCount = 1'b0;
            end
        end
        S1:begin
            if(Count >= Delay30 && farmSensor) begin //stay in S0 until30 second passes
                nextState = S2;
                RstCount = 1'b1;
            end
            else begin
                nextState = S1;
                RstCount = 1'b0;
        end
        end
        S2:begin
            if(Count >= Delay3) begin//stay in S0 until30 second passes
                nextState = S3;
                RstCount = 1'b1;
            end
            else begin
                nextState = S2; 
                RstCount = 1'b0;
        end
        end
        S3:begin
            if(Count >= Delay1) begin//stay in S0 until30 second passes
                nextState = S4;
                RstCount = 1'b1;
            end
            else begin
                nextState = S3; 
                RstCount = 1'b0;
        end
        end 
        S4:begin
            if(Count >= Delay18 || (Count >=Delay3 && !farmSensor)) begin//stay in S0 until30 second passes
                nextState = S5;
                RstCount = 1'b1;
            end
            else begin
                nextState = S4; 
                RstCount = 1'b0;
            end
        end 
        S5:begin
            if(Count >= Delay3) begin//stay in S0 until30 second passes
                nextState = S0;
                RstCount = 1'b1;
             end
            else begin 
                nextState = S5; 
                RstCount = 1'b0;
            end
        end 
        default: begin
            nextState = S0;
            RstCount = 1'b0; 
        end
    endcase
end

//Logic for the traffic signals
always@(*) begin
    case(state) 
        S0: begin
            highwaySignal = red;
            farmSignal = red;
        end 
        S1: begin
            highwaySignal = green;
            farmSignal = red;
        end 
        S2: begin
            highwaySignal = yellow;
            farmSignal = red;
        end 
        S3: begin
            highwaySignal = red;
            farmSignal = red;
        end 
        S4: begin
            highwaySignal = red;
            farmSignal = green;
        end 
        S5: begin
            highwaySignal = red;
            farmSignal = yellow;
        end 
        default: begin
            highwaySignal = red;
            farmSignal = red;
        end
   endcase
end

//Synchronous logic to hold state
always@(posedge Clk)
    if(Rst)//reset state
        state <= S0;
    else
        state <= nextState;        
    
endmodule
