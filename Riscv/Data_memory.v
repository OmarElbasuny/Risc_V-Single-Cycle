module Data_Memory (A,RD,WD,WE,clk);

input [31:0] A,WD;
input clk;
input WE;

output [31:0] RD ;

reg [31:0] Data_mem [1023 :0];

assign RD =  Data_mem[A];

always @(posedge clk) begin
    if (WE) begin
        Data_mem[A] <= WD ;
        
    end
    
end

    
    
endmodule