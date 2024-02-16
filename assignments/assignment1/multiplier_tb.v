`timescale 1ns/10ps

module multiplier_tb;

reg [2:0] A, B,
wire [5:0] P;

multiplier UUT(.A(A), .B(B), .P(P));

initial begin
	$dumpfile("multiplier.vcp");
	$dumpvars;

	for (int i = 0; i < 8; i = i + 1) begin
		for (int j = 0; j < 8; j = j + 1) begin
			A = i;
			B = j;
			#10;
		end
	end
	#10;
	$finish;
end

endmodule