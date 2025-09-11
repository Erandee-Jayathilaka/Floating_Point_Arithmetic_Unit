`timescale 1ns / 1ps

module FPU(
    input logic clk, 
    input logic rstn,
    input logic [31:0] num1,
    input logic [31:0] num2,
    input logic [1:0] op,  
    output logic [31:0] result 
);

    
    logic [31:0] S_add_sub;
    logic [31:0] S_mul;
    logic [31:0] S_div;

    

    
    AddSub AddSub_inst(
        .clk(clk), 
        .rstn(rstn), 
        .num1(num1), 
        .num2(num2), 
        .op(op),  // 1 for subtraction
        .S(S_add_sub)
    );

    
    Multiply Mul_inst(
        .clk(clk), 
        .rstn(rstn),
        .num1(num1),
        .num2(num2),
        .S(S_mul)
    );

    
    Divide Div_inst(
        .clk(clk), 
        .rstn(rstn),
        .num1(num1),
        .num2(num2),
        .S(S_div)
    );

    
    always_comb begin
        case (op)
            2'b00: result = S_add_sub;   
            2'b01: result = S_add_sub;   
            2'b10: result = S_mul;   
            2'b11: result = S_div;   
            default: result = 32'h00000000;  
        endcase
    end

endmodule
