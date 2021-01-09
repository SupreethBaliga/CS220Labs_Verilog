`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:08:37 01/29/2020
// Design Name:   four_binary_adder
// Module Name:   /media/cse/735F-494D/CS220/Lab3/Lab3_3/five_four_bit_adders/four_binary_adder_top.v
// Project Name:  five_four_bit_adders
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: four_binary_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module four_binary_adder_top;

	// Inputs
	reg PB1;
	reg PB2;
	reg PB3;
	reg PB4;
	reg PB5;
	reg [3:0] Y;

	// Outputs
	wire [6:0] final;
	reg [3:0] A;
	reg [3:0] B;
	reg [3:0] C;
	reg [3:0] D;
	reg [5:0] E = 6'b0;

	// Instantiate the Unit Under Test (UUT)
	four_binary_adder uut (
		.PB1(PB1), 
		.PB2(PB2), 
		.PB3(PB3), 
		.PB4(PB4), 
		.PB5(PB5), 
		.Y(Y), 
		.final(final)
	);
	
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

	always @(final) begin
		$display("time=%d,%4b+%4b+%4b+%4b+%4b=%7b\n",$time,A,B,C,D,E[3:0],final);
	end

	initial begin
		PB1=0;PB2=0;PB3=0;PB4=0;PB5=0;Y=4'b0000;
		#5
		PB1=1;PB2=0;PB3=0;PB4=0;PB5=0;Y=4'b1000;
		#5
		PB1=0;PB2=1;PB3=0;PB4=0;PB5=0;Y=4'b1001;
		#5
		PB1=0;PB2=0;PB3=1;PB4=0;PB5=0;Y=4'b1011;
		#5
		PB1=0;PB2=0;PB3=0;PB4=1;PB5=0;Y=4'b0101;
		#5
		PB1=0;PB2=0;PB3=0;PB4=0;PB5=1;Y=4'b1101;
		#5
		$finish;
	end
      
endmodule

