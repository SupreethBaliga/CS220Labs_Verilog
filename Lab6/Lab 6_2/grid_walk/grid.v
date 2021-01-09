`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:34 02/26/2020 
// Design Name: 
// Module Name:    grid 
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
module grid(y, clk, rotation_event, rotation_direction, led
    );

	input [3:0] y;
	input clk, rotation_event, rotation_direction;
	
	output [7:0] led;
	wire [7:0] led;
	reg prev_rotation_event = 1'b1;
	reg [3:0] curr_x = 4'b0000;
	reg [3:0] curr_y = 4'b0000;
	reg [1:0] direction;
	reg [1:0] step;
	reg [3:0] stepx = 4'b0000;
	reg [3:0] stepy = 4'b0000;
	
	wire [4:0] xout;
	wire [4:0] yout;
	
	always @(posedge clk) begin
		if(~prev_rotation_event & rotation_event) begin
			curr_x <= led[3:0];
			curr_y <= led[7:4];
			direction = y[1:0];
			step = y[3:2];
			case(direction)
				2'b00: begin
					stepx <= 4'b0000;
					stepy[1:0] <= step;
				end
				2'b01 : begin
					stepx[1:0] <= step;
					stepy <= 4'b0000;
				end
				2'b10: begin
					stepx <= 4'b0000;
					stepy[1:0] <= step;
				end
				2'b11 : begin
					stepx[1:0] <= step;
					stepy <= 4'b0000;
				end
			endcase
		end
		prev_rotation_event <= rotation_event;
	end
	
	five_bit_adder_subtractor F1(curr_x, stepx, (direction[1]^direction[0]), xout);
	five_bit_adder_subtractor F2(curr_y, stepy, (direction[1]^direction[0]), yout);
	
	assign led[7] = (~yout[4] & yout[3]) | (yout[4] & ~(direction[1]^direction[0]));
	assign led[6] = (~yout[4] & yout[2]) | (yout[4] & ~(direction[1]^direction[0]));
	assign led[5] = (~yout[4] & yout[1]) | (yout[4] & ~(direction[1]^direction[0]));
	assign led[4] = (~yout[4] & yout[0]) | (yout[4] & ~(direction[1]^direction[0]));
	
	assign led[3] = (~xout[4] & xout[3]) | (xout[4] & ~(direction[1]^direction[0]));
	assign led[2] = (~xout[4] & xout[2]) | (xout[4] & ~(direction[1]^direction[0]));
	assign led[1] = (~xout[4] & xout[1]) | (xout[4] & ~(direction[1]^direction[0]));
	assign led[0] = (~xout[4] & xout[0]) | (xout[4] & ~(direction[1]^direction[0]));
	
endmodule
