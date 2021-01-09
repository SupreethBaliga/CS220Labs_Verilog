`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:50:41 02/26/2020 
// Design Name: 
// Module Name:    seven_bit_adder_subtractor 
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
module seven_bit_adder_subtractor(clk,rotation_event,rotation_direction,y,led);
	 
	 input [3:0]y;
	 input clk;
	 input rotation_direction;
	 input rotation_event;
	 
	 output [7:0]led;
	 wire [7:0]led;
	 reg prev_rotation_event = 1'b1;
	 reg [6:0]A;
	 reg [6:0]B;
	 reg adsub;
	 reg [2:0]count = 3'b000;
	 wire [6:0]cout;
	 
	 always @(posedge clk) begin
		if(~prev_rotation_event & rotation_event) begin
			case(count)
				3'b000: begin
					A[3:0] <= y;
					count <= count+1; 
				end
				3'b001: begin
					A[6:4] <= y[2:0];
					count <= count+1;
				end
				3'b010: begin
					B[3:0] <= y;
					count <= count+1;
				end
				3'b011: begin
					B[6:4] <= y[2:0];
					count <= count+1;
				end
				3'b100: begin
					adsub <= y[0];
					count <= 3'b000;
				end
			endcase
		end
		prev_rotation_event <= rotation_event;
	 end
	 
	 one_bit_adder O1(A[0],B[0],adsub,adsub,led[0],cout[0]);
	 one_bit_adder O2(A[1],B[1],cout[0],adsub,led[1],cout[1]);
	 one_bit_adder O3(A[2],B[2],cout[1],adsub,led[2],cout[2]);
	 one_bit_adder O4(A[3],B[3],cout[2],adsub,led[3],cout[3]);
	 one_bit_adder O5(A[4],B[4],cout[3],adsub,led[4],cout[4]);
	 one_bit_adder O6(A[5],B[5],cout[4],adsub,led[5],cout[5]);
	 one_bit_adder O7(A[6],B[6],cout[5],adsub,led[6],cout[6]);
	 assign led[7] = (cout[6]^cout[5]);

endmodule
