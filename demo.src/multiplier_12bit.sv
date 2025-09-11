`timescale 1ns / 1ps

module Multiply12 #(
    parameter N = 12
)(
    input logic clk,
    input logic rstn, 
    input logic [N-1:0] M,
    input logic [N-1:0] Q,
    output logic [2*N-1:0] R
);

    logic [4*N-1:0] R_temp; 

    Multiply6 Mul1 (
        .M(M[0 +: N/2]),       
        .Q(Q[0 +: N/2]),       
        .clk(clk),            
        .rstn(rstn),         
        .R(R_temp[0 +: N])  
    ); 

    Multiply6 Mul2 (
        .M(M[0 +: N/2]),       
        .Q(Q[N/2 +: N/2]),      
        .clk(clk),            
        .rstn(rstn),         
        .R(R_temp[N +: N])  
    ); 

    Multiply6 Mul3 (
        .M(M[N/2 +: N/2]),     
        .Q(Q[0 +: N/2]),       
        .clk(clk),            
        .rstn(rstn),          
        .R(R_temp[2*N +: N])  
    ); 

    Multiply6 Mul4 (
        .M(M[N/2 +: N/2]),      
        .Q(Q[N/2 +: N/2]),      
        .clk(clk),           
        .rstn(rstn),          
        .R(R_temp[3*N +: N])  
    ); 

    always_comb begin
        R[N/2-1:0] = R_temp[N/2-1:0];
        R[2*N-1:N/2] = R_temp[N-1:N/2] + R_temp[N +: N] + R_temp[2*N +: N];
        R[2*N-1:N] = R[2*N-1:N] + R_temp[3*N +: N];
    end

endmodule



