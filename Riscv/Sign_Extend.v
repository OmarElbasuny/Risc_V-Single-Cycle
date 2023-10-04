module sign_extend (in,ImmExt,ImmSrc);

input [31:0] in;
input ImmSrc ;
output [31:0] ImmExt;

assign ImmExt = (ImmSrc == 1)? ({{20{In[31]}},In[31:25],In[11:7]}) :
                               {{20{in[31]}},in[31:20]} ;
                               

    
     
endmodule