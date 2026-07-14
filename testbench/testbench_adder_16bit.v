`timescale 1ns/1ps

module testbench_adder_16bit;

reg  [15:0] A, B;
reg  cin;
wire [15:0] S;
wire cout;
reg errorcount;
wire [16:0] test;

adder_16bit uut (
    .A(A),
    .B(B),
    .cin(cin),
    .S(S),
    .cout(cout)
);

assign test = A + B + cin;

initial begin
    cin = 0;
    errorcount = 0;
    
    A = 16'h0001; B = 16'h0001; #10;
        
    if({cout, S} != test)
    begin
    $display("Error at %0t ns: A = %h, B = %h, cin = %b\n Result: cout = %b, S = %h\n", $time, A, B, cin, cout, S);
    errorcount = errorcount + 1;
    end
    
    
    
    A = 16'h80FF; B = 16'h8001; #10;
        
    if({cout, S} != test)
    begin
    $display("Error at %0t ns: A = %h, B = %h, cin = %b\n Result: cout = %b, S = %h\n", $time, A, B, cin, cout, S);
    errorcount = errorcount + 1;
    end
    
    A = 16'h1234; B = 16'h1111; #10;
    
    if({cout, S} != test)
    begin
    $display("Error at %0t ns: A = %h, B = %h, cin = %b\n Result: cout = %b, S = %h\n", $time, A, B, cin, cout, S);
    errorcount = errorcount + 1;
    end
    A = 16'hFFFF; B = 16'h0001; #10;
    
    if({cout, S} != test)
    begin
    $display("Error at %0t ns: A = %h, B = %h, cin = %b\n Result: cout = %b, S = %h\n", $time, A, B, cin, cout, S);
    errorcount = errorcount + 1;
    end
    A = 16'hAAAA; B = 16'h5555; #10;
    
    if({cout, S} != test)
    begin
    $display("Error at %0t ns: A = %h, B = %h, cin = %b\n Result: cout = %b, S = %h\n", $time, A, B, cin, cout, S);
    errorcount = errorcount + 1;
    end

    cin = 1;
    A = 16'h0001; B = 16'h0000; #10;
    
    if({cout, S} != test)
    begin
    $display("Error at %0t ns: A = %h, B = %h, cin = %b\n Result: cout = %b, S = %h\n", $time, A, B, cin, cout, S);
    errorcount = errorcount + 1;
    end
    A = 16'h0005; B = 16'h0009; #10;
    
    if({cout, S} != test)
    begin
    $display("Error at %0t ns: A = %h, B = %h, cin = %b\n Result: cout = %b, S = %h\n", $time, A, B, cin, cout, S);
    errorcount = errorcount + 1;
    end
    $display("Number of errors: %d", errorcount);
    $stop;
end

endmodule
