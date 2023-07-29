module top(
    input wire clk,

    // Button input
    input wire B,

    // FF outputs, LED outputs
    output reg R1, NR1, R0, NR0,
    output D0, D1
);
    wire R1_PLUS, R0_PLUS;

    // Instantiate flip-flops
    d_flip_flop ff_R1 (.clk(clk), .d(R1_PLUS), .q(R1), .nq(NR1));
    d_flip_flop ff_R0 (.clk(clk), .d(R0_PLUS), .q(R0), .nq(NR0));

    // Combinational logic to calculate D inputs for the flip-flops
    assign R1_PLUS = ~(((~(NR0 & ~B)) & (~((NR1 & R0) & B))) & (~((R1 & R0) & ~B)));
    assign R0_PLUS = ~((~(NR1 & B) & ~(R0 & B)) & (~((R1 & NR0) & ~B)));

    // Output bits: D1, D0
    assign D1 = ~(NR1 | NR0);
    assign D0 = ~((~(NR1 & NR0)) & (~(R1 & R0)));


endmodule

module d_flip_flop(
    input wire clk,
    input wire d,
    output reg q,
    output reg nq
);

    always @(posedge clk) begin
        q <= d;
        nq <= ~d;
    end

endmodule
