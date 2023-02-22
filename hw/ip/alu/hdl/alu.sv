//
// Author: Amandeep Gill
//
// Simple ALU following RV32I opcodes

`include "alu_defines.sv"

module alu #(
    parameter XLEN = 32;
) (
    input                       clk,
    input  logic [XLEN - 1:0]   in1,
    input  logic [XLEN - 1:0]   in2,
    input  logic [       3:0]   op,
    output logic [XLEN - 1:0]   out
);

    logic [XLEN-1:0] out_int;
    always @(posedge clk)
        out <= out_int;
        
    always_comb 
    begin
        case (op)
        ADD: out_int = in1 + in2;
        SUB: out_int = in1 - in2;
        SLL: out_int = in1 << in2;
        SLT: out_int = $signed(in1) < $signed(in2);
        SLTU: out_int = in1 < in2;
        XOR: out_int = in1 ^ in2;
        SRL: out_int = in1 >> in2;
        SRA: out_int = in1 >>> in2;
        OR : out_int = in1 | in2;
        AND: out_int = in1 & in2;
        default: out_int = 4'bxxxx;
        endcase
    end
endmodule

