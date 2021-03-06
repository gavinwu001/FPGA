module top_module(
    input [254:0] in,
    output reg [7:0] out );

    always @(*) begin
        integer i;
        out = 0;
        for (i = 0; i < 255; i = i + 1) begin
            out = (in[i] ? (out + 1) : out);
        end

    end

endmodule


// 255 adder &  255 2-to-1 mux
