module flip_flop(
        input logic clk,
        input logic rst_n,
        input logic d,
        output logic q
    );
    
    always_ff @(posedge clk) begin
        if(!rst_n) begin
            q <= 0;
        end
        else begin
            q <= d;
        end
    end
    
endmodule
