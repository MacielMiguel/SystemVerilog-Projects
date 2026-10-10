/*
FIRST VERSION OF THE TESTBENCH FOR A SIMPLE ALU MODULE
*/

`timescale 1ns/1ps

module alu_tb;
    localparam int WIDTH = 4;
    localparam int MAX   = (1 << WIDTH);

    // ALU Operation codes
    localparam logic [2:0] OP_ADD = 3'b000;
    localparam logic [2:0] OP_SUB = 3'b001;
    localparam logic [2:0] OP_SHL = 3'b010;
    localparam logic [2:0] OP_SHR = 3'b011;
    localparam logic [2:0] OP_AND = 3'b100;
    localparam logic [2:0] OP_OR  = 3'b101;

  	// Standard variables to use in the reference function
    logic [WIDTH-1:0] a, b, result;
    logic [2:0]       op;

  	// Global Counters
    int n_tests  = 0;
    int n_errors = 0;

    // Instantiation
    alu #(.WIDTH(WIDTH)) dut (
        .a      (a),
        .b      (b),
        .op     (op),
        .result (result)
    );

    // Reference model to compare with the values obtained by the module
  function automatic logic [WIDTH-1:0] ref_model(
    input int ref_a, input int ref_b,
    input logic [2:0] ref_op
  );
        int ref_r;
    case (ref_op)
            OP_ADD:  ref_r = ref_a + ref_b;
            OP_SUB:  ref_r = ref_a - ref_b;              
            OP_SHL:  ref_r = ref_a * (2 ** ref_b);
            OP_SHR:  ref_r = ref_a / (2 ** ref_b);
            OP_AND:  ref_r = ref_a & ref_b;
            OP_OR:   ref_r = ref_a | ref_b;
            default: ref_r = 0;                   
        endcase
        return ref_r[WIDTH-1:0]; 
    endfunction

    // Task to compare the reference model with the module
  task automatic check(
    input logic [WIDTH-1:0] check_a,
    input logic [WIDTH-1:0] check_b,
    input logic [2:0]       check_op,
    input logic [WIDTH-1:0] exp_r			// Expected result
  );
        a  = check_a;
        b  = check_b;
        op = check_op;
        #1;                                // Time passes
        n_tests++;
    if (result !== exp_r) begin        
            n_errors++;
      $display("ERROR: op=%b a=%0d b=%0d -> obtained=%0d (%b) expected=%0d (%b)", check_op, check_a, check_b, result, result, exp_r, exp_r);
        end
    endtask

    // Testing
    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb);

        // 
        $display("--- Testes dirigidos ---");
        check(4'd15, 4'd1,    OP_ADD, 4'd0);      
        check(4'd7,  4'd8,    OP_ADD, 4'd15);
        check(4'd2,  4'd3,    OP_SUB, 4'b1111);   
        check(4'd5,  4'd5,    OP_SUB, 4'd0);
        check(4'd3,  4'd1,    OP_SHL, 4'd6);
        check(4'd1,  4'd3,    OP_SHL, 4'd8);
        check(4'd1,  4'd4,    OP_SHL, 4'd0);      
        check(4'd8,  4'd3,    OP_SHR, 4'd1);
        check(4'd15, 4'd5,    OP_SHR, 4'd0);
        check(4'b1010, 4'b0110, OP_AND, 4'b0010);
        check(4'b1010, 4'b0110, OP_OR,  4'b1110);
        check(4'd9,  4'd9,    3'b110, 4'd0);      
        check(4'd9,  4'd9,    3'b111, 4'd0);

        // All the combinations between a and b
      $display("--- Exhaustive tests ---");
        for (int o = 0; o < 8; o++)              
            for (int i = 0; i < MAX; i++)
                for (int j = 0; j < MAX; j++)
                    check(i[WIDTH-1:0], j[WIDTH-1:0], o[2:0], ref_model(i, j, o[2:0]));

        // Printing results from the tests
        $display("------------------------------------");
        if (n_errors == 0)
          $display("PASS: %0d tests, 0 errors", n_tests);
        else
          $display("FAIL: %0d tests, %0d errors", n_tests, n_errors);
        $display("------------------------------------");
        $finish;
    end  

endmodule