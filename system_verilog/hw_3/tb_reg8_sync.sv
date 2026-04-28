`timescale 1ns/1ps

module tb_reg8_sync;

    logic clk;
    logic rst_n;
    logic[7:0] d;
    logic[7:0] q;

    reg8_sync uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );
    
    initial clk = 0;
    
    // период 10 нс
    always begin
        #5;
        clk = ~clk;
    end

    initial begin
        $monitor("Time=%0t: clk=%b, rst_n=%b, d=%h, q=%h", $time, clk, rst_n, d, q);
    end

    initial begin
        // global reset
        #100;
        
        rst_n = 0;
        d = 0;

        #10;
        rst_n = 1;
        
        for(int i=0; i<5; i++) begin
            d = $urandom();
            #10; // or 11ns if post timing
            assert(d == q) else $error("Expected register loaded data to be %p, got %p", d, q);
        end

        rst_n = 0;
        #5;
        assert(q != 0) else $error("Register was reset without clock at %0t!", $time);
        #10;
        assert(q == 0) else $error("Register was not reset on clock at %0t!", $time);
        #10;
        
        $display("Test end");
        $finish;
    end

endmodule