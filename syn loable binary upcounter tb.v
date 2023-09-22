module tb();
reg [3:0]d;
reg load,reset,clk;
wire [3:0]count;
parameter cycle=10;
up_counter DUT(d,load,reset,clk,count);
always 
begin
#(cycle/2);
clk=1'b0;
#(cycle/2);
 clk=~clk;
end
task initialize();
 begin
 {d,load,reset}=6'b000011;
 end
endtask
task load_in(input [3:0]k);
 begin
 @(negedge clk)
 load=1'b1;
 d=k;
 @(negedge clk)
 load=1'b0;
 end
endtask
task rst();
 begin
 @(negedge clk)
 reset=1'b1;
 @(negedge clk)
 reset=1'b0;
 end
endtask
initial 
begin
initialize;
rst;
load_in(4'b0);
#100 $finish;
end
initial
 $monitor("input clk=%d,reset=%b,load=%b,d=%b, output 
count=%d",clk,reset,load,d,count);
endmodule
