module adder_4bit (
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire cin,
    output wire [3:0] S,
    output wire cout,
    output wire P,
    output wire G
);

wire [3:0] ps, gs;
wire [4:1] c;

adder_1bit fa0 (.a(A[0]), .b(B[0]), .cin(cin),  .s(S[0]), .p(ps[0]), .g(gs[0]));
adder_1bit fa1 (.a(A[1]), .b(B[1]), .cin(c[1]), .s(S[1]), .p(ps[1]), .g(gs[1]));
adder_1bit fa2 (.a(A[2]), .b(B[2]), .cin(c[2]), .s(S[2]), .p(ps[2]), .g(gs[2]));
adder_1bit fa3 (.a(A[3]), .b(B[3]), .cin(c[3]), .s(S[3]), .p(ps[3]), .g(gs[3]));

cla_4bit cla (
    .p(ps),
    .g(gs),
    .cin(cin),
    .c(c),
    .P4(P),
    .G4(G)
);

assign cout = c[4];

endmodule