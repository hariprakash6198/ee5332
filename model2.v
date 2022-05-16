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

module model2
    #(parameter N=8, q=10)
    (
    input clk,
    input reset_n,
    input [N*q - 1:0] c1,
    input [N-1:0] r2,
    input [N*q - 1:0] c2,
    output reg [N*q - 1:0] out,
    input [3:0] a
    );
    
    reg read_clk,write_clk;
    
    
    wire [3:0] b;
    reg [q-1:0] c1_1,c1_2,c1_3,c1_4,c1_5,c1_6,c1_7,c1_8;
    reg [N-1:0] r2_1;
    reg [q-1:0] c2_1,c2_2,c2_3,c2_4,c2_5,c2_6,c2_7,c2_8;
    
    reg [q-1:0] stage1_1_1,stage1_1_2,stage1_1_3,stage1_1_4;
    reg [q-1:0] stage1_2_1,stage1_2_2,stage1_2_3,stage1_2_4;
    reg [q-1:0] stage1_3_1,stage1_3_2,stage1_3_3,stage1_3_4;
    reg [q-1:0] stage1_4_1,stage1_4_2,stage1_4_3,stage1_4_4;
    reg [q-1:0] stage1_5_1,stage1_5_2,stage1_5_3,stage1_5_4;
    reg [q-1:0] stage1_6_1,stage1_6_2,stage1_6_3,stage1_6_4;
    reg [q-1:0] stage1_7_1,stage1_7_2,stage1_7_3,stage1_7_4;
    reg [q-1:0] stage1_8_1,stage1_8_2,stage1_8_3,stage1_8_4;
    
    reg [q-1:0] stage2_1_1,stage2_1_2;
    reg [q-1:0] stage2_2_1,stage2_2_2;
    reg [q-1:0] stage2_3_1,stage2_3_2;
    reg [q-1:0] stage2_4_1,stage2_4_2;
    reg [q-1:0] stage2_5_1,stage2_5_2;
    reg [q-1:0] stage2_6_1,stage2_6_2;
    reg [q-1:0] stage2_7_1,stage2_7_2;
    reg [q-1:0] stage2_8_1,stage2_8_2;
    
    reg [q-1:0] stage3_1;
    reg [q-1:0] stage3_2;
    reg [q-1:0] stage3_3;
    reg [q-1:0] stage3_4;
    reg [q-1:0] stage3_5;
    reg [q-1:0] stage3_6;
    reg [q-1:0] stage3_7;
    reg [q-1:0] stage3_8;
    
    assign b = -a;
    
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
            c1_5 <= c1[5*q - 1:4*q];
            c1_6 <= c1[6*q - 1:5*q];
            c1_7 <= c1[7*q - 1:6*q];
            c1_8 <= c1[8*q - 1:7*q];
            
            c2_1 <= c2[  q - 1:0*q];
            c2_2 <= c2[2*q - 1:1*q];
            c2_3 <= c2[3*q - 1:2*q];
            c2_4 <= c2[4*q - 1:3*q];
            c2_5 <= c2[5*q - 1:4*q];
            c2_6 <= c2[6*q - 1:5*q];
            c2_7 <= c2[7*q - 1:6*q];
            c2_8 <= c2[8*q - 1:7*q];
            
            r2_1 <= r2;
            
            stage1_1_4 <= ((r2_1[0])?c1_8:0) + ((r2_1[1])?c1_7:0);
            stage1_1_3 <= ((r2_1[2])?c1_6:0) + ((r2_1[3])?c1_5:0);
            stage1_1_2 <= ((r2_1[4])?c1_4:0) + ((r2_1[5])?c1_3:0);
            stage1_1_1 <= ((r2_1[6])?c1_2:0) + ((r2_1[7])?c1_1:0);
            
            stage1_2_4 <= ((r2_1[0])?c1_7:0) + ((r2_1[1])?c1_6:0);
            stage1_2_3 <= ((r2_1[2])?c1_5:0) + ((r2_1[3])?c1_4:0);
            stage1_2_2 <= ((r2_1[4])?c1_3:0) + ((r2_1[5])?c1_2:0);
            stage1_2_1 <= ((r2_1[6])?c1_1:0) - ((r2_1[7])?c1_8:0);
            
            stage1_3_4 <= ((r2_1[0])?c1_6:0) + ((r2_1[1])?c1_5:0);
            stage1_3_3 <= ((r2_1[2])?c1_4:0) + ((r2_1[3])?c1_3:0);
            stage1_3_2 <= ((r2_1[4])?c1_2:0) + ((r2_1[5])?c1_1:0);
            stage1_3_1 <= ((r2_1[6])?c1_8:0) + ((r2_1[7])?c1_7:0);
            
            stage1_4_4 <= ((r2_1[0])?c1_5:0) + ((r2_1[1])?c1_4:0);
            stage1_4_3 <= ((r2_1[2])?c1_3:0) + ((r2_1[3])?c1_2:0);
            stage1_4_2 <= ((r2_1[4])?c1_1:0) - ((r2_1[5])?c1_8:0);
            stage1_4_1 <= ((r2_1[6])?c1_7:0) + ((r2_1[7])?c1_6:0);
            
            stage1_5_4 <= ((r2_1[0])?c1_4:0) + ((r2_1[1])?c1_3:0);
            stage1_5_3 <= ((r2_1[2])?c1_2:0) + ((r2_1[3])?c1_1:0);
            stage1_5_2 <= ((r2_1[4])?c1_8:0) + ((r2_1[5])?c1_7:0);
            stage1_5_1 <= ((r2_1[6])?c1_6:0) + ((r2_1[7])?c1_5:0);
            
            stage1_6_4 <= ((r2_1[0])?c1_3:0) + ((r2_1[1])?c1_2:0);
            stage1_6_3 <= ((r2_1[2])?c1_1:0) - ((r2_1[3])?c1_8:0);
            stage1_6_2 <= ((r2_1[4])?c1_7:0) + ((r2_1[5])?c1_6:0);
            stage1_6_1 <= ((r2_1[6])?c1_5:0) + ((r2_1[7])?c1_4:0);
            
            stage1_7_4 <= ((r2_1[0])?c1_2:0) + ((r2_1[1])?c1_1:0);
            stage1_7_3 <= ((r2_1[2])?c1_8:0) + ((r2_1[3])?c1_3:0);
            stage1_7_2 <= ((r2_1[4])?c1_6:0) + ((r2_1[5])?c1_5:0);
            stage1_7_1 <= ((r2_1[6])?c1_4:0) + ((r2_1[7])?c1_7:0);
            
            stage1_8_4 <= ((r2_1[0])?c1_1:0) - ((r2_1[1])?c1_8:0);
            stage1_8_3 <= ((r2_1[2])?c1_7:0) + ((r2_1[3])?c1_6:0);
            stage1_8_2 <= ((r2_1[4])?c1_5:0) + ((r2_1[5])?c1_4:0);
            stage1_8_1 <= ((r2_1[6])?c1_3:0) + ((r2_1[7])?c1_2:0);
            
            stage2_1_2 <= stage1_1_4 + stage1_1_3;
            stage2_1_1 <= stage1_1_2 + stage1_1_1;
            
            stage2_2_2 <= stage1_2_4 + stage1_2_3;
            stage2_2_1 <= stage1_2_2 + stage1_2_1;
            
            stage2_3_2 <= stage1_3_4 + stage1_3_3;
            stage2_3_1 <= stage1_3_2 - stage1_3_1;
            
            stage2_4_2 <= stage1_4_4 + stage1_4_3;
            stage2_4_1 <= stage1_4_2 - stage1_4_1;
            
            stage2_5_2 <= stage1_5_4 + stage1_5_3;
            stage2_5_1 <= stage1_5_2 + stage1_5_1;
            
            stage2_6_2 <= stage1_6_4 + stage1_6_3;
            stage2_6_1 <= stage1_6_2 + stage1_6_1;
            
            stage2_7_2 <= stage1_7_4 - stage1_7_3;
            stage2_7_1 <= stage1_7_2 + stage1_7_1;
            
            stage2_8_2 <= stage1_8_4 - stage1_8_3;
            stage2_8_1 <= stage1_8_2 + stage1_8_1;
            
            stage3_1 <= stage2_1_2 + stage2_1_1;
            stage3_2 <= stage2_2_2 + stage2_2_1;
            stage3_3 <= stage2_3_2 + stage2_3_1;
            stage3_4 <= stage2_4_2 + stage2_4_1;   
            stage3_5 <= stage2_5_2 - stage2_5_1;
            stage3_6 <= stage2_6_2 - stage2_6_1;
            stage3_7 <= stage2_7_2 - stage2_7_1;
            stage3_8 <= stage2_8_2 - stage2_8_1;
            
            out[8*q - 1:7*q] <=  stage3_1 + c2_8 ;
            out[7*q - 1:6*q] <=  stage3_2 + c2_7 ;
            out[6*q - 1:5*q] <=  stage3_3 + c2_6 ;  
            out[5*q - 1:4*q] <=  stage3_4 + c2_5 ; 
            out[4*q - 1:3*q] <=  stage3_5 + c2_4 ;
            out[3*q - 1:2*q] <=  stage3_6 + c2_3 ;
            out[2*q - 1:1*q] <=  stage3_7 + c2_2 ;  
            out[  q - 1:0*q] <=  stage3_8 + c2_1 ;        
            
        end
    end
     
endmodule
