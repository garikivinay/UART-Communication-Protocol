# UART-Communication-Protocol
Universal Asynchronous Receiver Transmitter Design using Verilog HDL

## CodeTech VLSI Internship
## Intern id :- CITS6509 

### Project Overview
This project implements a **UART (Universal Asynchronous Receiver Transmitter)** using **Verilog HDL**. UART is one of the most widely used serial communication protocols in embedded systems, microcontrollers, FPGAs, and ASICs. The design supports serial data transmission and reception without requiring a shared clock between communicating devices.

A Verilog testbench is included to verify the UART transmitter and receiver under different operating conditions.

---

## Features

- UART Transmitter (TX)
- UART Receiver (RX)
- Asynchronous serial communication
- Start bit and Stop bit generation
- 8-bit data transmission
- Baud rate control
- Verilog Testbench for functional verification

---

## Repository Contents

| File | Description |
|------|-------------|
| `uart_design.v` | Verilog source code for the UART Transmitter and Receiver |
| `tb_uart_design.v` | Testbench used to verify UART communication |

---

## Inputs

- **clk** – System clock
- **rst** – Reset signal
- **tx_start** – Starts data transmission
- **tx_data[7:0]** – 8-bit data to be transmitted
- **rx_serial** – Serial data received from external device

---

## Outputs

- **tx_serial** – Serial transmitted output
- **rx_data[7:0]** – Received 8-bit data
- **tx_busy** – Indicates transmitter is busy
- **rx_done** – Indicates successful reception of data

---

## Working Principle

### UART Transmitter

1. Waits for the `tx_start` signal.
2. Generates a **Start Bit (0)**.
3. Transmits the 8-bit data serially (LSB first).
4. Generates one **Stop Bit (1)**.
5. Returns to the idle state until the next transmission.

### UART Receiver

1. Detects the incoming **Start Bit**.
2. Samples each incoming data bit at the configured baud rate.
3. Reconstructs the original 8-bit data.
4. Verifies the **Stop Bit**.
5. Asserts the `rx_done` signal after successful reception.

---

## Simulation

The testbench verifies:

- UART reset operation
- Data transmission
- Data reception
- Start and Stop bit generation
- Correct serial communication
- Multiple transmission scenarios

---

## Tools Used

- Verilog HDL
- ModelSim
- Xilinx Vivado Simulator
- Icarus Verilog (or any compatible Verilog simulator)

---

## Applications

- Microcontroller communication
- FPGA-to-PC communication
- Embedded systems
- IoT devices
- Serial debugging interfaces
- Wireless communication modules (Bluetooth, Wi-Fi, GPS)

---
