module cla_4bit (
    input  wire [3:0] p,
    input  wire [3:0] g,
    input  wire cin,
    output wire [4:1] c,
    output wire P4,
    output wire G4
);

assign c[1] = g[0] | (p[0] & cin);
assign c[2] = g[1] | (p[1] & c[1]);
assign c[3] = g[2] | (p[2] & c[2]);
assign c[4] = g[3] | (p[3] & c[3]);

assign P4 = p[3] & p[2] & p[1] & p[0];

assign G4 = g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & g[0])))));

endmodule