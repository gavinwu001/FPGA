module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
    wire [7:0] tmp_1;
    wire [7:0] tmp_2;

    assign tmp_1 = (a > b) ? b : a;
    assign tmp_2 = (tmp_1 > c) ? c : tmp_1;
    assign min = (tmp_2 > d) ? d : tmp_2;

endmodule
