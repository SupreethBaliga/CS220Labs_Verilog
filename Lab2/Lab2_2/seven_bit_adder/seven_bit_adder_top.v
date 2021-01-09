`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:41:28 01/22/2020
// Design Name:   seven_bit_adder
// Module Name:   /media/cse/DANE-ELEC/CS220Labs/ASSIGNMENT2/seven_bit_adder/seven_bit_adder_top.v
// Project Name:  seven_bit_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seven_bit_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seven_bit_adder_top;

	// Inputs
	reg PB1;
	reg PB2;
	reg PB3;
	reg PB4;
	reg [3:0] Y;

	// Outputs
	wire [6:0] out;
	wire carry_out;
	reg [6:0] A;
	reg [6:0] B;

	// Instantiate the Unit Under Test (UUT)
	seven_bit_adder uut (
		.PB1(PB1), 
		.PB2(PB2), 
		.PB3(PB3), 
		.PB4(PB4), 
		.Y(Y), 
		.out(out), 
		.carry_out(carry_out)
	);
	
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
	
	always @(out or carry_out) begin
		$display("time = %d, %7b + %7b = %7b, carry = %b\n", $time, A, B, out, carry_out);
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

