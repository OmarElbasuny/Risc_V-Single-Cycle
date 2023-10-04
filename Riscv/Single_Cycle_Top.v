`include "Pc.v"
`include "instruction_memory.v"
`include "Register_file.v"
`include "Sign_Extend.v"
`include "alu.v"
`include "control_unit_top.v"
`include "Pc_Adder.v"
`include "Data_memory.v"
`include "MUX.v"

module Single_cycle_top (clk,rst);
input clk,rst;

wire  [31:0] Pc_Top,RD_instr,ReadData,RD1_Top,ImmExt_Top,result_top,PCPlus4,RD2_Top,SrcB,mux_result;
wire  RegWrite,MemWrite,ALUSrc;
wire  [1:0] ImmSrc ;
wire  [2:0] ALUControl_Top;

P_C P_C (
         .PCNext(PCPlus4),
         .PC(Pc_Top),
         .clk(clk),
         .rst(rst)
         );

instruction_memory instruction_memory (
                                      .A(Pc_Top),
                                      .RD(RD_instr),
                                      .rst(rst)
                                      );

Reg_file Reg_file(
         .A1(RD_instr[19:15]),
         .A2(RD_instr[24:20]),
         .A3(RD_instr[11:7]),
         .RD1(RD1_Top),
         .RD2(RD2_Top),
         .WD3(mux_result),
         .WE3(RegWrite),
         .clk(clk),
         .rst(rst)
         ); 
   
sign_extend sign_extend  (
                         .in(RD_instr),
                         .ImmExt(ImmExt_Top),
                         .ImmSrc()
                         )  ;

alu alu(
       .a(RD1_Top),
       .b(SrcB),
       .alucontrol(ALUControl_Top),
       .result(result_top),
       .z_flag(),
       .Negative(),
       . carry_flag()
       ) ;

alu_decoder alu_decoder (
                       .ALUOp(),
                       .funct3(),
                       .op(),
                       .funct7(),
                       .ALUControl()
                       );

control_unit control_unit (
                         .OP(RD_instr[6:0]),
                         .RegWrite(RegWrite),
                         .ImmSrc(ImmSrc),
                         .ALUSrc(ALUSrc),
                         .MemWrite(MemWrite),
                         .ResultSrc(),
                         .Branch(),
                         .funct3(RD_instr[14:12]),
                         .funct7(),
                         .ALUControl(ALUControl_Top)
                         ) ; 



 


Data_Memory Data_Memory  (
                         .A(result_top),
                         .RD(ReadData),
                         .WD(RD2_Top),
                         .WE(MemWrite),
                         .clk(clk)
                         ) ;

Pc_adder Pc_adder (
                  .a(Pc_Top),
                  .b(32'd4),
                  .c(PCPlus4)
                  ) ; 

Mux Mux(
       .a(RD2_Top),
       .b(ImmExt_Top),
       .s(ALUSrc),
       .c(SrcB)
        ); 

      
 Mux Mux_DataMemory_to_Register(
       .a(result_top),
       .b(ReadData),
       .s(ResultSrc),
       .c(mux_result)
        );                                                                          
endmodule