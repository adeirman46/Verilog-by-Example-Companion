module simple_dflop (
    in_1,
    clk,
    out_1
);

input in_1;
input clk;
// output must be register
output out_1;
reg out_1;

// always block with sensitivity list clk 
always @(posedge clk) begin
    out_1 <= in_1;
end
    
endmodule