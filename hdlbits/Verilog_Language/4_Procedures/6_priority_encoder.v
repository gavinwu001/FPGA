// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );

    always @(*) begin
        case (in)
            4'b0: pos = 0;
            4'b01: pos = 0;
            4'b10: pos = 1;
            4'b11: pos = 0;
            4'b100: pos = 2;
            4'b101: pos = 0;
            4'b110: pos = 1;
            4'b111: pos = 0;
            4'b1000: pos = 3;
            4'b1001: pos = 0;
            4'b1010: pos = 1;
            4'b1011: pos = 0;
            4'b1100: pos = 2;
            4'b1101: pos = 0;
            4'b1110: pos = 1;
            4'b1111: pos = 0;
        endcase
    end
endmodule
