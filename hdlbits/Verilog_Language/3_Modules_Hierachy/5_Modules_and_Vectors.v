module my_dff8 (
    input clk,
	 input [7:0] in,
	 output reg [7:0] out);

	 always @(posedge clk)
	 begin
	     out <= in;
	 end
endmodule

module top_module (
    input clk,
    input [7:0] d,
    input [1:0] sel,
    output [7:0] q
);
    wire [7:0] q1;
    wire [7:0] q2;
    wire [7:0] q3;

   reg [7:0]   out;


    my_dff8 inst1(clk, d, q1);
    my_dff8 inst2(clk, q1, q2);
    my_dff8 inst3(clk, q2, q3);

    always @(*) begin
        case (sel)
            2'd0: out = d;
            2'd1: out = q1;
            2'd2: out = q2;
            2'd3: out = q3;
        endcase
    end

   assign q = out;


endmodule
