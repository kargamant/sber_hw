`timescale 1ns / 1ps

module tb_serial_adder();
    logic clk;
    logic rst_n;
    logic start;
    logic a_bit;
    logic b_bit;
    logic sum_bit;
    logic carry_out;
    logic ready;
    
    serial_adder uut(
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .a_bit(a_bit),
        .b_bit(b_bit),
        .sum_bit(sum_bit),
        .carry_out(carry_out),
        .ready(ready)
    );
    
    initial clk = 0;
    
    // генерация тактового сигнала
    always begin
        // f = 100MHz ~ T = 10ns -> half period delay
        #5;
        clk = ~clk;
    end
    
    // testbench
    byte a [10];
    byte b [10];
    byte s [10];
    byte op_time = 0;
    logic expected_carry = 0;
    initial begin
        #100;
        
        // генерация 10 случайных пар чисел и результатов
        for(int i=0; i<10; i++) begin
            a[i] = $urandom();
            b[i] = $urandom();
            s[i] = a[i] + b[i];
        end
        
        rst_n = 0;
        #10;
        rst_n = 1;
        for(int i=0; i<10; i++) begin
            start = 1;
            rst_n = 1;
            expected_carry = 0;
            op_time = 0;
            
            // суммирование каждой пары чисел и побитовая проверка результата
            for(int j=0; j<8; j++) begin
                a_bit = a[i][j];
                b_bit = b[i][j];
                #10;
                op_time += 10;
                assert(s[i][j] == sum_bit) else $error("Expected bit %0d to be %b, got %b.", j, s[i][j], sum_bit);
                            
                expected_carry = a[i][j] & b[i][j] | expected_carry & (a[i][j] | b[i][j]);
            end
            
            // проверка итогового переноса
            #20;
            assert(expected_carry == carry_out) else $error("Expected final carry to be %b, got %b.", expected_carry, carry_out);
            assert(ready) else $error("Expected ready bit to be 1, got 0");
            
            $display("Addition of %x and %x took %0dns or %0d clocks", a[i], b[i], op_time, op_time/10);
            
            // проверка корректного сброса состояния
            rst_n = 0;
            start = 0;
            #20;
            assert(sum_bit == 0) else $error("Sum bit was not reset.");
            assert(ready == 0) else $error("Ready bit was not reset.");
            assert(carry_out == 0) else $error("Carry out bit was not reset.");
        end
        $finish;
    end
    
endmodule
