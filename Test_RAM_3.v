module Test_RAM_3;
reg [9:0]address;
reg [7:0]data_in;
reg write,select,read;
wire [7:0]data_out;
integer k,myseed;

RAM_3 dut(data_out,data_in,address,write,select);
initial begin
for(k=0;k<=1023;k=k+1)
begin
  data_in=(k+k)%256;write=1;select=1;
#2 address=k;write=0;select=0;
//$display("Address: %5d,Data:%4d",address,data_in);

end


repeat(20)
begin
#2 address=$random(myseed)%1024;
write=0;select=0;
$display("Address=%5d,Data=%4d",address,data_in);
end
end

initial myseed=35;

initial begin
for(k=0;k<=1023;k=k+1)
begin
  data_out=mem[address];write=0;select=1;
#2 address=k;write=0;select=0;read=1;
$display("Address: %5d,Data:%4d",address,data_out);

end
end
endmodule
