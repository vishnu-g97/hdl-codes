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
module seq_det_tb(
    );
reg din,clk,rst_n;
wire op;
seq_det_melay dut(din,clk,rst_n,op);
always
	begin
     #10 clk=1'b0;
	  #10 clk=1'b1;
   end
	
task reset();
begin
@(negedge clk);
rst_n=1'b0;
@(negedge clk);
rst_n=1'b1;
end
endtask

task data(seq);
begin
@(negedge clk)
din=seq;
end
endtask

initial
begin
reset();
data(1);
data(0);
data(1);
data(0);
reset();
data(1);
data(0);
data(1);
#100;
$finish;
end
endmodule
