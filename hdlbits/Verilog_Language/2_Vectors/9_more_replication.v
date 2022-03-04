module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    // The output is XNOR of two vectors created by
    // concatenating and replicating the five inputs.
    // assign out = ~{ ... } ^ { ... };
    wire [24:0] var_a;
    wire [24:0] var_b;

    assign var_a = {{5{a}},{5{b}},{5{c}},{5{d}},{5{e}},};
    assign var_b = {{5{a,b,c,d,e}}};
    assign out = ~(var_a ^ var_b);

endmodule
