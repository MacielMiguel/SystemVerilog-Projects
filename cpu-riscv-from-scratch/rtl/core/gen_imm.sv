// Creating the immediates depending on the instruction received

module gen_imm 
    import riscv_pkg::*;
(
    input logic [31:0] instr,
    input imm_type_e imm_type,
    output logic [31:0] imm
);
    // Crio all tipos de immediato a partir da instrução
    logic [31:0] imm_i, imm_s, imm_b, imm_u, imm_j;

    assign imm_i = {{20{instr[31]}}, instr[31:20]};
    assign imm_s = {{20{instr[31]}}, instr[31:25], instr[11:7]};
    assign imm_b = {{19{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
    assign imm_u = {instr[31:12], 12'b0};
    assign imm_j = {{11{instr[31]}}, instr[31], instr[19:12], instr[20], instr[30:21], 1'b0};

    // Crio um bloco combinacional que é responsavel por instanciar o valor o imediato certo para o imediato de saida
    always_comb begin
        case (imm_type)
            IMM_I : imm = imm_i;
            IMM_S : imm = imm_s;
            IMM_B : imm = imm_b;
            IMM_U : imm = imm_u;
            IMM_J : imm = imm_j;
        endcase
    end
endmodule
