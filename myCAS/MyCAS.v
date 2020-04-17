`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/06 15:10:16
// Design Name: 
// Module Name: MyCAS
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


module MyCAS(
    input P,X,Y,C,
    output Cout,F 
    );
    //wire [1:0] sum;
    
    assign F=X^(Y^P)^C;
    assign Cout=(X+C)*(Y^P)+X*C;
    
    //assign sum=C+X;
    //assign {Cout,F}=2'b00+(P==1?Y:Y)+C+X;
  //assign {Cout,F}=2'b00+(P==1?Y-1:Y)+C+X;
    //assign {Cout,F}=sum+(P==1?Y-1:Y);
    
    /*
    always@*
    begin
    {Cout,F}=2'b00+Y^P+C+X;
    end
    */
endmodule
