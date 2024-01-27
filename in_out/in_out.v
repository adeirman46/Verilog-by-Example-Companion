module in_out (
    input in_1, in_2, in_3,
    output out_1, out_2
);

assign out_1 = in_1 & in_2 & in_3;
assign out_2 = in_1 | in_2 | in_3;
    
endmodule
