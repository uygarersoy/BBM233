`timescale 1ns / 1ps

module machine_d_tb;
	reg x;
	reg CLK;
	reg RESET;
	wire F;
	wire [2:0] S;

	machine_d uut (.x(x), .CLK(CLK), .RESET(RESET), .F(F), .S(S));

	initial begin
		CLK = 0;
		forever begin
			#5;
			CLK = ~CLK;
		end
	end 

	initial begin
		x = 0;
		CLK = 0;
		RESET = 0;

		#5 RESET = 1;
		#5 RESET = 0;

		#4; 
		#20 x = 1;
		#20 x = 0;
		#20 x = 1;
		#20 x = 0;

		#100;
		$finish;
	end

endmodule