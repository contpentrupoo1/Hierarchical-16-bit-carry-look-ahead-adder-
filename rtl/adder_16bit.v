module adder_16bit (
    input  wire [15:0] A,
    input  wire [15:0] B,
    input  wire cin,
    output wire [15:0] S,
    output wire cout
);

wire [3:0] P, G;
wire [4:1] C;

adder_4bit ad0 (.A(A[3:0]),    .B(B[3:0]),    .cin(cin),  .S(S[3:0]),    .cout(), .P(P[0]), .G(G[0]));
adder_4bit ad1 (.A(A[7:4]),    .B(B[7:4]),    .cin(C[1]), .S(S[7:4]),    .cout(), .P(P[1]), .G(G[1]));
adder_4bit ad2 (.A(A[11:8]),   .B(B[11:8]),   .cin(C[2]), .S(S[11:8]),   .cout(), .P(P[2]), .G(G[2]));
adder_4bit ad3 (.A(A[15:12]),  .B(B[15:12]),  .cin(C[3]), .S(S[15:12]),  .cout(cout), .P(P[3]), .G(G[3]));

cla_4bit cla (
    .p(P),
    .g(G),
    .cin(cin),
    .c(C),
    .P4(),
    .G4()
);

endmodule