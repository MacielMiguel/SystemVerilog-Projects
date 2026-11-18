// Arithmetic Unit
module alu 
    import riscv_pkg::*;
(
    input alu_op_e alu_op,
    input logic [31:0] a, 
    input logic [31:0] b,
    output logic [31:0] y
);
    logic [4:0] aux;
    assign aux = b[4:0];

    always_comb begin
        case (alu_op)
            ALU_ADD   : y = a + b;
            ALU_SUB   : y = a - b;
            ALU_SLL   : y = a << aux;
            ALU_SRL   : y = a >> aux;
            ALU_SRA   : y = $unsigned($signed(a) >>> aux);
            ALU_SLT   : y = {31'b0, $signed(a) < $signed(b)};
            ALU_SLTU  : y = {31'b0, a < b};
            ALU_XOR   : y = a ^ b;
            ALU_AND   : y = a & b;
            ALU_OR    : y = a | b;
            default   : y = 32'b0;
        endcase
    end

endmodule
