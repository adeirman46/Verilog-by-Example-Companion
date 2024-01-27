module srflop_n_counter (
    start,
    stop,
    clk,
    reset,
    count,
    stop_d2
);

input start, stop, clk, reset;
output [3:0] count;
output stop_d2;

// output as register
reg [3:0] count;
reg stop_d2;
// internal signal as register
reg cnt_en;
reg stop_d1;

// SR flip-flop
always @(posedge clk or posedge reset) begin
    if (reset) begin
        cnt_en <= 1'b0;
    end else if (start) begin
        cnt_en <= 1'b1;
    end else if (stop) begin
        cnt_en <= 1'b0;
    end
end

// modulo 14
always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 4'h0; 
    end else if (cnt_en && count == 4'd13) begin
        count <= 4'h0;
    end else if (cnt_en) begin
        count <= count + 1;
    end
end

// delay
always @(posedge clk or posedge reset) begin
    if (reset) begin
        stop_d1 <= 1'b0;
        stop_d2 <= 1'b0;
    end else begin
        stop_d1 <= stop;
        stop_d2 <= stop_d1;
    end
end
    
endmodule