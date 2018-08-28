// how to reverse a bus in verilog
// it can not be done using wires in for loop to do it because it will continously create and destroy the hardware
// use registers in combinational always block ,, declare the buses as registers ,, use a for loop ,,
// find the code below


module top_module (
	input [99:0] in,
	output reg [99:0] out
);
	
	always @(*) begin
		for (int i=0;i<$bits(out);i=i+1)		// $bits() is a system function that returns the width of a signal.
			out[i] = in[$bits(out)-i-1];	// $bits(out) is 100 because out is 100 bits wide.
	end
	
endmodule
