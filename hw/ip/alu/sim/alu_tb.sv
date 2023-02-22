`timescale 1ns/1ps

`include "alu_defines.sv"

module alu_tb;

localparam XLEN = 32;
localparam CLK_PERIOD = 10;  // 10 ns period = 100 MHz clk

logic               clk;
logic [XLEN - 1:0]  in1;
logic [XLEN - 1:0]  in2;
logic [       3:0]  op;
logic [XLEN - 1:0]  out;

initial
begin
    clk = 0;
    forever #CLK_PERIOD clk = ~clk;
end

alu DUT (
    .clk(clk),
    .in1(in1),
    .in2(in2),
    .op(op),
    .out(out)
);

initial 
begin
    in1 = 'd0;
    in2 = 'd0;
    op = 'dxxxx;
    #CLK_PERIOD;
end

initial
begin
    #CLK_PERIOD;
    op = ADD;
    in1 = 'd5;
    #CLK_PERIOD;
    in2 = 'd3;

    #CLK_PERIOD;
    op = SUB;
    #CLK_PERIOD;
    op = XOR;
    #CLK_PERIOD;
    op = SLL;
    #CLK_PERIOD;
    op = SLT;
    #CLK_PERIOD;
    op = SRL;
    #CLK_PERIOD;
    op = SRA;
    #CLK_PERIOD;
    op = OR;
    #CLK_PERIOD;
    op = AND;
    #CLK_PERIOD;
end


endmodule