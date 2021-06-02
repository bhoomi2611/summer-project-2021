module adder(input A, input B , input C1, output sum , output C2);
assign sum = (A^B)^(C1);
assign C2 = ((A^B)&C1) | (A&B);
endmodule
