`timescale 1ns / 1ps
`define MAX_COUNTER 1000000
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:50:24 02/05/2020 
// Design Name: 
// Module Name:    lcd_driver 
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
module lcd_driver(line1, line2, clk, lcd_rs, lcd_w, lcd_e, data);
		input [127:0]line1;
		input [127:0]line2;
		input clk;
		//reg [127:0] line1;
		//reg [127:0] line2;
		
		output lcd_rs, lcd_w, lcd_e;
		output [3:0]data;
		reg lcd_rs, lcd_w, lcd_e;
		reg [3:0]data;
		reg [7:0] db;
		
		reg [19:0]counter = 20'b0;
		reg [5:0] state = 6'b0;
		reg [2:0] s1 = 3'b0;
		reg [6:0] idx = 7'b1111111;
		
		always @(posedge clk) begin
			if(counter == `MAX_COUNTER) begin
				case(state)
					6'b000000: begin
									lcd_e <= 0;
									state <= state + 1;
								end
					6'b000001: begin
									lcd_rs <= 0;
									lcd_w <= 0;
									data <= 4'b0011;
									state <= state + 1;
								end
					6'b000010: begin
									lcd_e <= 1;
									state <= state + 1;
								end
					6'b000011: begin
									lcd_e <= 0;
									state <= state + 1;
								end
					6'b000100: begin
									lcd_rs <= 0;
									lcd_w <= 0;
									data <= 4'b0011;
									state <= state + 1;
								end
					6'b000101: begin
									lcd_e <= 1;
									state <= state + 1;
								end
					6'b000110: begin
									lcd_e <= 0;
									state <= state + 1;
								end
					6'b000111: begin
									lcd_rs <= 0;
									lcd_w <= 0;
									data <= 4'b0011;
									state <= state + 1;
								end
					6'b001000: begin
									lcd_e <= 1;
									state <= state + 1;
								end
					6'b001001: begin
									lcd_e <= 0;
									state <= state + 1;
								end
					6'b001010: begin
									lcd_rs <= 0;
									lcd_w <= 0;
									data <= 4'b0010;
									state <= state + 1;
								end
					6'b001011: begin
									lcd_e <= 1;
									state <= state + 1;
								end
					
					
					// Pge No. 11 complete
					6'b001100: begin
									lcd_e <= 0;
									state <= state + 1;
								end
					6'b001101: begin
									lcd_rs <= 0;
									lcd_w <= 0;
									data <= 4'b0010;
									state <= state + 1;
								end
					6'b001110: begin
									lcd_e <= 1;
									state <= state + 1;
								end
					6'b001111: begin
									lcd_e <= 0;
									state <= state + 1;
								end
					6'b010000: begin
									lcd_rs <= 0;
									lcd_w <= 0;
									data <= 4'b1000;
									state <= state + 1;
								end
					6'b010001: begin
									lcd_e <= 1;
									state <= state + 1;
								end
					
					//Page No. 12 complete
					6'b010010: begin
									lcd_e <= 0;
									state <= state + 1;
								end
					6'b010011: begin
									lcd_rs <= 0;
									lcd_w <= 0;
									data <= 4'b0000;
									state <= state + 1;
								end
					6'b010100: begin
									lcd_e <= 1;
									state <= state + 1;
								end
					6'b010101: begin
									lcd_e <= 0;
									state <= state + 1;
								end
					6'b010110: begin
									lcd_rs <= 0;
									lcd_w <= 0;
									data <= 4'b0110;
									state <= state + 1;
								end
					6'b010111: begin
									lcd_e <= 1;
									state <= state + 1;
								end
								
					//Page No. 13 comp
					6'b011000: begin
									lcd_e <= 0;
									state <= state + 1;
								end
					6'b011001: begin
									lcd_rs <= 0;
									lcd_w <= 0;
									data <= 4'b0000;
									state <= state + 1;
								end
					6'b011010: begin
									lcd_e <= 1;
									state <= state + 1;
								end
					6'b011011: begin
									lcd_e <= 0;
									state <= state + 1;
								end
					6'b011100: begin
									lcd_rs <= 0;
									lcd_w <= 0;
									data <= 4'b1100;
									state <= state + 1;
								end
					6'b011101: begin
									lcd_e <= 1;
									state <= state + 1;
								end
								
					//Page No. 14 comp
					6'b011110: begin
									lcd_e <= 0;
									state <= state + 1;
								end
					6'b011111: begin
									lcd_rs <= 0;
									lcd_w <= 0;
									data <= 4'b0000;
									state <= state + 1;
								end
					6'b100000: begin
									lcd_e <= 1;
									state <= state + 1;
								end
					6'b100001: begin
									lcd_e <= 0;
									state <= state + 1;
								end
					6'b100010: begin
									lcd_rs <= 0;
									lcd_w <= 0;
									data <= 4'b0001;
									state <= state + 1;
								end
					6'b100011: begin
									lcd_e <= 1;
									state <= state + 1;
								end
								
					//Page No. 15 comp
					6'b100100: begin
									lcd_e <= 0;
									state <= state + 1;
								end
					6'b100101: begin
									lcd_rs <= 0;
									lcd_w <= 0;
									data <= 4'b1000;
									state <= state + 1;
								end
					6'b100110: begin
									lcd_e <= 1;
									state <= state + 1;
								end
					6'b100111: begin
									lcd_e <= 0;
									state <= state + 1;
								end
					6'b101000: begin
									lcd_rs <= 0;
									lcd_w <= 0;
									data <= 4'b0000;
									state <= state + 1;
								end
					6'b101001: begin
									lcd_e <= 1;
									state <= state + 1;
								end
								
					//Page No. 17 comp
					
					//First Line
					6'b101010:begin
						//db = line1[idx-:7];
									case(s1)
										3'b000: begin
													db= {line1[idx],line1[idx-1],line1[idx-2],line1[idx-3],line1[idx-4],line1[idx-5],line1[idx-6],line1[idx-7]};
													lcd_e <= 0;
													s1 <= s1 + 1;
												end
										3'b001: begin
													lcd_rs <= 1;
													lcd_w <= 0;
													data <= db[7:4];
													s1 <= s1 + 1;
												end
										3'b010: begin
													lcd_e <= 1;
													s1 <= s1 + 1;
												end
										3'b011: begin
													lcd_e <= 0;
													s1 <= s1 + 1;
												end
										3'b100: begin
													lcd_rs <= 1;
													lcd_w <= 0;
													data <= db[3:0];
													s1 <= s1 + 1;
												end
										3'b101: begin
													lcd_e <= 1;
													if(idx > 7'b0000111) begin
														idx <= idx - 8;
													end
													else if(idx == 7'b0000111) begin
														idx <= 7'b0;
													end
													if(idx == 7'b0000000) begin
														state <= state + 1;
														idx <= 7'b1111111;
													end
													s1 <= 3'b000;
												end
									endcase
								end
									
					//Linebreak
					6'b101011: begin
									lcd_e <= 0;
									state <= state + 1;
								end
					6'b101100: begin
									lcd_rs <= 0;
									lcd_w <= 0;
									data <= 4'b1100;
									state <= state + 1;
								end
					6'b101101: begin
									lcd_e <= 1;
									state <= state + 1;
								end
					6'b101110: begin
									lcd_e <= 0;
									state <= state + 1;
								end
					6'b101111: begin
									lcd_rs <= 0;
									lcd_w <= 0;
									data <= 4'b0000;
									state <= state + 1;
								end
					6'b110000: begin
									lcd_e <= 1;
									state <= state + 1;
								end
								
					//Second Line
					6'b110001:begin
						//db = line2[idx-:7];
									case(s1)
										3'b000: begin
													
													db= {line2[idx],line2[idx-1],line2[idx-2],line2[idx-3],line2[idx-4],line2[idx-5],line2[idx-6],line2[idx-7]};
													lcd_e <= 0;
													s1 <= s1 + 1;
												end
										3'b001: begin
													lcd_rs <= 1;
													lcd_w <= 0;
													data <= db[7:4];
													s1 <= s1 + 1;
												end
										3'b010: begin
													lcd_e <= 1;
													s1 <= s1 + 1;
												end
										3'b011: begin
													lcd_e <= 0;
													s1 <= s1 + 1;
												end
										3'b100: begin
													lcd_rs <= 1;
													lcd_w <= 0;
													data <= db[3:0];
													s1 <= s1 + 1;
												end
										3'b101: begin
													lcd_e <= 1;
													if(idx > 7'b0000111) begin
														idx <= idx - 8;
													end
													else if(idx == 7'b0000111) begin
														idx <= 7'b0;
													end
													if(idx == 7'b0000000) begin
														state <= state + 1;
													end
													s1 <= 3'b000;
												end
									endcase
								end
					
					//Last step
					6'b110010: begin
									lcd_e <= 0;
								end
				endcase
					
				counter <= 20'b0;
			end
			else begin
				counter <= counter + 1;
			end
		end

endmodule
