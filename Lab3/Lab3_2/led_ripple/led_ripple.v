`timescale 1ns / 1ps
`define SHIFT_TIME 50000000
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:26:02 01/29/2020 
// Design Name: 
// Module Name:    led_ripple 
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
module led_ripple(clk,led
    );
	 
	 input clk;
	 output [7:0] led;
	 reg [7:0] led = 8'b00000001;
	 reg [31:0] counter = 32'b0;
	 always @(posedge clk) begin
		counter <= counter+1;
		if(counter==`SHIFT_TIME) begin
			led[1] <= led[0];
			led[2] <= led[1];
			led[3] <= led[2];
			led[4] <= led[3];
			led[5] <= led[4];
			led[6] <= led[5];
			led[7] <= led[6];
			led[0] <= led[7];
			counter <= 32'b0;
		end
	end
	 

endmodule
