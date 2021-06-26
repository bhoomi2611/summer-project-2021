`include "PC1.v"
`include "PC2.v"
module left_shift(input[0:55] key, output[0:55] out);
    assign out[0] = key[1];
    assign out[1] = key[2];
    assign out[2] = key[3];
    assign out[3] = key[4];
    assign out[4] = key[5];
    assign out[5] = key[6];
    assign out[6] = key[7];
    assign out[7] = key[8];
    assign out[8] = key[9];
    assign out[9] = key[10];
    assign out[10] = key[11];
    assign out[11] = key[12];
    assign out[12] = key[13];
    assign out[13] = key[14];
    assign out[14] = key[15];
    assign out[15] = key[16];
    assign out[16] = key[17];
    assign out[17] = key[18];
    assign out[18] = key[19];
    assign out[19] = key[20];
    assign out[20] = key[21];
    assign out[21] = key[22];
    assign out[22] = key[23];
    assign out[23] = key[24];
    assign out[24] = key[25];
    assign out[25] = key[26];
    assign out[26] = key[27];
    assign out[27] = key[0];
    
    assign out[28] = key[29];
    assign out[29] = key[30];
    assign out[30] = key[31];
    assign out[31] = key[32];
    assign out[32] = key[33];
    assign out[33] = key[34];
    assign out[34] = key[35];
    assign out[35] = key[36];
    assign out[36] = key[37];
    assign out[37] = key[38];
    assign out[38] = key[39];
    assign out[39] = key[40];
    assign out[40] = key[41];
    assign out[41] = key[42];
    assign out[42] = key[43];
    assign out[43] = key[44];
    assign out[44] = key[45];
    assign out[45] = key[46];
    assign out[46] = key[47];
    assign out[47] = key[48];
    assign out[48] = key[49];
    assign out[49] = key[50];
    assign out[50] = key[51];
    assign out[51] = key[52];
    assign out[52] = key[53];
    assign out[53] = key[54];
    assign out[54] = key[55];
    assign out[55] = key[28];
endmodule

module key_schedule(input[0:63] key, output[1:16][0:47] k);
wire[0:55] key_p1;
wire[0:55] key_l1,key_l2,key_l3_1,key_l3_2,key_l4_1,key_l4_2,key_l5_1,key_l5_2,key_l6_1,key_l6_2,key_l7_1,key_l7_2,key_l8_1,key_l8_2,key_l9,key_l10_1,key_l10_2,key_l11_1,key_l11_2,key_l12_1,key_l12_2,key_l13_1,key_l13_2,key_l14_1,key_l14_2,key_l15_1,key_l15_2,key_l16_2;

PC1 key0(key,key_p1);
left_shift i1(key_p1,key_l1);
PC2 key1(key_l1,k[1]);//1st key

left_shift i2(key_l1,key_l2);
PC2 key2(key_l2,k[2]);//2nd key

left_shift i3(key_l2,key_l3_1);
left_shift i4(key_l3_1,key_l3_2);
PC2 key3(key_l3_2,k[3]);//3rd key

left_shift i5(key_l3_2,key_l4_1);
left_shift i6(key_l4_1,key_l4_2);
PC2 key4(key_l4_2,k[4]);//4th key

left_shift i7(key_l4_2,key_l5_1);
left_shift i8(key_l5_1,key_l5_2);
PC2 key5(key_l5_2,k[5]);//5th key

left_shift i9(key_l5_2,key_l6_1);
left_shift i10(key_l6_1,key_l6_2);
PC2 key6(key_l6_2,k[6]);//6th key

left_shift i11(key_l6_2,key_l7_1);
left_shift i12(key_l7_1,key_l7_2);
PC2 key7(key_l7_2,k[7]);//7th key

left_shift i13(key_l7_2,key_l8_1);
left_shift i14(key_l8_1,key_l8_2);
PC2 key8(key_l8_2,k[8]);//8th key

left_shift i15(key_l8_2,key_l9);
PC2 key9(key_l9,k[9]);//9th key

left_shift i16(key_l9,key_l10_1);
left_shift i17(key_l10_1,key_l10_2);
PC2 key10(key_l10_2,k[10]);//10th key

left_shift i18(key_l10_2,key_l11_1);
left_shift i19(key_l11_1,key_l11_2);
PC2 key11(key_l11_2,k[11]);//11th key

left_shift i20(key_l11_2,key_l12_1);
left_shift i21(key_l12_1,key_l12_2);
PC2 key12(key_l12_2,k[12]);//12th key

left_shift i22(key_l12_2,key_l13_1);
left_shift i23(key_l3_1,key_l13_2);
PC2 key13(key_l3_2,k[13]);//13th key

left_shift i24(key_l13_2,key_l14_1);
left_shift i25(key_l14_1,key_l14_2);
PC2 key14(key_l14_2,k[14]);//14th key

left_shift i26(key_l14_2,key_l15_1);
left_shift i27(key_l15_1,key_l15_2);
PC2 key15(key_l15_2,k[15]);//15th key

left_shift i28(key_l15_2,key_l16_2);
PC2 key16(key_l16_2,k[16]);//16th key



endmodule