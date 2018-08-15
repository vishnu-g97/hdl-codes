`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vishnu
// 
// Create Date:    15:42:40 08/15/2018 
// Design Name: 
// Module Name:    blocking_assignment 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

// blocking assignments have to be done carefully. If you are writing sequential blocks it is recommended to use 
module blocking_assignment(
    input clock,
    input d,
	 output op
    );
reg q1,q2,q3;
always@(posedge clock)
  begin
      
    q3=q2;
    q2=q1;
    q1=d;	
  end
  assign op=q3;
endmodule
