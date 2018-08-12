`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:22:12 08/12/2018 
// Design Name: 
// Module Name:    updown_cntr_tb 
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
module updown_cntr_tb(
    );
reg en=1,clk=0,rst;
wire [3:0] count;
updown_cntr dut (clk,rst,en,count);
always
  begin
  #10 clk=1;
  #10 clk=0;
  end

task reset();
  begin 
   @(negedge clk)
	rst<=1;
	@(negedge clk)
	rst<=0;
  end
 endtask

  
task enable(input a);
  begin
  @(negedge clk)
  en<=a;
  end
endtask

initial
  begin
   reset();
	repeat(20) 
	enable(1);
	
  repeat(28)
	enable(0);
   #20 $finish;
	
  end
 

endmodule
