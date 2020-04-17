`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/04 11:02:06
// Design Name: 
// Module Name: myALU
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



module myALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALU_OP,
    output  ZF,
    output reg OF,
    output reg [31:0] F
    );

    reg [31:0] reg_and;//与
    reg [31:0] reg_or;//或
    reg [31:0] reg_xor;//异或
    reg [31:0] reg_nor;//或非
    reg [31:0] reg_add;
    reg [31:0] reg_sub;
    reg [31:0] reg_slt;//若 A＜B，则输出 1，否则输出 0
    reg [31:0] reg_sll;//B 逻辑左移 A 所指定的位数
    reg [31:0] reg_add1; //A++
    reg C32_add;
    reg C32_sub;
    
    
    always@* begin
    reg_and<=A&B;
    reg_or<=A|B;
    reg_xor<=A^B;
    reg_nor<=~(A|B);
    {C32_add,reg_add}<=33'b0+A+B;
    {C32_sub,reg_sub}<=33'b0+A-B;
    reg_slt<=A<B?1:0;
    reg_sll<=B<<A;
    reg_add1<=A+1;
    end
    
    
    always@* begin
    case (ALU_OP)
        4'b0000:begin F<=reg_and; OF<=0; end
        4'b0001:begin F<=reg_or; OF<=0; end
        4'b0010:begin F<=reg_xor; OF<=0; end
        4'b0011:begin F<=reg_nor; OF<=0;  end
        4'b0100:begin F<=reg_add; OF<=A[31]^B[31]^F[31]^C32_add; end
        4'b0101:begin F<=reg_sub; OF<=A[31]^B[31]^F[31]^C32_sub; end
        4'b0110:begin F<=reg_slt; OF<=0; end
        4'b0111:begin F<=reg_sll; OF<=0; end
        4'b1000:begin F<=reg_add1; OF<=0; end
        default:;
    endcase
    end
    
    assign ZF=F==0?1:0;
    
endmodule
