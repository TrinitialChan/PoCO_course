`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/06 15:38:33
// Design Name: 
// Module Name: MyCAS_grid
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


module MyCAS_grid(
    input [9:0] X,
    input [4:0] Y,
    output reg [5:0] Q,
    output reg [4:0] R
    );
    wire [10:0]X_;
    wire [5:0]Y_;
    wire [4:0] L1,L2,L3,L4,L5,L6;
    wire [4:0] LR;//最终余数
    
    wire q0,q1,q2,q3,q4,q5,q6;
    assign X_={1'b0,X};//格式化补0
    assign Y_={1'b0,Y};
       
    MyCAS_line line0(
        .X(X_[10:5]),
        .Y(Y_),
        .P(1),
        .Q(q0),
        .Xout(L1)
        );
    MyCAS_line line1({L1,X_[4]},Y_,q0,q1,L2);
    MyCAS_line line2({L2,X_[3]},Y_,q1,q2,L3);
    MyCAS_line line3({L3,X_[2]},Y_,q2,q3,L4);
    MyCAS_line line4({L4,X_[1]},Y_,q3,q4,L5);
    MyCAS_line line5({L5,X_[0]},Y_,q4,q5,L6);
    
    
    //恢复余数
    MyCAS_line lineR(
            .X({1'b0,L6}),
            .Y(Y_),
            .P(0),
            //.Q(q0),
            .Xout(LR)
            );
    
    always@*
    begin
    R=q5==0?LR:L6;//选择输出
    Q={q0,q1,q2,q3,q4,q5};
    end
   

    
    
    
endmodule
