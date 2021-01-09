`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:59:08 01/29/2020 
// Design Name: 
// Module Name:    four_binary_adder 
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
module four_binary_adder( PB1,PB2,PB3,PB4,PB5,Y,final);
	input PB1,PB2,PB3,PB4,PB5;
	input [3:0] Y;
	output [6:0] final;
	wire [6:0] final;
	reg [3:0] A;
	reg [3:0] B;
	reg [3:0] C;
	reg [3:0] D;
	reg [5:0] E = 6'b0;
	wire [4:0] temp1;
	wire [4:0] temp2;
	wire [5:0] temp3;
	
	always @(posedge PB1) begin
		A <= Y;
	end
	always @(posedge PB2) begin
		B <= Y;
	end
	always @(posedge PB3) begin
		C <= Y;
	end
	always @(posedge PB4) begin
		D <= Y;
	end
	always @(posedge PB5) begin
		E[3:0] <= Y;
	end
	
	four_bit_adder F1(A,B,temp1);
	four_bit_adder F2(C,D,temp2);
	five_bit_adder F3(temp1,temp2,temp3);
	six_bit_adder F4(temp3,E,final);

endmodule
