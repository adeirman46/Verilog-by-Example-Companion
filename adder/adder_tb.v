module adder_tb;
    reg [3:0] a, b;
    wire [3:0] c;

    // port mapping
    adder UUT (.a(a), .b(b), .c(c));

    // behaves like sequential in architecture
    initial begin
        // initial input
        a = 0;
        b = 0;
        #100; // wait for 100 ns (followed timescale)

        repeat(100) begin
            a = a + 1;
            b = a + 2;
            #100;
        end
    end
endmodule


