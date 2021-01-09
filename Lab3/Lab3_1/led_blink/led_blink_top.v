`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:56:37 01/29/2020
// Design Name:   led_blink
// Module Name:   /media/cse/735F-494D/CS220/Lab3/Lab3_1/led_blink/led_blink_top.v
// Project Name:  led_blink
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: led_blink
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module led_blink_top;

	// Inputs
	reg clk;

	// Outputs
	wire led0;

	// Instantiate the Unit Under Test (UUT)
	led_blink uut (
		.led0(led0), 
		.clk(clk)
	);

	initial begin
		forever begin
			clk = 0;
			#10
			clk = 1;
			#10
			clk = 0;
		end
	end
      
	initial begin
		#250000000
		$finish;
	end
endmodule

