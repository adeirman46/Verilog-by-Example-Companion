module dflop_n_reset (
    in_1,
    clk,
    reset,
    out_1
);

input in_1;
input clk;
input reset;
output out_1;
// out_1 is also register 
reg out_1;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        out_1 <= 1'b0;
    end else begin
        out_1 <= in_1;
    end
end
    
endmodule