`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/06 18:23:02
// Design Name: 
// Module Name: top_MyCAS
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


module top_MyCAS(
    input [9:0] X,
    input [4:0] Y,
    input X_sign,
    input Y_sign,
    output [4:0] Q,
    output [4:0] R,
    output Q_sign,
    output R_sign
    );
    wire [5:0]fullQ;//处理q0的0
    //符号运算
    assign Q_sign=X_sign^Y_sign;
    assign R_sign=X_sign;
    assign Q=fullQ[4:0];
    
    MyCAS_grid casGridInstance(
        .X(X),
        .Y(Y),
        .Q(fullQ),
        .R(R)
        );
    
    
    
endmodule
