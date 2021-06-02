module adder(input A, input B , input C1, output sum , output C2);
assign sum = (A^B)^(C1);
assign C2 = ((A^B)&C1) | (A&B);
endmodule

module eight_bit_adder(input [7:0]A, input[7:0]B, input C1,output cout, output[7:0]sum);
wire cout0,cout1, cout2, cout3, cout4,cout5,cout6,cout7;
adder a0(A[0],B[0],C1,sum[0],cout0);
adder a1(A[1],B[1],cout0,sum[1],cout1);
adder a2(A[2],B[2],cout1,sum[2],cout2);
adder a3(A[3],B[3],cout2,sum[3],cout3);
adder a4(A[4],B[4],cout3,sum[4],cout4);
adder a5(A[5],B[5],cout4,sum[5],cout5);
adder a6(A[6],B[6],cout5,sum[6],cout6);
adder a7(A[7],B[7],cout6,sum[7],cout);
endmodule

module testbench;
reg[7:0]A,B;
wire[7:0]sum;
wire cout;
reg[7:0]i,j;
eight_bit_adder a(A,B,1'b0,cout,sum);
initial 
begin
  A=12;
  B=12;
  #1
  $display("%b added to %b gives %b and carry %b",A,B,sum,cout);
  A=0;
  B=0;
  #1
  $display("%b added to %b gives %b and carry %b",A,B,sum,cout);
  A=0;
  B=12;
  #1
  $display("%b added to %b gives %b and carry %b",A,B,sum,cout);
  A=12;
  B=0;
  #1
  $display("%b added to %b gives %b and carry %b",A,B,sum,cout);
  A=120;
  B=122;
  #1
  $display("%b added to %b gives %b and carry %b",A,B,sum,cout);
  A=130;
  B=100;
  #1
  $display("%b added to %b gives %b and carry %b",A,B,sum,cout);
  A=128;
  B=129;
  #1
  $display("%b added to %b gives %b and carry %b",A,B,sum,cout);
  A=100;
  B=10;
  #1
  $display("%b added to %b gives %b and carry %b",A,B,sum,cout);
  A=41;
  B=72;
  #1
  $display("%b added to %b gives %b and carry %b",A,B,sum,cout);
  A=125;
  B=244;
  #1
  $display("%b added to %b gives %b and carry %b",A,B,sum,cout);
end
endmodule