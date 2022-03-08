module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cin;
    wire cout;
    add16 inst_1(a[15:0], b[15:0], 0, sum[15:0], cin);
    add16 inst_2(a[31:16], b[31:16], cin, sum[31:16], cout);

endmodule