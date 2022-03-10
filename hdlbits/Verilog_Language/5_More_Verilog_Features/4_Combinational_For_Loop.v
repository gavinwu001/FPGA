module top_module(
    input [99:0] in,
    output [99:0] out
);
    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin: somename
            assign out[i] = in[100 - i -1];
        end
    endgenerate

endmodule

// no LE, only pins
