module top_module(
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    assign cout[0] = (a[0] & b[0]) || (a[0] & cin) || (b[0] & cin);
    assign sum[0] = (a[0] & b[0] & cin) || (a[0] & !b[0] & !cin) || (!a[0] & b[0] & !cin) ||  (!a[0] & !b[0] & cin);

    genvar i;
    generate
        for (i = 1; i < 100; i = i + 1) begin: somename
            assign  cout[i] = (a[i] & b[i]) || (a[i] & cout[i - 1]) || (b[i] & cout[i - 1]);
            assign sum[i] = (a[i] & b[i] & cout[i - 1]) || (a[i] & !b[i] & !cout[i - 1])
                || (!a[i] & b[i] & !cout[i - 1]) || (!a[i] & !b[i] & cout[i - 1]);
        end
    endgenerate

endmodule // top_module


module one_bit_adder(input a, input b, input cin, output cout, output sum);
   assign cout =  (a & b) || (a & cin) || (b & cin);
   assign sum = (a & b & cin) || (a & !b & !cin) || (!a & b & !cin) ||  (!a & !b & cin);
endmodule // one_bit_adder


module top_module(
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    one_bit_adder inst(a[0], b[0], cin, cout[0], sum[0]);

    genvar i;
    generate
        for (i = 1; i < 100; i = i + 1) begin: somename
           one_bit_adder insts(a[i], b[i], cout[i - 1], cout[i], sum[i]);
        end
    endgenerate

endmodule // top_module








module top_module(
    input [99:0] a, b,
    input cin,
    output reg [99:0] cout,
    output reg [99:0] sum );

    always @(*) begin
        integer i;
        cout[0] = (a[0] & b[0]) || (a[0] & cin) || (b[0] & cin);
        sum[0] = (a[0] & b[0] & cin) || (a[0] & !b[0] & !cin) || (!a[0] & b[0] & !cin) ||  (!a[0] & !b[0] & cin);
        for (i = 1; i < 100; i = i + 1) begin
            cout[i] = (a[i] & b[i]) || (a[i] & cout[i - 1]) || (b[i] & cout[i - 1]);
            sum[i] = (a[i] & b[i] & cout[i - 1]) || (a[i] & !b[i] & !cout[i - 1])
                || (!a[i] & b[i] & !cout[i - 1]) || (!a[i] & !b[i] & cout[i - 1]);
        end
    end

endmodule // top_module


module one_bit_adder(input a, input b, input cin, output reg cout, output reg sum);
   always @(*) begin
       cout =  (a & b) || (a & cin) || (b & cin);
       sum = (a & b & cin) || (a & !b & !cin) || (!a & b & !cin) ||  (!a & !b & cin);
   end
endmodule // one_bit_adder

module top_module(
    input [99:0] a, b,
    input cin,
    output reg [99:0] cout,
    output reg [99:0] sum );

    always @(*) begin
        integer i;
        one_bit_adder inst(a[0], b[0], cin, cout[0], sum[0]);

        for (i = 1; i < 100; i = i + 1) begin
           one_bit_adder insts(a[i], b[i], cout[i - 1], cout[i], sum[i]);     // Error hardware blocks should not be instantiated in an always block
        end
    end

endmodule // top_module


// for each cout bit, 3 input wideor, for each sum bit, 4 bit wideor
