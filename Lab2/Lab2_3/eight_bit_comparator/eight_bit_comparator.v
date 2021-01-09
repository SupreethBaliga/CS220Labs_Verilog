`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:13 01/22/2020 
// Design Name: 
// Module Name:    eight_bit_comparator 
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
module eight_bit_comparator(PB1, PB2, PB3, PB4, Y, le, eq, gr
    );

	input PB1, PB2, PB3, PB4;
	input [3:0]Y;
	output le, eq, gr;
	wire le, eq, gr;
	reg [7:0]A;
	reg [7:0]B;
	wire [6:0] l;
	wire [6:0] g;
	wire [6:0] e;
	
	always @(posedge PB1) begin
		A[3:0] <= Y;
	end
	always @(posedge PB2) begin
		A[7:4] <= Y;
	end
	always @(posedge PB3) begin
		B[3:0] <= Y;
	end
	always @(posedge PB4) begin
		B[7:4] <= Y;
	end
	
	one_bit_comparator C0(A[7], B[7], 1'b0, 1'b1, 1'b0, l[6], e[6], g[6]);
	one_bit_comparator C1(A[6], B[6], l[6], e[6], g[6], l[5], e[5], g[5]);
	one_bit_comparator C2(A[5], B[5], l[5], e[5], g[5], l[4], e[4], g[4]);
	one_bit_comparator C3(A[4], B[4], l[4], e[4], g[4], l[3], e[3], g[3]);
	one_bit_comparator C4(A[3], B[3], l[3], e[3], g[3], l[2], e[2], g[2]);
	one_bit_comparator C5(A[2], B[2], l[2], e[2], g[2], l[1], e[1], g[1]);
	one_bit_comparator C6(A[1], B[1], l[1], e[1], g[1], l[0], e[0], g[0]);
	one_bit_comparator C7(A[0], B[0], l[0], e[0], g[0], le, eq, gr);

endmodule
