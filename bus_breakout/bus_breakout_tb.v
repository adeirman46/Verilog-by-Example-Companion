module bus_breakout_tb;
reg [3:0] in_1;
reg [3:0] in_2;
wire [5:0] out_1;

// port mapping
bus_breakout UUT(.in_1(in_1), .in_2(in_2),
 .out_1(out_1));

initial begin
    in_1 = 4'h4;
    in_2 = 4'h2;
    #100;
    in_1 = 4'h1;
    in_2 = 4'h2;
    #100;
    in_1 = 4'h0;
    in_2 = 4'h1;
    #100;
end
    
endmodule