module IP(input [1:64] in, output [1:64] out);
  assign out[1] = in[58];
  assign out[2] = in[50];
  assign out[3] = in[42];
  assign out[4] = in[34];
  assign out[5] = in[26];
  assign out[6] = in[18];
  assign out[7] = in[10];
  assign out[8] = in[2];
  assign out[9] = in[60];
  assign out[10] = in[52];
  assign out[11] = in[44];
  assign out[12] = in[36];
  assign out[13] = in[28];
  assign out[14] = in[20];
  assign out[15] = in[12];
  assign out[16] = in[4];
  assign out[17] = in[62];
  assign out[18] = in[54];
  assign out[19] = in[46];
  assign out[20] = in[38];
  assign out[21] = in[30];
  assign out[22] = in[22];
  assign out[23] = in[14];
  assign out[24] = in[6];
  assign out[25] = in[64];
  assign out[26] = in[56];
  assign out[27] = in[48];
  assign out[28] = in[40];
  assign out[29] = in[32];
  assign out[30] = in[24];
  assign out[31] = in[16];
  assign out[32] = in[8];
  assign out[33] = in[57];
  assign out[34] = in[49];
  assign out[35] = in[41];
  assign out[36] = in[33];
  assign out[37] = in[25];
  assign out[38] = in[17];
  assign out[39] = in[9];
  assign out[40] = in[1];
  assign out[41] = in[59];
  assign out[42] = in[51];
  assign out[43] = in[43];
  assign out[44] = in[35];
  assign out[45] = in[27];
  assign out[46] = in[19];
  assign out[47] = in[11];
  assign out[48] = in[3];
  assign out[49] = in[61];
  assign out[50] = in[53];
  assign out[51] = in[45];
  assign out[52] = in[37];
  assign out[53] = in[29];
  assign out[54] = in[21];
  assign out[55] = in[13];
  assign out[56] = in[5];
  assign out[57] = in[63];
  assign out[58] = in[55];
  assign out[59] = in[47];
  assign out[60] = in[39];
  assign out[61] = in[31];
  assign out[62] = in[23];
  assign out[63] = in[15];
  assign out[64] = in[7];
endmodule
module IP_inv(input [1:64] in, output [1:64] out);
  assign out[1] = in[40];
  assign out[2] = in[8];
  assign out[3] = in[48];
  assign out[4] = in[16];
  assign out[5] = in[56];
  assign out[6] = in[24];
  assign out[7] = in[64];
  assign out[8] = in[32];
  assign out[9] = in[39];
  assign out[10] = in[7];
  assign out[11] = in[47];
  assign out[12] = in[15];
  assign out[13] = in[55];
  assign out[14] = in[23];
  assign out[15] = in[63];
  assign out[16] = in[31];
  assign out[17] = in[38];
  assign out[18] = in[6];
  assign out[19] = in[46];
  assign out[20] = in[14];
  assign out[21] = in[54];
  assign out[22] = in[22];
  assign out[23] = in[62];
  assign out[24] = in[30];
  assign out[25] = in[37];
  assign out[26] = in[5];
  assign out[27] = in[45];
  assign out[28] = in[13];
  assign out[29] = in[53];
  assign out[30] = in[21];
  assign out[31] = in[61];
  assign out[32] = in[29];
  assign out[33] = in[36];
  assign out[34] = in[4];
  assign out[35] = in[44];
  assign out[36] = in[12];
  assign out[37] = in[52];
  assign out[38] = in[20];
  assign out[39] = in[60];
  assign out[40] = in[28];
  assign out[41] = in[35];
  assign out[42] = in[3];
  assign out[43] = in[43];
  assign out[44] = in[11];
  assign out[45] = in[51];
  assign out[46] = in[19];
  assign out[47] = in[59];
  assign out[48] = in[27];
  assign out[49] = in[34];
  assign out[50] = in[2];
  assign out[51] = in[42];
  assign out[52] = in[10];
  assign out[53] = in[50];
  assign out[54] = in[18];
  assign out[55] = in[58];
  assign out[56] = in[26];
  assign out[57] = in[33];
  assign out[58] = in[1];
  assign out[59] = in[41];
  assign out[60] = in[9];
  assign out[61] = in[49];
  assign out[62] = in[17];
  assign out[63] = in[57];
  assign out[64] = in[25];
