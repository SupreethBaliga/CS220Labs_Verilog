`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:09:37 01/22/2020 
// Design Name: 
// Module Name:    full_adder 
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
module full_adder(a, b, cin, sum, cout
    );
	 
	 input a,b, cin;
	 output sum,cout;
	 wire sum, cout;
	 
	 assign sum = a^b^cin;
	 assign cout = (a&b) | (b&cin)|(cin&a);


endmodule
