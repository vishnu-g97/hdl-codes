`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:36:11 08/10/2018 
// Design Name: 
// Module Name:    seq_det_tb 
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
module vending_mach_tb(
    );
reg [1:0]coin=1'b00;
reg clk=0,rst_n;

wire choco,change;
vending_machine dut(coin,clk,rst_n,choco,change);
always
	begin
     #10 clk=1'b0;
	  #10 clk=1'b1;
   end
	
task reset;
begin
rst_n=1'b0;
#10 rst_n=1'b1;
end
endtask

task data(input [1:0]seq);
begin
@(negedge clk)
coin=seq;
end
endtask

initial
begin
reset();
repeat(3)
data(2'b01);
repeat(3)
data(2'b01);
#20000000;
repeat(3)
data(2'b01); 
#100 $finish ;
end
endmodule
