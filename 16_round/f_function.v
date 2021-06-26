`include "expansion.v"
`include "s_box.v"
`include "permutation.v"
 
module feistel(input[0:31] right,input[0:47] key, output[0:31]f_out); 
wire[0:47] exp_out;
wire[0:47] Xor_key;
wire[0:31] S_out;
expansion intance1(right,exp_out);
assign Xor_key= key^exp_out;
Sbox1 i1(Xor_key[0:5],S_out[0:3]);
Sbox2 i2(Xor_key[6:11],S_out[4:7]);
Sbox3 i3(Xor_key[12:17],S_out[8:11]);
Sbox4 i4(Xor_key[18:23],S_out[12:15]);
Sbox5 i5(Xor_key[24:29],S_out[16:19]);
Sbox6 i6(Xor_key[30:35],S_out[20:23]);
Sbox7 i7(Xor_key[36:41],S_out[24:27]);
Sbox8 i8(Xor_key[42:47],S_out[28:31]);
permute instance2(S_out,f_out);
endmodule
