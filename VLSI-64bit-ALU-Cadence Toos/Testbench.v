`timescale 1ns / 1ps

module alu_64bit_tb;
    reg clk;
    reg rst_n;
    reg enable;
    reg [63:0] A, B;
    reg [3:0] sel;
    wire [63:0] out;
    wire carryout;
    wire Zero;
    wire Sign;
    wire Overflow;
    alu_64bit uut (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .A(A),
        .B(B),
        .sel(sel),
        .out(out),
        .carryout(carryout),
        .Zero(Zero),
        .Sign(Sign),
        .Overflow(Overflow)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
initial begin
    rst_n = 0; enable = 0;
    A = 64'd0;            
    B = 64'd0;            
    sel = 4'b0000;       
    #15;
    rst_n = 1;
    #10;
    enable = 1;
    A = 64'd10;           
    B = 64'd20;           
    sel = 4'b0000;        
    #10;
    A = 64'd50;           
    B = 64'd30;           
    sel = 4'b0001;        
    #10;
    A = 64'd17361641481138401520; 
    B = 64'd1085102592571150095;  
    sel = 4'b0010;                
    #10;
    sel = 4'b0011;                
    #10;
    sel = 4'b0100;                
    #10;
    A = 64'd9223372036854775808;
    sel = 4'b1000;               
    #10;
    A = 64'd100;          
    B = 64'd50;           
    sel = 4'b1011;        
    #10;
    A = 64'd100;          
    B = 64'd25;           
    sel = 4'b1110;         
    #10;
    B = 64'd0;             
    sel = 4'b1110;         
    #10;
    enable = 0;
    #10;
    $stop;
end
endmodule
