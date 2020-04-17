`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/06 15:10:59
// Design Name: 
// Module Name: MyCAS_line
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

module MyCAS_line(
    input [5:0]X,
    input [5:0]Y,
    input P,
    output Q,
    output [4:0]Xout,
    output reg [4:0]Cout
    );
    //wire p1,p2,p3,p4,p5;
    wire c0,c1,c2,c3,c4;

    
    MyCAS cas0(.P(P),.X(X[5]),.Y(Y[5]),.C(c0),.Cout(Q));
    MyCAS cas1(P,X[4],Y[4],c1,c0,Xout[4]);
    MyCAS cas2(P,X[3],Y[3],c2,c1,Xout[3]);
    MyCAS cas3(P,X[2],Y[2],c3,c2,Xout[2]);
    MyCAS cas4(P,X[1],Y[1],c4,c3,Xout[1]);
    MyCAS cas5(P,X[0],Y[0],P,c4,Xout[0]);
    
    always@*
    begin
    Cout={c0,c1,c2,c3,c4};
    end
    
    
endmodule
