`timescale 1ns / 1ps

module mux2(
    input logic a,
    input logic b,
    input logic sel,
    output logic y
    );
    
    assign y = sel ? a : b;
    
endmodule
