// create module (behaves like entity & architecture)
module adder (
    // entity
    input [3:0] a, b,
    output [3:0] c
);
    // architecture
    assign c = a + b; 
endmodule



