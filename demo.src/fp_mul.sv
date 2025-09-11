`timescale 1ns / 1ps

module Multiply(
    input logic clk, rstn,
    input logic [31:0] num1,
    input logic [31:0] num2,
    output logic [31:0] S 
); 
    logic sign1, sign2;
    logic [23:0] frac1, frac2; 
    logic [7:0] expo1, expo2, exp_temp, exp_add;
    logic [22:0] fraction;
    logic [7:0] exponent;
    logic [47:0] result;
    logic c_out;
    logic [4:0] count;

    assign sign1 = num1[31];
    assign sign2 = num2[31];
    assign frac1 = rstn? {1'b1, num1[22:0]} : '0;
    assign frac2 = rstn? {1'b1, num2[22:0]} : '0;
    assign expo1 = num1[30:23];
    assign expo2 = num2[30:23];

    Multiply24 Mul (
        .clk(clk),
        .rstn(rstn),            
        .M(frac1),      
        .Q(frac2),      
        .R(result)
    );

    Add8 add (
        .A(expo1),      
        .B(expo2),      
        .S(exp_add)     
    );

    Sub8 sub (
        .A(exp_add),      
        .B(8'd127),      
        .S(exp_temp)      
    );

    always_comb begin
        if(!result[47]) begin
            fraction = result[45:23] + result[22];
            exponent = exp_temp;
        end else begin
            fraction = result[46:24] + result[23];
            exponent = exp_temp+1;
        end
    end

    assign S[31] = sign1^sign2;
    assign S[30:23] = exponent;
    assign S[22:0] = fraction;
endmodule
