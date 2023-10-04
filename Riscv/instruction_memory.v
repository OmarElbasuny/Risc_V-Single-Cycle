module instruction_memory(A,RD,rst);

input  [31:0]  A  ;
output [31:0]  RD ;
input   rst       ;

reg [31:0] mem [1023:0];


assign RD = (!rst) ? 32'h00000000 :mem [A[31:2]] ;
 
 initial 
 begin

//$readmemh("C:\Users\nocha\Downloads\Ref_model\risc v\mem.hex",mem);
mem[0]= 32'h0062E3B3;
mem[1]= 32'h0062F433;
 end

endmodule