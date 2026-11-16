`timescale 1ns / 1ps

module tb_ripc_adder;

    localparam int N = 8;
    logic [N-1:0] a, b, sum;
    logic cin, cout;
    int errors = 0;

    ripc_adder #(.N(N)) dut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        for (int i = 0; i < 2**N; i++) 
            for (int j = 0; j < 2**N; j++)
                for (int c = 0; c < 2; c++) begin  
                    a = i[N-1:0]; b = j[N-1:0]; cin = c[0]; 
                    #1
                    if ({cout, sum} !== a + b + cin) begin
                        errors++;
                        $display("Error with values a=%d, b=%d, c=%d giving values %d.", a, b, cin, {cout, sum});
                    end
                end
        if (errors == 0) $display("Pass! The system works well.");
        else $display("Fail! The system doens't work.");
        $finish;
    end
endmodule
