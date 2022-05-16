`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2022 13:43:51
// Design Name: 
// Module Name: model1
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


module model1
    #(parameter N=4, q=10)
    (
    input clk,
    input reset_n,
    input [N*q - 1:0] c1,
    input [N-1:0] r2,
    input [N*q - 1:0] c2,
    output reg [N*q - 1:0] out
    );
    
    reg [q-1:0] c1_1,c1_2,c1_3,c1_4;
    reg [N-1:0] r2_1;
    reg [q-1:0] c2_1,c2_2,c2_3,c2_4;
    
    always @(posedge clk)
    begin
    if(reset_n == 1'b0)
        begin
            out <= 40'd0;
        end
    else
        begin
            c1_1 <= c1[  q - 1:0*q];
            c1_2 <= c1[2*q - 1:1*q];
            c1_3 <= c1[3*q - 1:2*q];
            c1_4 <= c1[4*q - 1:3*q];
            
            c2_1 <= c2[  q - 1:0*q];
            c2_2 <= c2[2*q - 1:1*q];
            c2_3 <= c2[3*q - 1:2*q];
            c2_4 <= c2[4*q - 1:3*q];
            
            r2_1 <= r2;
            
            out[4*q - 1:3*q] <= ((r2_1[0])?c1_4:0) + ((r2_1[1])?c1_3:0) + ((r2_1[2])?c1_2:0) + ((r2_1[3])?c1_1:0) + c2_4 ;
            out[3*q - 1:2*q] <= ((r2_1[0])?c1_3:0) + ((r2_1[1])?c1_2:0) + ((r2_1[2])?c1_1:0) - ((r2_1[3])?c1_4:0) + c2_3 ;
            out[2*q - 1:1*q] <= ((r2_1[0])?c1_2:0) + ((r2_1[1])?c1_1:0) - ((r2_1[2])?c1_4:0) - ((r2_1[3])?c1_3:0) + c2_2 ;  
            out[  q - 1:0*q] <= ((r2_1[0])?c1_1:0) - ((r2_1[1])?c1_4:0) - ((r2_1[2])?c1_3:0) - ((r2_1[3])?c1_2:0) + c2_1 ;
        end
    end
     
endmodule
