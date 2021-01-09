`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:40:02 02/26/2020 
// Design Name: 
// Module Name:    five_bit_adder_subtractor 
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
module five_bit_adder_subtractor(A, B, adsub, out
    );
	 
	 input [3:0]A;
	 input [3:0]B;
	 input adsub;
	 
	 output [4:0] out;
	 wire [4:0] out;
	 wire [4:0] cout;
	 
	 one_bit_adder_subtractor O1(A[0],B[0],adsub,adsub,out[0],cout[0]);
	 one_bit_adder_subtractor O2(A[1],B[1],cout[0],adsub,out[1],cout[1]);
	 one_bit_adder_subtractor O3(A[2],B[2],cout[1],adsub,out[2],cout[2]);
	 one_bit_adder_subtractor O4(A[3],B[3],cout[2],adsub,out[3],cout[3]);
	 one_bit_adder_subtractor O5(0,0,cout[3],adsub,out[4],cout[4]);

endmodule
