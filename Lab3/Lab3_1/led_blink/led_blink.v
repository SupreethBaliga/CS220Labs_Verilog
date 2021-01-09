`timescale 1ns / 1ps
`define OFF_TIME 25000000
`define ON_TIME (`OFF_TIME*2)
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:51:59 01/29/2020 
// Design Name: 
// Module Name:    led_blink 
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
module led_blink(led0, clk);
input clk;
output led0;
reg led0;
reg [31:0] counter = 32'b0;
always @(posedge clk) begin
	counter <= counter+1;
	if(counter==`OFF_TIME) begin
		led0 <= 1'b0;
	end
	else if(counter==`ON_TIME) begin
		led0 <= 1'b1;
		counter <= 32'b0;
	end
end


endmodule
