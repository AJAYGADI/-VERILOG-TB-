module tb();
reg clk,s,r;
wire q,qb;
nd_sr DUT(s,r,clk,q,qb);
task initialize();
begin
{s,r,clk}=3'b000;
end
endtask
task srinputs(input j,k);
 begin
 clk=1'b1;
 s=j;
 r=k;
 end
endtask
initial
begin
 initialize;
 srinputs(1'b0,1'b0); 
 #5;
 srinputs(1'b0,1'b1);
 #5;
 srinputs(1'b1,1'b0);
 #5;
 srinputs(1'b1,1'b1);
 #5;
 srinputs(1'b0,1'b1);
 #100 $finish;
 end
initial
 begin
 $display("s=%b,r=%b,q=%b,qb=%b",s,r,q,qb);
 end
endmodule
