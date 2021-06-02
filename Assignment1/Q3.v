module comp(input a, b , output less , output greater , output equal);
assign equal=~(a^b);
assign less=(~a) & b;
assign greater=a&(~b);
endmodule