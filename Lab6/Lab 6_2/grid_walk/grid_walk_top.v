`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:09:08 02/26/2020 
// Design Name: 
// Module Name:    grid_walk_top 
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
module grid_walk_top(clk, ROT_A, ROT_B, y, led
    );

	input clk, ROT_A, ROT_B;
	input [3:0] y;
	
	output [7:0] led;
	wire rotation_event, rotation_direction;
	wire [7:0] led;
	
	rotor R(clk, ROT_A, ROT_B, rotation_event, rotation_direction);
	grid G(y, clk, rotation_event, rotation_direction, led);

endmodule
