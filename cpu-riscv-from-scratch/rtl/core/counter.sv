// Creating a counter to understand the always_ff
module counter #(
    parameter int LENGTH = 5
    )(
       input logic clk, rst_n, en,
       output logic [LENGTH-1:0] counts,
       output logic max_v
);
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) counts <= '0;
        else if (en) counts <= counts + 1'b1; 
    end

    assign max_v = en && (counts == {LENGTH{1'b1}});
endmodule