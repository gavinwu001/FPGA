module top_module(
    input [7:0] in,
    output [7:0] out
);
   assign out[7:0] = {in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7]};

endmodule // top_module

genvar i;
generate
    for (i=0; i<8; i=i+1) begin: somename
        assign out[i] = in[7-i];
    end
endgenerate
