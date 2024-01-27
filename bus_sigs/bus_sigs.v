module bus_sigs (
    input [3:0] in_1,
    input [3:0] in_2,
    input in_3,
    output [3:0] out_1
);

wire a, b, c, d, e, f, g, h;

assign a = in_1[0] & ~in_3; 
assign b = in_2[0] & in_3;
assign c = in_1[1] & ~in_3;
assign d = in_2[1] & in_3;
assign e = in_1[2] & ~in_3;
assign f = in_2[2] & in_3;
assign g = in_1[3] & ~in_3;
assign h = in_2[3] & in_3;

assign out_1[0] = a | b;
assign out_1[1] = c | d;
assign out_1[2] = e | f;
assign out_1[3] = g | h;

endmodule