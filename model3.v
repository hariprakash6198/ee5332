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

module scheduler#(parameter N=4, q=10)
    (
    input [q-1:0] r0,
    input [q-1:0] r1,
    input [q-1:0] r2,
    input [q-1:0] r3,
    output reg [q-1:0] r0_out,
    output reg [q-1:0] r1_out,
    output reg [q-1:0] r2_out,
    output reg [q-1:0] r3_out,
    input clk,
    input rst,
    input en
    );
    
    
    
    always @(posedge clk)
    begin
        if(rst == 0)
        begin
            r0_out <= 10'd0;
            r1_out <= 10'd0;
            r2_out <= 10'd0;
            r3_out <= 10'd0;
            
        end
        else
        begin
            if(en == 1)
            begin
                r0_out <= -r3;
                r1_out <= r0;
                r2_out <= r1;
                r3_out <= r2;
            end
            else
            begin
                r0_out <= -r3_out;
                r1_out <= r0_out;
                r2_out <= r1_out;
                r3_out <= r2_out;
            end
            
        end
    end

endmodule

module adder #(parameter N=4, q=10)
    (
    input [N-1:0] r2,
    input [q-1:0] c_0,
    input [q-1:0] c_1,
    input [q-1:0] c_2,
    input [q-1:0] c_3,
    output [q-1:0] out_0
    );
    
    assign out_0 = ((r2[0])?c_0:0) + ((r2[1])?c_1:0) + ((r2[2])?c_2:0) + ((r2[3])?c_3:0);
     
endmodule


module model3
    #(parameter N=4, q=10)
    (
    input clk,
    input reset_n,
    input [q - 1:0] c1_0_in,
    input [q - 1:0] c1_1_in,
    input [q - 1:0] c1_2_in,
    input [q - 1:0] c1_3_in,
    input [N-1:0] r2_in,
    input [q - 1:0] c2_0_in,
    input [q - 1:0] c2_1_in,
    input [q - 1:0] c2_2_in,
    input [q - 1:0] c2_3_in,
    output reg [q - 1:0] out_0,
    output reg [q - 1:0] out_1,
    output reg [q - 1:0] out_2,
    output reg [q - 1:0] out_3
    
    );
    
    reg [q-1:0] c1_0,c1_1,c1_2,c1_3;
    reg [N-1:0] r2;
    reg [q-1:0] c2_0,c2_1,c2_2,c2_3;
    
    reg [1:0] counter;
    reg init;
    
    wire [q-1:0] r_0,r_1,r_2,r_3,r_0_out,r_1_out,r_2_out,r_3_out;
    wire en;
    wire [q-1:0] c_0,c_1,c_2,c_3,out;
    
    
    
    scheduler k0 (r_0,r_1,r_2,r_3,r_0_out,r_1_out,r_2_out,r_3_out,clk,reset_n,en);
    
    assign r_0 = c1_0;
    assign r_1 = -c1_3;
    assign r_2 = -c1_2;
    assign r_3 = -c1_1;
    assign en = (counter == 0)? 1:0;
    
    
    
    adder k1 (r2,c_0,c_1,c_2,c_3,out);
    assign c_0 = (counter == 0)?c1_0:r_0_out;
    assign c_1 = (counter == 0)?-c1_3:r_1_out;
    assign c_2 = (counter == 0)?-c1_2:r_2_out;
    assign c_3 = (counter == 0)?-c1_1:r_3_out;
    
    
    
    always @(posedge clk)
    begin
    if(reset_n == 1'b0)
        begin
            out_0 <= 10'd0;
            out_1 <= 10'd0;
            out_2 <= 10'd0;
            out_3 <= 10'd0;
            
            init <= 0;
            counter <= 2'd0;
        end
    else
        begin
            
            if(init == 0)
            begin
                c1_0 <= c1_0_in;
                c1_1 <= c1_1_in;
                c1_2 <= c1_2_in;
                c1_3 <= c1_3_in;
                
                c2_0 <= c2_0_in;
                c2_1 <= c2_1_in;
                c2_2 <= c2_2_in;
                c2_3 <= c2_3_in;
                
                r2 <= r2_in;
                init <= 1;
            end
            else
            begin
                counter <= counter + 1;
                
                if(counter == 0)
                    out_0 <= out;                
                else
                if(counter == 1)
                    out_1 <= out;    
                else
                if(counter == 2)
                    out_2 <= out;
                else
                if(counter == 3)
                    out_3 <= out;
                    
                if(counter == 3)
                begin
                    c1_0 <= c1_0_in;
                    c1_1 <= c1_1_in;
                    c1_2 <= c1_2_in;
                    c1_3 <= c1_3_in;
                    
                    c2_0 <= c2_0_in;
                    c2_1 <= c2_1_in;
                    c2_2 <= c2_2_in;
                    c2_3 <= c2_3_in;
                    
                    r2 <= r2_in;
                
                end    
            
            end
            

        end
    end
     
endmodule
