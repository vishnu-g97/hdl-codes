`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:43:04 08/13/2018 
// Design Name: 
// Module Name:    vending_mach_melay 
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
module vending_mach_melay(
    input clk,
    input rst_n,
    input [1:0]coin,
    output reg choco,
    output reg change
    );

reg [1:0] state,next_state;
// present state logic
parameter IDLE=2'b00,
          s1=2'b01,
			 s2=2'b10;
always@(posedge clk, negedge rst_n)
  begin
    if(~rst_n)
	  state<=IDLE;
    else
	  state<=next_state;
  end
// next state logic
always@(state,coin)
   begin
	  next_state=IDLE; 
	 case(state)
	      IDLE:  
		     begin
		      if(coin==2'b01)
		        next_state=s1;
				else
		      if(coin==2'b10)
		        next_state=s2;
		     end
		   s1:
			  begin
		       if(coin==2'b01)
				   next_state=s2;
				else
				 if(coin==2'b10)
				   next_state=IDLE;
				end
			s2: 
			  begin
			    if(coin==2'b01)
				   next_state=IDLE;
				else
				 if(coin==2'b10)
				   next_state=IDLE;
				end
		endcase
	end
//output logic

always@(posedge clk, negedge rst_n)
  begin
    if(~rst_n)
	   begin
		  choco<=1'b0;
		  change<=1'b0;
		end
     else
	    begin
		  choco<=1'b0;
		  change<=1'b0;
				case(state)
					s1: begin
					    if(coin==2'b10)
							begin
							choco<=1'b1;
							change<=1'b0;
							end
						else
						if(coin==2'b01)
							begin
							choco<=1'b0;
							change<=1'b0;
							end
						 end
					s2:  begin
					     if(coin==1)
							begin
							choco<=1'b1;
							change<=1'b0;
							end
							else
					   	if(coin==2)
							begin
							choco<=1'b1;
							change<=1'b1;
							end
						 end
				endcase
		end
		end
		
		
endmodule
