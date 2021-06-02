module comp(input a, b , output less , output greater , output equal);
assign equal=~(a^b);
assign less=(~a) & b;
assign greater=a&(~b);
endmodule

module eight_bit_comp(input[7:0]a,b ,output less, output greater, output equal);
wire [7:0]e,l,g;
comp c0(a[0],b[0],l[0],g[0],e[0]);
comp c1(a[1],b[1],l[1],g[1],e[1]);
comp c2(a[2],b[2],l[2],g[2],e[2]);
comp c3(a[3],b[3],l[3],g[3],e[3]);
comp c4(a[4],b[4],l[4],g[4],e[4]);
comp c5(a[5],b[5],l[5],g[5],e[5]);
comp c6(a[6],b[6],l[6],g[6],e[6]);
comp c7(a[7],b[7],l[7],g[7],e[7]);
assign equal = (e[0]& e[1] &e[2] &e[3] &e[4] &e[5] &e[6]& e[7]);
assign greater= (g[7]|(g[6]&e[7])|(g[5]&e[7]&e[6])|(g[4]&e[7]&e[6]&e[5])|(g[3]&e[7]&e[6]&e[5]&e[4])|(g[2]&e[7]&e[6]&e[5]&e[4]&e[3])|(g[1]&e[7]&e[6]&e[5]&e[4]&e[3]&e[2])|(g[0]&e[7]&e[6]&e[5]&e[4]&e[3]&e[2]&e[1]));
assign less=(~equal & ~greater);
endmodule

module test_bench;
reg[7:0]a;
reg[7:0]b;
wire less;
wire greater;
wire equal;
eight_bit_comp q(a,b,less,greater,equal);
initial begin
$display("a compared with b gives less greater equal");
a=125 ;
b=140;#1;
$display("%b compared with %b gives %b %b %b",a,b,less,greater,equal);
a=200;
b=200;#1;
$display("%b compared with %b gives %b %b %b",a,b,less,greater,equal);
a=210;
b=200;#1;
$display("%b compared with %b gives %b %b %b",a,b,less,greater,equal);
a=210;
b=200;#1;
$display("%b compared with %b gives %b %b %b",a,b,less,greater,equal);
a=2;
b=1;#1;
$display("%b compared with %b gives %b %b %b",a,b,less,greater,equal);
a=10;
b=20;#1;
$display("%b compared with %b gives %b %b %b",a,b,less,greater,equal);
a=210;
b=130;#1;
$display("%b compared with %b gives %b %b %b",a,b,less,greater,equal);
a=100;
b=100;#1;
$display("%b compared with %b gives %b %b %b",a,b,less,greater,equal);
a=210;
b=20;#1;
$display("%b compared with %b gives %b %b %b",a,b,less,greater,equal);
a=21;
b=200;#1;
$display("%b compared with %b gives %b %b %b",a,b,less,greater,equal);
end
initial begin
  #15 $finish;
end
endmodule
