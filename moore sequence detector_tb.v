module sequencedetector_tb;
reg clk,reset,in;
wire out;

sequencedetector dut(.clk(clk),.reset(reset),.in(in),.out(out));
always #5 clk = ~clk;
initial begin
clk = 0;
reset = 1;
in = 0;

#2 reset = 0;
#10 in =0;
#10 in =1;
#10 in =0;
#10 in =0;
#10 in =1;
#10 in =1;
#10 in =0;
#10 in =0;
#10 in =1;
#10 in =0;
#20 $finish;
end
endmodule
