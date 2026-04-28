

module half_adder(
    input logic a,
    input logic b,
    output logic s,
    output logic co
);
    assign s = a ^ b;
    assign co = a & b;
endmodule