`timescale 1ns / 1ps

module tb_seq_detector;

    logic clk = 0, rst_n = 0, din=0, found;
    int hits = 0;
    logic  [15:0] bitstream = 16'b1011011_1001_01100;       // number of 1011 is 3

    always #5 clk = ~clk;
    seq_detector dut (.clk(clk), .rst_n(rst_n), .din(din), .found(found));

    initial begin
        #12 rst_n = 1;
        for(int i = 15; i > 0; i--) begin
            @(negedge clk) din = bitstream[i];
            $dumpfile("tb_seq_detector.vcd");
            $dumpvars(0, tb_seq_detector);
        end
        @(negedge clk)
        if (hits == 3)  $display("PASS! The system is detecting the sequence.");
        else            $display("FAIL! The system is not detecting the sequence.");
        $finish;
    end 

    always @(posedge clk) if (found) hits++;
endmodule