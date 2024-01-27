module standard_mux (
    input [3:0] in_1, 
    input [3:0] in_2,
    input in_3,
    output [3:0] out_1
);

// if in_3 high then in_1 else in_2
assign out_1 = in_3? in_1: in_2;

endmodule