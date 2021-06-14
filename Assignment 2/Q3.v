module S1_Box( input[0:5] s_right,output[0:3] out_bits);
reg[0:3]out_bits;
  always@(s_right)  
    begin
    #10;
        case(s_right)
            6'b000000: out_bits = 4'b1110;
            6'b000010: out_bits = 4'b0100;
            6'b000100: out_bits = 4'b1101;
            6'b000110: out_bits = 4'b0001;
            6'b001000: out_bits = 4'b0010;
            6'b001010: out_bits = 4'b1111;
            6'b001100: out_bits = 4'b1011;
            6'b001110: out_bits = 4'b1000;
            6'b010000: out_bits = 4'b0011;
            6'b010010: out_bits = 4'b1010;
            6'b010100: out_bits = 4'b0110;
            6'b010110: out_bits = 4'b1100;
            6'b011000: out_bits = 4'b0101;
            6'b011010: out_bits = 4'b1001;
            6'b011100: out_bits = 4'b0000;
            6'b011110: out_bits = 4'b0111;
            
            6'b000001: out_bits = 4'b0000;
            6'b000011: out_bits = 4'b1111;
            6'b000101: out_bits = 4'b0111;
            6'b000111: out_bits = 4'b0100;
            6'b001001: out_bits = 4'b1110;
            6'b001011: out_bits = 4'b0010;
            6'b001101: out_bits = 4'b1101;
            6'b001111: out_bits = 4'b0001;
            6'b010001: out_bits = 4'b1010;
            6'b010011: out_bits = 4'b0110;
            6'b010101: out_bits = 4'b1100;
            6'b010111: out_bits = 4'b1011;
            6'b011001: out_bits = 4'b1001;
            6'b011011: out_bits = 4'b0101;
            6'b011101: out_bits = 4'b0011;
            6'b011111: out_bits = 4'b1000;

            6'b100000: out_bits = 4'b0100;
            6'b100010: out_bits = 4'b0001;
            6'b100100: out_bits = 4'b1110;
            6'b100110: out_bits = 4'b1000;
            6'b101000: out_bits = 4'b1101;
            6'b101010: out_bits = 4'b0110;
            6'b101100: out_bits = 4'b0010;
            6'b101110: out_bits = 4'b1011;
            6'b110000: out_bits = 4'b1111;
            6'b110010: out_bits = 4'b1100;
            6'b110100: out_bits = 4'b1001;
            6'b110110: out_bits = 4'b0111;
            6'b111000: out_bits = 4'b0011;
            6'b111010: out_bits = 4'b1010;
            6'b111100: out_bits = 4'b0101;
            6'b111110: out_bits = 4'b0000;

            6'b100001: out_bits = 4'b1111;
            6'b100011: out_bits = 4'b1100;
            6'b100101: out_bits = 4'b1000;
            6'b100111: out_bits = 4'b0010;
            6'b101001: out_bits = 4'b0100;
            6'b101011: out_bits = 4'b1001;
            6'b101101: out_bits = 4'b0001;
            6'b101111: out_bits = 4'b0111;
            6'b110001: out_bits = 4'b0101;
            6'b110011: out_bits = 4'b1011;
            6'b110101: out_bits = 4'b0011;
            6'b110111: out_bits = 4'b1110;
            6'b111001: out_bits = 4'b1010;
            6'b111011: out_bits = 4'b0000;
            6'b111101: out_bits = 4'b0110;
            6'b111111: out_bits = 4'b1101;
        endcase
    end
endmodule    
module DES(input[0:7]plaintext,
output[0:7]cipher,
input[0:5]key);

wire[0:5] rightexp, s_right;
wire[0:3] out_bits, permute,new_right;
assign  rightexp = {plaintext[4],plaintext[7],plaintext[5],plaintext[6],plaintext[4],plaintext[5]};//4 right bits of plain text are expanded to 6 bits
initial begin
#1;
$display("%b",plaintext);    
$display("%b",rightexp);
end
assign  s_right = rightexp^key;//xor expanded right with key
initial begin
#1;
$display("%b",s_right);    
end
S1_Box inst1(s_right,out_bits);//sbox 6bits is convertd to 4 bits 
assign  permute={out_bits[2],out_bits[0],out_bits[1],out_bits[3]};//permutation of the 4 bits
initial begin
#1;
$display("%b",out_bits);
$display("%b",permute);    
end
assign  new_right=permute^plaintext[0:3];//permutated is xor with left half of plaintext
assign cipher = {plaintext[4:7],new_right};//cipher with left half is encrypted and put on right side and the right of plaintext is asigned to new left of it
endmodule



    
    

module tb();

	reg[0:5] key;
	reg[0:7] plaintext;
	wire[0:7] cipher;

DES inst0( .plaintext(plaintext), .cipher(cipher),.key(key));

	initial
	begin
			
		
		plaintext = 8'b01010110;
        key = 6'b101100;
        #1;
        $display("%b",cipher);
	end
	
	

endmodule