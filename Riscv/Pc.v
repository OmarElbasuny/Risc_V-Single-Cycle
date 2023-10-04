module P_C(PCNext,PC,clk,rst);

input  [31:0] PCNext ;
output [31:0] PC     ;
input   clk          ; 
input   rst          ;
reg [31:0]PC ;
always @(posedge clk) begin
    if (~rst) 
    begin

        PC <= 32'h00000000 ;
    end

 else 
    begin
        PC <= PCNext;

    end
end
endmodule