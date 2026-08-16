`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 11:29:29 AM
// Design Name: 
// Module Name: generate_propagate_unit
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

// module descibes the carry generate/propagate
module generate_propagate_unit(
G,P,X,Y
    );
//ports are wires as we will use dataflow
output wire[3:0] G,P;  
input wire[3:0] X,Y;      

assign G = X & Y;
assign P = X ^ Y;
    
endmodule

//module  descirbes the 4bit carry look ahead unit
module carrylook_ahead_unit(C,G,P,C0);
//ports are wires because they will be used in dataflow
output wire[4:1] C;//C1, C2, C3, C4  
input wire [3:0] G,P;// generate and propagate    
input wire C0;// input carry            

assign C[1] = G[0] | (P[0] & C0);
assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C0);
assign C[3] = G[2] | (P[2] & G[1]) |(P[2] & P[1] & G[0]) +(P[2] & P[1] & P[0] & C0);
assign C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) + (P[3] & P[2] & P[1] & G[0]) + (P[3] & P[2] & P[1] & P[0] & C0);

endmodule

module summation_unit(S,P,C);  
//ports are wires due to use of dataflow
output wire[3:0]S; //sum vector
input wire [3:0]P, C; //propagate and carry vectors

//logic
assign S[3] = P[3] ^ C[3];
assign S[2] = P[2] ^ C[2];
assign S[1] = P[1] ^ C[1];
assign S[0] = P[0] ^ C[0];

endmodule