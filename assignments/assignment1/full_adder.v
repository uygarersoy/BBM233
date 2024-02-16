`ifndef FULL_ADDER_V
`define FULL_ADDER_V

`timescale 1ns/10ps

`include "half_adder.v"

module full_adder(
    input A, B, Cin,
    output S, Cout
);
    half_adder ha1(.A(A), .B(B), .S(), .C());
    half_adder ha2(.A(ha1.S), .B(Cin), .S(S), .C());

    or(Cout, ha1.C, ha2.C);


endmodule
`endif // FULL_ADDER_V