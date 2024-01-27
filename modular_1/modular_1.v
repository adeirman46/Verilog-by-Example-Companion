module modular_1 (
    input kill_clr,
    input clk,
    input reset,
    input go_1,
    input kill_1,
    input go_2,
    input kill_2,
    input go_3,
    input kill_3,
    output reg kill_ltchd,
    output done_1,
    output done_2,
    output done_3,
    output [6:0] count_1,
    output [6:0] count_2,
    output [6:0] count_3
);

// port mapping
state_machine_1 go_delay_1(
    .clk(clk), .reset(reset),
    .go(go_1), .kill(kill_1), .done(done_4), .count(count_1)
);
state_machine_1 go_delay_2(
    .clk(clk), .reset(reset),
    .go(go_2), .kill(kill_2), .done(done_2), .count(count_2)
);
state_machine_1 go_delay_3(
    .clk(clk), .reset(reset),
    .go(go_3), .kill(kill_3), .done(done_3), .count(count_3)
);

// kill latch
always @(posedge clk or posedge reset) begin
    if (reset) begin
        kill_ltchd <= 1'b0;
    end else if (kill_1 || kill_2 || kill_3) begin
        kill_ltchd <= 1'b1;
    end else if (kill_clr) begin
        kill_ltchd <= 1'b0;
    end
end
    
endmodule