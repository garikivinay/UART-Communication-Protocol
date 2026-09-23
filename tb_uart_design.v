```verilog
`timescale 1ns / 1ps

module tb_uart_design;
    reg clk;
    reg rst_n;
    reg tx_start;
    reg [7:0] tx_data;
    wire tx_serial;
    wire tx_active;
    wire tx_done;

    smart_uart_tx uut (
        .clk(clk),
        .rst_n(rst_n),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx_serial(tx_serial),
        .tx_active(tx_active),
        .tx_done(tx_done)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst_n = 0; tx_start = 0; tx_data = 8'h00; #15;
        rst_n = 1; #10;
        tx_data = 8'hA5; tx_start = 1; #10;
        tx_start = 0; #120;
        tx_data = 8'h3C; tx_start = 1; #10;
        tx_start = 0; #120;
        $finish;
    end
endmodule
