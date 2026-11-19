// Simple SoC top: core + 64 Kib RAM + MMIO
// Memmory map:
//   0x0000_0000 – 0x0000_FFFF  RAM 
//   0x1000_0000                TOHOST  : 1 = PASS, (n<<1)|1 = FAIL 
//   0x1000_0004                UART_TX : print the MSB
module soc_top #(
    parameter int NUM_WORDS = 16384
) (
    input  logic           clk,
    input  logic           rst_n,
    output logic           to_host_valid,
    output logic           to_uart_valid,
    output logic [31:0]    to_host_data,
    output logic [7:0]     to_uart_data,
    output logic           halted
);

    // Initialization
    logic [31:0] imem_addr, imem_rdata, dmem_addr, dmem_rdata, dmem_wdata, ram_rdata; 
    logic [3:0]  dmem_be;  
    logic        is_mmio;

    riscv_core u_core (
        .clk        (clk),
        .rst_n      (rst_n),
        .imem_addr  (imem_addr),
        .imem_rdata (imem_rdata),
        .dmem_addr  (dmem_addr),
        .dmem_wdata (dmem_wdata),
        .dmem_be    (dmem_be),
        .dmem_rdata (dmem_rdata),
        .halted     (halted)
    );

    // Decoding address (RAM or MMIO)
    assign is_mmio = (dmem_addr[31:28] == 4'h1);

    ram #(.NUM_WORDS(NUM_WORDS)) u_ram (
        .clk(clk),
        .i_addr(imem_addr),
        .d_addr(dmem_addr),
        .d_be(dmem_be),
        .d_wdata(is_mmio ? 4'b0000 : dmem_wdata),
        .i_rdata(imem_rdata),       // out instruction
        .d_rdata(dmem_rdata)        // out data
    );

    assign dmem_rdata = is_mmio ? 32'b0 : ram_rdata;

    // I/O's (Only writing)
    assign to_host_valid    = is_mmio && (dmem_addr[3:2] == 2'd0) && (dmem_be != 4'b0);
    assign to_host_data     = dmem_wdata;
    assign to_uart_valid    = is_mmio && (dmem_addr[3:2] == 2'd1) && (dmem_be != 4'b0);
    assign to_uart_data     = dmem_wdata[7:0];
    
endmodule
