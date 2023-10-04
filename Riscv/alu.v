module alu (a,b,alucontrol,result,z_flag, carry_flag,Negative);
input [31:0] a,b ;
input [2:0] alucontrol;
output[31:0] result;
output Negative;
output carry_flag;
output  [31:0]z_flag;


wire  [31:0] sum ;
wire  [31:0]a_and_b;
wire  [31:0]a_or_b;
wire  [31:0]slt;
wire  [31:0]mux_1;
wire  [31:0]mux_2;
wire  [31:0] not_b;
wire cout;


assign {cout,sum} = a + mux_1 + alucontrol[0];
assign a_and_b = a & b;
assign a_or_b = a | b;
assign not_b = ~ b;
assign Z_flag = & (~result);
assign slt = (a<b)? 32'b00000000000000000000000000000001 : 32'b00000000000000000000000000000000 ;
assign mux1 = (alucontrol[0] == 1'b0  ) ? b : not_b;
assign Negative = Result[31];
assign carry_flag = (~ alucontrol[1] & cout);


assign {result} =  (alucontrol[2:0] == 3'b000)? sum  :
                (alucontrol[2:0] == 3'b001)? sum :
                (alucontrol[2:0] == 3'b010)? a_and_b :
                (alucontrol[2:0] == 3'b011)? a_or_b :
                (alucontrol[2:0] == 3'b101)? slt : 32'h00000000 ;
                

    
endmodule