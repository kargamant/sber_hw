`timescale 1ns / 1ps

module tb_adder4();
    
    logic[3:0] a;
    logic[3:0] b;
    logic[3:0] s;
    logic ci = 0;
    logic co;
    logic[3:0] expected_s;
    logic expected_co;
    shortint errors = 0;
    
    adder4 uut (
        .ci(ci),
        .a(a),
        .b(b),
        .s(s),
        .co(co)
    );
    
    initial begin
        for(int i=0; i<256; i++) begin
            {a, b} = i;
            expected_s = a + b;
            expected_co = (a + b) > 15;
            #10;
            assert(s == expected_s) else begin
                $error("Wrong sum at %0d. Adding %b and %b. Expected %p, got %p.", i, a, b, expected_s, s);
                errors++;
            end
            assert(co == expected_co) else begin
                $error("Wrong carry_out at %0d. Adding %b and %b. Expected %p, got %p.", i, a, b, expected_co, co);
                errors++;
            end
        end

        if (errors > 0)
            $display("Not all tests have passed. Got %0d errors", errors);
        else
            $display("All tests have passed successfully");
        
        $finish;
    end
    
endmodule
