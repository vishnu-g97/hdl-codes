`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:36:59 08/10/2018 
// Design Name: 
// Module Name:    vending_machine 
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
module vending_machine(
    input [1:0] coin,
    input clk,
    input rst_n,
    output choco,
    output change,
	 output open
    );
// state encoding : binary
parameter IDLE=3'b000,
			 s1=3'b001,
			 s2=3'b010,
			 s3=3'b011,
			 s4=3'b100,
			 s5=3'b101, // wait for 1 sec in this state
			 s6=3'b110; 
reg [2:0] next_state;
reg [2:0] state;
integer i=0;
// present state logic
always@(posedge clk , negedge rst_n)
	begin
		if(~rst_n)
			state<=IDLE;
		else
		   state<=next_state;
	end
	
// next state logic
always@(coin,state)
	begin
		next_state=IDLE;
	case(state)
		IDLE: if(coin==1) next_state<=s1;
				else
			  	if(coin==2) next_state<=s2;
		s1:  if(coin==1) next_state<=s2;
				else
		     if(coin==2) next_state<=s3;
			  
	   s2:  if(coin==1) next_state<=s3;
				else
		     if(coin==2) next_state<=s4;
	   s3:  wait( i>=50*(10**6))
				next_state<=s5;
		s4:     wait(i>=50*(10**6))
				next_state<=s5;
		s5:   
					next_state<=s6;
		s6: 
		
					next_state<=IDLE;
	endcase
	end
always
  begin
	@(posedge clk)
	 i=i+1;
  end
assign choco=(state==s3) || (state==s4);
assign change=(state==s4);
assign open=(state==s3) || (state==s4);
endmodule
