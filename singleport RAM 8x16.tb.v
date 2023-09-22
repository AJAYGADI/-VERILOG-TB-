module rams_tb();
parameter depth=8,width=16,addr_bus=3;
reg [addr_bus-1:0]addr;
reg we,re;
wire [width-1:0]data;
reg [width-1:0]temp;
integer i,j;
rams DUT(addr,data,we,en);
initial
begin
for(i=0;i<8;i=i+1)
begin
addr<=i;
we<=1'b0;
re<=1'b1;
end
end
initial
begin
for(j=0;j<8;j=j+1)
begin
addr<=j;
we<=1'b1;
re<=1'b0;
temp<=$random;
end
end
assign data=(we && ~re)? temp:16'bz;
endmodule
