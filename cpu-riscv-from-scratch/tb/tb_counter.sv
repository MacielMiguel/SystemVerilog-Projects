`timescale 1ns / 1ps

module tb_counter;

    localparam int L = 4;

    logic clk = 0, rst_n = 0, en = 0, max_v;
    logic [L-1:0] counts;
    int errors = 0, wraps = 0;

    always #5 clk = ~clk;

    counter #(.LENGTH(L)) dut (.clk(clk), .rst_n(rst_n), .en(en), .counts(counts), .max_v(max_v));

    initial begin
        #12 rst_n = 1;  
        @(negedge clk) en = 1;
        for (int i = 0; i < 40; i++) begin
            @(negedge clk);
            if (counts !== 4'((i+1) % 16)) begin 
                errors++;
                $display("Error! At %d, it was supposed to be %d.", counts, 4'((i + 1) % 16));
            end
        end 
        en = 0;
        repeat (3) @(negedge clk);
        if (counts !== 4'(40 % 16)) begin 
            errors++;
            $display("Error! it has counted values while en=0.");
            if (wraps != 2) begin 
                errors++; 
                $display("ERROR: wrap %0d vezes (esperado 2)", wraps); 
            end
            if (errors == 0) 
                $display("tb_counter: PASS");
            else             
                $display("tb_counter: FAIL (%0d erros)", errors);
            $finish;
        end

    end

    always @(posedge clk) if (max_v) wraps++;
endmodule
