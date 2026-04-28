
module adder4 (
    input logic ci,
    input logic[3:0] a,
    input logic[3:0] b,
    output logic[3:0] s,
    output logic co
);
    full_adder fa_0(
        .ci(ci),
        .a(a[0]),
        .b(b[0]),
        .s(s[0])
    );
    full_adder fa_1(
        .ci(fa_0.co),
        .a(a[1]),
        .b(b[1]),
        .s(s[1])
    );
    full_adder fa_2(
        .ci(fa_1.co),
        .a(a[2]),
        .b(b[2]),
        .s(s[2])
    );
    full_adder fa_3(
        .ci(fa_2.co),
        .a(a[3]),
        .b(b[3]),
        .s(s[3]),
        .co(co)
    );
    
endmodule