module adder_1bit (
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire s,
    output wire p,
    output wire g
);

assign p = a ^ b;
assign g = a & b;
assign s = (a ^ b) ^ cin;

endmodule
