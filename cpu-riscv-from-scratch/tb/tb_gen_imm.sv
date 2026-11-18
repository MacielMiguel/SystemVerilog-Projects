`timescale 1ns/1ps
module tb_gen_imm;
    import riscv_pkg::*;

    logic [31:0] instr, imm;
    imm_type_e   imm_type;
    int          errors = 0;

    gen_imm dut (.instr(instr), .imm_type(imm_type), .imm(imm));

    task automatic check(
        input logic [31:0] i,
        input imm_type_e t,
        input logic [31:0] expected,
        input string asm_txt
    );
        instr = i; imm_type = t;
        #1;
        if (imm !== expected) begin
            errors++;
            $display("ERROR! %-22s instr=%h type=%s imm=%h (expected %h)", asm_txt, i, t.name(), imm, expected);
        end
    endtask

    initial begin
        check(32'hfff00093, IMM_I, 32'hffff_ffff, "addi ra,zero,-1");
        check(32'h7ff00093, IMM_I, 32'h0000_07ff, "addi ra,zero,2047");
        check(32'h40735293, IMM_I, 32'h0000_0407, "srai t0,t1,7");       // funct7 aparece no imm!
        check(32'hfe20ae23, IMM_S, 32'hffff_fffc, "sw sp,-4(ra)");
        check(32'h06531223, IMM_S, 32'h0000_0064, "sh t0,100(t1)");
        check(32'hfe000ee3, IMM_B, 32'hffff_fffc, "beq zero,zero,.-4");
        check(32'h00209463, IMM_B, 32'h0000_0008, "bne ra,sp,.+8");
        check(32'h123450b7, IMM_U, 32'h1234_5000, "lui ra,0x12345");
        check(32'hfffff197, IMM_U, 32'hffff_f000, "auipc gp,0xfffff");
        check(32'h7fc000ef, IMM_J, 32'h0000_07fc, "jal ra,.+2044");
        check(32'hfecff06f, IMM_J, 32'hffff_f7ec, "j .-2068");

        if (errors == 0) $display("tb_imm_gen: PASS");
        else             $display("tb_imm_gen: FAIL (%0d errors)", errors);
        $finish;
    end
endmodule
