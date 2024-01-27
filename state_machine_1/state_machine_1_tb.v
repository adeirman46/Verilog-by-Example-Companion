module state_machine_1_tb;

reg go, kill, clk, reset;
wire [6:0] count;
wire done;

// port mapping
state_machine_1 UUT(.go(go), .kill(kill),
.clk(clk), .reset(reset), .count(count),
.done(done));

// clock generation
always begin
    #50 clk = ~clk;
end

initial begin
    reset = 1'b1;
    go = 1'b0;
    kill = 1'b0;
    clk = 1'b0;

    // un-reset
    #100 reset = 1'b0;

    // start
    #100 go = 1'b1;
    #100 kill = 1'b0;

    #2000 kill = 1'b1;
    #100 kill = 1'b0;
    #100;
end

endmodule