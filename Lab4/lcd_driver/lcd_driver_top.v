`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:35 02/05/2020 
// Design Name: 
// Module Name:    lcd_driver_top 
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
module lcd_driver_top(clk, lcd_rs, lcd_w, lcd_e, data
    );
	 
	 input clk;
	 output lcd_rs, lcd_w, lcd_e;
	 output [3:0] data;
	 wire lcd_rs, lcd_w, lcd_e;
	 wire [3:0] data;
	 
	 lcd_driver LD0("WELCOME TO CSE, ", "IIT KANPUR      ", clk, lcd_rs, lcd_w, lcd_e, data);


endmodule
