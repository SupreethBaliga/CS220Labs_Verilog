`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:53 01/29/2020 
// Design Name: 
// Module Name:    five_bit_adder 
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
module five_bit_adder(x,y,z);

	input [4:0] x;
	input [4:0] y;
	output [5:0] z;
	wire [5:0] z;
	wire [3:0] c;
	full_adder FA0(x[0], y[0], 1'b0, z[0], c[0]);
	full_adder FA1(x[1], y[1], c[0], z[1], c[1]);
	full_adder FA2(x[2], y[2], c[1], z[2], c[2]);
	full_adder FA3(x[3], y[3], c[2], z[3], c[3]);
	full_adder FA4(x[4], y[4], c[3], z[4], z[5]);

endmodule
