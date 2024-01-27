module dflop_en_clr_tb;

reg in_1, enable, clear_n, clk, reset;
wire out_1;

// port mapping
dflop_en_clr UUT(.in_1(in_1), .enable(enable),
 .clear_n(clear_n), .clk(clk), .reset(reset), 
 .out_1(out_1));

// clock generation
always begin
    #50 clk = ~clk;
end

// reset generation
always begin
    #250 reset = ~reset;
end

// enable generation
always begin
    #150 enable = ~enable;
end

initial begin
    in_1 = 0;
    enable = 0;
    clear_n = 1;
    clk = 0;
    reset = 0;

    #100 in_1 = 1;
    #100 in_1 = 0;
    #100 in_1 = 1;
    #100 in_1 = 0;
    #100 clear_n = 0;
    #100 in_1 = 1;
    #100 in_1 = 0;
end
    
endmodule