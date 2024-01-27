module dflop_en_clr (
    in_1,
    enable,
    clear_n,
    clk,
    reset,
    out_1
);

input in_1, enable, clear_n, clk, reset;
output out_1;
// out_1 is also register
reg out_1;

// always block
always @(posedge clk or posedge reset) begin
    if (reset) begin
        out_1 <= 0;
    end else if (clear_n == 0) begin
        out_1 <= 0;
    end else if(enable) begin
        out_1 <= in_1;
    end   
end  
endmodule