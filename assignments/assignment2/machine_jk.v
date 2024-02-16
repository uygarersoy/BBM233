module machine_jk(
    input wire x,
    input wire CLK,
    input wire RESET,
    output wire F,
    output wire [2:0] S
);
    wire a, b, c, d;
    and(a, S[1], ~x);
    and(b, ~S[2], ~x);
    nand(c, S[2], S[2]);
    nand(d, x, x);

    jkff flip_flop_A(.J(a), .K(c), .CLK(CLK), .RESET(RESET), .Q(S[2]));
    jkff flip_flop_B(.J(d), .K(b), .CLK(CLK), .RESET(RESET), .Q(S[1]));
    jkff flip_flop_C(.J(x), .K(x), .CLK(CLK), .RESET(RESET), .Q(S[0]));

    and(F, S[2] & S[1] & ~S[0]);

endmodule