
module reg8_sync(
    input logic clk,
    input logic rst_n,
    input logic[7:0] d,
    output logic[7:0] q
);
    always_ff @(posedge clk) begin
        if(!rst_n)
            q <= 0;
        else
            q <= d;
    end
endmodule
