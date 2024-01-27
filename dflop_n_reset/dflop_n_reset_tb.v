module dflop_n_reset_tb;

reg in_1;
reg clk;
reg reset;
wire out_1;

// port mapping
dflop_n_reset UUT(.in_1(in_1), .clk(clk),
.reset(reset), .out_1(out_1));

// clock generation
always begin
    #50 clk = ~clk;
end

always begin
    #250 reset = ~reset;
end

initial begin
    in_1 = 0;
    clk = 0;
    reset = 0;

    #100 in_1 = 1;
    #100 in_1 = 0;
    #100 in_1 = 1;
    #100 in_1 = 0;
    #100;

end
    
endmodule