`timescale 1ns/1ns

module test_tb;

	 reg clk;
	 reg rst_n;
	 reg d;        //序列输入
	 
	 wire done ; //检测完成



 test u1 (
    
	 .clk(clk),
	 .rst_n(rst_n),
	 .d(d),         //序列输入
	 .done(done) //检测完成

);
//
initial clk = 0;
    always #1 clk = ~clk;
//
initial begin
    rst_n = 0;
    #1;
    rst_n = 1;
end
//
initial begin
    d = 0;
    #2;
    d = 1;
    #2;
    d = 0;	 
    #2;
    d = 1;
	 #2;
    d = 1;
	 
    #2;
	 d = 0;
	 #2;
    d = 1;
	 #2;
    d = 1;
	 #3;
	 d= 0;
	 #20;
	 $stop;
	 	 
end

endmodule
