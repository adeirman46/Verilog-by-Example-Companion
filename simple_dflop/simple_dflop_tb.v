module simple_dflop_tb;

    reg in_1;
    reg clk;
    wire out_1;

    // port mapping
    simple_dflop UUT(.in_1(in_1), .clk(clk),
     .out_1(out_1));

    // clock generation
    always begin
        // invert the clock every 50 time units
        #50 clk = ~clk;
    end

    initial begin
        in_1 = 0;
        clk = 0;

        #100 in_1 = 1;
        #100 in_1 = 0;
        #100 in_1 = 1;
        #100 in_1 = 0;
        #100;

    end
    
endmodule