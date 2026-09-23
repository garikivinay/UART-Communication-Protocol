```verilog
module smart_uart_tx (
    input wire clk,
    input wire rst_n,
    input wire tx_start,
    input wire [7:0] tx_data,
    output reg tx_serial,
    output reg tx_active,
    output reg tx_done
);
    localparam STATE_IDLE  = 2'b00;
    localparam STATE_START = 2'b01;
    localparam STATE_DATA  = 2'b10;
    localparam STATE_STOP  = 2'b11;

    reg [1:0] current_state;
    reg [2:0] bit_index;
    reg [7:0] data_holder;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= STATE_IDLE;
            tx_serial     <= 1'b1;
            tx_active     <= 1'b0;
            tx_done       <= 1'b0;
            bit_index     <= 3'b000;
        end else begin
            case (current_state)
                STATE_IDLE: begin
                    tx_serial <= 1'b1;
                    tx_done   <= 1'b0;
                    bit_index <= 3'b000;
                    if (tx_start) begin
                        data_holder   <= tx_data;
                        tx_active     <= 1'b1;
                        current_state <= STATE_START;
                    end else begin
                        tx_active <= 1'b0;
                    end
                end
                STATE_START: begin
                    tx_serial     <= 1'b0;
                    current_state <= STATE_DATA;
                end
                STATE_DATA: begin
                    tx_serial <= data_holder[bit_index];
                    if (bit_index == 3'b111) begin
                        bit_index     <= 3'b000;
                        current_state <= STATE_STOP;
                    end else begin
                        bit_index <= bit_index + 1'b1;
                    end
                end
                STATE_STOP: begin
                    tx_serial     <= 1'b1;
                    tx_active     <= 1'b0;
                    tx_done       <= 1'b1;
                    current_state <= STATE_IDLE;
                end
                default: current_state <= STATE_IDLE;
            endcase
        end
    end
endmodule
