/* This is a code to a sequence detector which is used as a practice of FSM in SystemVerilog */
// The FSM reads serial values of a sequence
module seq_detector (
    input logic clk, rst_n, din,
    output logic found
);
    typedef enum logic [2:0] {IDLE, S_1, S_10, S_101, S_1011} state_e;
    state_e state, next;

    // Sequential block is responsable for changing the value of state
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) state <= IDLE;
        else        state <= next; 
    end

    // Combinational block is responsable for determining the transitions in the states
    always_comb begin
        next = state;
        case (state)
            IDLE    : if (din) next = S_1;      else next = IDLE;
            S_1     : if (din) next = S_1;      else next = S_10;
            S_10    : if (din) next = S_101;    else next = IDLE;
            S_101   : if (din) next = S_1011;   else next = S_10;
            S_1011  : if (din) next = S_1;      else next = S_10;
            default : next = IDLE; 
        endcase
    end 

    // Ultima parte verifica se o valor de state chegou em algum momento ao ponto de 1011
    assign found = (state == S_1011);
endmodule
