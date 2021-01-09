`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:40:52 01/22/2020 
// Design Name: 
// Module Name:    seven_bit_adder 
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
module seven_bit_adder(PB1, PB2, PB3, PB4, Y, out, carry_out
    );
	
	input PB1, PB2, PB3, PB4;
	input [3:0]Y;
	output [6:0] out;
	output carry_out;
	reg [6:0] A;
	reg [6:0] B;
	wire carry_out;
	wire [6:0] out;
	wire [5:0] carry;
	
	always @(posedge PB1) begin
		A[3:0] <= Y;
	end
	always @(posedge PB2) begin
		A[6:4] <= Y[2:0];
	end
	always @(posedge PB3) begin
		B[3:0] <= Y;
	end
	always @(posedge PB4) begin
		B[6:4] <= Y[2:0];
	end
	
	full_adder FA0(A[0], B[0], 1'b0, out[0], carry[0]);
	full_adder FA1(A[1], B[1], carry[0], out[1], carry[1]);
	full_adder FA2(A[2], B[2], carry[1], out[2], carry[2]);
	full_adder FA3(A[3], B[3], carry[2], out[3], carry[3]);
	full_adder FA4(A[4], B[4], carry[3], out[4], carry[4]);
	full_adder FA5(A[5], B[5], carry[4], out[5], carry[5]);
	full_adder FA6(A[6], B[6], carry[5], out[6], carry_out);

endmodule
