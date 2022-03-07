module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//

    wire carry;
    wire cout;
    add16(a[15:0], b[15:0], 0, sum[15:0], carry);
    add16(a[31:16], b[31:16], carry, sum[31:16], cout);

endmodule

module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );

    genvar i;

	 wire cout_tmp[16:0];

	 assign cout_tmp[0] = cin;
	 assign cout = cout_tmp[16];

	 generate
	 for (i = 0; i < 16; i = i + 1) begin: somename
	     add1(a[i], b[i], cout_tmp[i], sum[i], cout_tmp[i + 1]);
	 end
	 endgenerate

endmodule



module add1 ( input a, input b, input cin,   output sum, output cout );

    assign cout = (a & b) || (a & cin) || (b & cin);
    assign sum = (a && !b && !cin) || (!a && b && !cin) || (!a && !b && cin) || (a && b && cin);

// Full adder module here

endmodule
