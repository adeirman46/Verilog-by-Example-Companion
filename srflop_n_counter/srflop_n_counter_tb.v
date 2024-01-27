module srflop_n_counter_tb;

reg start, stop, clk, reset;
wire [3:0] count;
wire stop_d2;

// port mapping
srflop_n_counter UUT(.start(start), .stop(stop),
 .clk(clk), .reset(reset), .count(count), .stop_d2(stop_d2));

// clock generation
always begin
    #50 clk = ~clk;
end

initial begin
    start = 0;
    stop = 0;
    clk = 0;
    reset = 1;

    #100 reset = 0;
    #100 start = 1;
    #100 start = 0;
    #100 stop = 1;
    #100 stop = 0;
    #100;
end
    
endmodule