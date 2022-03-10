module top_module(
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    wire cout_tmp[399:0];

    assign cout = cout_tmp[396];

    genvar i;
    generate
        bcd_fadd inst(a[3:0], b[3:0], cin, cout_tmp[0], sum[3:0]);
        for (i = 4; i < 400; i = i + 4) begin: somename
            bcd_fadd insts(a[i + 3:i], b[i + 3: i], cout_tmp[i - 4], cout_tmp[i], sum[i + 3: i]);
        end
    endgenerate


endmodule
