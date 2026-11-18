/* Creating package to use inside all the modules */
package riscv_pkg;
/* verilator lint_off UNUSEDPARAM */
/* 
    OP CODES RV32I  (Bits [6:0] inside the instructions)
*/

    localparam logic [6:0] OP_LUI       = 7'b0110111;
    localparam logic [6:0] OP_AUIPC     = 7'b0010111;
    localparam logic [6:0] OP_JAL       = 7'b1101111;
    localparam logic [6:0] OP_JALR      = 7'b1100111;
    localparam logic [6:0] OP_BRANCH    = 7'b1100011;
    localparam logic [6:0] OP_LOAD      = 7'b0000011;
    localparam logic [6:0] OP_STORE     = 7'b0100011;
    localparam logic [6:0] OP_IMM       = 7'b0010011;
    localparam logic [6:0] OP_REG       = 7'b0110011;
    localparam logic [6:0] OP_FENCE     = 7'b0001111;
    localparam logic [6:0] OP_SYSTEM    = 7'b1110011;

/*
    ALU OPERATIONS (Creating the types used)
*/

    typedef enum logic [3:0] {
        ALU_ADD, ALU_SUB, ALU_SLL, ALU_SRL, ALU_SRA,
        ALU_SLT, ALU_SLTU, ALU_XOR, ALU_AND, ALU_OR
    } alu_op_e;

    // Immediate format
    typedef enum logic [2:0] { IMM_I, IMM_S, IMM_B, IMM_U, IMM_J } imm_type_e;

    // Selecting the operand A for the ALU
    typedef enum logic [1:0] { SRC_A_RS1, SRC_A_PC, SRC_A_ZERO } src_a_e;

    // Selecting the value to be written at rd
    typedef enum logic [1:0] { RES_ALU, RES_MEM, RES_PC4 } result_src_e;

/*
    Signals to be used by the decoder
*/

    typedef struct packed {
        logic        reg_write;      // Writes at rd
        src_a_e      src_a;          // Source of ALU's A operand    
        logic        src_b_imm;      // 1: the operand B = immediate, if 0: rs2
        alu_op_e     alu_op;         // ALU operation
        imm_type_e   imm_type;       // Immediate type
        result_src_e result_src;     // Source of the value that is written at rd
        logic        mem_write;      // If we have to store
        logic        branch;         // If there's a conditional branch
        logic        jal;            // If there's an inconditional jump in regads to the PC
        logic        jalr;           // If there's an undirect jump (rs1 + imm)
        logic        halt;           // ECALL / EBREAK: for the simulation
        logic        illegal;        // if opcode is unknown
    } ctrl_t;

    /* verilator lint_on UNUSEDPARAM */

endpackage
