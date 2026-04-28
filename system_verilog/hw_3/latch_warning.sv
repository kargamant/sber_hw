module latch_warning(
    input logic x,
    input logic y,
    output logic z
);

    always_comb begin
        if(x | y)
            z = 1;
    end
    
endmodule
