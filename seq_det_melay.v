`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:37:15 08/10/2018 
// Design Name: 
// Module Name:    seq_det_melay.v 
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
module seq_det_melay(
    input din,
    input clk,
    input rst_n,
    output reg op
    );

parameter IDLE=2'b00,
			 s1=2'b01,
			 s10=2'b10,
			 s101=2'b11;
reg [1:0] state;
reg [1:0] next_state;
// present state logic

always@(posedge clk, negedge rst_n)
	begin
		if( rst_n==0)
		state<=IDLE;
		else
		state<=next_state;
	end
	
//next state

always@(state,din)
	begin
		next_state<=IDLE;
		//op<=0;
		
	case(state)
	
		IDLE:
		    if(din)
			 begin
				next_state<=s1;
				//op<=0;
			 end
		s1:
		    if(din)
			 begin
				next_state<=s1;
				//op<=0;
			 end
			 else
			   begin
					next_state<=s10;
				//	op<=0;
				end
		s10:
			if(din)
			 begin
				next_state<=s101;
			  // op<=0;
			 end
			 
	   s101:
		   if(din)
			 begin
				next_state<=s1;
				//op<=0;
			 end
			 else
			 begin
				next_state<=s10;
			//	op<=1;
			 end
	endcase
	end
//output logic
always@(posedge clk, negedge rst_n)
	begin
	   if(rst_n==0)
		op<=1'b0;
	     else
			begin
		     op<=1'b0;
			   case(state)
				  s101:
				  if(~din)
				   op<=1'b1;
				endcase
			end
	end
	
		/*   if( state==s101 && din==0)
			   op<=1'b1; 
	*/
	
endmodule
