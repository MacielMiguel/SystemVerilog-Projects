`timescale 1ns/1ps
module tb_regfile;

    logic        clk = 0;
    logic        we;
    logic [4:0]  rs1_addr, rs2_addr, rd_addr;
    logic [31:0] rd_data, rs1_data, rs2_data;
    int          errors = 0;

    always #5 clk = ~clk;   

    regfile dut (   
        .clk(clk), .we(we),
        .rs1_addr(rs1_addr), .rs2_addr(rs2_addr), .rd_addr(rd_addr),
        .rd_data(rd_data), .rs1_data(rs1_data), .rs2_data(rs2_data)
    );

    task automatic write_reg(input logic [4:0] r, input logic [31:0] v);
        @(negedge clk);                         // changing the inputs out of the active region
        we = 1; rd_addr = r; rd_data = v;
        @(negedge clk);
        we = 0; 
    endtask

    initial begin
        we = 0; rs1_addr = 0; rs2_addr = 0; rd_addr = 0; rd_data = 0;

        for (int i = 0; i < 32; i++) write_reg(i[4:0], 32'hA5A5_0000 + i);

        // Reads the values
        for (int r = 0; r < 32; r++) begin
            logic [31:0] exp1, exp2;
            rs1_addr = r[4:0];
            rs2_addr = 5'(31 - r);
            #1;
            exp1 = (r == 0)      ? 32'h0 : 32'hA5A5_0000 + r;
            exp2 = (31 - r == 0) ? 32'h0 : 32'hA5A5_0000 + (31 - r);
            if (rs1_data !== exp1) begin errors++; $display("ERROR rs1 x%0d = %h (expected %h)", r, rs1_data, exp1); end
            if (rs2_data !== exp2) begin errors++; $display("ERROR rs2 x%0d = %h (expected %h)", 31-r, rs2_data, exp2); end
        end

        // Asynchronous reading
        rs1_addr = 5'd7;
        write_reg(5'd7, 32'hDEAD_BEEF);
        if (rs1_data !== 32'hDEAD_BEEF) begin errors++; $display("ERROR: reading right after writing"); end

        if (errors == 0) $display("tb_regfile: PASS");
        else             $display("tb_regfile: FAIL (%0d errors)", errors);
        $finish;
    end
endmodule