`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/14 14:46:42
// Design Name: 
// Module Name: myCOM_ALU_REG
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


module myCOM_ALU_REG(
    input [4:0] W_Addr,
    input [4:0] R_Addr_A,
    input [4:0] R_Addr_B,
    input [3:0] ALU_OP,
    input Write_Reg,
    input [31:0] W_Data,
    input clk,
    input rst,
    input write_F,
    output [31:0] R_Data_A,
    output [31:0] R_Data_B,
    output ZF,
    output OF,
    output [31:0]F
    );
    reg [31:0] W_Data_in;
    
    always@*
    begin
        case (write_F)
            1'b1:W_Data_in<=F;
            1'b0:W_Data_in<=W_Data;
        endcase
    end
    
    myREG myREG_instance(
            .W_Addr(W_Addr),
            .Write_Reg(Write_Reg),
            .W_Data(W_Data_in),
            .R_Addr_A(R_Addr_A),
            .R_Addr_B(R_Addr_B),
            .clk(clk),
            .rst(rst),
            .R_Data_A(R_Data_A),
            .R_Data_B(R_Data_B)
            );
            
    myALU myALU_instance(
            .A(R_Data_A),
            .B(R_Data_B),
            .ALU_OP(ALU_OP),
            .ZF(ZF),
            .OF(OF),
            .F(F)
            );
    
    
endmodule
