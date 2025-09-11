`timescale 1ns / 1ps

module AddMantissa #(
    parameter N = 24
)(
    input logic [N-1:0] A,
    input logic [N-1:0] B,
    input logic c_in,
    output logic [N-1:0] S,
    output logic c_out
);

    logic [N:0] C;
    assign C[0] = c_in;
    assign c_out = C[N];
    
     Add8 #(.N(8)) add0 (
        .A(A[7:0]), 
        .B(B[7:0]), 
        .S(S[7:0])
    );

    Add8 #(.N(8)) add1 (
        .A(A[15:8]), 
        .B(B[15:8]), 
        .S(S[15:8])
    );

    Add8 #(.N(8)) add2 (
        .A(A[23:16]), 
        .B(B[23:16]), 
        .S(S[23:16])
    );

    Add8 #(.N(8)) add3 (
        .A(A[31:24]), 
        .B(B[31:24]), 
        .S(S[31:24])
    );
	 
	/* genvar i;

    generate
        for (i = 0; i < N; ++i) begin: add
            full_adder fa(
                .a(A[i]),
                .b(B[i]^c_in),
                .c_in(C[i]),
                .c_out(C[i+1]),
                .sum(S[i])
            );            
        end
    endgenerate*/
endmodule