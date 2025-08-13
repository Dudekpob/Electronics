`timescale 1ns/1ps

module counter_4bit (
	input wire clk,
	input wire reset,
	output reg[3:0] count
);

always @(posedge clk or posedge reset) begin
	if(reset)
	count <= 4'b0000;
	else
	count <= count+1;
end

endmodule

module counter_4bit_tb;

reg clk;
reg reset;
wire [3:0] count;

counter_4bit uut (
	.clk(clk),
	.reset(reset),
	.count(count)
);

initial clk = 0;
always #5 clk = ~clk;

initial begin
	reset =1;
	#20 reset =0;
	#200;
end

endmodule
