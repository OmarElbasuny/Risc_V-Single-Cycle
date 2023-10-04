module main_decoder(OP,RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp);


input  [6:0] OP; 
output RegWrite;
output [1:0]ImmSrc;
output ALUSrc;
output MemWrite ;
output ResultSrc;
output Branch;
output [1:0]ALUOp;




assign RegWrite  =   ( OP == 7'b0000011  | OP == 7'b0110011 ) ? 1'b1 : 1'b0;
assign ImmSrc    =   ( OP == 7'b1100011  ) ? 2'b10 :
                     ( OP == 7'b0100011  ) ? 2'b01 : 00 ; 

assign ALUSrc    =   ( OP == 7'b0000011 | OP == 7'b0100011 ) ? 1'b1 : 1'b0 ;
assign MemWrite  =   ( OP == 7'b0100011  ) ? 1'b1 : 1'b0 ; 
assign ResultSrc =   ( OP == 7'b0000011  ) ? 1'b1 : 1'b0 ;  
assign Branch    =   ( OP == 7'b1100011  ) ? 1'b1 : 1'b0;   
assign ALUOp     =   ( OP == 7'b0110011  ) ? 2'b10 :
                     ( OP == 7'b1100011  ) ? 2'b01 : 2'b00;

                     

endmodule