endmodule
module DES (input[0:63] plaintxt, input[0:55] key,output[0:63] cipher);
reg [0:63] IP_txt;
reg [0:47] Exp_right;
reg[0:47] Xor_key;
reg[0:31] S_out,permut_new,new_right;
IP inst0(plaintxt, IP_txt);
expansion inst1(plaintxt[32:63],Exp_right);
assign Xor_key=Exp_right^{key[0:6],key[8:14],key[16:22],key[24:30],key[32:38],key[40:46],key[48:54]};
Sbox1 i1(Xor_key[0:5],S_out[0:3]);
Sbox2 i2(Xor_key[6:11],S_out[4:7]);
Sbox3 i3(Xor_key[12:17],S_out[8:11]);
Sbox4 i4(Xor_key[18:23],S_out[12:15]);
Sbox5 i5(Xor_key[24:29],S_out[16:19]);
Sbox6 i6(Xor_key[30:35],S_out[20:23]);
Sbox7 i7(Xor_key[36:41],S_out[24:27]);
Sbox8 i8(Xor_key[42:48],S_out[28:31]);
permute inst2(S_out,permut_new);
assign new_right=permut_new^plaintxt[0:31];
IP_inv inst3({plaintxt[32:63],new_right},cipher);
endmodule
module Sbox1(input[0:5] iput,output[0:3] s1_out);
reg[0:3] S1[0:3][0:15];
reg[0:1] row;
reg[0:3] col;
initial begin
            S1[0][0] = 14;
            S1[0][1] = 4;
            S1[0][2] = 13;
            S1[0][3] = 1;
            S1[0][4] = 2;
            S1[0][5] = 15;
            S1[0][6] = 11;
            S1[0][7] = 8;
            S1[0][8] = 3;
            S1[0][9] = 10;
            S1[0][10] = 6;
            S1[0][11] = 12;
            S1[0][12] = 5;
            S1[0][13] = 9;
            S1[0][14] = 0;
            S1[0][15] = 7;
            S1[1][0] = 0;
            S1[1][1] = 15;
            S1[1][2] = 7;
            S1[1][3] = 4;
            S1[1][4] = 14;
            S1[1][5] = 2;
            S1[1][6] = 13;
            S1[1][7] = 1;
            S1[1][8] = 10;
            S1[1][9] = 6;
            S1[1][10] = 12;
            S1[1][11] = 11;
            S1[1][12] = 9;
            S1[1][13] = 5;
            S1[1][14] = 3;
            S1[1][15] = 8;
            S1[2][0] = 4;
            S1[2][1] = 1;
            S1[2][2] = 14;
            S1[2][3] = 8;
            S1[2][4] = 13;
            S1[2][5] = 6;
            S1[2][6] = 2;
            S1[2][7] = 11;
            S1[2][8] = 15;
            S1[2][9] = 12;
            S1[2][10] = 9;
            S1[2][11] = 7;
            S1[2][12] = 3;
            S1[2][13] = 10;
            S1[2][14] = 5;
            S1[2][15] = 0;
            S1[3][0] = 15;
            S1[3][1] = 12;
            S1[3][2] = 8;
            S1[3][3] = 2;
            S1[3][4] = 4;
            S1[3][5] = 9;
            S1[3][6] = 1;
            S1[3][7] = 7;
            S1[3][8] = 5;
            S1[3][9] = 11;
            S1[3][10] = 3;
            S1[3][11] = 14;
            S1[3][12] = 10;
            S1[3][13] = 0;
            S1[3][14] = 6;
            S1[3][15] = 13;
assign row={iput[0],iput[5]};
assign col=iput[1:4];
assign s1_out=S1[row][col];
end
endmodule
module Sbox2();
endmodule
module Sbox3();
endmodule
module Sbox4();
endmodule
module Sbox5();
endmodule
module Sbox6();
endmodule
module Sbox7();
endmodule
module Sbox8();
endmodule
module expansion(input[1:32] right,output[0:47] exp);

endmodule
module permute();

endmodule
module tb();

	reg[0:55] key;
	reg[0:63] plaintxt;
	wire[0:63] cipher;

DES inst0( .plaintxt(plaintxt), ,.key(key),.cipher(cipher));

	initial
	begin
			
		
		plaintxt = 8'b1010101010101010101010101010101010101010101010101010101010101010;
        key = 6'b10101010101010101010101010101010101010101010101010111110;
        #1;
        $display("%b",cipher);
        //plaintext = 8'b01101010;
        //key = 6'b101100;
        //#1;
        //$display("%b",cipher);
	end
	
	

endmodule