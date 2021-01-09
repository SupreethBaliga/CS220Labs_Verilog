`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:58:35 02/12/2020 
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
module led_ripple(clk, rotation_event, rotation_direction, led0, led1, led2, led3, led4, led5, led6, led7
    );
	
	input clk, rotation_event, rotation_direction;
	output led0, led1, led2, led3, led4, led5, led6, led7;
	reg led0 = 0, led1 = 0, led2 = 0, led3 = 0, led4 = 0, led5 = 1, led6 = 0, led7 = 0;
	reg prev_rotation_event = 1'b1;
	
	always @(posedge clk) begin
		if(~prev_rotation_event & rotation_event) begin
			if(~rotation_direction) begin
				led0 <= led1;
				led1 <= led2;
				led2 <= led3;
				led3 <= led4;
				led4 <= led5;
				led5 <= led6;
				led6 <= led7;
				led7 <= led0;
			end
			if(rotation_direction) begin
				led1 <= led0;
				led2 <= led1;
				led3 <= led2;
				led4 <= led3;
				led5 <= led4;
				led6 <= led5;
				led7 <= led6;
				led0 <= led7;
			end
		end
		prev_rotation_event <= rotation_event;
	end
endmodule
