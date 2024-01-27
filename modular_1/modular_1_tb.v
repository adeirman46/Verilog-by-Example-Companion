module modular_1_tb;

reg go_1, kill_1, clk, reset, kill_clr, go_2, kill_2,
 go_3, kill_3;
wire kill_ltchd, done_1, done_2, done_3;
wire [6:0] count_1, count_2, count_3;

// port mapping
modular_1 UUT(.go_1(go_1), .kill_1(kill_1),
 .clk(clk), .reset(reset), .kill_clr(kill_clr),
 .go_2(go_2), .kill_2(kill_2), .go_3(go_3),
 .kill_3(kill_3), .kill_ltchd(kill_ltchd),
 .done_1(done_1), .done_2(done_2), .done_3(done_3),
 .count_1(count_1), .count_2(count_2), .count_3(count_3));

// clock generation
always begin
    #50 clk = ~clk;
end

initial begin
    reset = 1'b1;
    go_1 = 1'b0;
    kill_1 = 1'b0;
    go_2 = 1'b0;
    kill_2 = 1'b0;
    go_3 = 1'b0;
    kill_3 = 1'b0;
    clk = 1'b0;

    // un-reset
    #100 reset = 1'b0;

    // start
    #100 go_1 = 1'b1;
    #100 kill_1 = 1'b0;
    #300 kill_1 = 1'b1;
    #100 kill_1 = 1'b0;

    #100 go_2 = 1'b1;
    #100 kill_2 = 1'b0;
    #300 kill_2 = 1'b1;
    #100 kill_2 = 1'b0;

    #100 go_3 = 1'b1;
    #100 kill_3 = 1'b0;
    #300 kill_3 = 1'b1;
    #100 kill_3 = 1'b0;
    #100;
end

endmodule