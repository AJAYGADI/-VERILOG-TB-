module tb();
reg rst,clk,data_in;
wire data_out;
moore DUT(clk,rst,data_in,data_out);
initial
begin
 clk=1'b0;
forever #10 clk=~clk;
end
task initialize();
begin
data_in=1'b0;
rst=1'b1;
end
endtask
task reset();
begin
@(negedge clk)
rst=1'b1;
@(negedge clk)
rst=1'b0;
end
endtask
task inputs(input i);
begin
@(negedge clk)
data_in=i;
end
endtask
initial
begin
initialize;
reset;
inputs(0);
inputs(1);
inputs(0);
inputs(1);
inputs(0);
reset;
inputs(1);
inputs(0);
inputs(1);
#300 $finish;
end
endmodule
