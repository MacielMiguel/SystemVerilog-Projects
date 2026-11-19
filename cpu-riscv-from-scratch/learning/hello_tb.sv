`timescale 1ns / 1ps 

module hello_tb;

    logic   clk = 0;
    logic [3:0] counter = 0;

    always #4 clk <= ~clk;

    always @(posedge clk)
        counter <= counter + 1;

    initial begin
        $monitor("t=%0t counter=%0d", $time, counter);
        $display("Hello! at the time instant %t", $time);
        $dumpfile("hello.vcd");         // File to store the data
        $dumpvars(0, hello_tb);
        #100;                        // It passes 100 ns
        $display("Now at the time instant %0t the counter value is %0d", $time, counter);    
        $finish;                
    end 

endmodule
