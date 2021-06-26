`include "IP.v"
`include "ip_inverse.v"
`include "key_scheduling.v"
`include "des_1_round.v"

module DES_16round(input[0:63] plaintext, input[0:63] key, output[0:63]cipher);
wire [0:63] IP_txt;
wire [0:15][0:63] r_out;
wire [0:15][0:47] K;
IP inst1(plaintext,IP_txt);
initial begin
    #3;
    $display("plaintxt:%b",plaintext);
end
key_schedule inst2(key,K[0:15]);
initial begin
    #5;
    $display("k2:%b",K[2]);
end
des_1round a1(IP_txt,K[0],r_out[0]);
des_1round a2(r_out[0],K[1],r_out[1]);
des_1round a3(r_out[1],K[2],r_out[2]);
des_1round a4(r_out[2],K[3],r_out[3]);
des_1round a5(r_out[3],K[4],r_out[4]);
des_1round a6(r_out[4],K[5],r_out[5]);
des_1round a7(r_out[5],K[6],r_out[6]);
des_1round a8(r_out[6],K[7],r_out[7]);
des_1round a9(r_out[7],K[8],r_out[8]);
des_1round a10(r_out[8],K[9],r_out[9]);
des_1round a11(r_out[9],K[10],r_out[10]);
des_1round a12(r_out[10],K[11],r_out[11]);
des_1round a13(r_out[11],K[12],r_out[12]);
des_1round a14(r_out[12],K[13],r_out[13]);
des_1round a15(r_out[13],K[14],r_out[14]);
des_1round a16(r_out[14],K[15],r_out[15]);
initial begin
    #7;
    $display("%b",r_out[0]);
end
IP_inv inst3(r_out[15],cipher);
endmodule


module tb();

	reg[0:63] key;
	reg[0:63] plaintext;
	wire[0:63] cipher;

DES_16round inst( .plaintext(plaintext), .key(key),.cipher(cipher));

	initial
	begin
		
		
		plaintext = 64'b1010101010101010101010101010101010101010101010101010101010101010;
        key =64'b00010011_00110100_01010111_01111001_10011011_10111100_11000110_01010101;
        #1;
        $display("plaintext: %b",plaintext);
        #10;
        $display("cipher: %b",cipher);
        //plaintext = 8'b01101010;
        //key = 6'b101100;
        //#1;
        //$display("%b",cipher);
	end
	
	

endmodule




