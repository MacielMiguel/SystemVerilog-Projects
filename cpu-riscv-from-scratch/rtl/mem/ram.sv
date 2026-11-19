module ram #(
    parameter int NUM_WORDS = 16384
) (
    input logic clk,
    /* verilator lint_off UNUSEDSIGNAL */
    input logic [31:0] i_addr,
    output logic [31:0] i_rdata,
    input logic [31:0] d_addr,
    /* verilator lint_on UNUSEDSIGNAL */
    input logic [3:0] d_be,
    input logic [31:0] d_wdata,
    output logic [31:0] d_rdata
);

    localparam int AW = $clog2(NUM_WORDS);

    logic [31:0] mem [NUM_WORDS];

    assign i_rdata = mem[i_addr[AW+1:2]];
    assign d_rdata = mem[d_addr[AW+1:2]]; 

    always_ff @(posedge clk) begin                          // O que isso faz?
        for (int i = 0; i < 4; i++) begin
            if (d_be[i]) mem[d_addr[AW+1:2]][8*i +: 8] <= d_wdata[8*i +: 8];
        end
    end  

endmodule
