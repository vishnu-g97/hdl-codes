`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:13:06 08/12/2018 
// Design Name: 
// Module Name:    updown_cntr 
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
module updown_cntr(
    input clk,
    input rst,
	 input en,
	 output [3:0]count
    );
reg [3:0] q;
// if enable is high counter is up or else down

always@(posedge clk)
begin
	 if(rst)
	  begin
	    if(en)
		 q=0;
	    else
	    if(~en )
	    q=12;
	  end
else	
  begin
	    if(en==1)
	     begin
			 q<=q+1'b1;
			 if(q==12)
			 q<=0;
		  end
		 if(en==0)
			begin
			 q<=q-1'b1;
			 if(q==0)
			 q<=12; 
			end
  end
end
assign count=q;
endmodule
