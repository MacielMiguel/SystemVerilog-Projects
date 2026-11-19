// LSU (Load Store Unit) interface with the RAM
module lsu (
    /* verilator lint_off UNUSEDSIGNAL */
    input logic [31:0] addr,                // Indicates which byte will be affected by the load or store (load/store)
    /* verilator lint_on UNUSEDSIGNAL */

    input logic [2:0] funct3,               // Indicates the number of bytes that will be used during the load or store (load/store)
    input logic       mem_write,            // If it will be a store or load instruction (load/store)
    input logic [31:0] store_data,          // Word that will be stored (byte, half or word) in the memory (store)
    input logic [31:0] mem_rdata,           // Word containing the data that was read from memory (load)
    output logic [31:0] mem_wdata,          // Word containing the repeated data that will be stored in the memory (store)
    output logic [3:0] mem_be,              // Enable to the desired bytes (store)
    output logic [31:0] load_data           // Value that goes to rd (load)
);
    logic [1:0] size, offset;
    /* verilator lint_off UNUSEDSIGNAL */
    logic [31:0] shifted;
    /* verilator lint_on UNUSEDSIGNAL */
    
    assign size = funct3[1:0];
    assign offset = addr[1:0];
    assign shifted = mem_rdata >> {offset, 3'b000};     // Não entendi o que isso faz

    // Loading combinational flow
    logic [31:0] lb_data, lh_data, lbu_data, lhu_data;
    assign lb_data = {{24{shifted[7]}}, shifted[7:0]};
    assign lh_data = {{16{shifted[15]}}, shifted[15:0]};
    assign lbu_data = {24'b0, shifted[7:0]};
    assign lhu_data = {16'b0, shifted[15:0]};

    always_comb begin
        case(funct3)
            3'b000  :   load_data = lb_data;
            3'b001  :   load_data = lh_data;
            3'b100  :   load_data = lbu_data;
            3'b101  :   load_data = lhu_data;
            default :   load_data = mem_rdata;
        endcase
    end

    // Storing combinational flow
    logic [31:0] sb_data, sh_data;
    assign sb_data = {4{store_data[7:0]}};
    assign sh_data = {2{store_data[15:0]}};
    
    always_comb begin
        case(size)
            2'b00   :   begin mem_wdata = sb_data; mem_be = 4'b0001 << offset;   end 
            2'b01   :   begin mem_wdata = sh_data; mem_be = 4'b0011 << offset;   end
            default :   begin mem_wdata = store_data; mem_be = 4'b1111;          end
        endcase
        if (!mem_write) mem_be = 4'b0000;
    end

endmodule
