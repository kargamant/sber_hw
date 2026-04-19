module serial_adder(
        input logic clk,
        input logic rst_n,
        input logic start,
        input logic a_bit,
        input logic b_bit,
        output logic sum_bit,
        output logic carry_out,
        output logic ready
    );
    // счётчик тактов
    byte counter;
    
    // состояния конечного автомата
    enum {IDLE, SHIFT} state;
    
    // было удобнее вынести логику суммирования и хранения переноса в отдельные блоки
    // в данном блоке осталась только логика конечного автомата, т.е. переключения состояний
    
    // триггер переноса
    flip_flop cff(
        .clk(clk),
        .rst_n(rst_n),
        .q(carry_out)
    );
    
    // триггер суммы, чтобы выдавать очередной бит суммы по такту, а не сразу по мере поступления сигналов
    // иначе возникали проблемы с проверкой sum_bit в тестбенче
    flip_flop sff(
        .clk(clk),
        .rst_n(rst_n),
        .q(sum_bit)
    );
    
    // отдельный блок сумматора
    sum_2 s2(
        .a(a_bit),
        .b(b_bit),
        .ci(cff.q),
        .q(sff.d),
        .co(cff.d)
    );
    
    // логика переключения состояний
    always_ff @(posedge clk) begin
        case(state)
            IDLE : begin 
                ready <= 0;
                counter <= 0;
                if(start) begin
                    state <= SHIFT;
                end
            end
            SHIFT : begin
                if(!start) begin 
                    state <= IDLE;
                    ready <= 0;
                    counter <= 0;
                end
                else if(counter == 8) ready <= 1;
                else if(!ready) counter <= counter + 1;
            end
        endcase
    end
endmodule
