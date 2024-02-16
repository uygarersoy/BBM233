`ifndef MULTIPLIER_V
`define MULTIPLIER_V

`timescale 1ns/10ps

`include "half_adder.v"
`include "full_adder.v"

module multiplier (
    input [2:0] A, B,
    output [5:0] P
);

  wire a, b, c, d, e, f, g, h;
  
  and(P[0], A[0], B[0]);
  and(a, A[0], B[1]);
  and(b, A[1], B[0]);
  and(c, A[1], B[1]);
  and(d, A[2], B[0]);
  and(e, A[0], B[2]);
  and(f, A[1], B[2]);
  and(g, A[2], B[1]);
  and(h, A[2], B[2]);

  half_adder ha0(.A(a), .B(b), .S(P[1]), .C());
  half_adder ha1(.A(c), .B(d), .S(Sum0), .C());
  full_adder fa0(.A(e), .B(ha1.S), .Cin(ha0.C), .S(P[2]), .Cout());
  full_adder fa1(.A(f), .B(g), .Cin(ha1.C), .S(), .Cout());
  half_adder ha2(.A(fa1.S), .B(fa0.Cout), .S(P[3]), .C());
  full_adder fa2(.A(h), .B(fa1.Cout), .Cin(ha2.C), .S(P[4]), .Cout(P[5]));


endmodule
`endif // MULTIPLIER_V