`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:09:57 01/22/2020
// Design Name:   eight_bit_comparator
// Module Name:   /media/cse/DANE-ELEC/CS220Labs/Lab2_3/eight_bit_comparator/eight_bit_comparator_top.v
// Project Name:  eight_bit_comparator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: eight_bit_comparator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module eight_bit_comparator_top;

	// Inputs
	reg PB1;
	reg PB2;
	reg PB3;
	reg PB4;
	reg [3:0] Y;
	reg [7:0] A;
	reg [7:0] B;

	// Outputs
	wire le;
	wire eq;
	wire gr;

	// Instantiate the Unit Under Test (UUT)
	eight_bit_comparator uut (
		.PB1(PB1), 
		.PB2(PB2), 
		.PB3(PB3), 
		.PB4(PB4), 
		.Y(Y), 
		.le(le), 
		.eq(eq), 
		.gr(gr)
	);
	
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
	
	always @(le or eq or gr) begin
		$display("time = %d, %8b, %8b : le = %b, eq = %b, gr = %b \n", $time, A, B, le, eq, gr);
	end
	
	initial begin
			PB1 = 0; PB2 = 0; PB3 = 0; PB4 = 0; Y = 4'b0000;
			#5
			PB1 = 1; PB2 = 0; PB3 = 0; PB4 = 0; Y = 4'b1010;
			#5
			PB1 = 0; PB2 = 1; PB3 = 0; PB4 = 0; Y = 4'b0101;
			#5
			PB1 = 0; PB2 = 0; PB3 = 1; PB4 = 0; Y = 4'b0001;
			#5
			PB1 = 0; PB2 = 0; PB3 = 0; PB4 = 1; Y = 4'b0111;
			#5
			PB1 = 0; PB2 = 0; PB3 = 0; PB4 = 0; Y = 4'b0000;
			#5
			PB1 = 1; PB2 = 0; PB3 = 0; PB4 = 0; Y = 4'b0110;
			#5
			PB1 = 0; PB2 = 1; PB3 = 0; PB4 = 0; Y = 4'b0110;
			#5
			PB1 = 0; PB2 = 0; PB3 = 1; PB4 = 0; Y = 4'b1111;
			#5
			PB1 = 0; PB2 = 0; PB3 = 0; PB4 = 1; Y = 4'b0111;
			#5
			$finish;
	end
      
endmodule

