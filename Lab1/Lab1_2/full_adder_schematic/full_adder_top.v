// Verilog test fixture created from schematic /media/cse/735F-494D/CS220Labs/Lab1_2/full_adder_schematic/fuller_adder_sch.sch - Wed Jan 15 15:07:29 2020

`timescale 1ns / 1ps

module fuller_adder_sch_fuller_adder_sch_sch_tb();

// Inputs
   reg a;
   reg b;
   reg cin;

// Output
   wire sum;
   wire cout;

// Bidirs

// Instantiate the UUT
   fuller_adder_sch UUT (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
   );
// Initialize Inputs
       always @(sum or cout) begin
			$display("time=%d: %b +%b +%b = %b, cout= %b\n" ,$time,  a, b ,cin,sum,cout);
		 end
		 
		 initial begin
			a=0;b=0;cin=0;
			#5
			a=0;b=1;cin=0;
			#5
			a=1;b=0;cin=1;
			#5
			a=1;b=1;cin=1;
			#5
			$finish;
		 end
endmodule
