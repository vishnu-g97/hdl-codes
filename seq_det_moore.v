`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:22:32 08/10/2018 
// Design Name: 
// Module Name:    seq_det 
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
module seq_det(
    input din,
    input clk,
	 input rst_n,
    output op
    );

parameter IDLE=3'b000,
			 s1=3'b001,
			 s10=3'b010,
			 s101=3'b011,
			 s1010=3'b100;
			 
reg [2:0] state;
reg [2:0] next_state;

// present state logic

always@(posedge clk or negedge rst_n)
	begin
		if(rst_n==0)
		 state<=IDLE;
		 else
		 state<=next_state;
	end
	
// next state logic

always@( state, din)
	begin
	next_state<=IDLE;
	case (state)
	
	IDLE: 
	if(din)
		next_state<=s1;
	s1:
	if(din)
		next_state<=s1;
	else
	   next_state<=s10;
	s10:
	if(din)
		next_state<=s101;
	s101:
	if(din)
	   next_state<=s1;
	else
		next_state<=s1010;
	s1010:
	if(din)
		next_state<=s101;
	endcase
	end
	
// oputput logic

assign op=(state==s1010);


endmodule
