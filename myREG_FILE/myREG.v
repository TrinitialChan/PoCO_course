`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/10 21:33:00
// Design Name: 
// Module Name: myREG
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


module myREG(
    input [4:0] W_Addr,
    input Write_Reg,
    input [31:0] W_Data,
    input [4:0] R_Addr_A,
    input [4:0] R_Addr_B,
    input clk,
    input rst,
    output [31:0] R_Data_A,
    output [31:0] R_Data_B
    );
    reg [31:0] REG_Files[0:31];
    
    assign R_Data_A=REG_Files[R_Addr_A];
    assign R_Data_B=REG_Files[R_Addr_B];
    integer i;
    
    always@(posedge clk or negedge rst)
    begin
        if(!rst) 
            begin 
            for(i=0;i<=31;i=i+1)      REG_Files[i]<=32'b0; 
            end
        else
        begin
            if(Write_Reg&W_Addr!=0) REG_Files[W_Addr]<=W_Data;
        end
    end
    
endmodule
