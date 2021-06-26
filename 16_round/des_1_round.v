`include "f_function.v"
module des_1round(input[0:63] in,input[0:47] key,output[0:63] out);
wire [0:31] left;
wire [0:31] right;
wire [0:31] f_out;
assign left=in[0:31];
assign right=in[32:63];
feistel a1(right,key,f_out);
assign out[32:63]=f_out^left;
assign out[0:31]=right;
endmodule