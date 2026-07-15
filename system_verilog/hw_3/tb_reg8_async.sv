`timescale 1ns/1ps

module tb_reg8_async;

    logic clk;
    logic rst_n;
    logic[7:0] d;
    logic[7:0] q;

    reg8_async uut (
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

		#100;

        rst_n = 0;
        d = 0;

        #3;
        rst_n = 1;
        
        for(int i=0; i<5; i++) begin
            d = $urandom();
            #10;
            assert(d == q) else $error("Time: %0t Expected register loaded data to be %p, got %p", $time, d, q);
        end
        #3;

        // Асинхронный сброс
        rst_n = 0;
        #3;
        assert(q == 0) else $error("Register was not reset asynchronosly at %0t", $time);
        rst_n = 1;

        d = $urandom();
        #10;
        assert(q == d) else $error("Time: %0t Expected register loaded data to be %p, got %p", $time, d, q);

        #10;
        $display("Test end");
        
        $finish;
    end

endmodule