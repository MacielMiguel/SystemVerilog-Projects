module ctrl_signals_unit 
    import riscv_pkg::*;
(
    input logic [31:0] instr,
    output ctrl_t       ctrl_signals
);
    // Defining variables used to decode the instructions
    logic [6:0] opcode;
    logic [2:0] funct3;
    logic       funct7;

    assign opcode = instr[6:0];
    assign funct3 = instr[14:12];
    assign funct7 = instr[30];

    // Creating a function to decode alu funct3 and funct7
    function automatic alu_op_e alu_decoder(input logic [2:0] f_funct3, input logic f_funct7, input logic is_reg);
        case (f_funct3)
            3'b000 : return (is_reg && f_funct7) ? ALU_SUB : ALU_ADD;
            3'b001 : return ALU_SLL;
            3'b010 : return ALU_SLT;
            3'b011 : return ALU_SLTU;
            3'b100 : return ALU_XOR;
            3'b101 : return (f_funct7) ? ALU_SRA : ALU_SRL;
            3'b110 : return ALU_OR;
            default : return ALU_AND;
        endcase
    endfunction

    // Combinational circuit that lies the signals to its opcode class
    always_comb begin
        // Standar signal values that doesn't operates on anything
        ctrl_signals            = '0;
        ctrl_signals.src_a      = SRC_A_RS1;
        ctrl_signals.alu_op     = ALU_ADD;
        ctrl_signals.imm_type   = IMM_I;
        ctrl_signals.result_src = RES_ALU;

        case(opcode)
            OP_LUI: begin
                ctrl_signals.reg_write = 1'b1;
                ctrl_signals.src_a     = SRC_A_ZERO;
                ctrl_signals.src_b_imm = 1'b1;
                ctrl_signals.imm_type  = IMM_U;
            end
            OP_AUIPC: begin
                ctrl_signals.reg_write = 1'b1;
                ctrl_signals.src_a     = SRC_A_PC;
                ctrl_signals.src_b_imm = 1'b1;
                ctrl_signals.imm_type  = IMM_U;
            end
            OP_JAL: begin
                ctrl_signals.reg_write  = 1'b1;
                ctrl_signals.result_src = RES_PC4;
                ctrl_signals.imm_type   = IMM_J;
                ctrl_signals.jal        = 1'b1;
            end
            OP_JALR: begin
                ctrl_signals.reg_write  = 1'b1;
                ctrl_signals.result_src = RES_PC4;
                ctrl_signals.src_b_imm  = 1'b1;
                ctrl_signals.imm_type   = IMM_I;
                ctrl_signals.jalr       = 1'b1;
            end
            OP_BRANCH: begin
                ctrl_signals.imm_type = IMM_B;
                ctrl_signals.branch   = 1'b1;
            end
            OP_LOAD: begin
                ctrl_signals.reg_write  = 1'b1;
                ctrl_signals.src_b_imm  = 1'b1;
                ctrl_signals.imm_type   = IMM_I;
                ctrl_signals.result_src = RES_MEM;
            end
            OP_STORE: begin
                ctrl_signals.src_b_imm = 1'b1;
                ctrl_signals.imm_type  = IMM_S;
                ctrl_signals.mem_write = 1'b1;
            end
            OP_IMM: begin
                ctrl_signals.reg_write = 1'b1;
                ctrl_signals.src_b_imm = 1'b1;
                ctrl_signals.imm_type  = IMM_I;
                ctrl_signals.alu_op    = alu_decoder(funct3, funct7, 1'b0);
            end
            OP_REG: begin
                ctrl_signals.reg_write = 1'b1;
                ctrl_signals.alu_op    = alu_decoder(funct3, funct7, 1'b1);
            end
            OP_FENCE: begin
                // No caches so Fence turns into a NOP
            end
            OP_SYSTEM: begin
                ctrl_signals.halt = 1'b1;                 // ECALL / EBREAK (no CSRs in this core)
            end
            default: begin
                ctrl_signals.illegal = 1'b1;
            end
        endcase
    end
endmodule
