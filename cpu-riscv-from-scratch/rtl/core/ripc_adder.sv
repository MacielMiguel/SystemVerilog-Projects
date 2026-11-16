// Ripple-carry adder based on individuals full_adder.sv
module ripc_adder #(
    parameter int N = 8
)(
    input logic [N-1:0] a, b,
    input logic cin,
    output logic [N-1:0] sum,
    output logic cout 
);
    logic [N:0] carries;
    assign carries[0] = cin;

    for (genvar i = 0; i < N; i++) begin : gen_it
        full_adder unit_fa (
            .a (a[i]),
            .b (b[i]),
            .cin (carries[i]),
            .sum (sum[i]),
            .cout (carries[i+1])
        );
    end

    assign cout = carries[N];
endmodule