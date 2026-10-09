module alu #(
    parameter int WIDTH = 4
) (
    input logic [WIDTH-1:0] a, 
    input logic [WIDTH-1:0] b,
    input logic [2:0]       op,
    output logic [WIDTH-1:0] result
);

    always_comb begin
        result = '0;
        case (op)
            3'b000: result = a + b;
            3'b001: result = a - b;
            3'b010: result = a << b;
            3'b100: result = a & b;
            3'b101: result = a | b;
        endcase
    end
endmodule

