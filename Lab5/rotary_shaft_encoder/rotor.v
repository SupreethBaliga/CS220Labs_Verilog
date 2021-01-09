`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:54:17 02/12/2020 
// Design Name: 
// Module Name:    rotor 
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
module rotor( clk, ROT_A, ROT_B, rotation_event, rotation_direction
    );

	input clk, ROT_A, ROT_B;
	output rotation_event, rotation_direction;
	reg rotation_event, rotation_direction;
	
	always @(posedge clk) begin
		if(ROT_A & ROT_B) begin
			rotation_event <= 1;
		end
		if(~ROT_A & ~ROT_B) begin
			rotation_event <= 0;
		end
		if(~ROT_A & ROT_B) begin
			rotation_direction <= 1;
		end
		if(ROT_A & ~ROT_B) begin
			rotation_direction <= 0;
		end
	end

endmodule
