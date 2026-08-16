`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 01:05:25 PM
// Design Name: 
// Module Name: combination_lock_fsm
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


module combination_lock_fsm(
output reg[2:0] state,
output wire[3:0] Lock, //asserted when locked
input wire Key1, //unlock button
input wire Key2, //unlock button2
input wire[3:0] Password, //indicate numnber
input wire Reset, //reset
input wire Clk //clock
    );

parameter S0 = 3'b000,
          S1 = 3'b001,
          S2 = 3'b010,
          S3 = 3'b011,
          S4 = 3'b100;

//intermediate nets
reg[2:0] nextState;
    
// Synchronous Logic to hold state
always@ (posedge Clk) begin
    if(Reset)
        state <= S0;
    else
        state <= nextState;
end

//Next state Logic
always@(*) begin
    case(state)
        S0: begin
            if( Key1 && (Password == 4'd13))
                nextState = S1;
            else
                nextState = S0;
        end
        S1:begin
            if(Key2)
                if(Password == 4'd7)
                    nextState = S2;
                else 
                    nextState = S0;
            else
                nextState = S1;
         end
         S2:begin
            if(Key1 && (Password == 4'd9))
                nextState = S3;
            else
                nextState = S2;
         end
         S3:begin
            if(Key2)
                if(Password == 4'd01)
                    nextState = S4;
                else
                    nextState = S0;
            else
                nextState = S3;
         end
         S4:begin
            nextState = S4;
         end
         default:begin
            nextState = S0;
         end
     endcase
end
    
 assign Lock = (state == S4) ? 4'b1111 : 4'b0000;   
    
endmodule
