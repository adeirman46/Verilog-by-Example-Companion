module in_out_tb;
    reg in_1, in_2, in_3;
    wire out_1, out_2;

    // port mapping
    in_out UUT(.in_1(in_1), .in_2(in_2), .in_3(in_3),
    .out_1(out_1), .out_2(out_2));

    initial begin
    // initial signal
    in_1 = 0;
    in_2 = 1;
    in_3 = 0;
    #100;
    in_1 = 1;
    in_2 = 1;
    in_3 = 0;
    #100;
    in_1 = 0;
    in_2 = 1;
    in_3 = 1;
    #100;
    in_1 = 0;
    in_2 = 0;
    in_3 = 0;
    #100;
        
    end
endmodule