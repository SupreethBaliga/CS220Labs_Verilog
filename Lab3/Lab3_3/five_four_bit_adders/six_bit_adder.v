`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:59 01/29/2020 
// Design Name: 
// Module Name:    six_bit_adder 
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
module six_bit_adder(x,y,z);

	input [5:0] x;
	input [5:0] y;
	output [6:0] z;
	wire [6:0] z;
	wire [4:0] c;
	full_adder FA0(x[0], y[0], 1'b0, z[0], c[0]);
	full_adder FA1(x[1], y[1], c[0], z[1], c[1]);
	full_adder FA2(x[2], y[2], c[1], z[2], c[2]);
	full_adder FA3(x[3], y[3], c[2], z[3], c[3]);
	full_adder FA4(x[4], y[4], c[3], z[4], c[4]);
	full_adder FA5(x[5], y[5], c[4], z[5], z[6]);
endmodule
