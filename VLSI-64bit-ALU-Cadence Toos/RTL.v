`timescale 1ns / 1ps

module alu_64bit(
    input clk,        
    input rst_n,       
    input enable,      
    input  [63:0] A,           
    input  [63:0] B,           
    input  [3:0]  sel,          
    output reg [63:0]out,     
    output reg carryout,    
    output reg Zero,        
    output reg Sign,       
    output reg Overflow     
);
    reg [64:0] tmp;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            out <= 64'b0;
            carryout <= 1'b0;
            Zero <= 1'b0;
            Sign <= 1'b0;
            Overflow <= 1'b0;
        end else if (enable) begin
            case (sel)
                4'b0000: begin 
                    tmp = {1'b0, A} + {1'b0, B};
                    out <= tmp[63:0];
                    carryout <= tmp[64];
                    Overflow <= (A[63] == B[63]) && (tmp[63] != A[63]);
                end
                4'b0001: begin 
                    tmp = {1'b0, A} - {1'b0, B};
                    out <= tmp[63:0];
                    carryout <= tmp[64];
                    Overflow <= (A[63] != B[63]) && (tmp[63] != A[63]);
                end
                4'b0010: begin 
                    out  <= A & B;
                    carryout <= 1'b0;
                    Overflow <= 1'b0;
                end
                4'b0011: begin 
                    out <= A | B;
                    carryout <= 1'b0;
                    Overflow <= 1'b0;
                end
                4'b0100: begin 
                    out      <= A ^ B;
                    carryout <= 1'b0;
                    Overflow <= 1'b0;
                end
                4'b0101: begin
                    out      <= ~(A | B);
                    carryout <= 1'b0;
                    Overflow <= 1'b0;
                end
                4'b0110: begin 
                    out      <= ~(A & B);
                    carryout <= 1'b0;
                    Overflow <= 1'b0;
                end
                4'b0111: begin
                    out      <= ~(A ^ B);
                    carryout <= 1'b0;
                    Overflow <= 1'b0;
                end
                4'b1000: begin 
                    out      <= A << 1;
                    carryout <= A[63];
                    Overflow <= 1'b0;
                end
                4'b1001: begin 
                    out      <= A >> 1;
                    carryout <= A[0];
                    Overflow <= 1'b0;
                end
                4'b1010: begin 
                    out      <= $signed(A) >>> 1;
                    carryout <= A[0];
                    Overflow <= 1'b0;
                end
                4'b1011: begin 
                    out <= (A > B) ? 64'd1 : 64'd0;
                    carryout <= 1'b0;
                    Overflow <= 1'b0;
                end
                4'b1100: begin 
                    out <= (A == B) ? 64'd1 : 64'd0;
                    carryout <= 1'b0;
                    Overflow <= 1'b0;
                end
                4'b1101: begin 
                    out <= A * B;
                    carryout <= 1'b0;
                    Overflow <= 1'b0;
                end
                4'b1110: begin 
                    out <= (B != 0) ? A / B : 64'h4521457896541234;
                    carryout <= 1'b0;
                    Overflow <= 1'b0;
                end
                default: begin
                    out <= 64'b0;
                    carryout <= 1'b0;
                    Overflow <= 1'b0;
                end
            endcase
            Zero <= (out == 64'b0);
            Sign <= out[63];
        end
    end

endmodule

