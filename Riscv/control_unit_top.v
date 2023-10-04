`include "alu_decoder.v"
`include "main_decoder.v"


module control_unit ( OP,RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,funct3,funct7,ALUControl);

input [6:0] OP,funct7;
input [2:0] funct3;
output RegWrite,ALUSrc,MemWrite,ResultSrc,Branch;
output [1:0] ImmSrc;
output [2:0] ALUControl;

wire [1:0] ALUOp ;

main_decoder main_decoder
                        (
                        .OP(OP),
                        .RegWrite(RegWrite),
                        .ImmSrc(ImmSrc),
                        .ALUSrc(ALUSrc),
                        .MemWrite(MemWrite),
                        .ResultSrc(ResultSrc),
                        .Branch(Branch),
                        .ALUOp(ALUOp)
                        );


alu_decoder alu_decoder(
                        .ALUOp(ALUOp),
                        .funct3(funct3),
                        .op(OP),
                        .funct7(funct7),
                        .ALUControl(ALUControl)
                        );

    
endmodule