`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:57:33 01/22/2020 
// Design Name: 
// Module Name:    one_bit_comparator 
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
module one_bit_comparator(a, b, lprev, eprev, gprev, l, e, g
    );

	input a, b, lprev, eprev, gprev;
	output l, e, g;
	wire l, e, g;
	
	assign l = lprev | (eprev & ~a & b);
	assign g = gprev | (eprev & a & ~b);
	assign e = eprev & (~(a^b));

endmodule
