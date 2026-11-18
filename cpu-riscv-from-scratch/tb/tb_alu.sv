`timescale 1ns / 1ps

module tb_alu;
    import riscv_pkg::*;

    // Starting the system 
    logic [31:0] a, b, y;
    alu_op_e    op;
    int         checks = 0;
    int         errors = 0;

    alu dut (.alu_op(op), .a(a), .b(b), .y(y));

    // Creating the function and the task used to evaluate the system
    function automatic logic [31:0] model(
        alu_op_e f_op, logic [31:0] f_a, logic [31:0] f_b
    );
        case (f_op)
            ALU_ADD   : return f_a + f_b;
            ALU_SUB   : return f_a - f_b;
            ALU_SLL   : return f_a << f_b[4:0];
            ALU_SRL   : return f_a >> f_b[4:0];
            ALU_SRA   : return $unsigned($signed(f_a) >>> f_b[4:0]);
            ALU_SLT   : return ($signed(f_a) < $signed(f_b)) ? 32'd1 : 32'd0;
            ALU_SLTU  : return (f_a < f_b) ? 32'd1 : 32'd0;
            ALU_XOR   : return f_a ^ f_b;
            ALU_AND   : return f_a & f_b;
            ALU_OR    : return f_a | f_b;
            default   : return 32'b0;
        endcase
    endfunction

    task automatic check();
        logic [31:0] expected_res;
        #1;
        expected_res = model(op, a, b);
        checks++;
        if(expected_res !== y) begin
            errors++;
            $display("Error in the set op = %d, a = %d, b = %d.", 4'(op), a, b);
        end
    endtask 

    // Creating the simulation to test the sets
    logic [31:0] corners[6];

    initial begin
        corners[0] = 32'h0;          
        corners[1] = 32'h1;
        corners[2] = 32'h7fff_ffff;  
        corners[3] = 32'h8000_0000;
        corners[4] = 32'hffff_ffff;  
        corners[5] = 32'd31;

        // Checking the corner values
        for (int k = 0; k < 10; k++) begin
            op = alu_op_e'(k);
            foreach (corners[i]) foreach (corners[j]) begin
                a = corners[i]; b = corners[j]; check();
            end
        end

        // Checking 20000 random sets 
        repeat (20000) begin
            op = alu_op_e'($urandom_range(0, 9));
            a  = $urandom();
            b  = $urandom();
            check();
        end

        if (errors == 0) $display("tb_alu: PASS (%0d verifications)", checks);
        else             $display("tb_alu: FAIL (%0d errors in %0d verifications)", errors, checks);
        $finish;
    end 
endmodule