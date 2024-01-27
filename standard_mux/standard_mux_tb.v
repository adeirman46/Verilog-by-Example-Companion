module standard_mux_tb;
    reg [3:0] in_1;
    reg [3:0] in_2;
    reg in_3;
    wire [3:0] out_1;

    // port mapping
    standard_mux UUT(.in_1(in_1), .in_2(in_2),
    .in_3(in_3), .out_1(out_1));

    initial begin
        in_1 = 4'h5;
        in_2 = 4'h4;
        in_3 = 1'b0;
        #100;
        in_1 = 4'h1;
        in_2 = 4'h2;
        in_3 = 1'b0;
        #100;
        in_1 = 4'h1;
        in_2 = 4'h1;
        in_3 = 1'b1;
        #100;
    end
endmodule