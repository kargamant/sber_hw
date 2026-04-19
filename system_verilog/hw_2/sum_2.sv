module sum_2(
        input logic a,
        input logic b,
        input logic ci,
        output logic q,
        output logic co
    );
    
    always_comb begin
        q = a ^ b ^ ci;
        co = a & b | ci & (a | b);
    end
endmodule
