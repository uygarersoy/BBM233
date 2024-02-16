module machine_d(
    input wire x,
    input wire CLK,
    input wire RESET,
    output wire F,
    output wire [2:0] S
);
    wire A, B, C;

    or(A, S[2], S[1] & ~x);
    or(B, S[1] & x, ~S[1] & ~x, S[2] & S[1]);
    or(C, ~S[0] & x, S[0] & ~x);

    dff flip_flop_A(.D(A), .CLK(CLK), .RESET(RESET), .Q(S[2]));
    dff flip_flop_B(.D(B), .CLK(CLK), .RESET(RESET), .Q(S[1]));
    dff flip_flop_C(.D(C), .CLK(CLK), .RESET(RESET), .Q(S[0]));

    and(F, S[2] & S[1] & ~S[0]);

endmodule