`timescale 1ns / 1ps

module Multiply6#(
    parameter N = 6
)(
    input logic clk,
    input logic rstn, 
    input logic [N-1:0] M,
    input logic [N-1:0] Q,
    output logic [2*N-1:0] R
);

    logic [4*N-1:0] R_temp; 

    Multiply3 Mul1 (
        .clk(clk),            
        .rstn(rstn),  
        .M(M[0 +: N/2]),       
        .Q(Q[0 +: N/2]),            
        .R(R_temp[0 +: N])  
    ); 

    Multiply3 Mul2 (
        .clk(clk),            
        .rstn(rstn),  
        .M(M[0 +: N/2]),       
        .Q(Q[N/2 +: N/2]),      
        .R(R_temp[N +: N])  
    ); 

    Multiply3 Mul3 (
        .clk(clk),            
        .rstn(rstn),  
        .M(M[N/2 +: N/2]),     
        .Q(Q[0 +: N/2]),       
        .R(R_temp[2*N +: N])  
    ); 

    Multiply3 Mul4 (
        .clk(clk),            
        .rstn(rstn),  
        .M(M[N/2 +: N/2]),      
        .Q(Q[N/2 +: N/2]),      
        .R(R_temp[3*N +: N])  
    ); 

    always_comb begin
        R[N/2-1:0] = R_temp[N/2-1:0];
        R[2*N-1:N/2] = R_temp[N-1:N/2] + R_temp[N +: N] + R_temp[2*N +: N];
        R[2*N-1:N] = R[2*N-1:N] + R_temp[3*N +: N];
    end
endmodule



