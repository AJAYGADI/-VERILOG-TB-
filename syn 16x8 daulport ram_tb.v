module ram_tb();
parameter width=8,depth=16,addr_bus=4;
reg clk,rst,we,re;
reg [addr_bus-1:0]wr,rd;
reg [width-1:0]din;
wire [width-1:0]dout;
parameter T=20;
initial clk=1'b0;
always #(T/10) clk=~clk;
ram DUT(din,dout,we,re,clk,wr,rd,rst);
task initialize();
begin
@(negedge clk)
din=8'b0;
{we,re,rst}=3'b001;
{wr,rd}=8'b0;
end
endtask
task reset();
begin
@(negedge clk)
rst = 1'b1;
@(negedge clk)
rst = 1'b0;
end
endtask
task write(input [7:0]i,input [3:0]j,input k);
begin
@(negedge clk)
din=i;
wr=j;
we=k;
end
endtask
task read(input [3:0]m,input n);
begin
@(negedge clk)
rd=m;
re=n;
end
endtask
initial
begin
initialize;
reset;
write({$random},4'b1101,1'b1);
#5 we=1'b0;
read(4'b1101,1'b1);
end
endmodule
