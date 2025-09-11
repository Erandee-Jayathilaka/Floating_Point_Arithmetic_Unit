`timescale 1ns / 1ps

module Division #(
    N = 48
)(
    input logic [N-1:0] M, 
    input logic [N-1:0] Q, //divisor
    input logic clk, rstn,
  	output logic [N/2-1:0] quotient,
    output logic [N/2-1:0] remainder,
    output logic normalize,
    output logic valid_out
);
    logic [N:0] R_temp, A;
    logic [N-1:0] M_copy, Q_copy; 
    logic [$clog2(N/2):0] c_bits;
    logic [N-1:0] subt;
    logic overflow;
    enum logic [1:0] {START, SUB, FINAL} state;
    
    
    always_ff @( posedge clk or negedge rstn ) begin : divisor
        if (!rstn) begin
            c_bits <= N/2+1;
            R_temp <= {1'b0, M};
            A <= ~Q + 1;
            {overflow, subt} <= M - Q;
            quotient <= 0; 
            normalize <= 0; 
            state <= START;
            M_copy <= M;  
            Q_copy <= Q;
            valid_out <= 1'b0;
        end

        else begin
            if (M_copy != M || Q_copy != Q) begin
                state <= START; 
            end
            
            case (state)
                START: begin
                    
 
                    normalize <= overflow;
                    R_temp <= R_temp >> !overflow;  // can be a edit
                    state <= SUB;
                    valid_out <= 1'b0;
                        // normalize <= 0;
                    end
                    
                // end  

                SUB: begin
                    if (c_bits > 0 && R_temp[N] == 0) begin
                        remainder <= R_temp[N-1:N/2];
                        c_bits <= c_bits - 1;
                        R_temp <= (R_temp << 1) - Q;
                        quotient[c_bits-1] <= 1; 

                    end

                    else if (c_bits > 0 && R_temp[N] == 1) begin
                        remainder <= R_temp[N-1:N/2];
                        c_bits <= c_bits - 1;
                        R_temp <= (R_temp << 1) + Q;
                        quotient[c_bits-1] <= 0; 
                    end

                    else begin
                        state <= FINAL;
                        valid_out <= 1'b1;
                    end    
                end

                FINAL: begin
                    // divisionReady <= 1;
                    c_bits <= N/2+1;
                    R_temp <= {1'b0, M};
                    A <= ~Q + 1;
                    M_copy <= M;  
                    Q_copy <= Q;
                end 
            endcase

        end        
    end
endmodule


