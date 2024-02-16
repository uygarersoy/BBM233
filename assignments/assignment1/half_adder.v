`ifndef HALF_ADDER_V
`define HALF_ADDER_V

`timescale 1ns/10ps

module half_adder(
    input A, B,
    output S, C
);
    assign S = A ^ B;
    assign C  = A & B;
endmodule
`endif // HALF_ADDER_V