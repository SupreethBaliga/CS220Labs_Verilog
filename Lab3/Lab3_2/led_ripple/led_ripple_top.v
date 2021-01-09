`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:31:35 01/29/2020
// Design Name:   led_ripple
// Module Name:   /media/cse/735F-494D/CS220/Lab3/Lab3_2/led_ripple/led_ripple_top.v
// Project Name:  led_ripple
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: led_ripple
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module led_ripple_top;

	// Inputs
	reg clk;

	// Outputs
	wire [7:0] led;

	// Instantiate the Unit Under Test (UUT)
	led_ripple uut (
		.clk(clk), 
		.led(led)
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
		#500000000
		$finish;
	end
      
endmodule

