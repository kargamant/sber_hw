module full_adder(
    input logic ci,
    input logic a,
    input logic b,
    output logic s,
    output logic co
);
    half_adder ha_1(
        .a(a),
        .b(b)
    );
    half_adder ha_2(
        .a(ha_1.s),
        .b(ci),
        .s(s)
    );
    assign co = ha_1.co | ha_2.co;
endmodule
