module Reg_file(A1,A2,A3,RD1,RD2,WD3,WE3,clk,rst);

input [4:0] A1,A2,A3;
input [31:0] WD3;
input WE3;
input clk,rst;

output [31:0] RD1,RD2;

reg [31:0] Registers [31:0];

always @ (posedge clk)
    begin
        if(WE3)
            Registers[A3] <= WD3;
    end
assign RD1 = (~rst)? 32'h00000000 : Registers[A1] ;
assign RD2 = (~rst)? 32'h00000000 : Registers[A2] ;

initial begin
        Registers[5] = 32'h00000005;
        Registers[6] = 32'h00000004;
        
    end



endmodule



