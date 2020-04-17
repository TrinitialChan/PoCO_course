`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/14 14:10:47
// Design Name: 
// Module Name: conn_ALU_REG
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


module conn_ALU_REG(
    input [31:0] sw, 
    input Write_Reg,
    input [31:0] W_Data_F,//合在一起
    input clk,
    input rst,
    output [31:0] R_Data_A,
    output [31:0] R_Data_B,
    output ZF,
    output OF
    );
    
    myREG myREG_instance(
            .W_Addr(sw[4:0]),
            .Write_Reg(Write_Reg),
            .W_Data(W_Data_F),
            .R_Addr_A(sw[14:10]),
            .R_Addr_B(sw[24:20]),
            .clk(clk),
            .rst(rst),
            .R_Data_A(R_Data_A),
            .R_Data_B(R_Data_B)
            );
            
    myALU myALU_instance(
            .A(R_Data_A),
            .B(R_Data_B),
            .ALU_OP(sw[31:28]),
            .ZF(ZF),
            .OF(OF),
            .F(W_Data_F)
            );
    
    
endmodule
