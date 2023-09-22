`timescale 1ms/1ns
module tb();
reg mclk;
wire bclk;
time t1,t2,t3,t4,t5,t6;
bufclock DUT(mclk,bclk);
parameter T=3.90625;
initial
begin
mclk=1'b0;
forever #(T/2) mclk=~mclk;
end
task master();
begin
@(posedge mclk)
t1=$time;
@(posedge mclk)
t2=$time;
t3=t2-t1;
end
endtask
task buffer();
begin
@(posedge mclk)
t4=$time;
@(posedge mclk)
t5=$time;
t6=t5-t4;
end
endtask
task freq_phase();
time f,p;
begin
f=t6-t3;
p=t4-t1;
$display("f=%t,p=%t",f,p);
end
endtask
initial
begin
fork
master;
buffer;
join
freq_phase;
end
endmodule
